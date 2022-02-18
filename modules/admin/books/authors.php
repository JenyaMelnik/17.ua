<?php
Core::$CSS[] = '<link type="text/css" rel=stylesheet href="/css/booksStyle.css"';

if (isset($_GET['action']) && $_GET['action'] == 'delete') {
    query("
        DELETE FROM `books_author`
        WHERE `id` = " . (int)$_GET['id'] . "
        LIMIT 1
    ");

    $_SESSION['notice'] = 'Автор удален';
    redirectTo(['module' => 'books', 'page'=>'authors']);
}

// =================================================================================================================
$queryAuthors = query("
    SELECT * FROM `books_author`
");

include "./" . Core::$CONTROLLER . "/books/addAuthors.php";
include "./" . Core::$CONTROLLER . "/books/editAuthors.php";

if (isset($_SESSION['notice'])) {
    $notice = $_SESSION['notice'];
    unset($_SESSION['notice']);
}


