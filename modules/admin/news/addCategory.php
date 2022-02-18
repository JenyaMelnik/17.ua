<?php

if (isset($_POST['addCategory'], $_POST['addCategoryName'])) {
    if (mb_strlen($_POST['addCategoryName']) < 3) {
        $error = 'Название категории должно состоять минимум из 3 символов';
    }

    if (!isset($error)) {
        $queryCategory = query("
            SELECT * FROM `news_category`
            WHERE `category` = '" . escapeString($_POST['addCategoryName']) . "'
            LIMIT 1
        ");

        if (!$queryCategory->num_rows) {
            query("
            INSERT INTO `news_category`
            SET `category` = '" . escapeString(trim($_POST['addCategoryName'])) . "'
        ");
            $_SESSION['notice'] = 'Категория добавлена';
            redirectTo(['module' => 'news', 'page' => 'categories']);

        } else {
            $error = 'Данная категория уже существует';
        }
    }
}

