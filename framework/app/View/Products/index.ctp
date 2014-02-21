<!-- File: /app/View/Products/index.ctp -->

<h1>Product list</h1>
<table>
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Actions</th>
        <th>Created</th>
    </tr>

<!-- Here's where we loop through our $posts array, printing out product info -->

    <?php foreach ($product as $product): ?>
    <tr>
        <td><?php echo $product['product']['id']; ?></td>
    </tr>
    <?php endforeach; ?>

</table>