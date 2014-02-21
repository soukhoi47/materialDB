<!-- File: /app/View/Products/index.ctp -->

<h1>Blog posts</h1>
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
        <td>
            <?php
                echo $this->Html->link(
                    $product['product']['title'],
                    array('action' => 'view', $product['product']['id'])
                );
            ?>
        </td>
    </tr>
    <?php endforeach; ?>

</table>