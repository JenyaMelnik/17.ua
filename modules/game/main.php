<?php
/**
 * @var $module string
 */
$clientHealth = $_SESSION['client_health'] ?? null;
$serverHealth = $_SESSION['server_health'] ?? null;

if(isset($_GET['reset'])) {
	$clientHealth = 10;
	$serverHealth = 10;

	$number = 0;
	$rand = 0;
}

if(is_null($clientHealth) || is_null($serverHealth)) {
	$clientHealth = 10;
	$serverHealth = 10;
}

$number = null;
$rand = null;

if(isset($_GET['number'])) {
	$number = $_GET['number'];
	$rand = rand(1, 3);
}

if(isset($_GET['submit'])) {
	if($number >= 1 && $number <= 3) {
		if($number == $rand) {
			$clientHealth -= rand(1, 4);
		}
		else {
			$serverHealth -= rand(1, 4);
		}
	}
}

$_SESSION['client_health'] = $clientHealth;
$_SESSION['server_health'] = $serverHealth;

if($clientHealth <= 0 || $serverHealth <= 0) {
	$winner = $_SESSION['client_health'] > $_SESSION['server_health'] ? 'client' : 'server';
	unset($_SESSION['client_health']);
	unset($_SESSION['server_health']);
	header("Location: " . createAbsoluteUrl(['module' => $module, 'page' => 'gameover', 'winner' => $winner,]));
	exit();
}
