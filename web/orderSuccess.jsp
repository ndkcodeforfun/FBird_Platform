<%-- 
    Document   : index
    Created on : Jun 27, 2023, 1:13:29 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="fbird.product.ProductDTO"%>
<%@page import="fbird.recipe.RecipeDTO"%>
<%@page import="fbird.user.UserDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Bird</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&family=Roboto:wght@700&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <!--        Icon Cart-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--Search bar-->
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">

        <script src="https://kit.fontawesome.com/39834b73e4.js" crossorigin="anonymous"></script>

    </head>

    <body>



        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0 mb-5">
            <a href="MainController" class="navbar-brand ms-lg-5">
                <h1 class="m-0 text-uppercase text-dark"><i class="bi bi-shop fs-1 text-primary me-3"></i>FBird</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="wrapper" 
                 style="
                 margin-top: 50px;
                 margin-bottom: 50px;
                 ">
                <form action="MainController" method="POST">

                    <div class="searchBar">
                        <input id="searchQueryInput" type="text" name="searchQueryInput" placeholder="Tìm kiếm sản phẩm" required="" value="" />
                        <button id="searchQuerySubmit" type="submit" name="action" value="searchQuerySubmit">
                            <svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="#666666" d="M9.5,3A6.5,6.5 0 0,1 16,9.5C16,11.11 15.41,12.59 14.44,13.73L14.71,14H15.5L20.5,19L19,20.5L14,15.5V14.71L13.73,14.44C12.59,15.41 11.11,16 9.5,16A6.5,6.5 0 0,1 3,9.5A6.5,6.5 0 0,1 9.5,3M9.5,5C7,5 5,7 5,9.5C5,12 7,14 9.5,14C12,14 14,12 14,9.5C14,7 12,5 9.5,5Z" />
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">

                    <div class="nav-item nav-link" style="width: max-content">
                        <% 
                            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                            if(loginUser != null && loginUser.getRole() == 3) {
                        %>
                        <a  href="MainController?action=ViewCart&customer_id=<%= loginUser.getCustomer_id() %>"class="shopping">

                            <i class="fa fa-shopping-cart" style="font-size:25px;"></i>

                        </a>
                        <%}%>
                    </div>


                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Danh mục</a>
                        <div class="dropdown-menu m-0">
                            <a href="MainController?action=productpage" class="dropdown-item">Sản phẩm</a>
                            <a href="MainController?action=foodpage&categoryID=1" class="dropdown-item">Thức ăn</a>
                            <a href="MainController?action=foodpage&categoryID=4" class="dropdown-item">Thuốc - Dược phẩm</a>
                        </div>
                    </div>
                    <a href="MainController?action=ViewRecipe" class="nav-item nav-link">Khẩu phần</a>
                    <% if(loginUser != null) {
                            if(loginUser.getRole() == 1){
                            loginUser.setFullname("Admin Account");
                    %>

                    <a href="adminDashboard.jsp" class="nav-item nav-link"><i class="fa-solid fa-user-gear"></i></a>
                        <%
                        } else if(loginUser.getRole() == 2){
                        %>
                    <a href="MainController?action=ViewShopDashboard" class="nav-item nav-link"><i class="fa-solid fa-user"></i></a>
                        <%
                            } else{
                        %>
                    <a href="MainController?action=ViewProfile&username=<%= loginUser.getUsername() %>" class="nav-item nav-link"><i class="fa-solid fa-user"></i></a>
                        <%
                            }
}
                if(loginUser != null) {
            
                        %>
                    <div class="nav-item dropdown"> 
                        <a href="#" class="nav-item nav-link nav-contact bg-primary text-white px-3 ms-lg-3" data-bs-toggle="dropdown"><%= loginUser.getFullname() %></a>
                        <div class="dropdown-menu m-3">
                            <a href="MainController?action=ViewProfile&username=<%= loginUser.getUsername() %>" class="dropdown-item">Tài khoản</a>
                            <a href="MainController?action=Logout" class="dropdown-item">Đăng xuất</a>
                        </div>
                    </div>
                    <%}else{%>
                    <a href="login.jsp" class="nav-item nav-link">Đăng nhập</a>
                    <a href="register.jsp" class="nav-item nav-link nav-contact bg-primary text-white px-5 ms-lg-5">Đăng ký<i class="bi bi-arrow-right"></i></a>
                        <%}%>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->

        <div class="card">
      <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <i class="checkmark">✓</i>
      </div>
        <h1 class="success">Thanh toán thành công</h1> 
        <p class="content">Quá trình thanh toán đã hoàn tất<br/> cửa hàng bạn mua sẽ giao trong thời gian sớm nhất!</p></br></br>
        
        <a href="MainController">Tiếp tục mua sắm</a></br>
        Hoặc tự động chuyển hướng sau <div id="countdown"></div>
        
      </div>



        <!-- Footer Start -->
        
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
var timeleft = 7;
var downloadTimer = setInterval(function(){
  if(timeleft <= 0){
    clearInterval(downloadTimer);
    document.getElementById("countdown").innerHTML = "0 giây";
  } else {
    document.getElementById("countdown").innerHTML = timeleft + " giây";
  }
  timeleft -= 1;
}, 1000);
        </script>
        <script>
            
            $(function () {
  setTimeout(function() {
    window.location.replace("http://localhost:8084/FBird/");
  }, 7000);
});
        </script>
    </body>

</html> 


<style>


    .wrapper {
        width: 100%;
        max-width: 31.25rem;
        /*  margin: 6rem auto;*/
        margin-right: 50px;
        margin-top: 50px;
        margin-bottom: 50px;
    }

    .label {
        font-size: .625rem;
        font-weight: 400;
        text-transform: uppercase;
        letter-spacing: +1.3px;
        margin-bottom: 1rem;
    }

    .searchBar {
        width: 111%;
        display: flex;
        flex-direction: row;
        /*align-items: center;*/
    }

    #searchQueryInput {
        width: 100%;
        height: 2.8rem;
        background: #f5f5f5;
        outline: none;
        border: none;
        border-radius: 1.625rem;
        padding: 0 3.5rem 0 1.5rem;
        font-size: 1rem;
    }

    #searchQuerySubmit {
        width: 3.5rem;
        height: 2.8rem;
        margin-left: -3.5rem;
        background: none;
        border: none;
        outline: none;
    }

    #searchQuerySubmit:hover {
        cursor: pointer;
    }
    .navbar-light .navbar-nav .nav-link {
        font-family: 'Roboto', sans-serif;
        position: relative;
        margin-left: 30px;
        padding: 30px 0;
        font-size: 18px;
        font-weight: 700;
        text-transform: uppercase;
        color: var(--dark);
        outline: none;
        transition: .5s;
        width: max-content;
    }
    body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
      }
    .success {
          color: #88B04B;
  font-family: "Times New Roman", "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        .content {
          color: #404F5E;
  font-family: "Times New Roman", "Nunito Sans", "Helvetica Neue", sans-serif;
          font-size:20px;
          margin: 0;
        }
      .checkmark {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      }
      .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
</style>
