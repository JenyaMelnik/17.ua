<?php
/**
 * @var $errors array
 * @var $dbc mysqli
 * @var $allCommentsQuery mysqli
 * @var $addedComment bool;
 */

if (isset($_SESSION['user'])) { ?>
    <div class="enter">
        <p id="commentWasAdded"> Комментарий добавлен </p>
        <p id="notice"><b><?= $notice ?? '' ?></b></p>
        <form action="" method="post"
              onsubmit="myAjaxComments('<?= $_SESSION['user']['login'] ?>', '<?= $_SESSION['user']['email'] ?>'); return false">
            <table>
                <tr>
                    <td><?= $_SESSION['user']['login'] ?>, ведите комментарий:</td>
                </tr>
                <tr>
                    <td>
                        <textarea rows="10" cols="42" id="comment" name="comment"></textarea>
                    </td>
                    <td id="commentError"></td>
                </tr>
            </table>
            <input type="submit" id="submit" name="sendComment" value="Добавить комментарий">
        </form>
    </div>
    <h4>Комментарии:</h4>
    <div id="allComments" class="allComments">
        <div id="addedComment" style="display: none">
            <div class="comment">
                <div id="addedCommentLoginAndDate" class="nameComment"></div>
                <div id="addedCommentText" class="textComment"></div>
            </div>
        </div>
        <?php
        if (mysqli_num_rows($allCommentsQuery)) {
            while ($comment = mysqli_fetch_assoc($allCommentsQuery)) { ?>
                <div class="comment">
                    <div class="nameComment">
                        <?= htmlspecialchars($comment['login']) . '<br>' . $comment['date'] ?>
                    </div>
                    <div class="textComment">
                        <?= nl2br(htmlspecialchars($comment['comment'])) ?>
                        <hr>
                    </div>
                </div>
                <?php
            }
        } else { ?>
            <p>Нет записей</p>
        <?php }
        unset($_SESSION['addedComment']);
        ?>
    </div>
<?php } else { ?>
    <p>Авторизируйтесь чтобы войти в раздел комментариев</p>
<?php } ?>
