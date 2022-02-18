<?php
/**
 * @var $news mysqli
 * @var $queryNewsCategories mysqli
 * @var $shownCategory string
 * @var $category string
 */

if (isset($_SESSION['user'])) {
    if ($_SESSION['user']['access'] == 5) { ?>
        <div class="item">
            <?php
            if (isset($info)) { ?>
                <h2> <?= $info; ?> </h2>
            <?php } ?>
            <a href="<?= createUrlChpu(['module' => 'news', 'page' => 'add']) ?>">ДОБАВИТЬ НОВОСТЬ</a>
            <a href="<?= createUrlChpu(['module' => 'news', 'page' => 'categories']) ?>">РЕДАКТИРОВАТЬ КАТЕГОРИИ</a>
            <hr>
            <div>
                <p>
                    <a href="<?= createUrlChpu(['module' => 'news']) ?>"><b>Все категории</b></a>
                    <?php
                    if ($queryNewsCategories->num_rows) {
                        while ($categories = $queryNewsCategories->fetch_assoc()) { ?>
                            <a href="<?= createUrlChpu(['module' => 'news']) ?>?category=<?= (int)$categories['id'] ?>"><b><?= htmlspecialchars($categories['category']) ?></b></a>
                        <?php }
                    } ?>
                </p>
                <p><b><?= htmlspecialchars($shownCategory) ?></b></p>
                <form action="" method="post">
                    <?php
                    if ($news->num_rows) {
                        while ($newsRow = $news->fetch_assoc()) { ?>
                            <div>
                                <div>
                                    <label><input type="checkbox" name="ids[]" value="<?= $newsRow['id'] ?>"></label>
                                    <a href="<?= createUrlChpu(['module' => 'news', 'page' => 'edit']) ?>?<?= htmlspecialchars($category) ?>&id=<?= $newsRow['id'] ?>">СМОТРЕТЬ/РЕДАКТИРОВАТЬ</a>
                                    <a href="<?= createUrlChpu(['module' => 'news']) ?>?action=delete&id=<?= $newsRow['id'] ?>"
                                       onclick="return areYouSure();">УДАЛИТЬ</a>
                                </div>
                                <div><?= $newsRow['date']; ?></div>
                                <div class="text"><?= htmlspecialchars($newsRow['title']); ?></div>
                            </div>
                            <hr>
                        <?php }
                    } else { ?>
                        <span>В данной категории нет новостей </span>
                    <?php } ?>
                    <input type="submit" name="delete" onclick="return areYouSure();" value="Удалить отмеченные записи">
                </form>
            </div>
        </div>
    <?php } else {
        echo 'У Вас не доступа к разделу NEWS';
    }
} else {
    echo 'Вы не авторизировались';
} ?>
