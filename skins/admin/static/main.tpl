<?php

if (!isset($_SESSION['user']) || $_SESSION['user']['access'] != 5) {
include './skins/default/cab/auth.tpl';
} else if (isset($_SESSION['user']) && $_SESSION['user']['access'] != 5) {
    echo 'Вы не админ!!!';
}
