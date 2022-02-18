<?php
if (isset($_POST['add'],
    $_POST['page'],
    $_POST['static'])) {

    $errors = [];

    if (mb_strlen($_POST['page']) < 2) {
        $errors['page'] = 'В названии должно быть не менее 2 символов';
    }
    if ($_POST['static'] != 0 && $_POST['static'] != 1) {
        $errors['static'] = 'Выберите статичная страница или нет';
    }

    if (!$errors) {
        query("
            INSERT INTO `pages` SET 
            `module` = '" . escapeString(trim($_POST['page'])) . "',
            `static` = " . (int)$_POST['static'] . "
        ");
        $_SESSION['notice'] = 'Страница добавлена';
        redirectTo(['module'=>'pages']);
    }
}