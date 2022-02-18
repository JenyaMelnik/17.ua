<div>
    <form action="" method="post">
        Введите категорию
        <input type="text" name="addCategoryName" value="<?= htmlspecialchars($_POST['addCategoryName'] ?? '')  ?>">
        <input type="submit" name="addCategory" value="Добавить">
        <?= $error ?? '' ?>
    </form>
</div>
