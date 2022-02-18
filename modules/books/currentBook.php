<?php

$book = query("
    SELECT * FROM `books`
    WHERE `id` = " . (int)$_GET['id'] . "
    LIMIT 1
");

if (!$book->num_rows) {
    $_SESSION['notice'] = 'Данной книги не существует';
    redirectTo(['module' => 'books']);
}

$currentBook = $book->fetch_assoc();
$book->close();

//============================================= Выбираем ID авторов текущей книги ===================================
$currentBookAuthorsIds = [];

$authorsIds = query("
    SELECT `author_id` FROM `books2books_author`
    WHERE `book_id` = " . (int)$_GET['id'] . "
");

if (!$authorsIds->num_rows) {
    $currentBookAuthorsName[] = 'Авторы не указаны';
    exit();
}

while ($authorId = $authorsIds->fetch_assoc()) {
    $currentBookAuthorsIds[] = $authorId['author_id'];
}
$authorsIds->close();

//============================================= Выбираем авторов текущей книги ======================================
$queryAuthors = query("
    SELECT * 
    FROM `books_author`
    WHERE `id` IN (" . implode(",", $currentBookAuthorsIds) . ")
    ORDER BY `author` ASC
");
if (!$queryAuthors->num_rows) {
    $currentBookAuthorsName[] = 'Авторы не указаны';
    exit();
}
while ($authors = $queryAuthors->fetch_assoc()) {
    $currentBookAuthorsName[] = $authors;
}
$queryAuthors->close();
//===================================================================================================================

if (isset($_GET['author'])) {
    $author = '?author=' . $_GET['author'];
} else {
    $author = '';
}





