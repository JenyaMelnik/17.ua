<div>
    <form action="" method="post">
        Введите автора
        <input type="text" name="authorName" value="<?= htmlspecialchars($_POST['authorName'] ?? '')  ?>">
        <input type="submit" name="addAuthor" value="Добавить">
        <?= $error ?? '' ?>
    </form>
</div>