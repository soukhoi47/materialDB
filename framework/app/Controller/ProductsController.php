<?php
class ProductsController extends AppController {
    public $helpers = array('Html', 'Form');
/*Index controller listing all Products*/
    public function index() {
        $this->set('Products', $this->Product->find('all'));
    }

/*view funtion to control the view of a product*/
     public function view($id = null) {
        if (!$id) {
            throw new NotFoundException(__('Invalid post'));
        }

        $this->Product->contain('Property');
        $product = $this->Product->findById($id);
        $properties=$product['Property'];
        if (!$product) {
            throw new NotFoundException(__('Invalid product'));
        }
        $this->set('product', $product);
        $this->set('properties', $properties);
    }

    public function addProperty($id = null) {
        $d['Properties']=$this->Product->Property->find('list');
        debug($d['Properties']);
        $this->set($d);
    }
}

