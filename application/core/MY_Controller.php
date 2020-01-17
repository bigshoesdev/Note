<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class MY_Controller extends CI_Controller {
	private $allowArr = array();
	public $input_data = array();

	protected  $menu_id = 1;
	function __construct()
	{
		parent::__construct();
        $this->load->library('session');
        $this->load->helper('common');
        $this->load->helper('url');
		
		$controller = $this->uri->rsegment(1);  ////get controller
        $action = $this->uri->rsegment(2);  ////get action
		//(authority, control, action array)
		
		$this->allow('guest', 'BackLogin', array('index', 'check', 'create', 'logout', 'm_login', 'm_signup'));
		$this->allow('user', 'BackManage', array('index', 'ajaxUserList','userList' ,'categoryList','ajaxCategoryList', 'attentionCategoryList' ,'ajaxAttentionCategoryList','postsList','ajaxPostsList','commentsList', 'ajaxCommentsList','userInfo', 'createUser', 'delUser','categoryInfo','createCategory',
            'delCategory', 'createPost', 'delPost','createComment','delComment','createAttentionCategory','delAttentionCategory','createattentioncategory','createattentioncategoryasorder','upAttentionCategory','downAttentionCategory','updatePassword','ajaxUpdatePassword',
            'canceledUser','activeUser'));

		$this->allow('guest', 'api', array('register', 'get_notifications'));
		///////////
		$this->convert_request();
		///////////
		if(!$this->session->has_userdata('user_role')){
			if(!$this->isAllowed('guest', $controller, $action))
				echo '<script>location.href="'.site_url().'/BackLogin"</script>';
		}else{
			if(!$this->isAllowed('guest', $controller, $action) && !$this->isAllowed('user', $controller, $action))
				echo '<script>location.href="'.site_url().'/BackManage"</script>';
		}
	//*/	
		if(!$this->isAllowed('guest', $controller, $action) && !$this->isAllowed('user', $controller, $action))
			echo '<script>location.href="'.site_url().'/BackLogin"</script>';
		
	}

	// Common response code
    const SUCCESS               = 200;
    const ACCOUNT_NO_EXIST      = 450;
    const ACCOUNT_DISABLED      = 451;

    /////////
	private function allow($role, $controller, $s_controllerArr){
		$allowArr=$this->allowArr;
		if(!isset($allowArr[$role]))
			$allowArr[$role]=array();
		array_push($allowArr[$role], array($controller=>$s_controllerArr));
		$this->allowArr=$allowArr;
	}
	/////////
	private function isAllowed($role, $controller, $action){
		$allowArr=$this->allowArr;
		if(!isset($allowArr[$role]))
			return false;
		else{
			$flag = false;
			foreach($allowArr[$role] as $key => $_allowArr){
				if(!isset($_allowArr[$controller]))
					continue;
				if(in_array($action, $_allowArr[$controller]))
					$flag = true;
			}
			return $flag;
		}
	}
	public function temple_page($view = '', $data = array(), $show_right_panel = FALSE, $show_header_panel = true) {
		//*
		if(!$this->session->has_userdata('user_role')){
			$data1['role']='guest';
			$data1['role1']='';
		}else{
			$data1['role'] = $this->session->user_role;
			$data1['role1'] ='user';
		}


		//*/
			
		$data1['show_header_panel']=$show_header_panel;
		$data1['menu_id'] = $this->menu_id;
        $data1['admin_name'] = $this->session->user_name;
        $data1['admin_email'] = $this->session->user_email;

        $this->load->view("templates/admin_header", $data1);
		if(trim($view)!=='')
			$this->load->view($view, $data);
        $this->load->view("templates/admin_footer", $data1);
    }

	public function rest_api($url, $content_type, $method, $postData=''){
		
		$ch = curl_init();
		$headers=array(
			'Accept: application/json',
			'Authorization: '.OPENFIRE_PWD,
			'Content-Type: application/'.$content_type,
		);
		curl_setopt($ch, CURLOPT_HEADER, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_FAILONERROR, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
		curl_setopt($ch, CURLOPT_URL, REST_URL.$url);
		if($postData!=='')
			curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
		$server_output = curl_exec($ch);
		curl_close ($ch);
		return $server_output;
	}
	
	public function quote_smart($value){
		// remove stripsladhes(/).
		if(get_magic_quotes_gpc()){
			$value=stripslashes($value);
		}
		// Quote if not integer: 
		$value = htmlspecialchars($value, ENT_QUOTES);
		$value = stripslashes($value);
		if (!is_numeric($value)){
			//$value=mysql_real_escape_string($value);
		}

		return $value;
	}
	/////////////////////////////////////
	public function convert_request(){
		$this->input_data = array();

        $this->input_data = array_merge($this->input_data, $_GET);

        if (!empty($_SERVER['CONTENT_TYPE']) && $_SERVER['CONTENT_TYPE'] == 'application/json')
        {
            $request = file_get_contents('php://input');
            $result = json_decode($request, TRUE);

            if ($result)
            {
                $this->input_data = array_merge($this->input_data, $result);
            }
        }
        else if (!empty($_SERVER['CONTENT_TYPE']) && substr($_SERVER['CONTENT_TYPE'], 0, 19) == 'multipart/form-data')
        {
            $this->input_data = array_merge($this->input_data, $_POST);
        }
	}
	/////////////////////////////////////
	
}
