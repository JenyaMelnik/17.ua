<?php
/**
 * @var $author array
 */
?>

<div>
    <form action="" method="post">
        Автор:
        <input type="text" name="editAuthorName" value="<?= htmlspecialchars($author['author'] ?? '')?>">
        <input type="submit" name="editAuthor" value="Сохранить изменения">
        <?= $errorEdit ?? '' ?>
    </form>
</div>