<?php

$news = query("
    SELECT *
    FROM `news`
    WHERE `id` = " . (int)$_GET['id'] . "
    LIMIT 1
");

if (!$news->num_rows) {
    $_SESSION['notice'] = 'Данной новости не существует!';
    redirectTo(['module' => 'news']);
}

$selectedNews = $news->fetch_assoc();
$news->close();

if (isset($_GET['category'])) {
    $category = '?category=' . $_GET['category'];
} else {
    $category= '';
}
