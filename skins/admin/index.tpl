<?php
/**
 * @var $content
 */
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title> <?= Core::$META['title'] ?> </title>
    <meta name="description" content="<?= Core::$META['description'] ?>">
    <meta name="keywords" content="<?= Core::$META['keywords'] ?>">
    <link href="/css/normalize.css" rel="stylesheet">
    <link href="/skins/admin/css/style.css" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/js/methods_v1.js"></script>

    <?php if (count(Core::$CSS)) {
        echo implode('\n', Core::$CSS);
    } ?>
    <?php if (count(Core::$JS)) {
        echo implode('\n', Core::$JS);
    } ?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div class="admin-auth container">
    <a href="/">ВЕРНУТСЯ К ПРОСМОТРУ САЙТА</a><br>
    <?php if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 5) { ?>
        <p><b> СТРАНИЦА УПРАВЛЕНИЯ САЙТОМ </b></p>
        <a href="/cab/exit"> Выход </a>
    <?php } ?>
</div>
<div class="search">
    <div class="container centre">
        <div class="col main-link">
            <a href="/admin">Wine store online</a>
        </div>
    </div>
</div>
<div class="container">
    <div class="admin-nav">
        <?php
        if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 5) { ?>
            <a href="<?= createUrlChpu(['module' => 'news']) ?>">NEWS</a>
            <a href="<?= createUrlChpu(['module' => 'comments']) ?>">COMMENTS</a>
            <a href="<?= createUrlChpu(['module' => 'goods']) ?>">GOODS</a>
            <a href="<?= createUrlChpu(['module' => 'users']) ?>">USERS</a>
            <a href="<?= createUrlChpu(['module' => 'books']) ?>">BOOKS</a>
            <a href="<?= createUrlChpu(['module' => 'pages']) ?>">PAGES</a>
        <?php } else { ?>
            <h2>Авторизируйтесь как администратор</h2>
        <?php } ?>
    </div>
</div>
<div id="content" class="container">
    <?= $content ?>
</div>
<footer>
    <div class="container clearfix">
        <p class="copyright">
            Powered By OpenCart Wine Store Online &copy;
            <?= COPYRIGHT ?>
        </p>
    </div>
</footer>
</body>