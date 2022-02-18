<?php
/**
 * @var $errors array
 */
?>

<div class="item">
    <form action="" method="post" enctype="multipart/form-data">
        <div class="edit">
            <table>
                <tr class="description">
                    <td class="first-col">Выберите категорию:</td>
                    <td class="second-col"><select name="category">
                            <?php
                            $category = ['Белые вина', 'Красные вина', 'Крепленые вина'];
                            foreach ($category as $v) { ?>
                                <option value="<?= $v ?>"
                                    <?php if (isset($_POST['category']) && $_POST['category'] == $v) {
                                        echo ' selected="selected"';
                                    } ?>><?= $v ?></option>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
                <tr class="description">
                    <td class="first-col">Введите название вина:</td>
                    <td class="second-col"><input type="text" name="title"
                                                  value="<?= htmlspecialchars($_POST['title'] ?? '') ?>">
                    </td>
                    <td> <?= $errors['title'] ?? '' ?> </td>
                </tr>
                <tr class="description">
                    <td class="first-col">Добавить фото:
                        <div class="foto">
                            <img src="<?= htmlspecialchars($_POST['img'] ?? '') ?>" height="150">
                        </div>
                    </td>
                    <td class="second-col"><input type="file" name="img"></td>
                    <td> <?= $errors['img'] ?? '' ?> </td>
                </tr>
                <tr class="description">
                    <td class="first-col">Введите описание вина:</td>
                    <td class="second-col"><textarea rows="5" cols="25"
                                                     name="description"><?= nl2br(htmlspecialchars($_POST['description'] ?? '')) ?></textarea>
                    </td>
                    <td> <?= $errors['description'] ?? '' ?> </td>
                </tr>
                <tr class="description">
                    <td class="first-col">Введите крепость вина:</td>
                    <td class="second-col"><input type="text" name="strength" value="<?= (float)($_POST['strength'] ?? '') ?>">
                        <span> %</span></td>
                    <td> <?= $errors['strength'] ?? '' ?> </td>
                </tr>
                <tr class="description">
                    <td class="first-col">Введите цену вина:</td>
                    <td class="second-col"><input type="text" name="price" value="<?= (float)($_POST['price'] ?? '') ?>"><span> грн.</span>
                    </td>
                    <td> <?= $errors['price'] ?? '' ?> </td>
                </tr>
                <tr class="description">
                    <td class="first-col">Есть ли товар в наличии:</td>
                    <td class="second-col">
                        <select name="availability">
                            <option value="1" <?php if (isset($_POST['availability']) && $_POST['availability'] == '1') {
                                echo 'selected="selected"';
                            } ?>>Есть в наличии
                            </option>
                            <option value="0" <?php if (isset($_POST['availability']) && $_POST['availability'] == '0') {
                                echo 'selected="selected"';
                            } ?>>Нет в наличии
                            </option>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" name="edit" value="Добавить">
        </div>
    </form>
</div>





