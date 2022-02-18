<?php

if (!isset($_SESSION['client_health']) || !isset($_SESSION['server_health'])) {
    $_SESSION['client_health'] = 10;
    $_SESSION['server_health'] = 10;
}

if (isset($_GET['reset'])) {
    $_SESSION['client_health'] = 10;
    $_SESSION['server_health'] = 10;
}

if (isset($_GET['number'])) {
    if ($_GET['number'] >= 1 && $_GET['number'] <= 3) {
        $number = $_GET['number'];
        $rand = rand(1, 3);
        if ($number == $rand) {
            $_SESSION['client_health'] -= rand(1, 4);
        } else {
            $_SESSION['server_health'] -= rand(1, 4);
        }
    }
}

if($_SESSION['client_health'] <= 0 || $_SESSION['server_health'] <= 0) {
    header("Location: " . createUrl(['module' => 'game2', 'page' => 'gameover']));
}
