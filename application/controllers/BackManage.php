<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BackManage extends MY_Controller {

	public function __construct(){
        parent::__construct();
		$this->load->model('User_Model', 'user');
        $this->load->model('Staffs_Model', 'staffs');
        $this->load->model('Categories_Model', 'categories');
        $this->load->model('Categories_Posts_Model', 'categoriesPosts');
        $this->load->model('Attention_Categories_Model', 'attentionCategories');
        $this->load->model('Posts_Model', 'posts');
        $this->load->model('Comments_Model', 'comments');
	}

	public function index(){
	    $this->userList();
	}

	public function userList(){
        $data= array();
        $this->menu_id = 1;
        $users = array();
        /*$users = $this->user->getUserList();
        foreach($users as $item){
            if(!$this->staffs->isAdmin($item->id)){
                $item->type =  0;
            }else{
                $item->type =  1;
            }
        }*/
        $data['list'] = $users;
        $this->temple_page('back/userList', $data);
    }

    public function ajaxUserList(){
        $datatable = array_merge( array( 'pagination' => array(), 'sort' => array(), 'query' => array() ), $_REQUEST );
        $filter = isset( $datatable[ 'query' ][ 'generalSearch' ] ) && is_string( $datatable[ 'query' ][ 'generalSearch' ] ) ? $datatable[ 'query' ][ 'generalSearch' ] : '';
        $ret = $this->user->getAjaxUserList($datatable);
        $users = $ret['data'];
        foreach($users as $item){
            if(!$this->staffs->isAdmin($item->id)){
                $item->type =  0;
            }else{
                $item->type =  1;
            }

            $item->postsCount = $this->posts->getUserPostCount($item->id);
            $item->commentsCount = $this->comments->getUserCommentsCount($item->id);

        }
        $meta    = array();
        $page    = ! empty( $datatable[ 'pagination' ][ 'page' ] ) ? (int)$datatable[ 'pagination' ][ 'page' ] : 1;
        $perpage = ! empty( $datatable[ 'pagination' ][ 'perpage' ] ) ? (int)$datatable[ 'pagination' ][ 'perpage' ] : -1;

        $pages = 1;
        $total =$ret['cnt']; // total items in array
        if ( $perpage > 0 ) {
            $pages  = ceil( $total / $perpage ); // calculate total pages
            $page   = max( $page, 1 ); // get 1 page when $_REQUEST['page'] <= 0
            $page   = min( $page, $pages ); // get last page when $_REQUEST['page'] > $totalPages
            $offset = ( $page - 1 ) * $perpage;
            if ( $offset < 0 ) {
                $offset = 0;
            }

            //$data = array_slice( $data, $offset, $perpage, true );
        }

        $meta = array(
            'page'    => $page,
            'pages'   => $pages,
            'perpage' => $perpage,
            'total'   => $total,
        );
        $result = array(
            'meta' => $meta + array(
                    'sort'  => array(),
                    'field' => array(),
                ),
            'data' => $users
        );
        echo json_encode( $result, JSON_PRETTY_PRINT );
    }

    public function userInfo(){
        $param = array_merge($_POST, $_GET);
        $this->menu_id = 1;
        $id = 0;
        if (isset($param['id'])) {
            $id = $param['id']*1;
            if(!$id) $id = 0;    
        }
        
	    $data = array();
	    $info = $this->user->getInfo($id*1);
	    if($info){
	        $permission = $this->staffs->isAdmin($info->id);
	        if($permission){
	            $data['permission'] = $permission;
            }
        }
	    $data['info'] = $info;
        $data['id'] = $id;
        $this->temple_page('back/userInfo', $data);
    }

    public function updatePassword(){
        $param = array_merge($_POST, $_GET);
        $this->menu_id = 1;
        //
        $this->temple_page('back/updatePassword', array());
    }

    public function canceledUser(){
        $param = array_merge($_POST, $_GET);
        $param['status'] = 'canceled';
        $this->user->save($param);
        echo json_encode(array('status'=>1));
    }

    public function activeUser(){
        $param = array_merge($_POST, $_GET);
        $param['status'] = 'active';
        $this->user->save($param);
        echo json_encode(array('status'=>1));
    }

    public function ajaxUpdatePassword(){
        $param = array_merge($_POST, $_GET);
        if(isset($param['password1']) && !empty($param['password1'])) {
            $param['password'] = md5($param['password1']);
        }

        $param['id'] = $this->session->uid;
        $this->user->save($param);
        echo json_encode(array('status'=>1));
    }

    public function createUser(){
        $param = array_merge($_POST, $_GET);

        //check for duplicate
        if ($this->user->_get(array('email' => $param['email'], 'id !=' => $param['id']))) {
            echo json_encode(array('status' => 0, 'msg' => 'Email Duplicated'));
            return;
        }

        if(isset($param['password1']) && !empty($param['password1'])) {
            $param['password'] = md5($param['password1']);
        }

        $param['id'] = $this->user->save($param);
        //if create admin --> add id to param
        if($param['type'] == 'admin'){
            $this->staffs->save($param);
        }

        if($param['type'] == 'user' && $param['id']*1 != 1){
            $this->staffs->delete(array('id'=>$param['id']));
        }

        echo json_encode(array('status'=>1));
    }



    public function delUser(){
        $param = array_merge($_POST, $_GET);
        $id = $param['id'];
        if(!$id ){
            echo json_encode(array('status'=>0, 'msg'=>'Please check object'));
            return;
        }

        if($id *1 == 1){
            echo json_encode(array('status'=>0, 'msg'=>'Can not delete Admin Info'));
            return;
        }
        $this->user->delete(array('id'=> $id));
        echo json_encode(array('status'=>1));
    }

    public function categoryList(){
	    $data = array();
        $this->menu_id = 2;
        //$list = $this->categories->getList();
        $list = array();
        $data['list'] = $list;
        $this->temple_page('back/categoriesList', $data);
    }

    public function ajaxCategoryList(){
        $datatable = array_merge( array( 'pagination' => array(), 'sort' => array(), 'query' => array() ), $_REQUEST );
        $filter = isset( $datatable[ 'query' ][ 'generalSearch' ] ) && is_string( $datatable[ 'query' ][ 'generalSearch' ] ) ? $datatable[ 'query' ][ 'generalSearch' ] : '';
        $ret = $this->categories->getAjaxList($datatable);
        $data = $ret['data'];

        $meta    = array();
        $page    = ! empty( $datatable[ 'pagination' ][ 'page' ] ) ? (int)$datatable[ 'pagination' ][ 'page' ] : 1;
        $perpage = ! empty( $datatable[ 'pagination' ][ 'perpage' ] ) ? (int)$datatable[ 'pagination' ][ 'perpage' ] : -1;

        $pages = 1;
        $total =$ret['cnt']; // total items in array
        if ( $perpage > 0 ) {
            $pages  = ceil( $total / $perpage ); // calculate total pages
            $page   = max( $page, 1 ); // get 1 page when $_REQUEST['page'] <= 0
            $page   = min( $page, $pages ); // get last page when $_REQUEST['page'] > $totalPages
            $offset = ( $page - 1 ) * $perpage;
            if ( $offset < 0 ) {
                $offset = 0;
            }

            //$data = array_slice( $data, $offset, $perpage, true );
        }

        $meta = array(
            'page'    => $page,
            'pages'   => $pages,
            'perpage' => $perpage,
            'total'   => $total,
        );
        $result = array(
            'meta' => $meta + array(
                    'sort'  => array(),
                    'field' => array(),
                ),
            'data' => $data
        );
        echo json_encode( $result, JSON_PRETTY_PRINT );
    }

    public function categoryInfo(){
        $param = array_merge($_POST, $_GET);
        $this->menu_id = 2;
        $id = $param['id']*1;
        if(!$id) $id = 0;
        $data = array();
        $info = $this->categories->getInfo($id*1);
        $data['info'] = $info;
        $data['id'] = $id;
        $this->temple_page('back/categoryInfo', $data);
    }

    public function createCategory(){
        $param = array_merge($_POST, $_GET);
        $this->categories->save($param);
        echo json_encode(array('status'=>1));
    }

    public function delCategory(){
        $param = array_merge($_POST, $_GET);
        $id = $param['id'];
        if(!$id ){
            echo json_encode(array('status'=>0, 'msg'=>'Please check object'));
            return;
        }
        $info = $this->categoriesPosts->getInfo($id);
        if($info){
            echo json_encode(array('status'=>0, 'msg'=>'can not delete category that is exit post'));
            return;
        }
        $this->categories->delete(array('id'=> $id));
        $this->attentionCategories->delete(array('id' => $id));
        echo json_encode(array('status'=>1));
    }

    public function attentioncategoryList(){
        $data = array();
        $this->menu_id = 5;
        //$list = $this->attentionCategories->getList();
        $list = array();
        $data['list'] = $list;
        $this->temple_page('back/attentionCategoriesList', $data);
    }

    public function ajaxAttentionCategoryList(){
        $datatable = array_merge( array( 'pagination' => array(), 'sort' => array(), 'query' => array() ), $_REQUEST );
        $filter = isset( $datatable[ 'query' ][ 'generalSearch' ] ) && is_string( $datatable[ 'query' ][ 'generalSearch' ] ) ? $datatable[ 'query' ][ 'generalSearch' ] : '';
        $ret = $this->attentionCategories->getAjaxList($datatable);
        $data = $ret['data'];

        $meta    = array();
        $page    = ! empty( $datatable[ 'pagination' ][ 'page' ] ) ? (int)$datatable[ 'pagination' ][ 'page' ] : 1;
        $perpage = ! empty( $datatable[ 'pagination' ][ 'perpage' ] ) ? (int)$datatable[ 'pagination' ][ 'perpage' ] : -1;

        $pages = 1;
        $total =$ret['cnt']; // total items in array
        if ( $perpage > 0 ) {
            $pages  = ceil( $total / $perpage ); // calculate total pages
            $page   = max( $page, 1 ); // get 1 page when $_REQUEST['page'] <= 0
            $page   = min( $page, $pages ); // get last page when $_REQUEST['page'] > $totalPages
            $offset = ( $page - 1 ) * $perpage;
            if ( $offset < 0 ) {
                $offset = 0;
            }

            //$data = array_slice( $data, $offset, $perpage, true );
        }

        $meta = array(
            'page'    => $page,
            'pages'   => $pages,
            'perpage' => $perpage,
            'total'   => $total,
        );
        $result = array(
            'meta' => $meta + array(
                    'sort'  => array(),
                    'field' => array(),
                ),
            'data' => $data
        );
        echo json_encode( $result, JSON_PRETTY_PRINT );
    }

    public function createattentioncategory(){
        $param = array_merge($_POST, $_GET);
        $this->attentionCategories->save($param);

        echo json_encode(array('status'=>1));
    }

    public function createattentioncategoryasorder(){
        $param = array_merge($_POST, $_GET);
        $this->attentionCategories->saveInfo($param);

        echo json_encode(array('status'=>1));
    }

    public function delAttentionCategory(){
        $param = array_merge($_POST, $_GET);
        $id = $param['id'];
        if(!$id ){
            echo json_encode(array('status'=>0, 'msg'=>'Please check object'));
            return;
        }
        $this->attentionCategories->delete(array('id'=> $id));

        echo json_encode(array('status'=>1));
    }

    public function upAttentionCategory(){
        $param = array_merge($_POST, $_GET);
        $id = $param['id'];
        if(!$id ){
            echo json_encode(array('status'=>0, 'msg'=>'Please check object'));
            return;
        }
        $this->attentionCategories->upItem($id);

        echo json_encode(array('status'=>1));
    }

    public function downAttentionCategory(){
        $param = array_merge($_POST, $_GET);
        $id = $param['id'];
        if(!$id ){
            echo json_encode(array('status'=>0, 'msg'=>'Please check object'));
            return;
        }
        $this->attentionCategories->downItem($id);

        echo json_encode(array('status'=>1));
    }

    public function postslist(){
        $data = array();
        $this->menu_id = 3;
        /*$list = $this->posts->getList();
        foreach($list as $item){
            $user = $this->user->getInfo($item->author_id);
            if(!$user){
                $item->author =  'no author';
            }else{
                $item->author =  $user->name;
            }
        }*/
        $list = array();
        $data['list'] = $list;
        $this->temple_page('back/postsList', $data);
    }

    public function ajaxPostsList(){
        $datatable = array_merge( array( 'pagination' => array(), 'sort' => array(), 'query' => array() ), $_REQUEST );
        $filter = isset( $datatable[ 'query' ][ 'generalSearch' ] ) && is_string( $datatable[ 'query' ][ 'generalSearch' ] ) ? $datatable[ 'query' ][ 'generalSearch' ] : '';
        $ret = $this->posts->getAjaxList($datatable);
        $data = $ret['data'];
        foreach($data as $item){
            $user = $this->user->getInfo($item->author_id);
            if(!$user){
                $item->author =  'no author';
            }else{
                $item->author =  $user->name;
            }
        }

        $meta    = array();
        $page    = ! empty( $datatable[ 'pagination' ][ 'page' ] ) ? (int)$datatable[ 'pagination' ][ 'page' ] : 1;
        $perpage = ! empty( $datatable[ 'pagination' ][ 'perpage' ] ) ? (int)$datatable[ 'pagination' ][ 'perpage' ] : -1;

        $pages = 1;
        $total =$ret['cnt']; // total items in array
        if ( $perpage > 0 ) {
            $pages  = ceil( $total / $perpage ); // calculate total pages
            $page   = max( $page, 1 ); // get 1 page when $_REQUEST['page'] <= 0
            $page   = min( $page, $pages ); // get last page when $_REQUEST['page'] > $totalPages
            $offset = ( $page - 1 ) * $perpage;
            if ( $offset < 0 ) {
                $offset = 0;
            }

            //$data = array_slice( $data, $offset, $perpage, true );
        }

        $meta = array(
            'page'    => $page,
            'pages'   => $pages,
            'perpage' => $perpage,
            'total'   => $total,
        );
        $result = array(
            'meta' => $meta + array(
                    'sort'  => array(),
                    'field' => array(),
                ),
            'data' => $data
        );
        echo json_encode( $result, JSON_PRETTY_PRINT );
    }

    public function createpost(){
        $param = array_merge($_POST, $_GET);
        $this->posts->save($param);
        echo json_encode(array('status'=>1));
    }

    public function delpost(){
        $param = array_merge($_POST, $_GET);
        $id = $param['id'];
        if(!$id ){
            echo json_encode(array('status'=>0, 'msg'=>'Please check object'));
            return;
        }

        if($id *1 == 1){
            echo json_encode(array('status'=>0, 'msg'=>'Can not delete Admin Info'));
        }
		$this->posts->_delete(array('id'=> $id));
		
		echo json_encode(array('status' => true, 'msg' => 'Success'));
    }

    public function postrecommended() {
	    $post_id = $this->input->post('id');
	    $recommended = $this->input->post('recommended');
	    $this->posts->recommended($post_id, $recommended);

	    echo json_encode(array('status' => true, 'msg' => 'Success'));
    }

    public function commentslist(){
        $data = array();
        $this->menu_id = 4;
        /*$list = $this->comments->getList();
        foreach($list as $item){
            $user = $this->user->getInfo($item->author_id);
            if(!$user){
                $item->author =  'no author';
            }else{
                $item->author =  $user->name;
            }

            $post = $this->posts->get($item->post_id);
            if(!$post){
                $item->postname =  'no post';
            }else{
                $item->postname =  $post->title;
            }
        }*/
        $list = array();
        $data['list'] = $list;
        $this->temple_page('back/commentsList', $data);
    }

    public function ajaxCommentsList(){
        $datatable = array_merge( array( 'pagination' => array(), 'sort' => array(), 'query' => array() ), $_REQUEST );
        $filter = isset( $datatable[ 'query' ][ 'generalSearch' ] ) && is_string( $datatable[ 'query' ][ 'generalSearch' ] ) ? $datatable[ 'query' ][ 'generalSearch' ] : '';
        $ret = $this->comments->getAjaxList($datatable);
        $data = $ret['data'];
        foreach($data as $item){
            $user = $this->user->getInfo($item->author_id);
            if(!$user){
                $item->author =  'no author';
            }else{
                $item->author =  $user->name;
            }

            $post = $this->posts->get($item->post_id);
            if(!$post){
                $item->postname =  'no post';
            }else{
                $item->postname =  $post->title;
            }
        }

        $meta    = array();
        $page    = ! empty( $datatable[ 'pagination' ][ 'page' ] ) ? (int)$datatable[ 'pagination' ][ 'page' ] : 1;
        $perpage = ! empty( $datatable[ 'pagination' ][ 'perpage' ] ) ? (int)$datatable[ 'pagination' ][ 'perpage' ] : -1;

        $pages = 1;
        $total =$ret['cnt']; // total items in array
        if ( $perpage > 0 ) {
            $pages  = ceil( $total / $perpage ); // calculate total pages
            $page   = max( $page, 1 ); // get 1 page when $_REQUEST['page'] <= 0
            $page   = min( $page, $pages ); // get last page when $_REQUEST['page'] > $totalPages
            $offset = ( $page - 1 ) * $perpage;
            if ( $offset < 0 ) {
                $offset = 0;
            }

            //$data = array_slice( $data, $offset, $perpage, true );
        }

        $meta = array(
            'page'    => $page,
            'pages'   => $pages,
            'perpage' => $perpage,
            'total'   => $total,
        );
        $result = array(
            'meta' => $meta + array(
                    'sort'  => array(),
                    'field' => array(),
                ),
            'data' => $data
        );
        echo json_encode( $result, JSON_PRETTY_PRINT );
    }

    public function createcomment(){
        $param = array_merge($_POST, $_GET);
        $this->comments->save($param);
        echo json_encode(array('status'=>1));
    }

    public function delcomment(){
        $param = array_merge($_POST, $_GET);
        $id = $param['id'];
        if(!$id ){
            echo json_encode(array('status'=>0, 'msg'=>'Please check object'));
            return;
        }

		$this->comments->_delete(array('id'=> $id));
		
		echo json_encode(array('status' => true, 'msg' => 'Success'));
    }
}
