<?php
/**
 * @var $module string
 * @var $page string
 */

$modulePath = './' . Core::$CONTROLLER . '/' . $module . '/' . $page . '.php';
$skinPath = './skins/' . Core::$SKIN . '/' . $module . '/' . $page . '.tpl';

/*
if (!file_exists($modulePath)) {
    $module = 'errors';
    $page = '404';
    $modulePath = './modules/' . $module . '/' . $page . '.php';
}

if (!file_exists($skinPath)) {
    $module = 'errors';
    $page = '404';
    $skinPath = './skins/' . Core::$SKIN . '/' . $module . '/' . $page . '.tpl';
}
*/