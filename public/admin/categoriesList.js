//== Class definition

var DatatableHtmlTableDemo1 = function() {
    //== Private functions

    // demo initializer
    var demo = function() {

        var datatable = $('.m-datatable').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: BASE_PATH +'/BackManage/ajaxCategoryList',
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
                    field: 'code',
                    title: 'Code',
                    template: function(row) {
                        return '\
                            <a href = "http://45.76.96.167/note.mu/public/hashtag/'+row.code+'" target=" _blank">'+row.code+'</a>';
                    },
                },
                {
                    field: 'used',
                    title: 'Used',
                },
                {
                    field: 'attention',
                    title: 'Attention',
                    template: function(row) {
                        var str = '';
                        var val = 1;
                        if(row.attention){
                            str = 'checked';
                            val = 0;
                        }
                        return '\
                            <span class="m-switch m-switch--info"><label><input type="checkbox" '+str+' name="" onchange="categoryAttention(\''+row.id+'\', \''+val+'\', this);" style="width: 60px"><span></span></label></span>';
                    },
                },
                {
                    field: 'created_at',
                    title: 'Created',
                },
                {
                    field: 'updated_at',
                    title: 'Updated',
                },
                {
                    field: 'actions',
                    title: 'Actions',
                    template: function (row, index, datatable) {
                        return '\
                        <button onclick="editCategory('+row.id+')" class="category-detail-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="View ">  <i class="la la-edit"></i> </button> \
                        <button onclick="deleteCategory('+row.id+')" class="category-delete-btn m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="la la-trash"></i> </button>\
                        ';
                    }
                },
            ],
        });

        $('#m_form_status').on('change', function () {
            datatable.search($(this).val().toLowerCase(), 'Used');
        });

        $('#m_form_type').on('change', function () {
            datatable.search($(this).val().toLowerCase(), 'Type');
        });

        $('#m_form_status, #m_form_type').selectpicker();

        $("tbody .category-attention-btn").click(function (e) {
            e.preventDefault();
            addAttentionItem($(this)[0]);
        });
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
    DatatableHtmlTableDemo1.init();
});

function addAttentionItem(obj){
    var id = $(obj).attr("href");
    var btn = $(obj);
    var param = new Object();
    param.id = id;
    swal({
        title: 'Are you sure?',
        text: "You add the item as attention category!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!'
    }).then(function (result) {
        if (result.value) {
            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            $.post(SITE_PATH + "BackManage/createAttentionCategory", param, function(data){
                btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                if(data.status == "1"){
                    swal('Success', 'The operation success!', 'success').then(function() {
                        window.location.href = SITE_PATH + 'BackManage/categoryList';
                    });
                }else{
                    swal("Error!", data.msg, "error");
                }
            }, "json");
        }
    });

}

function categoryAttention(cat_id, attention, obj) {
    var method = attention =='0' ? 'delAttentionCategory' : 'createAttentionCategory';
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
                $(thisObj).attr("onchange","categoryAttention("+cat_id+", "+(parseInt(attentionVal)+1)%2+", this)");
                //window.location.reload();
            } else {
                swal("Error!", data.msg, "error");
            }
        }
    });
}

function editCategory(category_id) {
    $("#detailForm input[name='id']").val(category_id);
    $("#detailForm").submit();
}

function deleteCategory(category_id) {
    //var id = $(this).attr("href");
    var btn = $(this);
    var param = new Object();

    swal({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!'
    }).then(function (result) {
        if (result.value) {
            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            param = {id: category_id};
            $.post(SITE_PATH + "BackManage/delCategory", param, function (data) {
                btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                if (data.status == "1") {
                    window.location.href = SITE_PATH + 'BackManage/categoryList';
                } else {
                    swal("Error!", data.msg, "error");
                }
            }, "json");
        }
    });
}