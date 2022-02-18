<?php
/**
 * @var $img string
 * @var $dbc mysqli
 */

if (isset($_POST['edit'],
    $_POST['category'],
    $_POST['title'],
    $_POST['description'],
    $_POST['strength'],
    $_POST['price'],
    $_POST['availability'])) {

    $errors = [];

    if (empty($_POST['title'])) {
        $errors['title'] = 'Вы не ввели название';
    }
    if (empty($_POST['description'])) {
        $errors['description'] = 'Вы не ввели описание';
    }
    if (empty($_POST['strength'])) {
        $errors['strength'] = 'Вы не ввели крепость';
    }
    if (empty($_POST['price'])) {
        $errors['price'] = 'Вы не ввели цену';
    }

    if ($_FILES['img']['error'] == 0) {
        include "./components/checkImg.php";
    }

    if (!count($errors)) {
        query("
            INSERT INTO `goods` 
            SET `category`     = '" . escapeString(trim($_POST['category'])) . "',
                `title`        = '" . escapeString(trim($_POST['title'])) . "',
                `description`  = '" . escapeString(trim($_POST['description'])) . "',
                `strength`     = " . (float)$_POST['strength'] . ",
                `price`        = " . (float)$_POST['price'] . ",
                `availability` = " . (int)$_POST['availability'] . "
        ");

        $id = mysqli_insert_id($dbc);

        if ($_FILES['img']['error'] == 0) {
            query("
                UPDATE `goods` SET
                `img`  = '" . escapeString(trim($img)) . "'
                WHERE `id` = " . $id . "
            ");
        }

        $_SESSION['notice'] = 'Товар добавлен';
        redirectTo(['module' => 'goods']);
    }
}