<?php
class Term extends AppModel{
	
	public $recursive = -1; 
	public $hasMany = array('TermR' => array(
		'className' => 'Taxonomy.TermR',
		'dependent' => true
	)); 
	public $displayField = 'name';


	public function afterFind($results, $primary = false){
		foreach($results as $k=>$v){
			if(isset($v['Term']['name_'.Configure::read('Config.language')])){
				$results[$k]['Term']['name'] = $v['Term']['name_'.Configure::read('Config.language')];
			}
		}
		return $results; 
	}

}
