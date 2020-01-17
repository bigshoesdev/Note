<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BackLogin extends MY_Controller {
	public function __construct()
    {
        parent::__construct();
		$this->load->model('User_Model', 'user');
        $this->load->model('Staffs_Model', 'staffs');

	}
	public function index()
	{
		 
		$data['view'] = $this->quote_smart($this->input->get('view'));
		$this->load->view('back/login', $data);
		
	}

	//user sign up site.
	public function create()
	{
		if($this->input->method()=='post'){
				
			$data = array(
				'user_email' => $this->quote_smart($this->input->post('userid')),
				'user_password' => md5($this->quote_smart($this->input->post('register_password'))),
				'user_name' => $this->quote_smart($this->input->post('username')),
				'user_role' => 'admin',
			);

			$result=$this->user->insert($data);
			if($result)
				echo 1; ////success registering
			else{
				echo 0;  ////failed registering 
			}
		}
	}
	
	//user log in site.
	public function check()
	{

		if($this->input->method()=='post'){
			$user_id = $this->quote_smart($this->input->post('email'));
			$user_pwd = $this->quote_smart($this->input->post('password'));
			$user=$this->user->verify($user_id, $user_pwd);
			if(!$user){
				echo json_encode(array('status'=>'0', 'msg' => 'Incorrect username or password. Please try again'));
				return;
			}else{
			    $user_role = $this->staffs->isAdmin($user->id);
			    if(!$user_role){
                    echo json_encode(array('status'=>'0', 'msg' => 'You is Not permission within Admin page. Please try again'));
                    return;
                }

                $this->session->set_userdata('uid', $user->id);
                $this->session->set_userdata('user_email', $user->email);
                $this->session->set_userdata('user_name', $user->name);
                $this->session->set_userdata('user_role', $user_role);
                echo json_encode(array('status'=>'1'));
			}
		}
	}

	
	public function logout() {
		//$condition['user_id']=$this->session->user_id;
		//$data['logout_date']=date('Y-m-d H:i:s');
		
		$this->session->unset_userdata('uid');
        
		$this->session->unset_userdata('user_email');
        $this->session->unset_userdata('user_name');
        $this->session->unset_userdata('user_role');

        // $this->load->view('back/login');
		//echo '<script>location.href="/login"</script>';
        redirect('/login');
    }

    //mobile api version
    public function m_login(){

    	if($this->input->method()=='post'){

    		$user_email = $this->quote_smart($this->input->post('m_email'));
			$user_pwd = $this->quote_smart($this->input->post('m_password'));

			$user=$this->user->verify($user_email, $user_pwd);

			if(!$user){
				echo json_encode(array('flag' => 0));
			}else{
				if($user->user_role=='user' || $user->user_role=='admin'){

					$this->session->set_userdata('uid', $user->uid);
					$this->session->set_userdata('user_email', $user->user_email);
					$this->session->set_userdata('user_name', $user->user_name);
					$this->session->set_userdata('user_role', $user->user_role);

					$array = array('uid' => $user->uid, 'user_email'=> $user->user_email, 'user_name'=>$user->user_name,'user_role'=>$user->user_role);
					//get user's tones.
					$arr_tones = $this->media->get_medias($user->uid);
					foreach($arr_tones as $val){
						switch ($val->md_content_type) {
							case '1':
								$val->md_content_type = 'text';
								break;
							case '2':
								$val->md_content_type = 'video';
								break;
							case '3':
								$val->md_content_type = 'image';
								break;
							case '4':
								$val->md_content_type = 'weburl';
								break;
							case '5':
								$val->md_content_type = 'notification';
								break;
							default:
								# code...
								break;
						}
					}
					echo json_encode(array('flag' => 1, 'info'=>$array, 'tones'=>$arr_tones));	
				}else{
					echo json_encode(array('flag' => 0));
				}
			}
		}
    }

    public function m_signup(){
    	if($this->input->method()=='post'){
			$user_email = $this->quote_smart($this->input->post('m_email'));
			$user_pwd = md5($this->quote_smart($this->input->post('m_password')));
			$data = array(
				'user_email' => $user_email,
				'user_password' => $user_pwd,
				'user_name' => $this->quote_smart($this->input->post('m_username')),
				'user_role' => 'user'
			);
			
			$result=$this->user->m_insert($data);
			if($result == false){
				echo json_encode(array('flag' => -1));  ////existing the same email
			}else if(count($result) > 0){ ////success registering 
				echo json_encode(array('flag'=> 1, 'info'=>$result));
			}else{
				echo json_encode(array('flag' => 0));  ////failed registering 
			}
		}
    }
}
