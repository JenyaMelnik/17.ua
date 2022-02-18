<?php

$resault = query("
    SELECT *
    FROM `goods_category`
    ORDER BY `id`
");
?>
    <select name="category">
        <?php while ($row = $resault->fetch_assoc()) { ?>
            <option value="<?= $row['category'] ?>"><?= $row['category'] ?></option>
        <?php } ?>
    </select>
<?php
$resault->close();


$res = query("
    SELECT * FROM `goods`
");
while ($row = $res->fetch_assoc()) {
    $res2 = query("
    SELECT `category` FROM `goods_category` WHERE `id` = " . $row['category_id'] . "
    ");
    $row2 = $res2->fetch_assoc();
    echo 'Данное вино относиться к категории: ' . $row2['category'];
}





