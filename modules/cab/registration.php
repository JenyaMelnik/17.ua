<?php
/**
 * @var $dbc mysqli
 * @var $img string
 */

if (isset($_POST['login'],
    $_POST['password'],
    $_POST['email'],
    $_POST['age'])) {

    $errors = [];

    if (empty($_POST['login'])) {
        $errors['login'] = 'Вы не ввели логин';
    } elseif (!preg_match('#^[\wё\s-]+$#u', $_POST['login'])) {
        $errors['login'] = 'Недопустимые символы!';
    } elseif (mb_strlen($_POST['login']) < 2) {
        $errors['login'] = 'Логин должен быть не менее двух символа';
    } elseif (mb_strlen($_POST['login']) > 20) {
        $errors['login'] = 'Логин должен быть не более 20 символов';
    }

    if (empty($_POST['password'])) {
        $errors['password'] = 'Вы не ввели пароль';
    } elseif (mb_strlen($_POST['password']) < 5) {
        $errors['password'] = 'Вы должен быть не менее 5 символов';
    }

    if (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = 'Вы не верно ввели email';
    }

    if ($_FILES['img']['error'] == 0) {
        include "./components/checkImg.php";
    }

    if (!count($errors)) {
        $res = query("
SELECT `id` 
FROM `users`
WHERE `login` = '" . escapeString(trim($_POST['login'])) . "'
LIMIT 1
        ");
        if (mysqli_num_rows($res)) {
            $errors['login'] = 'Пользователь с таким логином уже существует';
        }

        $res = query("
SELECT `id` 
FROM `users`
WHERE `email` = '" . escapeString(trim($_POST['email'])) . "'
LIMIT 1
        ");
        if (mysqli_num_rows($res)) {
            $errors['email'] = 'Пользователь с таким email уже существует';
        }
    }
    if (!count($errors)) {
        query("
        INSERT INTO `users` SET 
`login`    = '" . escapeString(trim($_POST['login'])) . "',
`password` = '" . escapeString(myHash($_POST['password'])) . "',
`email`    = '" . escapeString(trim($_POST['email'])) . "',
`age`      = " . (int)$_POST['age'] . ",
`hash`     = '" . escapeString(myHash($_POST['login'] . $_POST['age'])) . "'
        ");

        $id = mysqli_insert_id($dbc);
        $_SESSION['regOk'] = 'ok';

        if ($_FILES['img']['error'] == 0) {
            query("
                UPDATE `users` 
                SET  `avatar`  = '" . escapeString(trim($img)) . "'
                WHERE `id`  = " . $id . "
            ");
        }

        Mail::$subject = 'Регистрация на сайте';
        Mail::$to = $_POST['email'];
        Mail::$text = 'Вы зарегистрировались на сайте. Для активации аккаунта перейдите по ссылке: 
        ' . Core::$DOMAIN . 'index.php?module=cab&page=activate&id=' . $id . '&hash=' . myHash($_POST['login'] . $_POST['age']) . '
        ';
        Mail::send();
        redirectTo(['module' => 'cab', 'page' => 'registration']);
    }
}