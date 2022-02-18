<?php

$newsCategories = query("
     SELECT *
     FROM `news_category`
     ORDER BY `id` ASC 
");

$shownCategory = 'Все новости';
$category = '';

//========================  Выбираем категорию и новости в категории, else - все новости ============================
if (isset($_GET['category'])) {
    $category = 'category=' . $_GET['category'] . '&';

    $queryCurrentCategory = query("
        SELECT *  FROM `news_category`
        WHERE `id` = " . (int)$_GET['category'] . "
        LIMIT 1
    ");

    if ($queryCurrentCategory->num_rows) {
        $currentCategory = $queryCurrentCategory->fetch_assoc();
        $shownCategory = 'Категория новостей: ' . $currentCategory['category'];
    }

    $queryCurrentCategory->close();

    $news = query("
        SELECT * 
        FROM `news` 
        WHERE `category_id` = " . (int)$_GET['category'] . "
        ORDER BY `id` DESC 
    ");

} else {
    $news = query("
        SELECT * 
        FROM `news` 
        ORDER BY `id` DESC 
    ");
}

if (isset($_SESSION['notice'])) {
    $notice = $_SESSION['notice'];
    unset($_SESSION['notice']);
}
