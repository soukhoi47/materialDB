<?php
App::uses('AppModel', 'Model');
/**
 * Product Model
 *
 * @property Property $Property
 */
class Product extends AppModel {

	public $hasAndBelongsToMany = array(
		'Property' => array(
			'className' => 'Property',
			'joinTable' => 'products_properties',
			'foreignKey' => 'products_ID',
			'associationForeignKey' => 'properties_ID',
			'unique' => 'keepExisting',
			'conditions' => 'products_ID="Product"',
		)
	);

	public $actAs = array('contanable');
}
