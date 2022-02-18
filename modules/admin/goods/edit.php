<?php
/**
 * @var $img string
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
            UPDATE `goods` 
            SET `category`     = '" . escapeString(trim($_POST['category'])) . "',
                `title`        = '" . escapeString(trim($_POST['title'])) . "',
                `description`  = '" . escapeString(trim($_POST['description'])) . "',
                `strength`     = " . (float)$_POST['strength'] . ",
                `price`        = " . (float)$_POST['price'] . ",
                `availability` = " . (int)$_POST['availability'] . "
            WHERE `id`     = " . (int)$_GET['id'] . "
        ");

        if ($_FILES['img']['error'] == 0) {
            query("
                        UPDATE `goods` 
                        SET  `img` = '" . escapeString(trim($img)) . "'
                        WHERE `id` = " . (int)$_GET['id'] . "
                    ");
        }

        $_SESSION['notice'] = 'Товар отредактирован';
        redirectTo(['module' => 'goods']);
    }
}

$wines = query("
            SELECT *
            FROM `goods`
            WHERE `id` = " . (int)$_GET['id'] . "
            LIMIT 1
         ");

if (!mysqli_num_rows($wines)) {
    $_SESSION['notice'] = 'Данного товара не существует';
    redirectTo(['module' => 'goods']);
}

$row = mysqli_fetch_assoc($wines);

$row['category'] = $_POST['category'] ?? $row['category'];
$row['title'] = $_POST['title'] ?? $row['title'];
$row['description'] = $_POST['description'] ?? $row['description'];
$row['strength'] = $_POST['strength'] ?? $row['strength'];
$row['price'] = $_POST['price'] ?? $row['price'];
