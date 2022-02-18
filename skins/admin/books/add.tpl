<?php
/**
 * @var $allAuthors array
 */
?>

<form action="" method="post" enctype="multipart/form-data">
    <div>
        <table>
            <tr>
                <td>Введите название книги:</td>
                <td><input type="text" name="title"
                           value="<?= htmlspecialchars($_POST['title'] ?? '') ?>">
                </td>
                <td> <?= $errors['title'] ?? '' ?></td>
            </tr>
            <tr>
                <td>Выберите авторов:</td>
                <td>
                    <?php
                    if (!empty($allAuthors)) { ?>
                        <select name="author[]" multiple="multiple" required size="10">
                            <?php foreach ($allAuthors as $author) { ?>
                                <option value="<?= $author['id'] ?>"
                                    <?php if (isset($_POST['author']) && $_POST['author'] == $author['author']) {
                                        echo ' selected="selected"';
                                    } ?>><?= htmlspecialchars($author['author']) ?></option>
                            <?php } ?>
                        </select>
                    <?php } else { ?>
                        Нет авторов
                    <?php } ?>
                </td>
                <td><?= $errors['author'] ?? '' ?></td>
            </tr>
            <tr>
                <td>Введите описание книги:</td>
                <td><textarea name="description" rows="5"
                              cols="30"><?= htmlspecialchars($_POST['description'] ?? '') ?></textarea>
                </td>
                <td><?= $errors['description'] ?? '' ?></td>
            </tr>
            <tr>
                <td>Добавить фото книги:</td>
                <td><input type="file" name="img"
                           accept="image/jpeg,image/jpg,image/png,image/gif,image/bmp">
                </td>
                <td> <?= $errors['img'] ?? '' ?> </td>
            </tr>
        </table>
        <br>
        <input type="submit" name="add" value="Добавить книгу">
    </div>
</form>
