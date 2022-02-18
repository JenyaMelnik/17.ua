<?php

if (isset($_POST['edit']) && !isset($_GET['id'])) {
    $_SESSION['notice'] = 'Выберите пользователя для редактирования';
}

if (isset($_GET['id'])) {
    $usersInfo = query("
        SELECT *
        FROM `users`
        WHERE `id` = " . (int)$_GET['id'] . "
        LIMIT 1
    ");
    if (!mysqli_num_rows($usersInfo)) {
        $_SESSION['notice'] = 'Пользователя не существует';
        redirectTo(['module' => 'users']);
    }

    $userInfo = mysqli_fetch_assoc($usersInfo);

    if (isset($_POST['edit'],
        $_POST['password'],
        $_POST['login'],
        $_POST['age'],
        $_POST['email'],
        $_POST['access'],
        $_POST['active'])) {

        $errors = [];

        if (empty($_POST['login'])) {
            $errors['login'] = 'Вы не ввели логин';
        } elseif (!preg_match('#^[\wё\s-]+$#u', $_POST['login'])) {
            $errors['login'] = 'Недопустимые символы!';
        } elseif (mb_strlen($_POST['login']) < 2) {
            $errors['login'] = 'Пароль должен быть не менее двух символа';
        } elseif (mb_strlen($_POST['login']) > 20) {
            $errors['login'] = 'Пароль должен быть не более 20 символов';
        }

        if (!empty($_POST['password']) && mb_strlen($_POST['password']) < 5 ) {
            $errors['password'] = 'Пароль должен быть не менее 5 символов';
        }

        if (empty($_POST['age'])) {
            $errors['age'] = 'Вы не ввели возраст';
        } elseif (!is_numeric($_POST['age'])) {
            $errors['age'] = 'используйте только цифры';
        }

        if (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
            $errors['email'] = 'Вы не верно ввели email';
        }

        if ($_POST['active'] != 0 && $_POST['active'] != 1) {
            $errors['active'] = 'Вы не указали доступ';
        }

        if ($_POST['access'] < 0 || $_POST['access'] > 5) {
            $errors['access'] = 'Вы не указали права';
        }

        if (!count($errors)) {
            if ($_POST['login'] != $userInfo['login']) {
                $res = query("
					SELECT `id` FROM `users`
 					WHERE `login` = '" . escapeString(trim($_POST['login'])) . "'
            		LIMIT 1
				");
                if (mysqli_num_rows($res)) {
                    $errors['login'] = 'Пользователь с таким логином уже существует';
                }
            }

            if ($_POST['email'] != $userInfo['email']) {
                $res = query("
					SELECT `id` FROM `users`
 					WHERE `email` = '" . escapeString(trim($_POST['email'])) . "'
            		LIMIT 1
				");
                if (mysqli_num_rows($res)) {
                    $errors['email'] = 'Пользователь с таким email уже существует';
                }
            }
        }

        if (!count($errors)) {
            query("
            	UPDATE `users` 
            	SET `login` = '" . escapeString(trim($_POST['login'])) . "',
            	      `age` = " . (int)$_POST['age'] . ",
             	    `email` = '" . escapeString(trim($_POST['email'])) . "',
             	   `active` = " . (int)$_POST['active'] . ",
             	   `access` = " . (int)$_POST['access'] . "
             	 WHERE `id` = " . (int)$_GET['id'] . "
      		");

            if (!isset($errors['password']) && !empty($_POST['password'])) {
                query("
                    UPDATE `users`
                    SET `password` = '" . escapeString(myHash($_POST['password'])) . "'
                    WHERE `id` = " . (int)$_GET['id'] . "
                ");
            }

            $_SESSION['notice'] = 'Данные пользавателя отредактированы';
            header("Location: /admin/users&id=" . $_GET['id']);
            exit();
        }
    }

    $userInfo['login'] = $_POST['login'] ?? $userInfo['login'];
    $userInfo['age'] = $_POST['age'] ?? $userInfo['age'];
    $userInfo['email'] = $_POST['email'] ?? $userInfo['email'];
    $userInfo['active'] = $_POST['active'] ?? $userInfo['active'];
    $userInfo['access'] = $_POST['access'] ?? $userInfo['access'];
}
