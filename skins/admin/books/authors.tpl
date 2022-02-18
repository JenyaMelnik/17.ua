<?php
/**
 * @var $queryAuthors mysqli
 */
?>

<p><b><?= $notice ?? '' ?></b></p>
<div>
    <a href="<?= createUrlChpu(['module' => 'books']) ?>"><b>Вернутся к книгам</b></a>
</div>
<div class="border">
    <p>
        ДОБАВИТЬ АВТОРА
        <?php include "./skins/" . Core::$SKIN . "/books/addAuthors.tpl"; ?>
    </p>
</div>
<div class="clearfix">
    <div class="border floatleft">
        <p><b>ВСЕ АВТОРЫ:</b></p>
        <table>
            <?php
            while ($authors = $queryAuthors->fetch_assoc()) {
                if ($authors['id'] == 1) {
                    continue;
                } ?>
                <tr>
                    <td>
                        <a href="<?= createUrlChpu(['module' => 'books', 'page' => 'authors']) ?>?id=<?= $authors['id'] ?>"> <?= htmlspecialchars($authors['author']) ?></a>
                    </td>
                    <td>
                        <a href="<?= createUrlChpu(['module' => 'books', 'page' => 'authors']) ?>?action=delete&id=<?= $authors['id'] ?>">УДАЛИТЬ</a>
                    </td>
                </tr>
            <?php } ?>
        </table>
    </div>
    <div class="border floatleft">
        <p>
            ИЗМЕНИТЬ АВТОРА
            <?php include "./skins/" . Core::$SKIN . "/books/editAuthors.tpl"; ?>
        </p>
    </div>
</div>