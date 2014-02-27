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
        
        $d = $this->Product->findById($id);
        debug($d); die();
        if (!$d['Product']) {
            throw new NotFoundException(__('Invalid product'));
        }
        debug($d);
        $this->set('d',$d);
    }

}

