<%-- 
    Document   : login
    Created on : May 22, 2023, 8:20:36 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng ký - FBird</title>
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
                                        <h3 class="mb-4">Đăng ký</h3>
                                    </div>
                                </div>
                                <form action="SignUpController" method="POST" class="signup-form" id="signup-form">
                                    <p class="text-danger">
                                        
                                        ${msg}
                                    </p>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Tên truy cập:</label>
                                        <input name="username" type="text" class="form-control" placeholder="Username" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Mật khẩu:</label>
                                        <input name="password" type="password" class="form-control" placeholder="Password" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Xác nhận mật khẩu:</label>
                                        <input name="confirm" type="password" class="form-control" placeholder="Confirm Password" required>
                                    </div>
                                    <p class="form-group mb-2" style="color: red;">

                                    </p>
                                    <div class="g-recaptcha form-group mb-3" data-sitekey="6LfcOQYlAAAAAOlqYLQzLd461rhm2GIe6FVlgrbh"></div>

                                    
                                    <div class="form-group">
                                        <button type="submit"  value="Register" class="form-control btn btn-primary rounded submit px-3">Đăng ký</button>
                                        <input name="action" value="Register" hidden=""/>
                                    </div>
                                </form>
                                <div style="text-align: center">
                                    Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a>
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
        const form = document.getElementById("signup-form");
        const error = document.querySelector(".form-group.mb-2");

        form.addEventListener("submit", function (event) {
            event.preventDefault();
            const response = grecaptcha.getResponse();
            if (response) {
                form.submit();
            } else {
                error.innerHTML = "Vui lòng nhấn recaptcha";
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
