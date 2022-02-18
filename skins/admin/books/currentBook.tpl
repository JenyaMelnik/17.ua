<?php
/**
 * @var $author string
 * @var $currentBook array
 * @var $currentBookAuthors array
 */
?>
<div>
    <div>
        <div>
            <div class="text"><?= htmlspecialchars($currentBook['title']); ?></div>
            <div class="text">
                <img src="<?= $currentBook['img']; ?> " alt="image">
            </div>
            <p>
                Авторы:
                <?php if (!empty($currentBookAuthors)) {
                    foreach ($currentBookAuthors as $currentBookAuthor) { ?>
                        <a href="<?= createUrlChpu(['module' => 'books']) ?>?author=<?= $currentBookAuthor['id'] ?>"><?= htmlspecialchars($currentBookAuthor['author']); ?></a>
                    <?php }
                } else { ?>
                    Нет авторов
                <?php } ?>
            </p>
            <div class="text"><?= nl2br(htmlspecialchars($currentBook['description'])); ?></div>
        </div>
        <hr>
    </div>
    <a href="<?= createUrlChpu(['module' => 'books']) ?><?= htmlspecialchars($author) ?>"> Вернутся к книгам </a>
</div>