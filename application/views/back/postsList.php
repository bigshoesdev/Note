<div class="m-portlet m-portlet--mobile">
<div class="m-portlet__head">
    <div class="m-portlet__head-caption">
        <div class="m-portlet__head-title">
            <h3 class="m-portlet__head-text">
               Posts Table
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
                                    <option value="open">
                                        Open
                                    </option>
                                    <option value="close">
                                        Close
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
                                    <option value="text">
                                        text
                                    </option>
                                    <option value="audio">
                                        audio
                                    </option>
                                    <option value="video">
                                        video
                                    </option>
                                    <option value="picture">
                                        picture
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

            <div class="col-xl-4 order-1 order-xl-2 m--align-right hidden">
                <a href="#" class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air m-btn--pill">
												<span>
													<i class="la la-plus-circle"></i>
													<span>
														New Post
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
                Title
            </th>
            <th title="Field #2">
                Status
            </th>
            <th title="Field #3">
                Type
            </th>
            <th title="Field #4">
                Recommended
            </th>
            <th title="Field #5">
                Author
            </th>
            <th>
                Favourite Count
            </th>
            <th>
                Comment Count
            </th>
            <th title="Field #6">
                Actions
            </th>
        </tr>
        </thead>
       <tbody>
       <?php foreach($list as $val) {  ?>
           <tr >
               <td><?php echo $val->title;?></td>
               <td><?php echo $val->status;?></td>
               <td><?php echo $val->type;?></td>
               <td><span class="m-switch m-switch--info"><label><input type="checkbox" <?=$val->recommended? 'checked' : ''?> name="" onchange="postRecommended(<?=$val->id?>, <?=$val->recommended?>);" style="width: 60px"><span></span></label></span></td>
               <td><?php echo $val->author;?></td>
               <td><?=$val->cnt_favourite?></td>
               <td><?=$val->cnt_comment?></td>
               <td>
               <?php if($val->status == 'open'){?>
                    <a data-id="<?php echo $val->id;?>"  onclick = "postUpdate(this);"    data-status = "close" class="posts-update-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Close ">  <i class="la flaticon-close"></i> </a>
               <?php }else{?>
                   <a data-id="<?php echo $val->id;?>"   onclick = "postUpdate(this);"   data-status = "open" class="posts-update-btn m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Open ">  <i class="la flaticon-open-box"></i> </a>
               <?php }?>
                   <a href="javascript:postDelete(<?=$val->id?>);" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Open ">  <i class="la la-trash"></i> </a>
               </td>
           </tr>
       <?php }?>
       </tbody>
    </table>
    <!--end: Datatable -->
</div>
</div>

<script src="<?=base_url()?>public/admin/postsList.js" type="text/javascript"></script>