<?php

if (!isset($_SESSION['user']) || $_SESSION['user']['access'] != 5) {
    include './modules/cab/auth.php';
}
