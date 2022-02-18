<?php
/**
 * @var $dbc mysqli
 */

if (isset($_POST['add'],
    $_POST['title'],
    $_POST['category'],
    $_POST['text'])) {

    $errors = [];

    if (empty($_POST['title'])) {
        $errors['title'] = 'Вы не ввели заголовок';
    } elseif (mb_strlen($_POST['title']) < 10) {
        $errors['title'] = 'Заголовок должен быть не менее 10 символа';
    }
    if (empty($_POST['category'])) {
        $errors['category'] = 'Вы не выбрали категорию';
    }
    if (empty($_POST['text'])) {
        $errors['text'] = 'Вы не ввели текст новости';
    } elseif (mb_strlen($_POST['text']) < 20) {
        $errors['text'] = 'Текст новости должен быть не менее 20 символа';
    }

    if (!$errors) {

        query("
            INSERT INTO `news` 
            SET `title`       = '" . escapeString(trim($_POST['title'])) . "',
                `category_id` =  " . (int)($_POST['category']) . ",
                `text`        = '" . escapeString(trim($_POST['text'])) . "',
                `date`        = NOW();
        ");
        $_SESSION['info'] = 'Новость добавлена';
        redirectTo(['module' => 'news']);
    }
}

//==================================================  Все категории  ================================================
$categories = query("
              SELECT *
              FROM `news_category`
              ORDER BY `id`
          ");

if ($categories->num_rows) {
    while ($category = $categories->fetch_assoc()) {
        $allCategories[] = $category;
    }
}

$categories->close();
