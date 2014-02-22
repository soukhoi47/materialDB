<!-- File: /app/View/Products/view.ctp -->

<h1><?php echo h($product['Product']['name']); ?></h1>

<p><small>Created: <?php echo $product['Product']['created']; ?></small></p>

<p><strong>Properties:</strong></p>

<table>
    <tr>
        <th>Property</th>
        <th>Value</th>
        <th>Unit</th>
    </tr>

    <!-- Here is where we loop through our $Products array, printing out Product info -->

    <?php foreach ($Properties as $Property): ?>
    <tr>
        <td><?php echo $Property['name']; ?> [<?php echo $Property['symbol']; ?>]</td>
        <td><?php echo $Property['ProductsProperty']['valeur']; ?></td>
        <td><?php echo $Property['unit']; ?></td>
    </tr>
    <?php endforeach; ?>
    <?php unset($Product); ?>
</table>
