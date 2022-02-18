<?php

$dbc = mysqli_connect(Core::$DB_LOCAL, Core::$DB_LOGIN, Core::$DB_PASS, Core::$DB_NAME);
mysqli_set_charset($dbc, 'utf8');

$module = $_GET['module'] ?? 'static';
$page = $_GET['page'] ?? 'main';

if (isset($_GET['route'])) {
    $route = $_GET['route'];
}

if (isset($route)) {
    $temp = explode('/', $route);

    if ($temp[0] == 'admin') {
        Core::$CONTROLLER = Core::$CONTROLLER . '/admin';
        Core::$SKIN = 'admin';
        unset($temp[0]);
    }
    $i = 0;
    foreach ($temp as $k => $v) {
        if ($i == 0) {
            if (!empty($v)) {
                $module = $v;
            }
        } elseif ($i == 1) {
            if (!empty($v)) {
                $page = $v;
            }
        } else {
            $_GET['key' . ($k - 1)] = $v;
        }
        ++$i;
    }
    unset($route);
}

if (isset($module)) {
    $res = query("
        SELECT * 
        FROM `pages`
        WHERE `module` = '" . escapeString($module) . "'
        LIMIT 1
    ");
    if (!$res->num_rows) {
        header("Location:/404");
        exit();
//        redirectTo(['page' => '404']);
    } else {
        $staticpage = $res->fetch_assoc();
        $res->close();
        if ($staticpage['static'] == 1) {
            $module = 'staticpage';
            $page = 'main';
        }
    }
}

if (isset($page)) {
    if (!preg_match('#^[a-z-_]*$#ui', $page)) {
        redirectTo(['page' => '404']);
    }
}
