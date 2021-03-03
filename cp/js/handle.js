/// <reference path="../do/admin/admin-login.aspx" />
/// <reference path="../do/admin/admin-login.aspx" />
/// <reference path="../do/admin/admin-login.aspx" />
/// <reference path="../do/admin/admin-login.aspx" />
/* ============================== MAIN ============================== */
var LOCAL_DO_URL = "/cp/do/";
var SEND_MAIL_URL = "http://emk.tuscript.com/hp-app/"

$(function () {
    $('input').focus(function () {
        $(this).removeClass('error');
    });

    $('textarea').focus(function () {
        $(this).removeClass('error');
    });

    $('select').focus(function () {
        $(this).removeClass('error');
    });
});

function Logout() {
    $.post(LOCAL_DO_URL + 'admin/admin-logout.aspx', function () {
        location.href = '/cp-login';
    });
}

function Cancel() {
    parent.history.back();
    return false;
}

function ResetForm() {
    $('input').each(function () {
        $(this).val('');
    });

    $('textarea').each(function () {
        $(this).val('');
    });

    $('select').each(function () {
        $(this).val(0);
    });
}

function Search(table_id) {
}
/* ============================== MAIN ============================== */

/* ============================== LOGIN ============================== */
$(function () {
    $('#txtLoginPIN').keydown(function (e) {
        if (e.keyCode == 13) {
            Login();
        }
    });
});

function Logout() {
    $.post(LOCAL_DO_URL + 'admin/admin-logout.aspx', function () {
        location.href = '/cp-login';
    });
}
function Login() {
   
    var user = $("#txtLoginUsername").val();
    var pwd = $("#txtLoginPIN").val();
    CheckFieldEmpty('#login-form');
    var error = CheckFieldError();
    if (error == "") {
        ShowLoading();
        $.post(LOCAL_DO_URL + "admin/admin-login.aspx", {
            user: user,
            pwd: pwd
        }, function (data) {
            if (data == 1) {
                location.href = "/cp-default";
            }
            else {
                alertify.alert('Error', 'Đăng nhập không thành công');
            }
        });
    } else {
        alertify.alert('Error', error);
    }
}

/* ============================== LOGIN ============================== */

/* ============================== SEARCH ============================== */
function Search(strSearch, processPath) {
    $("#table").html('<div class="spinner spinner-2"><div class="rect1"></div><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div><div class="rect5"></div></div>');

    $.post(LOCAL_DO_URL + processPath, {
        strSearch: strSearch,
    }, function (data) {
        $("#table").html(data);
    });
}
/* ============================== SEARCH ============================== */