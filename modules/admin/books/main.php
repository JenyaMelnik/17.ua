<?php

$paginator = new Paginator();
$paginator->itemsOnPage = 2;

//=========================================== Удаление нескольких записей ===========================================
if (isset($_POST['delete'])) {
    if (!empty($_POST['booksToDelete'])) {
        $booksToDeleteIds = [];
        foreach ($_POST['booksToDelete'] as $bookToDelete) {
            $booksToDeleteIds[] = (int)$bookToDelete;
        }
        $booksToDelete = implode(',', $booksToDeleteIds);
        query("
            DELETE FROM `books`
            WHERE `id` IN (" . $booksToDelete . ")
        ");

        query("
            DELETE FROM `books2books_author`
            WHERE `book_id` IN (" . $booksToDelete . ")
        ");

        $_SESSION['notice'] = 'Книги удалены';
    } else {
        $_SESSION['notice'] = 'Выберите хотя бы одну книгу';
    }
    redirectTo(['module' => 'books']);
}

//========================================== Удаление одной записи ==================================================
if (isset($_GET['action']) && $_GET['action'] == 'delete' && isset($_GET['id'])) {
    query("
        DELETE FROM `books` 
        WHERE `id` = " . (int)$_GET['id']
    );

    query("
        DELETE FROM `books2books_author` 
        WHERE `book_id` = " . (int)$_GET['id']
    );

    $_SESSION['notice'] = 'Книга удалена';
    redirectTo(['module' => 'books']);
}

//===================================================================================================================
$shownBooks = 'Все книги';
$author = '';

//============ Выбираем текущего автора и его id книг, else - все книги на странице и их id =========================
if (isset($_GET['author'])) {
    $author = 'author=' . $_GET['author'] . '&';

    $queryAuthor = query("
        SELECT `author` 
        FROM `books_author`
        WHERE `id` = " . (int)$_GET['author'] . "
        LIMIT 1
    ");

    if ($queryAuthor->num_rows) {
        $currentAuthor = $queryAuthor->fetch_assoc();
        $shownBooks = 'Книги автора: ' . $currentAuthor['author'];
    }

    $queryAuthor->close();

// ===================================================
    $queryBookId = query("
        SELECT `book_id`
        FROM `books2books_author`
        WHERE `author_id` = " . (int)$_GET['author']
    );

    if (!$queryBookId->num_rows) {
        $_SESSION['notice'] = 'Нет такого автора';
        redirectTo(['module' => 'books']);
    }

    $bookIds = [];
    while ($bookId = $queryBookId->fetch_assoc()) {
        $bookIds[] = (int)$bookId['book_id'];
    }
    $queryBookId->close();

    $numberOfItems = query("
        SELECT COUNT(id) AS cnt
        FROM `books` 
        WHERE `id` IN (" . implode(", ", $bookIds) . ")
    ")->fetch_object()->cnt;

    $paginator->numberOfItems = $numberOfItems;

    $queryBooks = query("
        SELECT * 
        FROM `books` 
        WHERE `id` IN (" . implode(", ", $bookIds) . ")
        ORDER BY `id` ASC
        " . $paginator->sqlQueryLimit()
    );

} else {

    $numberOfItems = query("
        SELECT COUNT(id) AS cnt
        FROM `books` 
    ")->fetch_object()->cnt;

    $paginator->numberOfItems = $numberOfItems;

    $queryBooks = query("
        SELECT * 
        FROM `books` 
        ORDER BY `id` ASC
        " . $paginator->sqlQueryLimit()
    );
}

$booksIds = [];
$books = [];

if ($queryBooks->num_rows) {
    while ($queryBook = $queryBooks->fetch_assoc()) {
        $booksIds[] = $queryBook['id'];
        $books[] = $queryBook;
    }
}

//==================================== Выбираем ids авторов на странице =============================================
//========================== Выбираем связку book_ids to author_ids для книг на странице ============================
$authorsIdOnPage = [];
$booksIdToAuthorsIdOnPage = [];

$queryBooksToAuthors = query("
    SELECT * FROM `books2books_author`
    WHERE `book_id` IN (" . implode(", ", $booksIds) . ")
");

if ($queryBooksToAuthors->num_rows) {
    while ($bookToAuthor = $queryBooksToAuthors->fetch_assoc()) {
        $booksIdToAuthorsIdOnPage[$bookToAuthor['book_id']][] = $bookToAuthor['author_id'];
        if (!in_array($bookToAuthor['author_id'], $authorsIdOnPage)) {
            $authorsIdOnPage[] = $bookToAuthor['author_id'];
        }
    }
}

$queryBooksToAuthors->close();

//======================================== Выбираем авторов книг на странице ========================================
$allAuthorsOnPage = [];

$queryAllAuthorsOnPage = query("
    SELECT * FROM `books_author`
    WHERE `id` IN (" . implode(", ", $authorsIdOnPage) . ")
");

if ($queryAllAuthorsOnPage->num_rows) {
    while ($authorOnPage = $queryAllAuthorsOnPage->fetch_assoc()) {
        if ($authorOnPage['author'] == '') {
            continue;
        }
        $allAuthorsOnPage[$authorOnPage['id']] = $authorOnPage['author'];
    }
}

// ==================================================================================================================
if (isset($_SESSION['notice'])) {
    $notice = $_SESSION['notice'];
    unset($_SESSION['notice']);
}
