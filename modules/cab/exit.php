<?php
setcookie('autoAuthHash', escapeString(myHash($_SESSION['user']['id'] . $_SESSION['user']['login'] . $_SESSION['user']['email'])), time() - 360, '/');
setcookie('autoAuthId', (int)($_SESSION['user']['id']), time() - 360, '/');

session_unset();
session_destroy();

header("Location: /");
exit();
