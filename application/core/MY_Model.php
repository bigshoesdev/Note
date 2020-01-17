<?php

class MY_Model extends CI_Model {
    
	public $table = '';
	public $primary = 'id';
	public $fields = array('status', 'id');
	public $timestamp = false;

	public function __construct()
    {
        $this->load->database();
        parent::__construct();
	}

    public function _get_uid($prefix = '')
    {
        return md5($prefix . time() . rand());
    }



	public function _get($condition)
    {

    	if ($this->table == null OR $this->table == '' )
    	{
    		return array();
    	}

        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where($condition);
        
        $query = $this->db->get();
        $rows = $query->result();

        if (count($rows) == 0)
        {
            return array();
        }
		return $rows[0];
    }

	public function _get_list($condition,$like = null ,$join = null, $order = null, $limit = null, $select = '' )
    {

		if ($this->table == null OR $this->table == '')
    	{
    		return array();
    	}
        if($select != ''){
            $this->db->select($select);
        }else{
            $this->db->select('*');
        }

        $this->db->from($this->table);
		if($condition!=='')
			$this->db->where($condition);
        
        if ($order != null)
        {
            if(!is_string($order)){
                foreach ($order as $key => $value)
                {
                    $this->db->order_by($key, $value);
                }
            }else{
                $this->db->order_by($order);
            }

        }

        if($limit != null){
            if(count($limit) == 2){
                $this->db->limit($limit[0],$limit[1]);
            }

            if(count($limit) == 1){
                $this->db->limit($limit[0]);
            }
        }

        if($join != null){
            if(count($join) ==2)
            $this->db->join($join[0], $join[1]);

            if(count($join) ==3)
                $this->db->join($join[0], $join[1], $join[2]);
        }

        if($like != null && !is_string($like)){
            $i =0;
            foreach($like as $item){
                if($i==0){
                    $this->db->like($item);
                }else{
                    $this->db->or_like($item);
                }
                $i++;
            }

        }

        $query = $this->db->get();
        $rows = $query->result();
        if (count($rows) == 0)
        {
            return array();
        }
		return $rows;
    }

    public function _get_list_count($condition,$like = null ,$join = null)
    {
        if ($this->table == null OR $this->table == '')
        {
            return array();
        }

        $this->db->select('*');
        $this->db->from($this->table);
        if($condition!=='')
            $this->db->where($condition);



        if($join != null){
            if(count($join) ==2)
                $this->db->join($join[0], $join[1]);

            if(count($join) ==3)
                $this->db->join($join[0], $join[1], $join[2]);
        }

        if($like != null && !is_string($like)){
            $i =0;
            foreach($like as $item){
                if($i==0){
                    $this->db->like($item);
                }else{
                    $this->db->or_like($item);
                }
                $i++;
            }

        }

        $count = $this->db->count_all_results();

        return $count;
    }



    public  function correctField($info){
	    $ret = array();
	    foreach($info as $key => $value){
	        if(in_array($key, $this->fields)){
	            $ret[$key]  = $value;
            }
        }

        return $ret;
    }
    public  function _save($info){
        $info = $this->correctField($info);
        if($info[$this->primary]*1 == 0){
            unset($info[$this->primary]);
        }
        if($this->timestamp){
            $info['updated_at'] = date('Y-m-d H:i:s');
        }
	    if(isset($info[$this->primary])){
            $condition = array($this->primary=>$info[$this->primary]);
            $this->_update($condition, $info);
            return $info[$this->primary];
        }else{
            $info['created_at'] = date('Y-m-d H:i:s');
	        $this->_insert($info);
        }
        return $this->db->insert_id();
    }
    public function _insert($info)
    {
		
    	if ($this->table == null OR $this->table == '')
    	{
    		return false;
    	}
    	
        $this->db->insert($this->table, $info);
        return true;
    }

    public function _update($condition, $info)
    {
		if ($this->table == null OR $this->table == '')
    	{
    		return false;
    	}
		
    	$this->db->where($condition);
        $this->db->update($this->table, $info);

        return true;
    }

	public function _delete($condition)
	{
		if ($this->table == null OR $this->table == '')
    	{
    		return false;
    	}

    	$this->db->where($condition);
        $this->db->delete($this->table);

        return true;
	}

	public function _count($condition)
	{
		if ($this->table == null OR $this->table == '')
    	{
    		return false;
    	}

    	$this->db->where($condition);
        $this->db->from($this->table);
		$count = $this->db->count_all_results();
        return $count;
	}

}
?>
