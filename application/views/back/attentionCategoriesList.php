<div class="m-portlet m-portlet--mobile">
<div class="m-portlet__head">
    <div class="m-portlet__head-caption">
        <div class="m-portlet__head-title">
            <h3 class="m-portlet__head-text">
                Attention Categories Table
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
            <div class="col-xl-4 order-1 order-xl-2 m--align-right hidden">
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
               Order
            </th>
            <th title="Field #2">
                Title
            </th>
            <th title="Field #5">
                Actions
            </th>
        </tr>
        </thead>
       <tbody>
       <?php foreach($list as $val) {  ?>
           <tr >
               <td><?php echo $val->display_order;?></td>
               <td><?php echo $val->title;?></td>
               <td>
                   <button type = "button" data-id="<?php echo $val->id;?>"  data-order = "<?php echo $val->display_order;?>" onclick = "editOrder(this);" data-category = "<?php echo $val->id;?>" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit">  <i class="la la-edit"></i> </button>
                   <button href="<?php echo $val->id;?>"  data-category = "<?php echo $val->id;?>" onclick = "delItem(this);" class="category-delete-btn m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="la la-remove"></i> </button>
               </td>
           </tr>
       <?php }?>
       </tbody>
    </table>
    <!--end: Datatable -->
</div>
</div>
<button id = "modalBtn" class = "hidden" type = "button" data-toggle = "modal" data-target = "#m_modal_attention_order"></button>
<div class="modal fade" id="m_modal_attention_order" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Edit Order
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">
												&times;
											</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="form-control-label">
                            Display Order:
                        </label>
                        <input type="text" class="form-control" id="display_order">
                        <input type = "hidden" name = "id">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    Close
                </button>
                <button type="button" onclick = "saveOrder(this);" class="btn btn-primary">
                    Save
                </button>
            </div>
        </div>
    </div>
</div>
<form id = "detailForm" action = "<?=site_url()?>/BackManage/categoryInfo" method = "post">
    <input type = "hidden" name = "id" value = "0"/>
</form>

<script src="<?=base_url()?>public/admin/attentionCategoriesList.js" type="text/javascript"></script>