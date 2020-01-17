//== Class definition

var DatatableHtmlTableDemo0 = function() {
    //== Private functions

    // demo initializer
    var demo = function() {

        var datatable = $('.m-datatable').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: BASE_PATH +'/BackManage/ajaxAttentionCategoryList',
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
                    field: 'display_order',
                    title: 'Order',
                },
                {
                    field: 'title',
                    title: 'Title',
                },
                {
                    field: 'action',
                    title: 'Action',
                    // callback function support for column rendering
                    template: function (row) {
                        var status = {
                            1: {'title': 'Used', 'class': 'm-badge--success'},
                            0: {'title': 'Unused', 'class': 'm-badge--warning'},
                        };
                        return '\
                            <button type = "button" data-id="'+row.id+'"  data-order = "'+row.display_order+'" onclick = "editOrder(this);" data-category = "'+row.id+'" class="hidden m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit">  <i class="la la-edit"></i> </button>\
                            <button href="'+row.id+'"  data-category = "'+row.id+'" onclick = "delItem(this);" class="category-delete-btn m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="la la-remove"></i> </button>\
                            <button href="'+row.id+'"  data-category = "'+row.id+'" onclick = "upItem(this);" class="category-delete-btn m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="fa fa-arrow-up"></i> </button>\
                            \<button href="'+row.id+'"  data-category = "'+row.id+'" onclick = "downItem(this);" class="category-delete-btn m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="fa fa-arrow-down"></i> </button>\
                            ';
                    },
                }
            ],
        });

        $('#m_form_status').on('change', function() {
            datatable.search($(this).val().toLowerCase(), 'Used');
        });

        $('#m_form_type').on('change', function() {
            datatable.search($(this).val().toLowerCase(), 'Type');
        });

        $('#m_form_status, #m_form_type').selectpicker();

        $(".category-delete-btn").click(function (e) {
            e.preventDefault();
            delItem($(this)[0]);
            return;
            var id = $(this).attr("href");
            var btn = $(this);
            var param = new Object();
            param.id = id;
            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            $.post(SITE_PATH + "backmanage/delCategory", param, function(data){
                btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                if(data.status == "1"){
                    window.location.href = SITE_PATH + 'backmanage/categoryList';
                }else{
                    alert(data.msg);
                }
            }, "json");
        });

        $(".category-detail-btn").click(function(e){
            e.preventDefault();
            var id = $(this).attr("href");
            $("#detailForm input[name='id']").val(id);
            $("#detailForm").submit();
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
    DatatableHtmlTableDemo0.init();
});



function delItem(obj){
    var btn = $(obj);
    swal({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!'
    }).then(function (result) {
        if (result.value) {
            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            var id = btn.attr("href");
            var param = new Object();
            param.id = id;
            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            $.post(SITE_PATH + "BackManage/delAttentionCategory", param, function(data){
                btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                if(data.status == "1"){
                    window.location.href = SITE_PATH + 'BackManage/attentionCategoryList';
                }else{
                    alert(data.msg);
                }
            }, "json");
        }
    });

}

function  upItem(obj){
    var btn = $(obj);
    btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
    var id = btn.attr("href");
    var param = new Object();
    param.id = id;
    btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
    $.post(SITE_PATH + "BackManage/upAttentionCategory", param, function(data){
        btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
        if(data.status == "1"){
            window.location.reload();
        }else{
            alert(data.msg);
        }
    }, "json");
}

function  downItem(obj){
    var btn = $(obj);
    btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
    var id = btn.attr("href");
    var param = new Object();
    param.id = id;
    btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
    $.post(SITE_PATH + "BackManage/downAttentionCategory", param, function(data){
        btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
        if(data.status == "1"){
            window.location.reload();
        }else{
            alert(data.msg);
        }
    }, "json");
}

function editOrder(obj){
    var id = $(obj).data('id');
    var order = $(obj).data('order');
    $("#m_modal_attention_order").find("#display_order").val(order);
    $("#m_modal_attention_order").find("input[name='id']").val(id);
    $("#modalBtn").click();
}

function saveOrder(obj){
    var btn = $(obj);
    var display_order = $("#m_modal_attention_order").find("#display_order").val();
    var id = $("#m_modal_attention_order").find("input[name='id']").val();
    var param = new Object();
    param.id = id;
    param.display_order = display_order;
    var thisObj = obj;
    btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
    $.post(SITE_PATH+"BackManage/createattentioncategoryasorder", param, function(data){
        btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
        if(data.status == "1"){
            $(thisObj).prev().click();
            window.location.reload();
        }else{
            alert(data.msg);
        }
    }, "json");
}