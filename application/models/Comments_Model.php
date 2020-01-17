<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once 'tables.php';
class Comments_Model extends MY_Model {
	function __construct() {
		parent::__construct();
        $this->table = TBL_COMMENTS;
	}

    public function getList($where  = ''){
        $ret = $this->_get_list($where);
        return $ret;
    }

    public function getAjaxList($param){
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
                if($key != 'generalSearch' && $key != 'Status' ){
                    $where[$key1] = $value;
                }

                if($key1 == 'status'){
                    $like[] = array('comments.status'=>$value);
                }

                if($key1 == 'generalsearch'){
                    $like[] = array('comments.content'=>$value);
                    $like[] = array('c.title'=>$value);

                }
            }
        }

        if(count($where) == 0){
            $where = '';
        }

        if(count($like) == 0){
            $like = null;
        }
        $join = array('posts c', 'comments.post_id = c.id', 'left');
        $select = 'comments.*, c.title postname';
        $ret = array();
        $ret['data'] = $this->_get_list($where, $like, $join,null, $limit, $select);
        $ret['cnt'] = $this->_get_list_count($where, $like, $join);

        return $ret;
    }

    public function save($info){
        $this->_save($info);
    }

    public function getUserCommentsCount($userId){
        $where = array('author_id', $userId);
        return $this->_count($where);
    }
}