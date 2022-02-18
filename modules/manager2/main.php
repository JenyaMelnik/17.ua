<?php
$mainDir = '.';
$link = $_GET['link'] ?? '';
$currentDir = $mainDir . $link;

$dir = scandir($currentDir);

$toUp = [];
$dirs =[];
$files = [];

foreach ($dir as $element) {
    if ($element == '.') {
        continue;
    }
    $fullPath = $currentDir . '/' . $element;
    if (is_dir($fullPath) && $element == '..') {
        $toUp[] = '<a href="/index.php?module=manager2&page=main&link=' . $link . '/' . $element . '">' . $element . '</a><br>';
    }
    if (is_dir($fullPath) && $element != '..') {
        $dirs[] = '<img src="/img/folder.jpg" width=15px> <a href="/index.php?module=manager2&page=main&link=' . $link . '/' . $element . '">' . $element . '</a> <br>';
    }
    if (is_file($fullPath)) {
        $files[] = '<img src="/img/file.jpg" width=15px> ' . $element . '<br>';
    }
}

$allElements = array_merge($toUp, $dirs, $files);
