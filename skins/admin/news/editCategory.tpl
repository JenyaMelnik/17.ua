<div>
    <form action="" method="post">
        Категория:
        <input type="text" name="categoryName" value="<?= htmlspecialchars($currentCategory['category'] ?? '') ?>">
        <input type="submit" name="editCategory" value="Сохранить изменения">
        <?= $editError ?? '' ?>
    </form>
</div>