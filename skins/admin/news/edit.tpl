<?php
/**
 * @var $category string
 */
?>

<div>
    <a href="<?= createUrlChpu(['module' => 'news']) ?><?= $category ?>"><b> Вернутся к новостям </b></a>
    <form action="" method="post">
        <table>
            <tr>
                <td>Заголовок новости:</td>
                <td><input type="text" name="title"
                           value="<?= htmlspecialchars($currentNews['title'] ?? '') ?>"></td>
                <td><?= $errors['title'] ?? '' ?></td>
            </tr>
            <tr>
                <td>Категория новости:</td>
                <td>
                    <?php
                    if (!empty($allCategories)) { ?>
                        <select name="categoryId">
                            <?php foreach ($allCategories as $category) { ?>
                                <option value="<?= $category['id'] ?>"
                                    <?php if (isset($currentCategory['category']) && $currentCategory['category'] == $category['category']) {
                                        echo 'selected="selected"';
                                    } ?>><?= htmlspecialchars($category['category']) ?></option>
                            <?php } ?>
                        </select>
                    <?php } else { ?>
                        <b>Нет категорий</b>
                    <?php } ?>
                </td>
                <td><?= $errors['category'] ?? '' ?></td>
            </tr>
            <tr>
                <td>Текст новости:
                <td><textarea name="text" rows="5"
                              cols="30"><?= htmlspecialchars($currentNews['text'] ?? '') ?></textarea></td>
                <td><?= $errors['text'] ?? '' ?></td>
            </tr>
        </table>
        <input type="submit" name="edit" value="Отредактировать новость">
    </form>
</div>
