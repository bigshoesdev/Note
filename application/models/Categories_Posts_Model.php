<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once 'tables.php';
class Categories_Posts_Model extends MY_Model {
	function __construct() {
		parent::__construct();
        $this->table = TBL_CATEGORIES_POSTS;
        $this->fields  = array('category_id', 'post_id');
        $this->timestamp = true;
	}
    public function getInfo($id)
    {
        $info = $this->_get(array('category_id' => $id));
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