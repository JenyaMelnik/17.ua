<?php

class Core
{
    static $CREATED = '2021';
    static $SKIN = 'default';
    static $ORIGINAL_PATH = '/uploaded/original/';
    static $RESIZED_PATH = '/uploaded/100x100/';
    static $CONTROLLER = 'modules';
    static $DB_NAME = 'jenyamelnik1986';
    static $DB_LOGIN = 'jenyamelnik1986';
    static $DB_PASS = 'Jrwq1_13jwqdnXX';
    static $DB_LOCAL = 'localhost';
    static $DOMAIN = 'https://17.ua/';
    static $JS = [];
    static $CSS = [];
    static $META = [
        'title' => 'стандартный TITLE',
        'description' => 'd',
        'keywords' => 'k'
    ];

    public static function isAdminController(): bool
    {
        return self::$CONTROLLER !== 'modules';
    }
}

define('COPYRIGHT', Core::$CREATED === date('Y') ? Core::$CREATED : Core::$CREATED . ' - ' . date('Y'));

$protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"], 0, 5)) == 'https' ? 'https' : 'http';
define('URI', "$protocol://" . $_SERVER["SERVER_NAME"] . '/');

