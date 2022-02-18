<?php
/**
 * @var $number int
 * @var $rand int
 * @var $clientHealth int
 * @var $serverHealth int
 */
?>
<div>
	<div class="form">
		<form action="/index.php?module=game&page=main" method="get">
			<input type="hidden" name="module" value="game">
			<input type="hidden" name="page" value="main">
			<label> введите число от 1 до 3 <input type="text" name="number" value="1"> </label>
			<input type="submit" name="submit" value="ввести">
			<input type="submit" name="reset" value="сбросить результат">
		</form>
	</div>
	<div>
		<p> Ваше число: <?=$number?> </p>
		<p> Случайное число: <?=$rand?> </p>
	</div>
	<div class="health">
		<span> Здоровье клиента: </span> <?=$clientHealth?> <br>
		<span> Здоровье сервера: </span> <?=$serverHealth?>
	</div>
</div>