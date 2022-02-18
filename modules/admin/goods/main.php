<?php
/**
 * @var $dbc mysqli
 */

if (isset($_POST['delete'])) {
    if (!empty($_POST['ids'])) {
        $arrayIds = [];
        foreach ($_POST['ids'] as $v) {
            $arrayIds[] = (int)$v;
        }
        $ids = implode(',', $arrayIds);
        query("
            DELETE FROM `goods`
            WHERE `id` IN (" . $ids . ")
        ");

        $_SESSION['notice'] = 'Товары удалены';

    } else {
        $_SESSION['notice'] = 'Выберите хотя бы один товар';
    }
    redirectTo(['module' => 'goods']);
}

if (isset($_GET['action']) && $_GET['action'] == 'delete') {
    query("
        DELETE FROM `goods` 
        WHERE `id` = " . (int)$_GET['id'] . "
    ");

    $_SESSION['notice'] = 'Товар удален';
    redirectTo(['module' => 'goods']);
}

$wines = query("
            SELECT *
            FROM `goods`
            ORDER BY `id` DESC
         ");

if (isset($_SESSION['notice'])) {
    $notice = $_SESSION['notice'];
    unset($_SESSION['notice']);
}
