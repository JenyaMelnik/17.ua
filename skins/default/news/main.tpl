<?php
/**
 * @var $news mysqli
 * @var $newsCategories mysqli
 * @var $shownCategory string
 * @var $category string
 */

echo $notice ?? '';

if (isset($_SESSION['user'])) { ?>
    <div class="item">
        <div>
            <p>
                <a href="/news"><b>Все новости</b></a>
                <?php
                while ($categories = $newsCategories->fetch_assoc()) { ?>
                    <a href="/news?category=<?= (int)$categories['id'] ?>"><b><?= htmlspecialchars($categories['category']) ?></b></a>
                <?php } ?>
            </p>
            <p><b><?= htmlspecialchars($shownCategory) ?></b></p>
            <?php
            if ($news->num_rows) {
                while ($newsRow = $news->fetch_assoc()) { ?>
                    <div>
                        <div><?= $newsRow['date']; ?></div>
                        <div class="text"><?= htmlspecialchars($newsRow['title']); ?></div>
                    </div>
                    <a href="<?= createUrlChpu(['module' => 'news', 'page' => 'currentItem']) ?>?<?= htmlspecialchars($category) ?>id=<?= (int)$newsRow['id'] ?>">Подробнее...</a>
                    <hr>
                <?php }
            } else { ?>
                <span>Нет товаров</span>
            <?php } ?>
        </div>
    </div>
<?php } else {
    echo 'Авторизируйтесь что бы просматривать раздел новостей';
}
