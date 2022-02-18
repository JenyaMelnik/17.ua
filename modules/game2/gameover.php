<?php

$winner = $_SESSION['client_health'] > $_SESSION['server_health'] ? 'игрок' : 'сервер';
unset($_SESSION['client_health']);
unset($_SESSION['server_health']);
