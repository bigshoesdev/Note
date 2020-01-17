<div class="m-portlet m-portlet--mobile">
<div class="m-portlet__head">
    <div class="m-portlet__head-caption" >
        <div class="m-portlet__head-title">
            <h3 class="m-portlet__head-text">
                User Table
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
                        <div class="m-form__group m-form__group--inline">
                            <div class="m-form__label">
                                <label>
                                    Status:
                                </label>
                            </div>
                            <div class="m-form__control">
                                <select class="form-control m-bootstrap-select" id="m_form_status">
                                    <option value="">
                                        All
                                    </option>
                                    <option value="Active">
                                        Active
                                    </option>
                                    <option value="Canceled">
                                        Canceled
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="d-md-none m--margin-bottom-10"></div>
                    </div>
                    <div class="col-md-4">
                        <div class="m-form__group m-form__group--inline">
                            <div class="m-form__label">
                                <label class="m-label m-label--single">
                                    Type:
                                </label>
                            </div>
                            <div class="m-form__control">
                                <select class="form-control m-bootstrap-select" id="m_form_type">
                                    <option value="">
                                        All
                                    </option>
                                    <option value="0">
                                        User
                                    </option>
                                    <option value="1">
                                        Admin
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="d-md-none m--margin-bottom-10"></div>
                    </div>
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
														New User
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
                Name
            </th>
            <th title="Field #2">
                Email
            </th>
            <th title="Field #3">
                PostsCount
            </th>
            <th title="Field #4">
                CommentsCount
            </th>
            <th title="Field #5">
                Status
            </th>
            <th title="Field #6">
                Type
            </th>
            <th title="Field #7">
                    Actions
            </th>
        </tr>
        </thead>
       <tbody>
       <?php foreach($list as $val) {  ?>
           <tr >
               <td><?php echo $val->name;?></td>
               <td><?php echo $val->email;?></td>
               <td><?php echo $val->postsCount;?></td>
               <td><?php echo $val->commentsCount;?></td>
               <td><?php echo $val->status;?></td>
               <td><?php echo $val->type;?></td>
               <td>
                   <button type = "button"  onclick = "detailView(this);" href="<?php echo $val->id;?>"  class="detail-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="View ">  <i class="la la-edit"></i> </button>
                   <button type = "button"  onclick = "delItem(this);" href="<?php echo $val->id;?>"  class="delete-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Delete ">  <i class="la la-remove"></i> </button>
               </td>
           </tr>
       <?php }?>
       </tbody>
    </table>
    <!--end: Datatable -->
</div>
</div>

<form id = "detailForm" action = "<?=site_url()?>/BackManage/userInfo" method = "post">
    <input type = "hidden" name = "id" value = "0"/>
</form>

<script src="<?=base_url()?>public/admin/userList.js" type="text/javascript"></script>