<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="cp_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Orccode | Admin Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="/cp/images/favicon.png" rel="shortcut icon" />

    <!-- jQuery -->
    <script src="/cp/plugins/jquery/jquery-2.2.4.min.js"></script>

    <!-- Bootstrap -->
    <link href="/cp/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/cp/plugins/bootstrap/js/bootstrap.min.js"></script>

    <!-- Fontawesome -->
    <script src="/cp/plugins/fontawesome/fontawesome-all.min.js"></script>

    <!-- AlertifyJS -->
    <link href="/cp/plugins/alertify/css/alertify.min.css" rel="stylesheet" />
    <link href="/cp/plugins/alertify/css/themes/default.min.css" rel="stylesheet" />
    <script src="/cp/plugins/alertify/alertify.min.js"></script>

    <!-- Loading CSS -->
    <link href="/cp/css/loading.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="/cp/stylesheet/main.min.css" rel="stylesheet" />

    <!-- Custom JS -->
    <script src="/cp/js/effect.js"></script>
    <script src="/cp/js/check-exception.js"></script>
    <script src="/cp/js/handle.js"></script>
</head>
<body>
    <div id="login-container">
        <div class="overlay"></div>
        <div id="login-form">
            <div class="row form">
                <div class="col-sm-12">
                    <h3 class="text-center" id="header-title">ADMIN LOGIN</h3>
                </div>
            </div>
            <div class="row form">
                <div class="col-sm-12">
                    <!-- User use email to sign in, Admin use username -->
                    <label>Email or Username</label>
                    <input type="text" class="required" id="txtLoginUsername" />
                </div>
            </div>
            <div class="row form">
                <div class="col-sm-12">
                    <label>Password</label>
                    <input type="password" class="required" id="txtLoginPIN" />
                </div>
            </div>
            <div class="row form">
                <div class="col-sm-12">
                    <a href="#" onclick="ShowFPForm()">Forgot password?</a>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <button class="btn btn-primary full-width" onclick="Login()">Submit</button>
                </div>
            </div>
        </div>
        <div id="forgot-password-form">
            <div class="row form">
                <div class="col-sm-12">
                    <h3 class="text-center" id="header-title">RECOVER PASSWORD</h3>
                </div>
            </div>
            <div class="row form">
                <div class="col-sm-12">
                    <p>Enter your Email and instructions will be sent to you!</p>
                </div>
            </div>
            <div class="row form">
                <div class="col-sm-12">
                    <label>Email</label>
                    <input type="text" class="required" id="txtFPEmail" placeholder="Email" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <button class="btn btn-primary full-width" onclick="ResetPIN()">Reset</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Loading -->
    <div id="loading-screen">
        <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
        </div>
    </div>
    <!-- ./Loading -->
    <script>
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
    </script>
</body>
</html>