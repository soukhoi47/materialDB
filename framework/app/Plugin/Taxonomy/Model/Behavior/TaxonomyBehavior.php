<?php
class TaxonomyBehavior extends ModelBehavior{


	public function setup(Model $model,$config = array()){
		$model->hasAndBelongsToMany['Term'] = array(
			'className'  => 'Taxonomy.Term',
			'associationForeignKey' => 'term_id',
			'with'      => 'Taxonomy.TermR',
			'foreignKey' => 'ref_id',
			'joinTable'  => 'term_relationships',
			'conditions' => 'ref = "'.$model->name.'"'
		);
	}

	public function afterSave(Model $model, $created, $options = array()){
		if(isset($model->data[$model->name]['terms'])){
			$model->deleteTerms(array_keys($model->data[$model->name]['terms'])); 
			foreach($model->data[$model->name]['terms'] as $terms){
				if(!empty($terms)){
					foreach($terms as $term_id){
						$model->Term->TermR->create();
						$model->Term->TermR->save(array(
							'term_id' => $term_id,
							'ref'	  => $model->name,
							'ref_id'  => $model->id
						));
					}
				}
			}
		}
	}

	public function afterFind(Model $model, $results, $primary = false){
		foreach($results as $k=>$v){
			if(!empty($v['Term'])){
				$results[$k][$model->name]['terms'] = Set::Combine($v['Term'],'{n}.id','{n}.id','{n}.type');
				$results[$k]['Taxonomy'] = Set::Combine($v['Term'],'{n}.id','{n}','{n}.type');
			}
		}
		return $results;
	}

	/**
	* List terms
	**/
	public function listTerms($model){
		$args = func_get_args();
		unset($args[0]);
		return $model->Term->find('list',array(
			'fields' => array('id',Configure::read('Taxonomy.field'),'type'),
			'conditions' => array('type'=>$args)
		));
	}


	public function addTerm($model,$name,$type){
		$d = array(
			Configure::read('Taxonomy.field') => $name,
			'type' => $type
		);
		$term = $model->Term->find('first',array('conditions' => $d,'fields' => array('id')));
		if(empty($term)){
			$model->Term->create(); 
			$model->Term->save($d); 
			$term_id = $model->Term->id; 
		}else{
			$term_id = $term['Term']['id'];
		}
		$d = array(
			'ref'     => $model->name,
			'ref_id'  => $model->id,
			'term_id' => $term_id
		);
		$count = $model->Term->TermR->find('count',array('conditions'=>$d));
		if($count == 0){
			$model->Term->TermR->create(); 
			$model->Term->TermR->save($d);
		}
		return true;
	}


	public function deleteTerms($model,$types){
		$terms = $model->Term->find('list',array(
			'fields' => array('id','id'),
			'conditions' => array('Term.type'=>$types)
		));
		$model->Term->TermR->deleteAll(array(
			'ref' => $model->name,
			'ref_id'=>$model->id,
			'term_id' => $terms
		));
	}



}
