<form action="" method="post">
    <div class="edit">
        <table class="user-info user">
            <tr class="description">
                <td class="first-col">Логин</td>
                <td><input type="text" name="login"
                           value="<?= htmlspecialchars($userInfo['login'] ?? '') ?>">
                </td>
                <td> <?= (htmlspecialchars($errors['login'] ?? '')) ?></td>
            </tr>
            <tr class="description">
                <td class="first-col">Пароль</td>
                <td><input type="password" name="password">
                </td>
                <td> <?= (htmlspecialchars($errors['password'] ?? '')) ?></td>
            </tr>
            <tr class="description">
                <td class="first-col">Возраст</td>
                <td><input type="text" name="age" value="<?= (int)($userInfo['age'] ?? '') ?>"></td>
                <td> <?= (htmlspecialchars($errors['age'] ?? '')) ?></td>
            </tr>
            <tr class="description">
                <td class="first-col">Email</td>
                <td><input type="text" name="email" value="<?= htmlspecialchars($userInfo['email'] ?? '') ?>">
                </td>
                <td> <?= (htmlspecialchars($errors['email'] ?? '')) ?></td>
            </tr>
            <tr class="description">
                <td class="first-col">Доступ</td>
                <td>
                    <label><input type="radio" name="active" value="1"
                            <?php if (isset($userInfo['active']) && $userInfo['active'] == 1) { ?> checked <?php } ?> >
                        Открыт</label>
                    <br>
                    <label><input type="radio" name="active" value="0"
                            <?php if (isset($userInfo['active']) && $userInfo['active'] == 0) { ?> checked <?php } ?> >
                        Бан</label>
                </td>
            </tr>
            <tr class="description">
                <td class="first-col">Группа прав</td>
                <td>
                    <label><input type="radio" name="access" value="5"
                            <?php if (isset($userInfo['access']) && $userInfo['access'] == 5) { ?> checked <?php } ?> >
                        Админ</label>
                    <br>
                    <label><input type="radio" name="access" value="0"
                            <?php if (isset($userInfo['access']) && $userInfo['access'] != 5) { ?> checked <?php } ?> >
                        User</label>
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" name="edit" value="Сохранить изменения">
        <input type="submit" name="delete" value="Удалить пользователя">
    </div>
</form>
