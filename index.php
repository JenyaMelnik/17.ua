<?php
error_reporting(-1);
ini_set('display_errors', 1);
header('Content-Type: text/html; charset=utf-8');
session_start();

/**
 * @var $modulePath string
 * @var $skinPath string
 */

// Конфиг сайта
include_once './config.php';
include_once './libs/default.php';
include_once './variables.php';

// Роутер
include_once './route.php';

ob_start();
include './' . Core::$CONTROLLER . '/allPages.php';

if (!file_exists($modulePath) || !file_exists($skinPath)) {
    redirectTo(['page' => '404']);
}

include $modulePath;
include $skinPath;

$content = ob_get_contents();
ob_end_clean();

//if (isset($_POST['ajax'])) {
//    echo $content;
//    exit();
//}

include './skins/' . Core::$SKIN . '/index.tpl';
