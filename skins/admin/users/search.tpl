<div>
    <form action="" method="post">
        <input type="text" name="searchLogin" placeholder="поиск пользователей"
               value="<?= htmlspecialchars($_POST['searchLogin'] ?? '') ?>">
        <input type="submit" name="search" value="искать">
        <input type="submit" name="clear" value="очистить">
    </form>
</div>