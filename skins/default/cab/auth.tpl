<?php
if (!isset($status) || $status != 'ok') { ?>
    <div id="auth">
        <form action="" method="post" onsubmit="return checkLengthTwoField('login', 'loginError', 'password', 'passwordError')">
            <table>
                <tr>
                    <td><input type="text" id="login" name="login" placeholder="введите логин">
                        <div id="loginError" ></div>
                    </td>
                </tr>
                <tr>
                    <td><input type="password" id="password" name="pass" placeholder="введите пароль">
                        <div id="passwordError" ></div>
                    </td>
                </tr>
                <tr>
                    <td><label><input type="checkbox" name="autoauth"> Запомнить меня</label></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Войти"></td>
                </tr>
            </table>
        </form>
    </div>
<?php } else { ?>
    <p class="congratulation">Поздравляем, вы авторизировались</p>
<?php } ?>
