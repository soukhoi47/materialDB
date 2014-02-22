<!-- File: /app/View/Products/view.ctp -->

<h1><?php echo h($product['Product']['name']); ?></h1>

<p><small>Created: <?php echo $product['Product']['created']; ?></small></p>

<table>
    <tr>
        <th>Property</th>
        <th>Value</th>
        <th>Unit</th>
    </tr>

    <!-- Here is where we loop through our $Products array, printing out Product info -->

    <?php foreach ($Products as $Product): ?>
    <tr>
        <td><?php echo $Product['Product']['Property']['name']; ?> [<?php echo $Product['Product']['Property']['symbol']; ?>]</td>
        <td><?php echo $Product['Product']['Property']['ProductsProperty']['valeur']; ?></td>
        <td><?php echo $Product['Product']['Property']['unit']; ?></td>
    </tr>
    <?php endforeach; ?>
    <?php unset($Product); ?>
</table>
