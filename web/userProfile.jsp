<%@page import="fbird.shop.ShopDTO"%>
<%@page import="fbird.customer.CustomerDTO"%>
<%@page import="java.util.List"%>
<%@page import="fbird.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : userProfile
    Created on : Jun 13, 2023, 1:18:21 PM
    Author     : Khanh
--%>


<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Thông tin người dùng</title>
        <link rel="icon" href="img/logo-shop.PNG" type="image/png">
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
        <!--%
        UserDTO user = session.getAttribute("USER");
        %-->



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



        <div class="rts-shop-section section-gap">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3">
                        <div class="side-sticky">
                            <div class="shop-side-action">
                                <div class="action-item" >
                                    <div class="action-top">
                                        <span class="action-title"><i class="fa-sharp fa-solid fa-user"></i> Tài khoản của tôi</span>   
                                    </div>
                                    <ul style="list-style-type: none;">
                                        <li>
                                            <%
                                                if(loginUser != null){
                                            %>
                                            <a href="MainController?action=ViewProfile&username=<%= loginUser.getUsername() %>">
                                                <div class="color-item">
                                                    <span class="color-name">Hồ sơ</span>
                                                </div>
                                            </a>
                                            <%
                                                }
                                            %>
                                        </li>
                                        <li>
                                            <a href="createShop.jsp">
                                                <div class="color-item">
                                                    <span class="color-name">Đăng kí shop</span>
                                                </div>
                                            </a>
                                        </li>

                                        <li>
                                            <%
                            if(loginUser != null) {
                        %>
                                            <a href="MainController?action=ViewCustomerOrder&customer_id=<%= loginUser.getCustomer_id() %>&status=">
                                                <div class="color-item">
                                                    <span class="color-name">Đơn hàng của bạn</span>
                                                </div>
                                            </a>
                                                <%}%>
                                        </li>

                                        <li>
                                            <a href="MainController?action=Logout">
                                                <div class="color-item">
                                                    <span class="color-name">Đăng xuất</span>
                                                </div>
                                            </a>
                                        </li>

                                    </ul>






                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9" style="border: 2px solid; border-radius: 10px; width: 750px; margin: 10px;">



                        <div>
                            <div class="border-bottom">
                                <div class="text-left font-weight-bold" style="font-size: 20px;">
                                    Hồ sơ của tôi
                                </div>
                                <div class="text-muted" style="width: 400px;">
                                    Quản lý thông tin hồ sơ để bảo mật tài khoản
                                </div>
                            </div>

                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                        <%
                                    CustomerDTO c = (CustomerDTO) request.getAttribute("CUSTOMER");
                                    
                                        %>
                                        <form action="AddUserProfileController" method="POST">


                                            <div class="form-group">
                                                <label for="username">Tên đăng nhập:</label>
                                                <input name="username" type="text" class="form-control" readonly="" id="username" value="${sessionScope.LOGIN_USER.getUsername()}">
                                            </div>

                                            <div class="form-group">
                                                <label for="name">Tên khách hàng:</label>
                                                <input name="fullname" type="text" class="form-control" id="name" <%
                                                            if(c.getFullname() == null){
                                                       %>placeholder="Chưa có thông tin"<%
                                                    } else {%>value="<%= c.getFullname()%>"<%}
                                                       %>">
                                            </div>

                                            <div class="form-group">
                                                <label for="email">Địa chỉ email:</label>
                                                <input name="email" type="text" class="form-control" id="email" <%
                                                            if(c.getEmail() == null){
                                                       %>placeholder="Chưa có thông tin"<%
                                                    } else {%>value="<%= c.getEmail()%>"<%}
                                                       %>>
                                            </div>

                                            <div class="form-group">
                                                <label for="phone">Số điện thoại:</label>
                                                <input name="phone" type="text" class="form-control" id="phone" <%
                                                            if(c.getPhone() == null){
                                                       %>placeholder="Chưa có thông tin"<%
                                                    } else {%>value="<%= c.getPhone()%>"<%}
                                                       %>>
                                            </div>

                                            <div class="form-group">
                                                <label>Giới tính:</label>

                                                <div class="form-check">
                                                    <input name="gender" class="form-check-input" type="radio" id="male" value="Nam" <% if (c.isGender() == true) { %>checked="checked"<% } %>>
                                                    <label class="form-check-label" for="male">Nam</label>
                                                </div>

                                                <div class="form-check">
                                                    <input name="gender" class="form-check-input" type="radio" id="female" value="Nữ" <% if (c.isGender() != true) { %>checked="checked"<% } %>>
                                                    <label class="form-check-label" for="female">Nữ</label>
                                                </div>

                                                <div class="form-check">
                                                    <input name="gender" class="form-check-input" type="radio" name="gender" id="other" value="Khác">
                                                    <label class="form-check-label" for="other">Khác</label>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="birthdate">Ngày sinh:</label>
                                                <input name="dob" type="date" class="form-control" id="birthdate" value="<%= c.getDate_of_birth() %>">
                                            </div>

                                            <div class="form-group" style="margin-top: 10px; margin-bottom: 10px;">
                                                <button class="btn btn-primary" type="submit">Lưu</button>
                                            </div>
                                            <p class="text-danger">

                                                ${msg}
                                            </p>

                                        </form>
                                    </div>


                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6" style="margin-top: 5px; text-align: center; position: relative;">
                                        <img class="avatar" src="https://images.unsplash.com/photo-1552728089-57bdde30beb3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=425&q=80" width="100" height="100">
                                        <div class="d-flex mt-2 position-absolute start-50 translate-middle-x">
                                            <a href="createAddress.jsp" class="btn btn-primary" type="submit">Thêm địa chỉ</a>

                                        </div>

                                        
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>










        <!-- Footer Start -->
        <div class="container-fluid bg-light mt-5 py-5">
            <div class="container pt-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">PHƯƠNG THỨC LIÊN LẠC</h5>
                        <p class="mb-4"></p>
                        <p class="mb-2"><i class="bi bi-geo-alt text-primary me-2"></i>Lô E2a-7, Đường D1, Khu Công nghệ cao, P.Long Thạnh Mỹ, Tp. Thủ Đức, TP.HCM.</p>
                        <p class="mb-2"><i class="bi bi-envelope-open text-primary me-2"></i>daihoc.hcm@fpt.edu.vn</p>
                        <p class="mb-0"><i class="bi bi-telephone text-primary me-2"></i> (028) 7300 5588</p>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">F-Bird</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-body mb-2" href="MainController"><i class="bi bi-arrow-right text-primary me-2"></i>Trang chủ</a>

                            <a class="text-body mb-2" href="devteam.jsp"><i class="bi bi-arrow-right text-primary me-2"></i>Thành viên</a>


                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">Loại hàng cho chim</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-body mb-2" href="MainController?action=foodpage"><i class="bi bi-arrow-right text-primary me-2"></i>Thức ăn</a>
                            <a class="text-body mb-2" href="MainController?action=medicinepage"><i class="bi bi-arrow-right text-primary me-2"></i>Thuốc - Dược phẩm</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">Theo dõi chúng tôi trên</h5>
                        <!--                        <form action="">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control p-3" placeholder="Nhập email">
                                                        <button class="btn btn-primary">Đăng ký</button>
                                                    </div>
                                                </form>
                                                <h6 class="text-uppercase mt-4 mb-3"> Theo dõi chúng tôi trên</h6>-->
                        <div class="d-flex">
                            <a class="btn btn-outline-primary btn-square me-2" href="#"><i class="bi bi-twitter"></i></a>
                            <a class="btn btn-outline-primary btn-square me-2" href="#"><i class="bi bi-facebook"></i></a>
                            <a class="btn btn-outline-primary btn-square me-2" href="#"><i class="bi bi-linkedin"></i></a>
                            <a class="btn btn-outline-primary btn-square" href="#"><i class="bi bi-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid bg-dark text-white-50 py-4">
            <div class="container">
                <div class="row g-5">
                    <div class="col-md-6 text-center text-md-start">
                        <p class="mb-md-0">&copy; <a class="text-white" href="MainController">Trang web được thiết kế bởi Nhóm 3 </a> </p>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <p class="mb-0">Nguồn <a class="text-white" href="https://htmlcodex.com">HTML Codex</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html> 


<style>
    .avatar{


        border-radius: 50%;
        -moz-border-radius:50%;
        -webkit-border-radius: 50%;
    }

    .button:hover{
        background-color: #67f528;
    }
    .button{
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 10px 25px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
    }

    body {
        font-family: 'Roboto', Arial, sans-serif;
    }

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
</style>

