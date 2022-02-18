<form action="" method="post">
    <table>
        <tr>
            <td>Введите название страницы:</td>
            <td><input type="text" name="page" value="<?= htmlspecialchars($_POST['page'] ?? '') ?>"></td>
            <td> <?= htmlspecialchars($errors['page'] ?? '') ?></td>
        </tr>
        <tr>
            <td>Статика или нет:</td>
            <td>
                <input type="radio" name="static" value="1"
                    <?php if (isset($_POST['static']) && $_POST['static'] == 1) {
                        echo 'checked';
                    } ?>>Да
                <input type="radio" name="static" value="0"
                    <?php if ((isset($_POST['static']) && $_POST['static'] == 0) || !isset($_POST['static'])) {
                        echo 'checked';
                    } ?>>Нет
            </td>
            <td><?= htmlspecialchars($errors['static'] ?? '') ?></td>
        </tr>
    </table>
    <input type="submit" name="add" value="Добавить">
</form>