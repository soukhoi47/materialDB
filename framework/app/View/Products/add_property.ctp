<!-- File: /app/View/Products/addProperty.ctp -->

<?php echo $this->Form->create('Property');?>
<!-- 	<?php echo $this->Form->input();?>-->
	<?php echo $this->Form->input('Properties',array('label'=>"Property",'type'=>'select','multiple'=>'checkbox'));?> 
<?php echo $this->Form->end('Add');?>

