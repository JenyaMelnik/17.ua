<?php
/**
 * @var $categories mysqli
 */
?>

<p><b><?= $notice ?? '' ?></b></p>
<div class="border">
    <p>
        ДОБАВИТЬ КАТЕГОРИЮ
        <?php include "./skins/" . Core::$SKIN . "/news/addCategory.tpl"; ?>
    </p>
</div>
<div class="clearfix">
    <div class="border floatleft">
        <p><b>ВСЕ КАТЕГОРИИ:</b></p>
        <table>
            <?php

            if ($categories->num_rows) {
                while ($category = $categories->fetch_assoc()) { ?>
                    <tr>
                        <td>
                            <a href="<?= createUrlChpu(['module' => 'news', 'page' => 'categories']) ?>?id=<?= (int)$category['id'] ?>"> <?= htmlspecialchars($category['category']) ?></a>
                        </td>
                        <td>
                            <a href="<?= createUrlChpu(['module' => 'news', 'page' => 'categories']) ?>?action=delete&id=<?= (int)$category['id'] ?>">УДАЛИТЬ</a>
                        </td>
                    </tr>
                <?php }
            } else { ?>
                <tr>
                    <td>Нет категорий</td>
                </tr>
            <?php } ?>

        </table>
    </div>
    <div class="border floatleft">
        <p>
            ИЗМЕНИТЬ КАТЕГОРИЮ
            <?php include "./skins/" . Core::$SKIN . "/news/editCategory.tpl"; ?>
        </p>
    </div>
</div>