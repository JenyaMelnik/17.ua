<?php

const TYPE_DIR = 'dir';
const TYPE_FILE = 'file';
const TYPE_TO_UP = 'up';

$mainDir = realpath(__DIR__ . '/../../');
$str = strlen($mainDir);
$path = $_GET['link'] ?? '';
$dir = realpath($mainDir . $path);
$checkPath = substr($dir, 0, $str);

if ($checkPath != $mainDir) {
    $path = '';
    $dir = $mainDir;
}

$scanDir = scandir($dir);

$dirs = [];
$files = [];
$toUp = [];

foreach ($scanDir as $element) {
    if ($element == '.') {
        continue;
    }

    if ($dir == $mainDir && $element == '..') {
        continue;
    }

    $currentPath = $dir . '/' . $element;
    $isDir = is_dir($currentPath);
    $type = $link = null;

    if ($isDir && $element != '..') {
        $link = $path . '/' . $element;
        $type = TYPE_DIR;
        $dirs[] = ['link' => $link, 'type' => $type, 'name' => $element,];
    } else if ($isDir && $element == '..') {
        $link = $path . '/' . $element;
        $type = TYPE_TO_UP;
        $toUp[] = ['link' => $link, 'type' => $type, 'name' => $element,];
    } else if (!$isDir && $element != '..') {
        $type = TYPE_FILE;
        $files[] = ['type' => $type, 'name' => $element,];
    }
}

sort($toUp);
sort($dirs);
sort($files);

$elements = array_merge($toUp, $dirs, $files);
