<?php
/**
 * @var $pages array
 */

?>
<div>
    <span><b><?= $notice ?? '' ?></b></span>
    <p>
        <a href="/admin/pages/add"><b>Добавить страницу</b></a>
    </p>
    <table>
        <?php
        foreach ($pages as $page) {
            if ($page['static'] == 1) {
                $static = 'Да';
            } elseif ($page['static'] == 0) {
                $static = 'Нет';
            } else {
                $static = 'Не указано';
            } ?>
            <tr>
                <td><a href="/admin/pages?action=delete&id=<?= $page['id'] ?>">Удалить</a></td>
                <td>
                    <a href="/admin/pages/edit?id=<?= $page['id'] ?>"><b><?= $page['module'] ?></b></a>
                </td>
                <td> Статика: <?= $static ?> </td>
            </tr>
        <?php } ?>
    </table>
</div>
