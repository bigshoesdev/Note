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
                       User Info
                    </h3>
                </div>
            </div>
        </div>
        <!--begin::Form-->
        <form class="m-form m-form--fit m-form--label-align-right">
            <input type = "hidden" name = "id" value = "<?php echo $id;?>">
            <div class="m-portlet__body">
                <div class="form-group m-form__group">
                    <label for="exampleInputEmail1">
                       UserName
                    </label>
                    <input type="text" class="form-control m-input m-input--square" name = "name"  placeholder="UserName" value = "<?php echo getObjectParamInfo($info, 'name', '');?>">
                </div>
                <div class="form-group m-form__group">
                    <label for="exampleInputEmail1">
                        Email address
                    </label>
                    <input type="email" class="form-control m-input m-input--square" name="email" aria-describedby="emailHelp" placeholder="Enter email" value = "<?php echo getObjectParamInfo($info, 'email', '');?>">
                    <span class="m-form__help">
                                                    We'll never share your email with anyone else.
                     </span>
                </div>
                <div class="form-group m-form__group">
                <label class="m-checkbox">
                    <input type="checkbox" id = "chkPassword">
                       Do you update password?
                    <span></span>
                </label>
                </div>
                <div class="form-group m-form__group hidden pass_rect">
                    <label for="exampleInputPassword1">
                        Password
                    </label>
                    <input type="password" class="form-control m-input m-input--square" id="password1" name = "password1" placeholder="Password">
                </div>
                <div class="form-group m-form__group hidden pass_rect">
                    <label for="exampleInputPassword1">
                        ConfirmPassword
                    </label>
                    <input type="password" class="form-control m-input m-input--square" id="password2" name = "password2" placeholder="ConfirmPassword">
                </div>
                <div class="form-group m-form__group">
                    <label for="exampleSelect1">
                       Status
                    </label>
                    <select class="form-control m-input m-input--square selectpicker" name ="status">
                        <option value = "active" <?php if(getObjectParamInfo($info, 'status', 'active') == 'active')  echo 'selected = "selected"';?> >
                            Active
                        </option>
                        <option value = "canceled" <?php if(getObjectParamInfo($info, 'status', 'active') == 'canceled')  echo 'selected = "selected"';?>>
                            Canceled
                        </option>
                    </select>
                </div>

                <div class="form-group m-form__group">
                    <label for="exampleSelect1">
                        Type
                    </label>
                    <select class="form-control m-input m-input--square selectpicker" name ="type">
                        <option value = "admin" <?php if(isset($permission))  echo 'selected = "selected"';?>>
                           Admin
                        </option>
                        <option value = "user" <?php if(!isset($permission))  echo 'selected = "selected"';?>>
                            User
                        </option>
                    </select>
                </div>
                <div class="m-form__group form-group <?php if(!isset($permission))  echo 'hidden';?>" id = "permission_rect">
                    <label for="">
                        Permission
                    </label>
                    <div class="m-checkbox-inline">
                        <label class="m-checkbox">
                            <input type="checkbox" id = "usersCheck" <?php if(isset($permission)&&getObjectParamInfo($permission, 'manage_users', '0')*1==1) echo "checked = 'checked'";?> >
                            Users
                            <span></span>
                        </label>
                        <label class="m-checkbox">
                            <input type="checkbox"  id = "categoriesCheck" <?php if(isset($permission)&&getObjectParamInfo($permission, 'manage_categories', '0')*1==1) echo "checked = 'checked'";?>>
                            Categories
                            <span></span>
                        </label>
                        <label class="m-checkbox">
                            <input type="checkbox" id = "postsCheck" <?php if(isset($permission)&&getObjectParamInfo($permission, 'manage_posts', '0')*1==1) echo "checked = 'checked'";?> >
                            Posts
                            <span></span>
                        </label>
                    </div>
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

<script src="<?=base_url()?>public/admin/userInfo.js" type="text/javascript"></script>