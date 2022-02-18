<?php
/**
 * @var $books mysqli
 * @var $shownBooks string
 * @var $author string
 * @var $booksIdToAuthorsIdOnPage array
 * @var $allAuthorsOnPage array
 * @var $paginator Paginator
 */

if (isset($_SESSION['user'])) { ?>
    <div class="item">
        <p><b><?= $notice ?? ''; ?></b></p>
        <h2>
            <strong><?= htmlspecialchars($shownBooks) ?></strong>
        </h2>
        <?php
        if (isset($_GET['author'])) { ?>
            <a href="<?= createUrlChpu(['module' => 'books']) ?>"><b>Все авторы</b></a>
        <?php } ?>
        <hr>
        <div>
            <?php
            if (!empty($books)) {
                foreach ($books as $book) { ?>
                    <div>
                        <h2>
                            <strong><?= htmlspecialchars($book['title']); ?></strong>
                        </h2>
                    </div>
                    <div>
                        <img src="<?= $book['img'] ?>" alt="image" height="100">
                    </div>
                    <div>
                        <p> Авторы: <br>
                            <?php
                            foreach ($booksIdToAuthorsIdOnPage[$book['id']] as $booksAuthorId) { ?>
                                <a href="<?= createUrlChpu(['module' => 'books']) ?>?author=<?= (int)$booksAuthorId ?>">
                                    - <?= htmlspecialchars($allAuthorsOnPage[$booksAuthorId]); ?><br>
                                </a>
                            <?php } ?>
                        </p>
                    </div>
                    <a href="<?= createUrlChpu(['module' => 'books', 'page' => 'currentBook']) ?>?<?= htmlspecialchars($author) ?>id=<?= (int)$book['id'] ?>">Подробнее...</a>
                    <hr>
                <?php }
            } else { ?>
                <span>Нет книг</span>
                <br>
            <?php } ?>
        </div>
    </div>
    <div>
        <a href="<?= createUrlChpu(['module' => 'books', 'page' => 'main']) ?>?<?= htmlspecialchars($author) ?>p=1"><b>Первая</b></a>
        <a href="<?= createUrlChpu(['module' => 'books', 'page' => 'main']) ?>?<?= htmlspecialchars($author) ?>p=<?= ($paginator->previousPage()) ?>"><b>Назад</b></a>
        <?php
        for ($i = $paginator->startPaginator(); $i < $paginator->endPaginator(); ++$i) {
            if ($i == $paginator->currentPage()) { ?>
                <a href="<?= createUrlChpu(['module' => 'books', 'page' => 'main']) ?>?<?= htmlspecialchars($author) ?>p=<?= $i ?>"><?= '<b>' . $i . '</b>' ?></a>
            <?php } else { ?>
                <a href="<?= createUrlChpu(['module' => 'books', 'page' => 'main']) ?>?<?= htmlspecialchars($author) ?>p=<?= $i ?>"><?= $i ?></a>
            <?php }
        } ?>
        <a href="<?= createUrlChpu(['module' => 'books', 'page' => 'main']) ?>?<?= htmlspecialchars($author) ?>p=<?= ($paginator->nextPage()) ?>"><b>Вперед</b></a>
        <a href="<?= createUrlChpu(['module' => 'books', 'page' => 'main']) ?>?<?= htmlspecialchars($author) ?>p=<?= $paginator->numberOfPages() ?>"><b>Конец</b></a>
    </div>
<?php } else {
    echo 'Авторизируйтесь что бы просматривать раздел книги';
} ?>
