//== Class Definition
var SnippetForm2 = function() {

    var login = $('#m_login');

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

    var handleFomDisplay = function(){
        $("#chkPassword").click(function(){
            if($(this).prop("checked")){
                $(".pass_rect").removeClass("hidden");
            }else{
                $(".pass_rect").addClass("hidden");
            }
        });

        $("select[name='type']").change(function(){
            if($(this).val() == "admin"){
                $("#permission_rect").removeClass("hidden");
            }else{
                $("#permission_rect").addClass("hidden");
            }
        })


        $("#preview").click(function(){
            window.location.href = SITE_PATH + 'BackManage/userList';
            // window.history.back();
        })
    }

    var handleSignInFormSubmit = function() {
        $("#preview").click(function(){
            window.history.back();
        })

        $('#submit').click(function(e) {
            e.preventDefault();
            var btn = $(this);
            var form = $(this).closest('form');

            var password1 = $("#password1").val();
            var password2 = $("#password2").val();
            if(password1 == '' || password1 == ''){
                showErrorMsg(form, 'danger', 'Input  password. Please try correct.');
                return;
            }
            if(password1 != password2){
                showErrorMsg(form, 'danger', 'Incorrect  password. Please try correct.');
                return;
            }



            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            form.ajaxSubmit({
                url: SITE_PATH + 'BackManage/ajaxUpdatePassword',
                type:"POST",
                dataType:"json",
                beforeSend: function (data, status) {
                    btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
                },
                success: function(response, status, xhr, $form) {
                    btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                    if(response.status==1){
                        swal('Success', 'The operation success!', 'success').then(function() {
                            //window.location.href = SITE_PATH + 'BackManage/userList';
                        });
                    }else{
                        swal("Error!",  response.msg, "warning");
                    }
                }
            });
        });
    }
    //== Public Functions
    return {
        // public functions
        init: function() {
            handleFomDisplay();
            handleSignInFormSubmit();
        }
    };
}();

//== Class Initialization
jQuery(document).ready(function() {
    SnippetForm2.init();
});

