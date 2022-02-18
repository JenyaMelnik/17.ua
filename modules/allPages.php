<?php
/**
 * @var $page string
 */
/*
$res = query("
SELECT *
FROM `meta`
WHERE '" . escapeString($_GET['module']) . "_" . escapeString($_GET['page']) . "'
LIMIT 1
");
$row = mysqli_fetch_assoc($res);
Core::$META = $row;
*/

if (isset($_SESSION['user'])) {
    $res = query("
        SELECT * 
        FROM `users`
        WHERE `id` = " . (int)$_SESSION['user']['id'] . "
        LIMIT 1
    ");
    $_SESSION['user'] = mysqli_fetch_assoc($res);
    if ($_SESSION['user']['active'] != 1) {
        include './modules/cab/exit.php';
    }
} elseif (isset($_COOKIE['autoAuthHash'], $_COOKIE['autoAuthId'])) {
    $res = query("
        SELECT *
        FROM `users`
        WHERE `id`      = " . (int)($_COOKIE['autoAuthId']) . "
        AND `hash`      = '" . escapeString($_COOKIE['autoAuthHash']) . "'
        AND `ip`        = '" . escapeString(myHash($_SERVER['REMOTE_ADDR'])) . "'
        AND `userAgent` = '" . escapeString(myHash($_SERVER['HTTP_USER_AGENT'])) . "'
        LIMIT 1
    ");
    if (mysqli_num_rows($res)) {
        $_SESSION['user'] = mysqli_fetch_assoc($res);
    } else {
        setcookie('autoAuthHash', null, time() - 360, '/');
        setcookie('autoAuthId', null, time() - 360, '/');
    }
}
