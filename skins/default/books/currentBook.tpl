<?php
/**
 * @var $author string
 * @var $currentBook array
 * @var $currentBookAuthorsName array
 */
?>
<div>
    <div>
        <div>
            <div class="text"><?= htmlspecialchars($currentBook['title']); ?></div>
            <div class="text">
                <img src="<?= $currentBook['img']; ?>" alt="image">
            </div>
            <p>
                Авторы:
                <?php
                foreach ($currentBookAuthorsName as $currentBookAuthorName) { ?>
                    <a href="<?= createUrlChpu(['module' => 'books']) ?>?author=<?= $currentBookAuthorName['id'] ?>"><?= htmlspecialchars($currentBookAuthorName['author']); ?></a>
                <?php } ?>
            </p>
            <div class="text"><?= nl2br(htmlspecialchars($currentBook['description'])); ?></div>
        </div>
        <hr>
    </div>
    <a href="<?= createUrlChpu(['module' => 'books']) ?><?= $author ?>"> Вернутся к книгам </a>
</div>