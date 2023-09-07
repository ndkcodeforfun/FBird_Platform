<%-- 
    Document   : shopProduct
    Created on : Jun 6, 2023, 3:30:24 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="fbird.product.ProductDTO"%>
<%@page import="fbird.feedback.FeedbackDTO"%>
<%@page import="fbird.user.UserDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FBird</title>
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
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0 mb-5">
            <a href="MainController" class="navbar-brand ms-lg-5">
                <h1 class="m-0 text-uppercase text-dark"><i class="bi bi-shop fs-1 text-primary me-3"></i>FBird</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="wrapper" 
                 style="margin-right: 50px;
                 margin-top: 50px;
                 margin-bottom: 50px;
                 ">
                <form action="MainController" method="POST">
                
                <div class="searchBar">
                    <input id="searchQueryInput" type="text" name="searchQueryInput" placeholder="Search" value="" />
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
                            <a href="MainController?action=foodpage&categoryID=4" class="dropdown-item">Thuốc</a>
                        </div>
                    </div>
                    <a href="MainController?action=ViewRecipe" class="nav-item nav-link">Khẩu phần</a>                      
                    <a href="userProfile.jsp" class="nav-item nav-link"><i class="fa-solid fa-user"></i></a>  
                    <<%
                
                if(loginUser != null) {
            
                        %>
                    <div class="nav-item dropdown"> 
                        <a href="#" class="nav-item nav-link nav-contact bg-primary text-white px-3 ms-lg-3" data-bs-toggle="dropdown"><%= loginUser.getFullname() %></a>
                        <div class="dropdown-menu m-3">
                            <a href="MainController?action=ViewProfile&username=<%= loginUser.getUsername() %>" class="dropdown-item">View Profile</a>
                            <a href="MainController?action=Logout" class="dropdown-item">LOG OUT</a>
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
        <!--================= Header Section End Here =================-->

        <!--================= Shop Section Start Here =================-->
        
        <div>
            <div style="margin-top: 20px; margin-bottom: 20px; background-color: #D5CAD0; display: flex; justify-content: space-around; width: 100%; text-align: center; padding: 10px;">
               
                <% 
               List<ProductDTO> listShopProduct = (List<ProductDTO>) request.getAttribute("LIST_SHOP_PRODUCT");
               int countproduct=0;
               if (listShopProduct != null && !listShopProduct.isEmpty()) {
                   for (ProductDTO LSP : listShopProduct) {
                    countproduct++;
                    }
                   
               
                %>
                <a href="shopProduct.jsp">
                    <div style="display: flex;">
                        <div class="avatar"
                             style="background-image: url('<%= listShopProduct.get(0).getAvatar() %>');">

                        </div>
                </a>
                <div class="shop-name" style="display: flex; flex-direction: column; margin-left: 10px">
                    <div style="font-size: 30px;"><%= listShopProduct.get(0).getShop_name() %></div>
                    <div>Đã tham gia: <div style="color: red; display: inline-block;">5 năm trước</div></div>
                </div>
            </div>
                    <%

List<FeedbackDTO> listAllFeedback = (List<FeedbackDTO>) request.getAttribute("LIST_AllFeedback");
 
 int countfeedback=0;
 
    
 for (FeedbackDTO LAF : listAllFeedback) {
     if (LAF != null ) {
      countfeedback++;
 }
 }
                        %>
            <div style="display: flex; flex-direction: column; justify-content: space-around;">
                <div><i class="fa-regular fa-star"></i> Đánh giá: <div style="color: red; display: inline-block;"><%= countfeedback%></div></div>

                <div><i class="fa-brands fa-shopify"></i> Sản phẩm: <div style="color: red; display: inline-block;"><%= countproduct%></div></div>

                <div><i class="fa-solid fa-cart-shopping"></i> Số lượng đã bán: <div style="color: red; display: inline-block;">100k</div></div>


            </div>
            <div style="display: flex; flex-direction: column; justify-content: space-around;">
                <div><i class="fa-solid fa-comment"></i> Bình luận: <div style="color: red; display: inline-block;">1234</div></div>
                
                <div class="report-option">
                    <p>Tố cáo:</p>
                    <select>
                        <option value="spam">Spam</option>
                        <option value="phishing">Lừa đảo</option>
                        <option value="inappropriate-content">Hàng fake</option>
                        <option value="other">Khác</option>
                    </select>
                    <button class="confirm-button">Xác nhận</button>
                </div>    
            </div>
            <div style="display: flex; flex-direction: column;">
                <%if(loginUser != null) {%>
                        <form action="MainController" id="myForm1">

                            <div class="report-option" >

                                <a type="button" class='fas fa-exclamation-triangle' onclick="callAlert()"   style="margin-top: -28px; margin-left: 550px;"></a>

                            </div>
                        </form>
                        <%}else{%>
                        <div class="report-option" >

                            <a class='fas fa-exclamation-triangle' href="login.jsp"   style="margin-top: -28px; margin-left: 550px;"></a>

                        </div>
                        <%}%> 
            </div>
        </div>
    </div>
    <div class="rts-shop-section section-gap">
        <div class="container">
            <div class="row">
                <div class="col-xl-3">
                    <div class="side-sticky">
                        <div class="shop-side-action">
                            <div class="action-item" style="border: 2px solid;border-radius: 10px; width: 200px; text-align: center;">
                                <div class="action-top" style="margin-bottom: 10px; border-bottom: 1px solid rgba(0, 0, 0, 0.5);">
                                    <span class="action-title">Danh mục</span>   
                                </div>
<!--                                    <c:forEach var="cate" items="${requestScope.CATE_LIST}">
                                    <div class="color-item">
                                        <a href="HomeController?cateid=${cate.madm}"><span class="color-name">${cate.tendm}</span></a>
                                    </div>
                                </c:forEach>-->
                                <a href="#">
                                    <div class="color-item">

                                        <span class="color-name">Thức ăn</span>

                                    </div>
                                </a>
                                <a href="#">
                                    <div class="color-item">
                                        <span class="color-name">Thức uống</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="color-item">
                                        <span class="color-name">Thuốc</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="color-item">
                                        <span class="color-name">Thực phẩm hỗ trợ</span>
                                    </div>
                                </a>





                            </div>
                        </div>
                    </div>
                </div>
                                     
                <div class="col-xl-9">
                    <div class="products-area products-area3">
                        <div class="row justify-content-center">
                            <div>${requestScope.MESSAGE}</div>
                          <% for (ProductDTO LSP : listShopProduct) {
                          
                %>
                            <div class="col-xl-4 col-md-4 col-sm-6">
                                <div class="product-item product-item2 element-item3 sidebar-left" style="border: 2px solid; border-radius: 10px; width: 250px; margin: 10px;">
                                    <div style="text-align: center;">
                                        <a href="MainController?action=ViewProductDetail&shop_product_item_id=<%=LSP.getShopProductItemID() %>&shop_id=<%=LSP.getShopID() %>" class="product-image">
                                            <img style="width: 191px;height: 190px" src="<%=LSP.getImage_1() %>"  />
                                        </a>
                                    </div>
                                    <div class="bottom-content">
                                        <div style="text-align: center;">
                                            <a href="productDetail.html" style="color: black;"><%=LSP.getTitle() %></a>
                                        </div>

                                        <div style="text-align: center;">
                                            
                                            <span class="product-price" style="font-weight: bold; color: red;"><%=LSP.getPrice() %>đ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
 <% 
                               
                                }
               }
            %>
                            

                        </div>
                    </div>
                </div>
                                        
            </div>
                                        
        </div>
    </div>
                           
    <!--================= Shop Section Section End Here =================-->

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
                    <h5 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">FBird</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-body mb-2" href="MainController"><i class="bi bi-arrow-right text-primary me-2"></i>Trang chủ</a>

                        <a class="text-body mb-2" href="member.html"><i class="bi bi-arrow-right text-primary me-2"></i>Thành viên</a>


                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">Loại hàng cho chim</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-body mb-2" href="food.html"><i class="bi bi-arrow-right text-primary me-2"></i>Thức ăn</a>
                        <a class="text-body mb-2" href="drinks.html"><i class="bi bi-arrow-right text-primary me-2"></i>Thức uống</a>
                        <a class="text-body mb-2" href="supplement.html"><i class="bi bi-arrow-right text-primary me-2"></i>Thực phẩm bổ sung</a>
                        <a class="text-body mb-2" href="medicine.html"><i class="bi bi-arrow-right text-primary me-2"></i>Thuốc</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">Phản hồi đến công ty chúng tôi</h5>
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control p-3" placeholder="Nhập email">
                            <button class="btn btn-primary">Đăng ký</button>
                        </div>
                    </form>
                    <h6 class="text-uppercase mt-4 mb-3"> Theo dõi chúng tôi trên</h6>
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
                    <p class="mb-md-0">&copy; <a class="text-white" href="MainController">Trang web được thiết kế bởi nhóm 3 </a> </p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <p class="mb-0">Nguồn <a class="text-white" href="https://htmlcodex.com">HTML Codex</a></p>
                </div>
            </div>
        </div>
    </div>
    <script>
        function callAlert() {
                swal("Viết lý do khiếu nại:", {
                    content: "input"
                })
                        .then((value) => {
                            if (value !== null && value.trim() !== '') {
                                // Hiển thị thông báo khi gửi khiếu nại thành công
                                swal({
                                    title: "Gửi khiếu nại thành công!",
                                    icon: "success",
                                    button: "OK"
                                });
                                submitForm1("ReportProduct", value);
                                // Tùy chỉnh các tác vụ khác dựa trên giá trị `value` ở đây nếu cần
                                // Ví dụ: Gửi giá trị đến máy chủ qua AJAX để xử lý
                                // Các tác vụ khác...
                            } else {
                                // Người dùng không nhập gì hoặc nhập lý do trống.
                                swal("Vui lòng nhập lý do khiếu nại!", {
                                    icon: "error",
                                    button: "Trở lại"
                                });
                            }
                        });
            }
            function submitForm1(action, shop_id, customer_id, value) {
                                var form = document.getElementById("myForm1");
                                var xhr = new XMLHttpRequest();
                                xhr.open("POST", "MainController?action=" + encodeURIComponent(action) + "&shop_id=" + encodeURIComponent(shop_product_item_id) + "&customer_id=" + encodeURIComponent(customer_id) + "&value=" + encodeURIComponent(value), true);
                                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                xhr.onreadystatechange = function () {
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                        // Xử lý kết quả tại đây (nếu cần)
                                        console.log(xhr.responseText);
                                    }
                                };
                                xhr.send(new FormData(form));
                            }
    </script>
    <!-- Footer End -->
    <!--================= Jquery latest version =================-->
    <script src="assets/js/vendors/jquery-3.6.0.min.js"></script>
    <!--================= Bootstrap latest version =================-->
    <script src="assets/js/vendors/bootstrap.min.js"></script>
    <!--================= Wow.js =================-->
    <script src="assets/js/vendors/wow.min.js"></script>
    <!--================= Swiper Slider =================-->
    <script src="assets/js/vendors/swiper-bundle.min.js"></script>
    <!--================= Nice Select =================-->
    <script src="assets/js/vendors/jquery.nice-select.js"></script>
    <!--================= Swiper Slider =================-->
    <script src="assets/js/vendors/jquery.nstSlider.min.js"></script>
    <!--================= Swiper Slider =================-->
    <script src="assets/js/vendors/zoom.js"></script>
    <!--================= metisMenu Plugin =================-->
    <script src="assets/js/vendors/metisMenu.min.js"></script>
    <!--================= Main Menu Plugin =================-->
    <script src="assets/js/vendors/rtsmenu.js"></script>
    <!--================= Magnefic Popup Plugin =================-->
    <script src="assets/js/vendors/isotope.pkgd.min.js"></script>
    <!--================= Magnefic Popup Plugin =================-->
    <script src="assets/js/vendors/jquery.magnific-popup.min.js"></script>
    <!--================= Main Script =================-->
    <script src="assets/js/main.js"></script>
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
    .color-item:hover{
        background-color: #d0011b;
    }
    .avatar {
        width: 100px;
        height: 100px;

        border-radius: 50%;
        -moz-border-radius:50%;
        -webkit-border-radius: 50%;
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
        width: 100%;
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
