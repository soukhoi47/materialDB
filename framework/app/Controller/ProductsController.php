<?php
class ProductsController extends AppController {
    public $helpers = array('Html', 'Form');
/*Index controller listing all Post*/
    public function index() {
        $this->set('products', $this->Post->find('all'));
    }

}
