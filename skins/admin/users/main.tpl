<?php
/**
 * @var $users mysqli
 * @var $userInfo mysqli
 * @var $search mysqli
 * @var $errors array
 * @var $login string
 * @var $email string
 * @var $age int
 * @var $active int
 */
?>
<div>
    <?php if (isset($notice)) { ?>
        <h2><?= $notice ?></h2>
    <?php }
    include "./skins/" . Core::$SKIN . "/users/search.tpl"; ?>
    <br>
    <div class="clearfix user-list">
        <table class="user">
            <?php if ($_SESSION['search'] == 'yes') {
                while ($userSearch = mysqli_fetch_assoc($search)) { ?>
                    <tr>
                        <td class="user"> -
                            <a href="users?id=<?= $userSearch['id'] ?>"><?= htmlspecialchars($userSearch['login']) ?></a>
                        </td>
                    </tr>
                <?php }
            } else {
                while ($user = mysqli_fetch_assoc($users)) { ?>
                    <tr>
                        <td class="user"> -
                            <a href="users?id=<?= $user['id'] ?>"><?= htmlspecialchars($user['login']) ?></a>
                        </td>
                    </tr>
                <?php }
            } ?>
        </table>
    </div>
    <div class="clearfix">
        <?php include "./skins/" . Core::$SKIN . "/users/edit.tpl" ?>
    </div>
</div>
