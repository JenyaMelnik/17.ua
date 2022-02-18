<?php

class DBConnectAndClose
{
    static public array $mysqli;
    static public array $connect;

    static public function connect($dbKey = 0)
    {
        if (!isset(self::$mysqli[$dbKey])) {
            if (!isset(self::$connect['server']))
                self::$connect['server'] = Core::$DB_LOCAL;
            if (!isset(self::$connect['user']))
                self::$connect['user'] = Core::$DB_LOGIN;
            if (!isset(self::$connect['pass']))
                self::$connect['pass'] = Core::$DB_PASS;
            if (!isset(self::$connect['db']))
                self::$connect['db'] = Core::$DB_NAME;

            self::$mysqli[$dbKey] = @new mysqli(self::$connect['server'],
                self::$connect['user'],
                self::$connect['pass'],
                self::$connect['db']);

            if (mysqli_connect_errno()) {
                echo 'Не удалось подключиться к базе данных';
                exit();
            }

            if (!self::$mysqli[$dbKey]->set_charset("utf8")) {
                echo 'Ошибка при загрузке набора символов utf8:' . self::$mysqli[$dbKey]->error;
                exit();
            }
        }
        return self::$mysqli[$dbKey];
    }

    static public function close($dbKey = 0)
    {
        self::$mysqli[$dbKey]->close();
        unset(self::$mysqli[$dbKey]);
    }
}

/**
 *mysqli_query
 *
 * @param $query string
 * @param int $dbKey
 * @return bool|mysqli_result
 */
function query(string $query, int $dbKey = 0)
{
    $res = DBConnectAndClose::connect($dbKey)->query($query);
    if (!$res) {
        $info = debug_backtrace();
        $error = "QUERY: " . $query . "<br>\n" . DBConnectAndClose::connect($dbKey)->error . "<br>\n" .
            "file: " . $info[0]['file'] . "<br>\n" .
            "line: " . $info[0]['line'] . "<br>\n" .
            "date:" . date("Y-m-d H:i:s") . "<br>\n" .
            "=============================================";
//        Отправка уведомления на почту
        file_put_contents('./logs/mysql.log', strip_tags($error) . "\n\n", FILE_APPEND);
        echo $error;
        exit();
    } else {
        return $res;
    }
}

/**
 * autoload classes
 */
spl_autoload_register(function ($class) {
    include './libs/class_' . $class . '.php';
});

/**
 * hashing
 *
 * @param $var
 * @return string
 */
function myHash($var): string
{
    $salt = 'ABC';
    $salt2 = 'CBA';
    return crypt(md5($var . $salt), $salt2);
}

function dump($array, $stop = false)
{
    echo '<pre>' . print_r($array, 1) . '</pre>';
    if (!$stop) {
        exit();
    }
}

/**
 * @param $var
 */
function dd($var)
{
    echo '<pre>' . print_r($var, 1) . '</pre>';
    exit();
}

/**
 * Create absolute URL
 *
 * @param array $params
 * @return string
 */
function createAbsoluteUrl(array $params): string
{
    return URI . createUrl($params);
}

/**
 * Create URL
 *
 * @param array $params
 * @return string
 */
function createUrl(array $params): string
{
    return 'index.php?' . http_build_query($params);
}

/**
 * Create Chpu URL
 *
 * @param array $params
 * @return string
 */
function createUrlChpu(array $params): string
{
    if (!Core::isAdminController()) {
        $url = URI . implode('/', $params);
    } else {
        $url = URI . 'admin/' . implode('/', $params);
    }
    return $url;
}

/**
 * Redirect
 *
 * @param array $params
 */
function redirectTo(array $params): void
{
    header("Location: " . createUrlChpu($params));
    exit();
}


/**
 * trim all array's elements
 *
 * @param $el
 * @return array|string
 */
function trimAll($el)
{
    return !is_array($el)
        ? trim($el)
        : array_map('trimAll', $el);
}

/**
 * to int all array's elements
 *
 * @param $el
 * @return array|int
 */
function intAll($el)
{
    return !is_array($el)
        ? (int)$el
        : array_map('intAll', $el);
}

/**
 * htmlspecialchars all array's elements
 *
 * @param $el
 * @return array|string
 */
function htmlspecialcharsAll($el)
{
    return !is_array($el)
        ? htmlspecialchars($el)
        : array_map('htmlspecialcharsAll', $el);
}

/**
 * mysqli_real_escape_string all array's elements
 *
 * @param $el
 * @return array|string
 */
function escapeString($el)
{
    global $dbc;
    return !is_array($el)
        ? mysqli_real_escape_string($dbc, $el)
        : array_map('escapeString', $el);
}
