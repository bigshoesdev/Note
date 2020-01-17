//== Class definition

var DatatableHtmlTableDemo4= function() {
    //== Private functions

    // demo initializer
    var demo = function() {

        var datatable = $('.m-datatable').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: BASE_PATH +'/BackManage/ajaxUserList',
                    },
                },
                pageSize: 10, // display 20 records per page
                serverPaging: true,
            },
            search: {
                input: $('#generalSearch'),
            },
            pagination: true,
            sortable: false,
            columns: [
                {
                    field: 'name',
                    title: 'Name',
                },
                {
                    field: 'email',
                    title: 'Email',
                },{
                    field: 'postsCount',
                    title: 'PostsCount',
                },{
                    field: 'commentsCount',
                    title: 'CommentsCount',
                },
                {
                    field: 'email',
                    title: 'Email',
                },
                 {
                    field: 'status',
                    title: 'Status',
                    // callback function support for column rendering
                    template: function(row) {
                        var str = "";
                        var val = 1;
                        if(row.status == 'active'){
                            str = "checked";
                            val = 0;
                        }

                        var status = {
                            active: {'title': 'Active', 'class': 'm-badge--success'},
                            canceled: {'title': 'Canceled', 'class': 'm-badge--warning'},
                        };
                        return '<span class="m-switch m-switch--info"><label><input type="checkbox" '+str+'  onchange="changeActive('+row.id+','+val+', this);" style="width: 60px"><span></span></label></span>';
                    },
                }, {
                    field: 'type',
                    title: 'Type',
                    // callback function support for column rendering
                    template: function(row) {
                        var status = {
                            1: {'title': 'Admin', 'state': 'danger'},
                            0: {'title': 'User', 'state': 'primary'},
                        };
                        return '<span class="m--font-bold m--font-' +
                            status[row.type].state + '">' +
                            status[row.type].title + '</span>';
                    },
                },{
                    field: 'action',
                    title: 'Action',
                    template: function (row, index, datatable) {
                        return '\
                        <button type = "button"  onclick = "detailView(this);" href="'+row.id+'"  class="detail-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="View ">  <i class="la la-edit"></i> </button>\
                            <button type = "button"  onclick = "delItem(this);" href="'+row.id+'"  class="delete-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="la la-remove"></i> </button>\
                            \
                            ';
                    }
                }
            ],
        });

        $('#m_form_status').on('change', function() {
            datatable.search($(this).val().toLowerCase(), 'Status');

        });

        $('#m_form_type').on('change', function() {
            datatable.search($(this).val().toLowerCase(), 'Type');
        });

        $('#m_form_status, #m_form_type').selectpicker();



    };

    var displayForm = function(){
        $(".detail-btn").click(function(e){
            e.preventDefault();
            var id = $(this).attr("href");
            $("#detailForm input[name='id']").val(id);
            $("#detailForm").submit();
        })

        $(".delete-btn").click(function (e) {
            e.preventDefault();
            delItem($(this)[0]);
            return;
            var id = $(this).attr("href");
            var btn = $(this);
            var param = new Object();
            param.id = id;
            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            $.post(SITE_PATH + "BackManage/delUser", param, function(data){
                btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                if(data.status == "1"){
                    window.location.href = SITE_PATH + 'BackManage/userList';
                }else{
                    alert(data.msg);
                }
            }, "json");
        });
    }

    return {
        //== Public functions
        init: function() {
            // init dmeo
            demo();
            displayForm();
        },
    };
}();

jQuery(document).ready(function() {
    DatatableHtmlTableDemo4.init();
});

function changeActive(cat_id, attention, obj) {
    var method = attention =='0' ? 'canceledUser' : 'activeUser';
    var thisObj = obj;
    var attentionVal = attention;
    $.post({
        url: SITE_PATH + 'BackManage/' + method,
        dataType: 'json',
        data: {
            id: cat_id
        },
        success: function(resp) {
            // we should do nothing
            if (resp.status) {
                $(thisObj).attr("onchange","changeActive("+cat_id+", "+(parseInt(attentionVal)+1)%2+", this)");
                //window.location.reload();
            } else {
                swal("Error!", data.msg, "error");
            }
        }
    });
}

function detailView(obj){
        var id = $(obj).attr("href");
        $("#detailForm input[name='id']").val(id);
        $("#detailForm").submit();
}

function delItem(obj){
    var id = $(obj).attr("href");
    var btn = $(obj);
    var param = new Object();
    param.id = id;
    swal({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!'
    }).then(function (result) {
        if (result.value) {
            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            $.post(SITE_PATH + "BackManage/delUser", param, function(data){
                btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                if(data.status == "1"){
                    swal('Success', 'The operation success!', 'success').then(function() {
                        window.location.href = SITE_PATH + 'BackManage/userList';
                    });
                }else{
                    swal("Error!", data.msg, "error");
                }
            }, "json");
        }
    });
}



