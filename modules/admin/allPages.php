<?php
/**
 * @var $module string
 * @var $page string
 */


if (!isset($_SESSION['user']) || $_SESSION['user']['access'] != 5) {
    if ($module != 'static' || $page !='main') {
        header("Location: /admin/static/main");
        exit();
    }
}

include './modules/allPages.php';