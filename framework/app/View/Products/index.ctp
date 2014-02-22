<h1>Blog Products</h1>
<table>
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Created</th>
    </tr>

    <!-- Here is where we loop through our $Products array, printing out Product info -->

    <?php foreach ($Products as $Product): ?>
    <tr>
        <td><?php echo $Product['Product']['id']; ?></td>
        <td>
            <?php echo $this->Html->link($Product['Product']['name'],
array('controller' => 'Products', 'action' => 'view', $Product['Product']['id'])); ?>
        </td>
        <td><?php echo $Product['Product']['created']; ?></td>
    </tr>
    <?php endforeach; ?>
    <?php unset($Product); ?>
</table>