<?php

if (isset($_POST['searchLogin'], $_POST['search'])) {
    $errors = [];

    if (empty($_POST['searchLogin'])) {
        $errors['searchLogin'] = 'введите логин или часть логина';
        $_SESSION['notice'] = $errors['searchLogin'];
    }

    if (!count($errors)) {
        $search = query("
            SELECT * FROM `users`
            WHERE `login` LIKE '%" . escapeString(trim($_POST['searchLogin'])) . "%'
            ORDER BY `login` ASC 
        ");

        if (mysqli_num_rows($search)) {
            $_SESSION['search'] = 'yes';
        } else {
            $_SESSION['notice'] = 'Пользователь не найден';
        }
    } else {
        $_SESSION['search'] = 'no';
    }
} else {
    $_SESSION['search'] = 'no';
}

if (isset($_POST['clear'])) {
    unset($_SESSION['search']);
    redirectTo(['module' => 'users']);
}
