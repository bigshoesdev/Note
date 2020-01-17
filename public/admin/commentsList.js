//== Class definition

var DatatableHtmlTableDemo2 = function() {
    //== Private functions

    // demo initializer
    var demo = function() {

        var datatable = $('.m-datatable').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: BASE_PATH +'/BackManage/ajaxCommentsList',
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
                    field:'postname',
                    title: 'PostName',
                }, {
                    field:'content',
                    title: 'Content',
                },
                 {
                    field: 'Status',
                    title: 'Status',
                    // callback function support for column rendering
                    template: function(row) {
                        var status = {
                            open: {'title': 'Open', 'class': 'm-badge--success'},
                            close: {'title': 'Close', 'class': 'm-badge--warning'},
                        };
                        return '<span class="m-badge ' + status[row.status].class + ' m-badge--wide">' + status[row.status].title + '</span>';
                    },
                },{
                    field:'cnt_favourite',
                    title: 'Favourite',
                },{
                    field:'author',
                    title: 'Author',
                },{
                    field: 'action',
                    title: 'Action',
                    template: function (row, index, datatable) {
                        var status = row.status;
                        var retStr = '';
                        if(status == 'open'){
                            retStr = '\
                              <a data-id="'+row.id+'"   onclick="updateItem(this)"  data-status = "close" class="update-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Close">  <i class="la flaticon-close"></i> </a>\
                            ';
                        }else{
                            retStr = '\
                            <a data-id="'+row.id+'"   onclick="updateItem(this)"  data-status = "open" class="update-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Open">  <i class="la flaticon-open-box"></i> </a>\
                            ';

                        }
                        retStr += '\
                            <a href = "javascript:commentDelete('+row.id+')"  class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="la la-trash"></i> </a>\
                        ';
                        return retStr;
                    }
                },
            ],
        });

        $('#m_form_status').on('change', function() {
            datatable.search($(this).val().toLowerCase(), 'Status');
            $(".update-btn").click(function(){
                var id = $(this).data("id");
                var status = $(this).data("status");
                var param = new Object();
                param.id = id ;
                param.status = status ;
                var btn = $(this);

                btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
                $.post(SITE_PATH + "backmanage/createComment", param, function(data){
                    btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                    if(data.status == "1"){
                        window.location.href = SITE_PATH + 'backmanage/commentsList';
                    }else{
                        alert(data.msg);
                    }
                }, "json");
            })
        });

        $('#m_form_type').on('change', function() {
            datatable.search($(this).val().toLowerCase(), 'Type');
            $(".update-btn").click(function(){
                var id = $(this).data("id");
                var status = $(this).data("status");
                var param = new Object();
                param.id = id ;
                param.status = status ;
                var btn = $(this);

                btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
                $.post(SITE_PATH + "backmanage/createComment", param, function(data){
                    btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                    if(data.status == "1"){
                        window.location.href = SITE_PATH + 'backmanage/commentsList';
                    }else{
                        alert(data.msg);
                    }
                }, "json");
            })
        });

        $('#m_form_status, #m_form_type').selectpicker();

        $(".update-btn").click(function(){
            var id = $(this).data("id");
            var status = $(this).data("status");
            var param = new Object();
            param.id = id ;
            param.status = status ;
            var btn = $(this);

            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            $.post(SITE_PATH + "backmanage/createComment", param, function(data){
                btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                if(data.status == "1"){
                    window.location.href = SITE_PATH + 'backmanage/commentsList';
                }else{
                    alert(data.msg);
                }
            }, "json");
        })


    };

    var showErrorMsg = function(form, type, msg) {
        var alert = $('<div class="m-alert m-alert--outline alert alert-' + type + ' alert-dismissible" role="alert">\
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>\
			<span></span>\
		</div>');

        form.find('.alert').remove();
        alert.prependTo(form);
        alert.animateClass('fadeIn animated');
        alert.find('span').html(msg);
    }

    return {
        //== Public functions
        init: function() {
            // init dmeo
            demo();
        },
    };
}();

jQuery(document).ready(function() {
    DatatableHtmlTableDemo2.init();
});

function updateItem(obj){
    var id = $(obj).data("id");
    var status = $(obj).data("status");
    var param = new Object();
    param.id = id ;
    param.status = status ;
    var btn = $(this);

    btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
    $.post(SITE_PATH + "BackManage/createComment", param, function(data){
        btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
        if(data.status == "1"){
            window.location.href = SITE_PATH + 'BackManage/commentsList';
        }else{
            alert(data.msg);
        }
    }, "json");
}

function commentDelete(comment_id) {
    swal({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!'
    }).then(function(result) {
        if (result.value) {
            $.get({
                url: SITE_PATH + "BackManage/delComment",
                dataType: "json",
                data: {
                    id: comment_id
                },
                success : function(resp) {
                    if ( resp.status ) {
                        swal('Success', 'The operation success!', 'success').then(function() {
                            window.location.href = SITE_PATH + "BackManage/commentsList";
                        });
                    } else {
                        swal({
                            type: 'warning',
                            title: resp.msg
                        });
                    }
                }
            });
        }
    });
}