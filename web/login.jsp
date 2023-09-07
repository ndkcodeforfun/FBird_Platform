<%-- 
    Document   : login1.jsp
    Created on : May 27, 2023, 2:49:21 PM
    Author     : COMPUTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
    <head>
        <title>Đăng nhập - FBird</title>
        <link rel="icon" href="img/logo-shop.PNG" type="image/png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="login-form/css/style.css">
    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">

                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url(login-form/images/bg-1.jpg);">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Đăng nhập</h3>
                                    </div>
                                </div>
                                <form action="MainController" class="signin-form" method="POST" id="signin-form">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Tên đăng nhập:</label>
                                        <input type="text" class="form-control" placeholder="Username" name="username" required="">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Mật khẩu:</label>
                                        <input type="password" class="form-control" placeholder="Password" name="password" required="">
                                    </div>
                                    <div class="form-group mb-3" style="color: red;">
                                        ${requestScope.ERROR}

                                    </div>
                                    <div class="form-group mb-2" style="color: red;">

                                    </div>
                                    <div class="g-recaptcha form-group mb-2" data-sitekey="6LfcOQYlAAAAAOlqYLQzLd461rhm2GIe6FVlgrbh"></div>

                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3" name="action" value="Login">Đăng nhập</button>
                                        <input name="action" value="Login" hidden=""/>
                                    </div>

                                    <div class="form-group">


                                        <a class="form-control btn btn-outline-dark " href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8084/FBird/LoginGoogleController&response_type=code&client_id=1030788107110-b5qdutua61r96002p0r24f7jeo1det9c.apps.googleusercontent.com&approval_prompt=force" role="button" style="text-transform:none">
                                            <div style="margin-top: 5px;">
                                                <img width="20px" style="margin-bottom:3px; margin-right:5px" alt="Google sign-in" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" />
                                                <span>
                                                    Đăng nhập bằng Google   
                                                </span>
                                            </div>

                                        </a>
                                    </div>



                                    <div class="form-group d-md-flex">
                                        <div class="w-50 text-left">
                                            <label class="checkbox-wrap checkbox-primary mb-0">Nhớ mật khẩu
                                                <input type="checkbox" checked>
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <div class="w-50 text-md-right">
                                            <a href="#">Quên mật khẩu</a>
                                        </div>
                                    </div>
                                </form>
                                <div style="text-align: center">
                                    Chưa có tài khoản? <a href="register.jsp">Đăng ký nhanh</a>
                                </div>
                                <div style="text-align: center">
                                    Quay về trang chủ || <a href="MainController">Home</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script>
    window.onload = function () {
        const form = document.getElementById("signin-form");
        const error = document.querySelector(".form-group.mb-2");

        form.addEventListener("submit", function (event) {
            event.preventDefault();
            const response = grecaptcha.getResponse();
            if (response) {
                form.submit();
            } else {
                error.innerHTML = "Please confirm reCaptcha";
            }
        });
    };
</script>


        <script src="login-form/js/jquery.min.js"></script>
        <script src="login-form/js/popper.js"></script>
        <script src="login-form/js/bootstrap.min.js"></script>
        <script src="login-form/js/main.js"></script>

    </body>
</html>


