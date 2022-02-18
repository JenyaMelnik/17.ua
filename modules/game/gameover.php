<?php

$winner = $_GET['winner'] ?? null;

if ($winner != 'client' && $winner != 'server') {
    $winner = null;
}

$translations = [
    'client' => 'клиент',
    'server' => 'сервер',
];

$winnerRu = $translations[$winner] ?? null;
