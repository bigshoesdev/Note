<div class = "row">
 <div class = "col-md-12">
    <div class="m-portlet m-portlet--tab">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                                                <span class="m-portlet__head-icon m--hide">
                                                    <i class="la la-gear"></i>
                                                </span>
                    <h3 class="m-portlet__head-text">
                       UpdatePassword
                    </h3>
                </div>
            </div>
        </div>
        <!--begin::Form-->
        <form class="m-form m-form--fit m-form--label-align-right">
            <div class="m-portlet__body">
                <div class="form-group m-form__group pass_rect">
                    <label for="exampleInputPassword1">
                        Password
                    </label>
                    <input type="password" class="form-control m-input m-input--square" id="password1" name = "password1" placeholder="Password">
                </div>
                <div class="form-group m-form__group pass_rect">
                    <label for="exampleInputPassword1">
                        ConfirmPassword
                    </label>
                    <input type="password" class="form-control m-input m-input--square" id="password2" name = "password2" placeholder="ConfirmPassword">
                </div>
            </div>
            <div class="m-portlet__foot m-portlet__foot--fit">
                <div class="m-form__actions">
                    <button type="button" id = "submit" class="btn btn-primary">
                        Submit
                    </button>
                    <button type="button"  id = "preview" class="btn btn-secondary">
                        Cancel
                    </button>
                </div>
            </div>
        </form>
        <!--end::Form-->
    </div>
 </div>
 </div>

<script src="<?=base_url()?>public/admin/updatePassword.js" type="text/javascript"></script>