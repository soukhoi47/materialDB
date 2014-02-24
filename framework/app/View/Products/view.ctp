<!-- File: /app/View/Products/view.ctp -->

<h1><?php echo h($d['Product']['name']); ?></h1>

<p><small>Created: <?php echo $d['Product']['created']; ?></small></p>

<table>
    <tr>
        <th>Property</th>
        <th>Value</th>
        <th>Unit</th>
    </tr>

    <!-- Here is where we loop through our $Properties array, printing out Product properties info -->

    <?php foreach ($d['Property'] as $property): ?>
    <tr>
        <td><?php echo $property['name']; ?> <strong>[<?php echo $property['symbol']; ?>]</strong></td>
        <td><?php echo $property['ProductsProperty']['valeur']; ?></td>
        <td><?php echo $property['unit']; ?></td>
    </tr>
    <?php endforeach; ?>
    <p>
        <?php echo $this->Html->link('Add a Property',array('controller' => 'Products', 'action' => 'addProperty', $d['Product']['id'])); ?>
    </p>
    <?php unset($d); ?>

</table>
