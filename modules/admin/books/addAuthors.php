<?php

if (isset($_POST['addAuthor'], $_POST['authorName'])) {
    if (empty($_POST['authorName'])) {
        $error = 'Вы не ввели автора';
    }

    if (!isset($error)) {
        $queryAurhor = query("
            SELECT * FROM `books_author`
            WHERE `author` = '" . escapeString($_POST['authorName']) . "'
            LIMIT 1
        ");

        if (!$queryAurhor->num_rows) {
            query("
            INSERT INTO `books_author`
            SET `author` = '" . escapeString(trim($_POST['authorName'])) . "'
        ");
            $_SESSION['notice'] = 'Автор добавлен';
            redirectTo(['module' => 'books', 'page' => 'authors']);

        } else {
            $error = 'Данный автор уже добавлен';
        }
    }
}
