<?php

$wine = query("
    SELECT *
    FROM `goods`
    WHERE `id` = " . (int)$_GET['id'] . "
    LIMIT 1
");

if (!mysqli_num_rows($wine)) {
    $_SESSION['notice'] = 'Данного товара не существует!';
    redirectTo(['module' => 'goods']);
}

$item = mysqli_fetch_assoc($wine);