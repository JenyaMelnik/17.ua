<?php

Core::$JS[] = '<script src="/skins/admin/js/methods.js"></script>';

//==================================  Удаление нескольких записей  ==================================================
if (isset($_POST['delete'])) {
    foreach ($_POST['ids'] as $k => $v) {
        $_POST['ids'][$k] = (int)$v;
    }

    $ids = implode(',', $_POST['ids']);
    query("
        DELETE FROM `news`
        WHERE `id` IN (" . $ids . ")
    ");

    $_SESSION['info'] = 'Новости удалены';
    redirectTo(['module' => 'news']);
}

//==================================  Удаление одной записи  ========================================================
if (isset($_GET['action']) && $_GET['action'] == 'delete') {
    query("
        DELETE FROM `news`
        WHERE `id` = " . (int)$_GET['id'] . "
    ");

    $_SESSION['info'] = 'Новость удалена';
    redirectTo(['module' => 'news']);
}

//===================================  Выбираем все категории  ======================================================
$queryNewsCategories = query("
     SELECT *
     FROM `news_category`
     ORDER BY `id` ASC 
");

$shownCategory = 'Все новости';
$category = '';

//=================================== Выбираем текущую категорию ====================================================
if (isset($_GET['category'])) {
    $category = 'category=' . $_GET['category'] . '&';

    $queryCurrentCategory = query("
        SELECT *  FROM `news_category`
        WHERE `id` = " . (int)$_GET['category'] . "
    ");

    if ($queryCurrentCategory->num_rows) {
        $currentCategory = $queryCurrentCategory->fetch_assoc();
        $shownCategory = 'Категория новостей: ' . $currentCategory['category'];
    }

    $queryCurrentCategory->close();
}

//===================================  Выбираем новости по категории, else - все новости ============================
if (isset($_GET['category'])) {
    $news = query("
        SELECT * 
        FROM `news` 
        WHERE `category_id` = " . (int)($_GET['category']) . "
        ORDER BY `id` DESC 
    ");

} else {
    $news = query("
        SELECT * 
        FROM `news` 
        ORDER BY `id` DESC 
    ");
}

if (isset($_SESSION['info'])) {
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}
