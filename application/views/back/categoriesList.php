<div class="m-portlet m-portlet--mobile">
<div class="m-portlet__head">
    <div class="m-portlet__head-caption">
        <div class="m-portlet__head-title">
            <h3 class="m-portlet__head-text">
                Categories Table
            </h3>
        </div>
    </div>
</div>
<div class="m-portlet__body">
    <!--begin: Search Form -->
    <div class="m-form m-form--label-align-right m--margin-top-20 m--margin-bottom-30">
        <div class="row align-items-center">
            <div class="col-xl-8 order-2 order-xl-1">
                <div class="form-group m-form__group row align-items-center">
                    <div class="col-md-4">
                        <div class="m-input-icon m-input-icon--left">
                            <input type="text" class="form-control m-input" placeholder="Search..." id="generalSearch">
                            <span class="m-input-icon__icon m-input-icon__icon--left">
															<span>
																<i class="la la-search"></i>
															</span>
														</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 order-1 order-xl-2 m--align-right">
                <a href="javascript:void(0);"  onclick = "$('#detailForm input[name=\'id\']').val(0); $('#detailForm').submit();" class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air m-btn--pill">
												<span>
													<i class="la la-plus-circle"></i>
													<span>
														New Category
													</span>
												</span>
                </a>
                <div class="m-separator m-separator--dashed d-xl-none"></div>
            </div>
        </div>
    </div>
    <!--end: Search Form -->
    <!--begin: Datatable -->
    <table class="m-datatable" id="html_table" width="100%">
        <thead>
        <tr>
            <th title="Field #1">
                Code
            </th>
            <th title="Field #2">
                Used
            </th>
            <th>
                Attention
            </th>
            <th title="Field #3">
                Created
            </th>
            <th title="Field #4">
                Updated
            </th>
            <th title="Field #5">
                Actions
            </th>
        </tr>
        </thead>
       <tbody>
       <?php foreach($list as $val) {  ?>
           <tr >
               <td><?php echo $val->code;?></td>
               <td><?php echo $val->used;?></td>
               <td><span class="m-switch m-switch--info"><label><input type="checkbox" <?=$val->attention? 'checked' : ''?> name="" onchange="categoryAttention(<?=$val->id?>, <?=$val->attention? '0':'1';?>, this);" style="width: 60px"><span></span></label></span></td>
               <td><?php echo $val->created_at;?></td>
               <td><?php echo $val->updated_at;?></td>
               <td>
                   <button onclick="editCategory(<?php echo $val->id;?>)" class="category-detail-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="View ">  <i class="la la-edit"></i> </button>
                   <button onclick="deleteCategory(<?php echo $val->id;?>)" class="category-delete-btn m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="la la-trash"></i> </button>
               </td>
           </tr>
       <?php }?>
       </tbody>
    </table>
    <!--end: Datatable -->
</div>
</div>

<form id = "detailForm" action = "<?=site_url()?>/BackManage/categoryInfo" method = "post">
    <input type = "hidden" name = "id" value = "0"/>
</form>

<script src="<?=base_url()?>public/admin/categoriesList.js" type="text/javascript"></script>