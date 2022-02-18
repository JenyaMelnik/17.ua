<?php
/**
 * @var $dbc mysqli
 */

if (isset($_POST['add'],
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
        $currentAuthorIds = [];

        foreach ($_POST['author'] as $authorId) {
            if ($authorId == 1) {
                continue;
            }
            $currentAuthorIds[] = (int)$authorId;
        }

        $selectedAuthors = query("
            SELECT * FROM `books_author`
            WHERE `id` IN (" . implode(',', $currentAuthorIds) . ")
            ORDER BY `id` ASC
        ");

        if (!$selectedAuthors->num_rows) {
            $_SESSION['notice'] = 'Ошибка! Выбранные авторы отсутсвуют!';
        } else {

            query("
            	INSERT INTO `books` 
            	SET `title` = '" . escapeString(trim($_POST['title'])) . "',
             	    `description` = '" . escapeString(trim($_POST['description'])) . "'
      		");

            $id = mysqli_insert_id(DBConnectAndClose::connect());

            if ($_FILES['img']['error'] == 0 && isset($imgResizedPath)) {
                query("
                    UPDATE `books` 
                    SET  `img` = '" . $imgResizedPath . "'
                    WHERE `id` = " . $id
                );
            }

            while ($selectedAuthor = $selectedAuthors->fetch_assoc()) {
                query("
                    INSERT INTO `books2books_author`
                    SET `book_id` = " . $id . ",
                    `author_id` = " . $selectedAuthor['id']
                );
            }

            $_SESSION['notice'] = 'Книга дабавлена';
        }
        $selectedAuthors->close();
        redirectTo(['module' => 'books']);
    }
}

//============================================== Выбираем всех авторов ==============================================
$authors = query("
    SELECT *
    FROM `books_author`
    ORDER BY `author` ASC
");

if ($authors->num_rows) {
    while ($authorId = $authors->fetch_assoc()) {
        $allAuthors[] = $authorId;
    }
}

$authors->close();
