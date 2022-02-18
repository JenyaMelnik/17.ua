<?php

if (isset($_GET['hash'], $_GET['id'])) {
    $res = query("
SELECT `id`
FROM `users`
WHERE `id` = " . (int)($_GET['id']) . "
AND `hash` = '" . escapeString($_GET['hash']) . "'
LIMIT 1
    ");

    if (mysqli_num_rows($res)) {
        query("
UPDATE `users` 
SET `active` = 1
WHERE `id`   = " . (int)($_GET['id']) . "
AND `hash`   = '" . escapeString($_GET['hash']) . "';
    ");
        $info = 'Вы активировались на сайте';
    } else {
        $info = 'Вы прошли по неверной ссылке';
    }
}
