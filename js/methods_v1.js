function areYouSure() {
    return confirm('Вы уверены что хотите удалить?');
}

function showHide() {
    var element = document.getElementById('auth');
    if (element.style.display === 'block') {
        element.style.display = 'none';
    } else {
        element.style.display = 'block';
    }
}

function checkLength(id, errorId) {
    var length = document.getElementById(id).value.length;
    if (length < 3) {
        document.getElementById(errorId).innerHTML = 'минимум 3 символа. Вы ввели: ' + length;
        return false;
    } else {
        document.getElementById(errorId).innerHTML = '';
        return true;
    }
}

function checkLengthTwoField(id, errorId, id2, errorId2) {
    var loginLength = document.getElementById(id).value.length;
    var passwordLength = document.getElementById(id2).value.length;
    if (loginLength < 2 && passwordLength < 2) {

        document.getElementById(errorId).innerHTML = 'минимум 2 символа. Вы ввели ' + loginLength;
        document.getElementById(errorId2).innerHTML = 'минимум 2 символа. Вы ввели ' + passwordLength;
        return false;
    } else if (loginLength < 2 && passwordLength >= 2) {
        document.getElementById(errorId).innerHTML = 'минимум 2 символа. Вы ввели ' + loginLength;
        document.getElementById(errorId2).innerHTML = '';
        return false;
    } else if (passwordLength < 2 && loginLength >= 2) {
        document.getElementById(errorId2).innerHTML = 'минимум 2 символа. Вы ввели ' + passwordLength;
        document.getElementById(errorId).innerHTML = '';
        return false;
    } else {
        document.getElementById(errorId).innerHTML = '';
        document.getElementById(errorId2).innerHTML = '';
    }
}

function myAjaxComments(userLogin, userEmail) {
    if (checkLength('comment', 'commentError')) {
        var comment = document.getElementById('comment').value;
        $.ajax({
            url: '',
            type: "POST",
            cache: false,
            data: {login: userLogin, email: userEmail, comment: comment},
            success: function (msg) {
                var comment = JSON.parse(msg);
                if (document.getElementById('notice').style.display !== 'none') {
                    document.getElementById('notice').style.display = 'none';
                }
                document.getElementById('commentWasAdded').style.display = 'block';
                document.getElementById('addedCommentLoginAndDate').innerHTML = comment.login + '<br>' + comment.date;
                document.getElementById('addedCommentText').innerHTML = comment.comment + '<hr>';
            },
        });

        document.getElementById('allComments').innerHTML =
            document.getElementById('addedComment').innerHTML + document.getElementById('allComments').innerHTML;
    }
}
