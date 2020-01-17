<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once 'tables.php';
class Categories_model extends MY_Model {
	function __construct() {
		parent::__construct();
        $this->table = TBL_CATEGORIES;
        $this->fields  = array('id', 'code', 'used');
        $this->timestamp = true;
	}

    public function getList($where  = ''){
//        $ret = $this->_get_list($where);
//        return $ret;
        $this->db->select('c.id, c.code, c.used, a.display_order as attention, c.created_at, c.updated_at')
            ->from($this->table.' c')
            ->join('attention_categories a', 'a.id = c.id', 'left');
        return $this->db->get()->result();
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
                if($key != 'generalSearch' && $key1 != 'type'){
                    $where[$key1] = $value;
                }

                if($key1 == 'generalsearch'){
                    $like[] = array('categories.code'=>$value);
                }
            }
        }

        if(count($where) == 0){
            $where = '';
        }

        if(count($like) == 0){
            $like = null;
        }
        $join = array('attention_categories a', 'a.id = categories.id', 'left');
        $select = 'categories.id, categories.code, categories.used, a.display_order as attention, categories.created_at, categories.updated_at';
        $ret = array();
        $ret['data'] = $this->_get_list($where, $like, $join,null, $limit, $select);
        $ret['cnt'] = $this->_get_list_count($where, $like, $join);
        /*$this->db->select('c.id, c.code, c.used, a.display_order as attention, c.created_at, c.updated_at')
            ->from($this->table.' c')
            ->join('attention_categories a', 'a.id = c.id', 'left');
        return $this->db->get()->result();*/
        return $ret;
    }

    public function getInfo($id)
    {
        $info = $this->_get(array('id' => $id));
        return $info;
    }

    public function save($info){
        $this->_save($info);
    }

    public function  delete($condition)
    {
        $this->_delete($condition);
    }
}