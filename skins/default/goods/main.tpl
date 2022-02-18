<?php
/**
 * @var $wines array
 * @var $notice string
 */

echo $notice ?? '';
?>
<div class="item">
    <?php
    if (mysqli_num_rows($wines)) {
        while ($row = mysqli_fetch_assoc($wines)) { ?>
            <div>
                <h1 class="category"><?= htmlspecialchars($row['category']) ?></h1>
                <h2>
                    <strong><?= htmlspecialchars($row['title']) ?></strong>
                </h2>
                <span>Крепость: <b><?= (float)$row['strength'] ?>%</b></span><br>
                <span>Цена: <b><?= (float)$row['price'] ?></b> грн.</span><br><br>
                <span>Наличие товара: </span>
                <?php if ($row['availability']) { ?>
                    <span><b>Есть в наличии</b></span>
                <?php } else { ?>
                    <span><b>Нет в наличии</b></span>
                <?php } ?>
                <br>
                <a href="<?= createUrlChpu(['module' => 'goods', 'page' => 'currentItem']) ?>?id=<?= (int)$row['id'] ?>">Подробнее...</a>
            </div>
            <hr>
        <?php }
    } else { ?>
        <span>Нет товаров</span>
    <?php } ?>
</div>