<?php
// ======================================= Добавление комментария ==================================================
if (isset($_POST['login'], $_POST['comment'], $_POST['email'])) {
    $comment = [
        'login' => htmlspecialchars($_POST['login']),
        'email' => htmlspecialchars($_POST['email']),
        'comment' => nl2br(htmlspecialchars($_POST['comment'])),
        'date' => date("Y-m-d H:i:s")
    ];

    $addCommentSqlQuery = " INSERT INTO `comments` SET
            `login`   = '" . escapeString($_POST['login']) . "',
            `email`   = '" . escapeString($_POST['email']) . "',
            `comment` = '" . escapeString($_POST['comment']) . "',
            `date`    = '" . $comment['date'] . "'";

    if (query($addCommentSqlQuery)) {
        $comment['id'] = mysqli_insert_id(DBConnectAndClose::connect());
        echo json_encode($comment);
        exit();
    }
}

// =========================================== Все комментарии =====================================================
$allCommentsQuery = query( "SELECT * FROM `comments` ORDER BY `id` DESC ");

// =================================================================================================================
if (isset($_SESSION['notice'])) {
    $notice = $_SESSION['notice'];
    unset($_SESSION['notice']);
}
