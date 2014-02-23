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
			'foreignKey' => 'product_id',
			'associationForeignKey' => 'property_id',
			'unique' => 'keepExisting',
		)
	);
	public $recursive = -1;
	public $actsAs = array('Containable');
}
