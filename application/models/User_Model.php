<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once 'tables.php';
class User_model extends MY_Model {

	function __construct() {
		parent::__construct();
        $this->table = TBL_USER;
        $this->fields  = array('id', 'name', 'email', 'password', 'status');
	}
	public function verify($user_id, $user_pwd)
    {
        $user_info = $this->_get(array('email' => $user_id, 'password' => md5($user_pwd)));
        if (!$user_info)
        {
            return false;
        }

        return $user_info;
    }

    public function getUserList($where  = ''){
        $ret = $this->_get_list($where);
        return $ret;
    }

    public function getAjaxUserList($param){
        $where = array();
        $query = array();

        $page    = ! empty( $param[ 'pagination' ][ 'page' ] ) ? (int)$param[ 'pagination' ][ 'page' ] : 1;
        $perpage = ! empty( $param[ 'pagination' ][ 'perpage' ] ) ? (int)$param[ 'pagination' ][ 'perpage' ] : 10;

        $limit = array();
        $limit[1] = ($page*1 - 1 ) * $perpage;
        $limit[0] =  $perpage*1;

        if(isset($param['query'])){
            $query = $param['query'];
        }

        $like = array();
        if(!is_string($query)){
            foreach($query as $key => $value){
                $key1 = strtolower($key);
                if($key != 'generalSearch' && $key1 != 'type'){
                    $where[$key1] = $value;
                }

                if($key1 == 'type'){
                    if($value*1 == 0){
                        $where['staffs.id '] = null;
                    }else{
                        $where['staffs.id !='] = null;
                    }
                }
                if($key1 == 'generalsearch'){
                    $like[] = array('name'=>$value);
                    $like[] = array('email'=>$value);
                }
            }
        }

        if(count($where) == 0){
            $where = '';
        }

        if(count($like) == 0){
            $like = null;
        }
        $join = array('staffs', 'users.id = staffs.id', 'left');
        $ret = array();
        $ret['data'] = $this->_get_list($where, $like, $join,null, $limit, 'users.*');
        $ret['cnt'] = $this->_get_list_count($where, $like, $join);

        return $ret;
    }


	
	public function existCheck($user_email)
    {
        $user_info = $this->_get(array('user_email' => $user_email));
        if (!$user_info)
        {
            return false;
        }

        return true;
    }
	public function getInfo($uid)
    {
        $user_info = $this->_get(array('id' => $uid));
        if (!$user_info)
        {
            return false;
        }

        return $user_info;
    }
	
	public function insert($user_info)
    {
		$cnt = $this->_count(array('user_email' => $user_info['user_email']));
		if($cnt>0)
			return false;
		$user_info['uid'] = $this->_get_uid($user_info['user_email']);/////generate unique key.

        $result = $this->_insert($user_info);

        if (!$result)
        {
            return false;
        }

        return true;
    }

    public function m_insert($user_info)
    {
		$cnt = $this->_count(array('user_email' => $user_info['user_email']));
		if($cnt>0)
			return false;
		$user_info['uid'] = $this->_get_uid($user_info['user_email']);/////generate unique key.

        $result = $this->_insert($user_info);

        if (!$result)
        {
            return array();
        }

        return $user_info;
    }
    
    public function getuserinfo($param1,$param2,$param3)//get total users' information. 
    {
		$this->db->from($this->table);
		if(count($param1) > 0)$this->db->or_like($param1);
		$this->db->order_by('user_role', 'asc');
		$this->db->limit($param2,$param3);
		$query=$this->db->get();
		
		$rows = $query->result();
        if (count($rows) == 0)
        {
            return array();
        }
		
		return $rows;	
    }

    public function getusercount($param1)//get number of total users.
    {
		$this->db->from($this->table);
		if(count($param1) > 0)$this->db->or_like($param1);
	    $query=$this->db->get();
		return count($query->result());
    }

    //------------------------------------------------------------------//

    public function update_by_email($email, $user_info){
        return $this->_update(array('user_email' => $email), $user_info);
    }	

	public function get_by_uid($uid) {
        return $this->_get(array('uid' => $uid));
    }

    public function updateuserinfo($param1, $param2){
     	return $this->_update($param1,$param2);
    }
	public function deluser($param1){
		$data=array('id'=>$param1);
		return $this->_delete($data);
		
   	}
   	public function delete($condition = array()){
        return $this->_delete($condition);
    }
    public function getuserid($condition){
	   return $this->_get($condition);
    }

    public function save($info){
        return $this->_save($info);
    }
}