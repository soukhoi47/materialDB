<?php
App::uses('AppModel', 'Model');
/**
 * Product Model
 *
 * @property Property $Property
 */
class Product extends AppModel {
	public $actAs = array('Containable','Taxonomy.Taxonomy');

}
