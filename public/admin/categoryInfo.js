//== Class Definition
var SnippetForm1 = function() {

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
        $("#preview").click(function(){
             window.location.href = SITE_PATH + 'BackManage/categoryList';
        })
    }

    var handleSignInFormSubmit = function() {
        $('#submit').click(function(e) {
            e.preventDefault();
            var btn = $(this);
            var form = $(this).closest('form');

            form.validate({
                rules: {
                    code : {
                        required: true
                    }
                }
            });

            if (!form.valid()) {
                return;
            }

            btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            form.ajaxSubmit({
                url: SITE_PATH + 'BackManage/createCategory',
                type:"POST",
                dataType:"json",
                beforeSend: function (data, status) {
                    btn.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
                },
                success: function(response, status, xhr, $form) {
                    btn.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
                    if(response.status==1){
                        swal('Success', 'The operation success!', 'success').then(function() {
                            window.location.href = SITE_PATH + 'BackManage/categoryList';
                        });
                    }else{
                        swal("Error!", response.msg, "error");
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
    SnippetForm1.init();
});