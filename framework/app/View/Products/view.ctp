<!-- File: /app/View/Products/view.ctp -->

<h1><?php echo h($product['Product']['name']); ?></h1>

<p><small>Created: <?php echo $product['Product']['created']; ?></small></p>

<table>
    <tr>
        <th>Property</th>
        <th>Value</th>
        <th>Unit</th>
    </tr>

    <!-- Here is where we loop through our $Properties array, printing out Product properties info -->

    <?php foreach ($properties as $property): ?>
    <tr>
        <td><?php echo $property['name']; ?> <strong>[<?php echo $property['symbol']; ?>]</strong></td>
        <td><?php echo $property['ProductsProperty']['valeur']; ?></td>
        <td><?php echo $property['unit']; ?></td>
    </tr>
    <?php endforeach; ?>
    <?php unset($Properties); ?>
</table>
