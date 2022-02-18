<?php
/**
 * @var $dbc mysqli
 */

if (isset($_POST['edit'],
    $_POST['title'],
    $_POST['author'],
    $_POST['description'])) {

    $errors = [];

    if (mb_strlen($_POST['title']) < 2) {
        $errors['title'] = 'Название книги должно быть не менее двух символов';
    } elseif (mb_strlen($_POST['title']) > 30) {
        $errors['title'] = 'Название книги должно быть не более 30 символов';
    }
    if (count($_POST['author']) < 2 && $_POST['author'][0] == 1) {
        $errors['author'] = 'Выберите автора книги';
    }

    if (empty($_POST['description'])) {
        $errors['description'] = 'Вы не ввели описание';
    }

    if ($_FILES['img']['error'] == 0) {
        $booksCore = new Core;
        $booksCore::$ORIGINAL_PATH = '/uploaded/books/original/';
        $booksCore::$RESIZED_PATH = '/uploaded/books/100x100/';
        $imgPath = $booksCore::$ORIGINAL_PATH . date('Ymd-His') . 'img' . rand(10000, 99999) . '.jpg';
        $uploadedImagePath = '.' . $imgPath;

        $newFoto = new ImageUploadAndResize;
        $errors = $newFoto->checkAndLoad($uploadedImagePath, $_FILES);

        if (!count($errors)) {
            $imgResizedPath = $booksCore::$RESIZED_PATH . date('Ymd-His') . 'img' . rand(10000, 99999) . '.jpg';
            $resizedImagePath = '.' . $imgResizedPath;
            if (!$newFoto->resize($uploadedImagePath, $resizedImagePath, $_FILES, 100, 100)) {
                $errors['img'] = 'Не подходящий размер фото';
            }
        }
    }

    if (!count($errors)) {
        $currentAuthorsIds = [];

        foreach ($_POST['author'] as $selectedAuthorId) {
            if ($selectedAuthorId == 1) {
                continue;
            }
            $currentAuthorsIds[] = (int)$selectedAuthorId;
        }

        $selectedAuthors = query("
            SELECT * FROM `books_author`
            WHERE `id` IN (" . implode(',', $currentAuthorsIds) . ")
            ORDER BY `id` ASC
        ");

        if (!$selectedAuthors->num_rows) {
            $_SESSION['notice'] = 'Ошибка! Выбранные авторы отсутсвуют!';
        } else {

            query("
            	UPDATE `books` 
            	SET       `title` = '" . escapeString(trim($_POST['title'])) . "',
             	    `description` = '" . escapeString(trim($_POST['description'])) . "'
             	WHERE       `id`  = " . (int)$_GET['id'] . "
             	LIMIT 1
      		");

            if ($_FILES['img']['error'] == 0 && isset($imgResizedPath)) {
                query("
                    UPDATE `books` 
                    SET  `img`  = '" . $imgResizedPath . "'
                    WHERE `id`  = " . (int)$_GET['id'] . "
                    LIMIT 1
                ");
            }

            query("
                DELETE FROM `books2books_author`
                WHERE `book_id` = " . (int)$_GET['id']
            );

            while ($selectedAuthor = $selectedAuthors->fetch_assoc()) {
                query("
                    INSERT INTO `books2books_author`
                    SET `book_id` = " . (int)$_GET['id'] . ",
                      `author_id` = " . $selectedAuthor['id']
                );
            }

            $_SESSION['notice'] = 'Изменения сохранены';
        }
        redirectTo(['module' => 'books']);
    }
}

//============================================= Выбираем текущую книгу ==============================================
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

if ($authorsIds->num_rows) {
    while ($authorId = $authorsIds->fetch_assoc()) {
        $currentBookAuthorsIds[] = $authorId['author_id'];
    }
}

$authorsIds->close();

//============================================== Выбираем всех авторов ==============================================
$authors = query("
    SELECT *
    FROM `books_author`
    ORDER BY `author` ASC
");

if ($authors->num_rows) {
    while ($author = $authors->fetch_assoc()) {
        $allAuthors[] = $author;
    }
}

$authors->close();

//===================================================================================================================
$currentBook['title'] = $_POST['title'] ?? $currentBook['title'];
$currentBook['description'] = $_POST['description'] ?? $currentBook['description'];

if (isset($_GET['author'])) {
    $selectedAuthorId = '?author=' . $_GET['author'];
} else {
    $selectedAuthorId = '';
}
