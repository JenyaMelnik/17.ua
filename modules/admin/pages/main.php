<?php

if (isset($_GET['action']) && $_GET['action'] == 'delete') {
    query("
        DELETE FROM `pages`
        WHERE `id` = " . (int)$_GET['id'] . "
        LIMIT 1
    ");
    $_SESSION['notice'] = 'Страница удалена';
    redirectTo(['module' => 'pages']);
}

$result = query("
SELECT *
FROM `pages`
ORDER by `module` ASC 
");

while ($page = $result->fetch_assoc()) {
    $pages[] = $page;
}

if (isset($_SESSION['notice'])) {
    $notice = $_SESSION['notice'];
    unset($_SESSION['notice']);
}