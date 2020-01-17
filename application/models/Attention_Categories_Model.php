<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once 'tables.php';
class Attention_Categories_Model extends MY_Model {
	function __construct() {
		parent::__construct();
        $this->table = TBL_ATTENTION_CATEGORIES;
        $this->fields  = array('id', 'display_order');
        $this->timestamp = true;
	}

    public function getList($where  = ''){
//        $ret = $this->_get_list($where);
//        return $ret;
        $this->db->select('a.id, c.code as title, a.display_order')
            ->from($this->table.' a')
            ->join(TBL_CATEGORIES.' c', 'a.id = c.id', 'left')->order_by('a.display_order');
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
                    $like[] = array('c.code'=>$value);
                }
            }
        }

        if(count($where) == 0){
            $where = '';
        }

        if(count($like) == 0){
            $like = null;
        }
        $join = array(TBL_CATEGORIES.' c', 'attention_categories.id = c.id', 'left');
        $ret = array();
        $select = 'attention_categories.id, c.code as title, attention_categories.display_order';
        $ret['data'] = $this->_get_list($where, $like, $join,'attention_categories.display_order', $limit, $select);
        $ret['cnt'] = $this->_get_list_count($where, $like, $join);

        return $ret;
    }

    public function getInfo($id)
    {
        $info = $this->_get(array('id' => $id));
        return $info;
    }

    public function saveInfo($info){
        $info = $this->correctField($info);
        $this->_update(array('id'=>$info['id']), $info);
    }

    public function upItem($id){
        $info = $this->_get(array('id' => $id));
        if(!isset($info->id)) return;
        $displayOrder = $info->display_order;
        if($displayOrder*1==1) return;
        $data = array('display_order'=>$displayOrder);
        $this->db->where('display_order', $displayOrder-1);
        $this->db->update($this->table, $data);
        $data = array('display_order'=> $displayOrder-1);
        $this->db->where('id', $id);
        $this->db->update($this->table, $data);

    }

    public function downItem($id){
        $info = $this->_get(array('id' => $id));
        if(!isset($info->id)) return;
        $displayOrder = $info->display_order;
        $data = array('display_order'=> $displayOrder);
        $this->db->where('display_order', $displayOrder+1);
        $this->db->update($this->table, $data);
        $data = array('display_order'=> $displayOrder+1);
        $this->db->where('id', $id);
        $this->db->update($this->table, $data);
    }

    public function save($info){
        $info = $this->correctField($info);
        $cnt = $this->_count(array('id'=>$info['id']));
        if($cnt > 0) return;
        if(!isset($info['display_order'])){
//            $list = $this->_get_list('', array('display_order', 'DESC '));
            $max = $this->db->select('max(display_order) as display_order')->from($this->table)->get()->row();
            if( empty($max) ){
                $info['display_order'] = 1;
            }else{
                $info['display_order'] = $max->display_order*1 + 1;
            }
        }
        if($cnt>0){
            $this->_update(array('id'=>$info['id']), $info);
        }else{
            $this->_insert($info);
        }
        //$this->_save($info);
    }

    public function  delete($condition)
    {
        $this->_delete($condition);
    }
}