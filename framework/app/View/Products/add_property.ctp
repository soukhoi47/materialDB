<!-- File: /app/View/Products/addProperty.ctp -->

<?php echo $this->Form->create('property');?>
<!-- 	<?php echo $this->Form->input();?>-->
<table>
	<tr>
		<td rowspan="2">
			<?php echo $this->Form->input('property',array('label'=>"Property","type"=>'select','multiple'=>'false','size' => 10));?> 
		</td>
		<td>
		<?php echo $this->Form->input('value');?>
		</td>
	</tr>
		<td>
			<?php echo $this->Form->end('Add');?>
		</td>
	</tr>
</table>




