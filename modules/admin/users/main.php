<?php
Core::$CSS[] = '<link type="text/css" rel=stylesheet href="/skins/admin/css/users.css"';

include "./" . Core::$CONTROLLER . "/users/search.php";

if (isset($_POST['delete']) && !isset($_GET['id'])) {
    $_SESSION['notice'] = 'Выберите пользователя для удаления';
} elseif ((isset($_POST['delete'], $_GET['id']))) {
    query("
        DELETE FROM `users`
        WHERE `id` = " . (int)$_GET['id'] . "
        LIMIT 1
    ");

    $_SESSION['notice'] = 'Пользователь удален';
    redirectTo(['module' => 'users']);
}

$users = query("
             SELECT * 
             FROM `users`
             ORDER BY `login` ASC 
         ");

include "./" . Core::$CONTROLLER . "/users/edit.php";

if (isset($_SESSION['notice'])) {
    $notice = $_SESSION['notice'];
    unset($_SESSION['notice']);
}