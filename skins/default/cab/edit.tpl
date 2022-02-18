<?php
if (isset($_SESSION['notice'])) { ?>
    <p><b> <?= $_SESSION['notice'] ?> </b></p>
    <?php unset($_SESSION['notice']);
} ?>

<form action="" method="post" enctype="multipart/form-data">
    <div>
        <table>
            <tr>
                <td>Ваш логин:</td>
                <td><input type="text" name="login"
                           value="<?= htmlspecialchars($_SESSION['user']['login'] ?? '') ?>">
                </td>
                <td> <?= (htmlspecialchars($errors['login'] ?? '')) ?></td>
            </tr>
            <tr class="description">
                <td class="first-col">Сменить пароль</td>
                <td><input type="password" name="password">
                </td>
                <td> <?= (htmlspecialchars($errors['password'] ?? '')) ?></td>
            </tr>
            <tr>
                <td>Ваш возраст:</td>
                <td><input type="text" name="age" value="<?= (int)($_SESSION['user']['age'] ?? '') ?>"></td>
                <td> <?= (htmlspecialchars($errors['age'] ?? '')) ?></td>
            </tr>
            <tr>
                <td>Ваш email:</td>
                <td><input type="text" name="email" value="<?= htmlspecialchars($_SESSION['user']['email'] ?? '') ?>">
                </td>
                <td> <?= (htmlspecialchars($errors['email'] ?? '')) ?></td>
            </tr>
            <tr>
                <td>Редактировать фото:
                    <div class="foto">
                        <img src="<?= htmlspecialchars($_SESSION['user']['avatar']) ?>" height="150">
                    </div>
                </td>
                <td class="second-col"><input type="file" name="img"
                                              accept="image/jpeg,image/jpg,image/png,image/gif,image/bmp">
                </td>
                <td> <?= $errors['img'] ?? '' ?> </td>
            </tr>
        </table>
        <br>
        <input type="submit" name="edit" value="Сохранить изменения">
    </div>
</form>
