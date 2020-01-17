//== Class definition

var DatatableHtmlTableDemo3 = function() {
    //== Private functions

    // demo initializer
    var demo = function() {

        var datatable = $('.m-datatable').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: BASE_PATH +'/BackManage/ajaxPostsList',
                    },
                },
                pageSize: 10, // display 20 records per page
                serverPaging: true,
            },
            search: {
                input: $('#generalSearch'),
            },
            columns: [
                {
                    field: 'title',
                    title: 'Title',
                },
               /* {
                    field: 'content',
                    title: 'Content',
                },*/
                 {
                    field: 'status',
                    title: 'Status',
                    // callback function support for column rendering
                    template: function(row) {
                        var status = {
                            open: {'title': 'Open', 'class': 'm-badge--success'},
                            close: {'title': 'Close', 'class': 'm-badge--warning'},
                        };
                        return '<span class="m-badge ' + status[row.status].class + ' m-badge--wide">' + status[row.status].title + '</span>';
                    }
                },
                {
                    field: 'type',
                    title: 'Type',
                },
                {
                    field: 'recommended',
                    title: 'Recommended',
                },{
                    field: 'author',
                    title: 'Author',
                },{
                    field: 'cnt_favourite',
                    title: 'Favourite Count',
                },{
                    field: 'cnt_comment',
                    title: 'Comment Count',
                },{
                    field: 'action',
                    title: 'Action',
                    template: function (row, index, datatable) {
                        var status = row.status;
                        var retStr = "";
                        if(status == 'open'){
                            retStr =  '\
                            <a data-id="'+row.id+'"  onclick = "postUpdate(this);"    data-status = "close" class="posts-update-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Close ">  <i class="la flaticon-close"></i> </a>\
                        ';
                        }else{
                            retStr = '\
                            <a data-id="'+row.id+'"   onclick = "postUpdate(this);"   data-status = "open" class="posts-update-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Open ">  <i class="la flaticon-open-box"></i> </a>\
                            ';
                        }
                        retStr +=  '\
                        <a href="javascript:postDelete('+row.id+');" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="la la-trash"></i> </a>\
                        ';
                        return retStr;
                    }
                },

            ],
        });

        $('#m_form_status').on('change', function() {
            datatable.search($(this).val().toLowerCase(), 'Status');

        });

        $('#m_form_type').on('change', function() {
            datatable.search($(this).val().toLowerCase(), 'Type');
        });

        $('#m_form_status, #m_form_type').selectpicker();

        $(".posts-update-btn").click(function(e){
            e.preventDefault();
            var id = $(this).data("id");
            var status = $(this).data("status");
            var param = new Object();
            param.id = id ;
            param.status = status ;
            var btn = $(this);

            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            $.post(SITE_PATH + "BackManage/createPost", param, function(data){
                btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                if(data.status == "1"){
                    window.location.href = SITE_PATH + 'BackManage/postsList';
                }else{
                    alert(data.msg);
                }
            }, "json");
        })
    };

    return {
        //== Public functions
        init: function() {
            // init dmeo
            demo();
        },
    };
}();

jQuery(document).ready(function() {
    DatatableHtmlTableDemo3.init();
});

function postUpdate(obj){
    var id = $(obj).data("id");
    var status = $(obj).data("status");
    var param = new Object();
    param.id = id ;
    param.status = status ;
    var btn = $(this);

    btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
    $.post(SITE_PATH + "BackManage/createPost", param, function(data){
        btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
        if(data.status == "1"){
            window.location.href = SITE_PATH + 'BackManage/postsList';
        }else{
            alert(data.msg);
        }
    }, "json");
}

function postDelete(post_id) {
    swal({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!'
    }).then(function(result) {
        if (result.value) {
            $.get({
                url: SITE_PATH + "BackManage/delPost",
                dataType: "json",
                data: {
                    id: post_id
                },
                success : function(resp) {
                    if ( resp.status ) {
                        window.location.href = SITE_PATH + "BackManage/postsList";
                    } else {
                        alert( resp.msg );
                    }
                }
            });
        }
    });
}

function postRecommended(post_id, cur_rec) {
    $.post({
        url: SITE_PATH + "BackManage/postRecommended",
        dataType: "json",
        data: {
            id: post_id,
            recommended: cur_rec ? 0 : 1
        },
        success: function (resp) {
            if ( resp.status ) {
                // window.location.href = SITE_PATH + "backmanage/postsList";
            } else {
                // don't change it
                // alert( resp.msg );
            }
        }
    })
}
