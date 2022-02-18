<?php
/**
 * @var $rand int
 * @var $number int
 * @var $notice string
 *
 */
?>
<div>
    <div class="form">
        <form action="/index.php?module=game2&page=main" method="get">
            <input type="hidden" name="module" value="game2">
            <input type="hidden" name="page" value="main">
            <label> введите число от 1 до 3 <input type="text" name="number"></label>
            <input type="submit" name="submit" value="ввести">
            <input type="submit" name="reset" value="сбросить результат">
        </form>
    </div>
    <div>
        <p> Ваше число: <?= $number ?? '' ?> </p>
        <p> Случайное число: <?= $rand ?? '' ?> </p>
    </div>
    <div class="health">
        <span> Здоровье клиента: </span> <?= $_SESSION['client_health'] ?? '' ?> <br>
        <span> Здоровье сервера: </span> <?= $_SESSION['server_health'] ?? '' ?>
    </div>
</div>