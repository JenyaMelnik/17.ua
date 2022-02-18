<?php
Core::$CSS[] = '<link type="text/css" rel=stylesheet href="/css/newsStyle.css"';

// ================================================ Удаление категории =============================================
if (isset($_GET['action']) && $_GET['action'] == 'delete') {
    query("
        DELETE FROM `news_category`
        WHERE `id` = " . (int)$_GET['id'] . "
    ");

    $_SESSION['notice'] = 'Категория удалена';
    redirectTo(['module' => 'news', 'page'=>'categories']);
}

// =================================================================================================================
$categories = query("
    SELECT * FROM `news_category`
");

include "./" . Core::$CONTROLLER . "/news/addCategory.php";
include "./" . Core::$CONTROLLER . "/news/editCategory.php";

if (isset($_SESSION['notice'])) {
    $notice = $_SESSION['notice'];
    unset($_SESSION['notice']);
}


