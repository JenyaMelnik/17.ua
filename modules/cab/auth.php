<?php

if (isset($_POST['login'], $_POST['pass'])) {
    $res = query("
    SELECT *
    FROM `users`
WHERE `login` = '" . escapeString($_POST['login']) . "'
AND `password` = '" . escapeString(myHash($_POST['pass'])) . "'
AND `active` = 1
LIMIT 1
    ");
    if (mysqli_num_rows($res)) {
        $_SESSION['user'] = mysqli_fetch_assoc($res);
        if (Core::$CONTROLLER != 'modules' && $_SESSION['user']['access'] != 5) {
            $errors = $_SESSION['user']['login'] . ', вы не админ!';
            $status = 'false';
        } else {
            $status = 'ok';
        }
        if (isset($_POST['autoauth'])) {
            setcookie('autoAuthHash', escapeString(myHash($_SESSION['user']['id'] . $_SESSION['user']['login'] . $_SESSION['user']['email'])), time() + 360 * 24 * 30 * 12, '/');
            $_COOKIE['autoAuthHash'] = escapeString(myHash($_SESSION['user']['id'] . $_SESSION['user']['login'] . $_SESSION['user']['email']));

            setcookie('autoAuthId', (int)($_SESSION['user']['id']), time() + 360 * 24 * 30 * 12, '/');
            $_COOKIE['autoAuthId'] = (int)($_SESSION['user']['id']);

            query("
            UPDATE `users` 
SET `hash`  = '" . escapeString(myHash($_SESSION['user']['id'] . $_SESSION['user']['login'] . $_SESSION['user']['email'])) . "',
`ip`        = '" . escapeString(myHash($_SERVER['REMOTE_ADDR'])) . "',
`userAgent` = '" . escapeString(myHash($_SERVER['HTTP_USER_AGENT'])) . "'
WHERE `id`  = " . (int)($_SESSION['user']['id']) . "
LIMIT 1 
            ");
        }
    } else {
        $authError = 'Нет пользавателя с логином:' . $_POST['login'] .', и паролем: ' . $_POST['pass'] . ', или ваш аккаунт не активен';
    }
}