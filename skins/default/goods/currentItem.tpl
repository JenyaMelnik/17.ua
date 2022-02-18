<?php
/**
 * @var $item array
 */
?>

<div class="item">
    <h1 class="category"><?= htmlspecialchars($item['category']) ?></h1>
    <h2>
        <strong><?= htmlspecialchars($item['title']) ?></strong>
    </h2>
    <span><?= nl2br(htmlspecialchars($item['description'])) ?></span><br><br>
    <span>Крепость: <b><?= (float)$item['strength'] ?>%</b></span><br>
    <span>Цена: <b><?= (float)$item['price'] ?></b> грн.</span><br><br>
    <span>Наличие товара: </span>
    <?php if ($item['availability']) { ?>
        <span><b>Есть в наличии</b></span>
    <?php } else { ?>
        <span><b>Нет в наличии</b></span>
    <?php } ?>
    <hr>
    <a href="<?= createUrlChpu(['module' => 'goods']) ?>"> Вернутся к товарам </a>
</div>
