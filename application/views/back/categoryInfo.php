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
                       Category Info
                    </h3>
                </div>
            </div>
        </div>
        <!--begin::Form-->
        <form class="m-form m-form--fit m-form--label-align-right">
            <input type = "hidden" name = "id" value = "<?php echo $id ?>">
            <div class="m-portlet__body">
                <div class="form-group m-form__group">
                    <label for="exampleInputEmail1">
                       Code
                    </label>
                    <input type="text" class="form-control m-input m-input--square" name = "code"  placeholder="Code" value = "<?php echo getObjectParamInfo($info, 'code', '');?>">
                </div>
                <div class="form-group m-form__group">
                    <label for="exampleSelect1">
                        Used
                    </label>
                    <input type="number" class="form-control m-input m-input--square" name = "used"  placeholder="Used" value = "<?php echo getObjectParamInfo($info, 'used', '0');?>">
                </div>
            </div>
            <div class="m-portlet__foot m-portlet__foot--fit">
                <div class="m-form__actions">
                    <button type="button" id = "submit" class="btn btn-primary">
                        Submit
                    </button>
                    <button type="button" id = "preview"  class="btn btn-secondary">
                        Cancel
                    </button>
                </div>
            </div>
        </form>
        <!--end::Form-->
    </div>
 </div>
 </div>

<script src="<?=base_url()?>public/admin/categoryInfo.js" type="text/javascript"></script>