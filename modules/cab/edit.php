<?php
/**
 * @var $imgPath string
 */

if (isset($_POST['edit'],
    $_POST['login'],
    $_POST['age'],
    $_POST['email'])) {

    if ($_POST['login'] == $_SESSION['user']['login']
        && $_POST['age'] == $_SESSION['user']['age']
        && $_POST['email'] == $_SESSION['user']['email']
        && $_FILES['img']['error'] != 0) {

        $_SESSION['notice'] = 'Вы ничего не изменили';

    } else {

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

        if (!empty($_POST['password']) && mb_strlen($_POST['password']) < 5) {
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

        if ($_FILES['img']['error'] == 0) {
            $imgPath = Core::$ORIGINAL_PATH . date('Ymd-His') . 'img' . rand(10000, 99999) . '.jpg';
            $uploadedImagePath = '.' . $imgPath;

            $newFoto = new ImageUploadAndResize;
            $errors = $newFoto->checkAndLoad($uploadedImagePath, $_FILES);

            if (!count($errors)) {
                $imgResizedPath = Core::$RESIZED_PATH . date('Ymd-His') . 'img' . rand(10000, 99999) . '.jpg';
                $resizedImagePath = '.' . $imgResizedPath;
                if (!$newFoto->resize($uploadedImagePath, $resizedImagePath, $_FILES, 100, 100)) {
                    $errors['img'] = 'Не подходящий размер фото';
                }
            }
        }

        if (!count($errors)) {
            if ($_POST['login'] != $_SESSION['user']['login']) {
                $queryRezult = query("
					SELECT `id` FROM `users`
 					WHERE `login` = '" . escapeString(trim($_POST['login'])) . "'
            		LIMIT 1
				");
                if (mysqli_num_rows($queryRezult)) {
                    $errors['login'] = 'Пользователь с таким Логином уже существует';
                }
            }

            if ($_POST['email'] != $_SESSION['user']['email']) {
                $queryRezult = query("
					SELECT `id` FROM `users`
 					WHERE `email` = '" . escapeString(trim($_POST['email'])) . "'
            		LIMIT 1
				");
                if (mysqli_num_rows($queryRezult)) {
                    $errors['email'] = 'Пользователь с таким email уже существует';
                }
            }
        }

        if (!count($errors)) {
            query("
            	UPDATE `users` 
            	SET `login` = '" . escapeString(trim($_POST['login'])) . "',
            	      `age` = " . (int)$_POST['age'] . ",
             	    `email` = '" . escapeString(trim($_POST['email'])) . "'
             	WHERE  `id` = " . (int)$_SESSION['user']['id'] . "
      		");

            if ($_FILES['img']['error'] == 0 && isset($imgResizedPath)) {
                query("
                    UPDATE `users` 
                    SET  `avatar` = '" . escapeString($imgResizedPath) . "'
                    WHERE `id` = " . (int)$_SESSION['user']['id'] . "
                ");
            }

            if (!isset($errors['password']) && !empty($_POST['password'])) {
                query("
                    UPDATE `users`
                    SET `password` = '" . escapeString(myHash($_POST['password'])) . "'
                    WHERE `id` = " . (int)$_SESSION['user']['id'] . "
                ");
            }

            $_SESSION['notice'] = 'Ваши данные отредактированы';
            redirectTo(['module' => 'cab', 'page' => 'edit']);
        }
    }
}

$_SESSION['user']['login'] = $_POST['login'] ?? $_SESSION['user']['login'];
$_SESSION['user']['age'] = $_POST['age'] ?? $_SESSION['user']['age'];
$_SESSION['user']['email'] = $_POST['email'] ?? $_SESSION['user']['email'];

