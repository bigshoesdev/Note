$(".detail-btn").click(function(e){
    e.preventDefault();
    var id = $(this).attr("href");
    $("#detailForm input[name='id']").val(id);
    $("#detailForm").submit();
})


