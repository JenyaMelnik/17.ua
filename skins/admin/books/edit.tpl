<?php
/**
 * @var $currentBook array
 * @var $selectedAuthorId string
 */
?>

<form action="" method="post" enctype="multipart/form-data">
    <div>
        <p>
            <b><a href="<?= createUrlChpu(['module' => 'books']) ?><?= htmlspecialchars($selectedAuthorId) ?>"> Вернутся к книгам </a></b>
        </p>
        <table>
            <tr>
                <td>Название книги:</td>
                <td><input type="text" name="title"
                           value="<?= htmlspecialchars($currentBook['title']); ?>">
                </td>
                <td> <?= $errors['title'] ?? '' ?></td>
            </tr>
            <tr>
                <td>Авторы:</td>
                <td>
                    <?php
                    if (!empty($allAuthors) && !empty($currentBookAuthorsIds)) { ?>
                    <select name="author[]" multiple="multiple" required size="10">
                        <?php foreach ($allAuthors as $author) { ?>
                            <option value="<?= $author['id'] ?>"
                                <?php
                                foreach ($currentBookAuthorsIds as $currentBookAuthorId) {
                                    if ($currentBookAuthorId == $author['id']) {
                                        echo 'selected="selected"';
                                    }
                                } ?>><?= htmlspecialchars($author['author']) ?>
                            </option>
                        <?php }
                        } else { ?>
                            Нет авторов
                        <?php } ?>
                    </select>
                </td>
                <td><?= $errors['author'] ?? '' ?></td>
            </tr>
            <tr>
                <td>Описание книги:</td>
                <td><textarea name="description" rows="5"
                              cols="30"><?= htmlspecialchars($currentBook['description']) ?></textarea>
                </td>
                <td><?= $errors['description'] ?? '' ?></td>
            </tr>
            <tr>
                <td>Фото книги:
                    <div class="text">
                        <img src="<?= $currentBook['img']; ?>" alt="image">
                    </div>
                </td>
                <td><input type="file" name="img"
                           accept="image/jpeg,image/jpg,image/png,image/gif,image/bmp">
                </td>
                <td> <?= $errors['img'] ?? '' ?> </td>
            </tr>
        </table>
        <br>
        <input type="submit" name="edit" value="Сохранить изменения">
    </div>
</form>
