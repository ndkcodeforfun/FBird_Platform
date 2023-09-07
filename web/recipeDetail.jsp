<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="fbird.cart.CartDTO"%>
<%@page import="fbird.user.UserDTO"%>
<%@page import="fbird.shop.ShopDTO"%>
<%@page import="fbird.product.ProductDTO"%>
<%@page import="fbird.recipe.RecipeDTO"%>
<%@ page import="java.text.NumberFormat" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nội dung khẩu phần</title>
        <link rel="icon" href="img/logo-shop.PNG" type="image/png">
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
        <!--Search bar-->
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="productPage/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">

        <script src="https://kit.fontawesome.com/39834b73e4.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div style="background-color: #BCDAE0;">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0 mb-5">
                <a href="MainController" class="navbar-brand ms-lg-5">
                    <h1 class="m-0 text-uppercase text-dark"><i class="bi bi-shop fs-1 text-primary me-3"></i>FBIRD</h1>
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
                <%
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    List<RecipeDTO> recipe = (List<RecipeDTO>) request.getAttribute("RECIPE_DETAIL");
                    ShopDTO shop = (ShopDTO) request.getAttribute("SHOP_RECIPE");
                    if(recipe != null && shop != null){
                %>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <div class="nav-item nav-link" style="width: max-content">
                            <% 
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
                                <% if(loginUser.getRole() == 3){%>
                                <a href="MainController?action=ViewProfile&username=<%= loginUser.getUsername() %>" class="dropdown-item">Tài khoản</a>
                                <%}%>
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

            <div class="flex-box">
                <div class="left">
                    <div class="big-img">
                        <img src="<%=recipe.get(0).getImage_1()%>">
                    </div>
                    <div class="images">
                        <div class="small-img">
                            <img src="<%=recipe.get(0).getImage_1()%>" onclick="showImg(this.src)">
                        </div>
                        <div class="small-img">
                            <img src="<%=recipe.get(0).getImage_2()%>" onclick="showImg(this.src)">
                        </div>
                        <div class="small-img">
                            <img src="<%=recipe.get(0).getImage_3()%>" onclick="showImg(this.src)">
                        </div>
                        <div class="small-img">
                            <img src="<%=recipe.get(0).getImage_4()%>" onclick="showImg(this.src)">
                        </div>
                    </div>
                </div>

                <div class="right">
                    <div class="url"><a class="url1" href="MainController">Trang chủ &nbsp</a>  >   <a class="url1" href="MainController?action=ViewRecipe">&nbsp Khẩu phần</a> </div>
                    <div class="pname" style="text-transform: uppercase;"><%= recipe.get(0).getTitle_recipe()%></div>
                    <div class="size" style=" font-size: 17px; font-weight: bold; text-transform: uppercase; color: #7ab730;">Thành Phần</div>
                    <div class="pname" style="margin-top: -20px; ">
                    <%
                            List<RecipeDTO> listRecipeProduct = (List<RecipeDTO>) request.getAttribute("RECIPE_PRODUCT");
                           for(RecipeDTO rp: listRecipeProduct){
                    %>
                    <div >> <a style="font-size:14px;"><%= rp.getTitle()%></a></div>
                    <%}%>
                    </div>
                    <div class="price" style="font-size: 35px;">
                        <%-- Lấy giá tiền từ recipe.get(0).getTotal_price() --%>
                        <% double totalPrice = recipe.get(0).getTotal_price(); %>

                        <%-- Tạo một đối tượng NumberFormat để định dạng giá tiền --%>
                        <% NumberFormat numberFormat = NumberFormat.getInstance(); %>
                        <% numberFormat.setMinimumFractionDigits(0); %>
                        <% numberFormat.setMaximumFractionDigits(0); %>
                        <% String formattedPrice = numberFormat.format(totalPrice); %>

                        <%-- Hiển thị giá tiền với định dạng đã chọn --%>
                        <%= formattedPrice %>đ
                    </div>

                    <div class="btn-box">
                        <% if(loginUser != null && loginUser.getRole() == 3) {%>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="recipe" value="<%= recipe.get(0).getRecipe_id()%>"/>   
                            <input type="hidden" name="customer" value="<%= loginUser.getCustomer_id()%>"/>
                            <button class="cart-btn" name="action" value="AddRecipeToCart">Thêm vào giỏ hàng</button>
                        </form>

                        <%} else if(loginUser != null && loginUser.getRole() != 3){%>
                        <button class="cart-btn"><a href="#" style="color: white;">Phân quyền của bạn không được mua hàng</a></button>
                        <%} else {%>
                        <button class="cart-btn"><a href="login.jsp" style="color: white;">Thêm vào giỏ hàng</a></button>
                        <%}%>
                    </div>
                </div>
            </div>

            <div style="margin-left: 20%; transform: translateX(-10%);">
                <div style="margin-top: 20px; margin-bottom: 20px; background-color: #D5CAD0; display: flex; justify-content: space-around; width: 50%; text-align: center; padding: 10px;">
                    <a href="shopProduct.jsp">
                        <div class="avatar"
                             style="background-image: url('data:image/jpeg;base64,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');">
                        </div>
                    </a>
                    <div class="shop-name" style="display: flex; flex-direction: column;">
                        <div><%=shop.getShopName() %></div>
                        <div><a href="shopProduct.jsp">Xem ngay</a></div>
                    </div>

                    
                </div>
            </div>
        </div>
        <%}%>



        <h2 class="border-start border-5 border-primary ps-3 mb-4" style="color: #7ab730;margin-left: 180px; margin-top: 30px;"">THÀNH PHẦN CHI TIẾT</h2>
        <div class="col-xl-12">
            <div class="products-area products-area3">
                <div class="row justify-content-center">
                    <%
                            List<RecipeDTO> listRecipeProduct = (List<RecipeDTO>) request.getAttribute("RECIPE_PRODUCT");
                            for(RecipeDTO rp: listRecipeProduct){
                    %>
                    <div class=" col-lg-3 col-xl-2 col-md-4 col-sm-6" style="margin: 10px;">
                        <div class="product-item product-item2 element-item3 sidebar-left" style="border: 2px solid; border-radius: 10px; width: 220px;">
                            <div style="text-align: center;">
                                <a href="MainController?action=ViewProductDetail&shop_product_item_id=<%= rp.getShop_product_item_id()%>&shop_id=<%= rp.getShop_id()%>" class="product-image">
                                    <img style="width: 160px;height: 190px" src="<%= rp.getProduct_image()%>" alt="product-image" />
                                </a>
                            </div>
                            <div class="bottom-content">
                                <div style="text-align: center;white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;margin-top: 10px; font-weight: bold;">
                                    <a href="MainController?action=ViewProductDetail&shop_product_item_id=<%= rp.getShop_product_item_id()%>&shop_id=<%= rp.getShop_id()%>" style="color: black;"><%= rp.getTitle()%></a>
                                </div>

                                <div style="text-align: center;">

                                    <span class="product-price" style=" color: black; font-size: 15px;">
                                        <%= rp.getName()%>
                                    </span>


                                </div>

                                <div style="text-align: center;">

                                    <span class="product-price" style=" color: black; font-size: 15px;">
                                        Số lượng: <%= rp.getQuantity()%>
                                    </span>


                                </div>
                            </div>
                        </div>
                    </div> 
                    <%}%>

                </div>
            </div>
        </div>
        <h3 class="border-start border-5 border-primary ps-3 mb-4" style=" color: #7ab730;margin-left: 180px; margin-top: 30px;">MÔ TẢ KHẨU PHẦN</h3>
        <div class="product-description-container">
            <%= recipe.get(0).getDescription()%>
        </div>
        <h3 class="border-start border-5 border-primary ps-3 mb-4" style="color: #7ab730;margin-left: 180px; margin-top: 30px;">FEEDBACK</h3>

        
        <div class="container-fluid py-5">
                <div class="container">
                    <div class="border-start border-5 border-primary ps-5 mb-5" style="max-width: 600px;">
                        <h6 class="text-primary text-uppercase">Sản phẩm</h6>
                        <h1 class="display-5 text-uppercase mb-0" style="font-size: 40px">Dành cho chim của bạn</h1>
                    </div>
                    <div class="col-xl-12">
                        <div class="products-area products-area3">
                            <div class="row justify-content-center">
                                <!--                                <div>${requestScope.MESSAGE}</div>-->


                                <% 
                List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
                
                if (listProduct != null && !listProduct.isEmpty()) {
              
                    for (ProductDTO listP : listProduct) { 
                   
                                %>
                                <div class=" col-lg-3 col-xl-2 col-md-4 col-sm-6" style="margin: 10px;">
                                    <div class="product-item product-item2 element-item3 sidebar-left" style="border: 2px solid; border-radius: 10px; width: 220px;">
                                        <div style="text-align: center;">
                                            <a href="MainController?action=ViewProductDetail&shop_product_item_id=<%=listP.getShopProductItemID() %>&shop_id=<%=listP.getShopID() %>" class="product-image">
                                                <img style="width: 160px;height: 190px" src="<%=listP.getImage_1() %>" alt="" />
                                            </a>
                                        </div>
                                        <div class="bottom-content">
                                            <div style="text-align: center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">
                                                <a href="" style="margin-top: 10px; font-weight: bold;white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;color: black;"><%=listP.getTitle() %></a>
                                            </div>

                                            <div style="text-align: center;">
                                                <!--<span style="text-decoration: line-through "><//%=listRHP.getOriginal_price() %>đ</span>-->
                                                <%
        // Lấy giá tiền từ listP.getPrice()
        double price = listP.getPrice();

        // Tạo một đối tượng NumberFormat để định dạng giá tiền
        NumberFormat numberFormat = NumberFormat.getInstance();
        numberFormat.setMinimumFractionDigits(0);
        numberFormat.setMaximumFractionDigits(0);
        String formattedPrice = numberFormat.format(price);
                                                %>

                                                <span class="product-price" style="font-size: 25px; font-weight: bold; color: red;">
                                                    <%= formattedPrice %>đ
                                                </span>

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

        <!-- Comment List End -->

        <!-- Comment Form Start -->

    </div>


    <!-- Comment Form End -->


    <!-- Topbar End -->
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

    <script>
        let bigImg = document.querySelector('.big-img img');
        function showImg(pic) {
            bigImg.src = pic;
        }
    </script>
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
    .url{
        display: flex;
        align-content: space-between;
    }
    .url1:hover{
        color: green;
    }
    .avatar {
        width: 50px;
        height: 50px;

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
    .product-description-container {
        border: 3px solid #ccc; /* Định dạng viền */
        padding: 15px; /* Khoảng cách giữa nội dung và viền của hộp */
        margin-left: 180px; /* Khoảng cách từ lề trái */
        margin-top: 30px; /* Khoảng cách từ lề trên */
        font-size: 15px;
        display: inline-block; /* Đảm bảo hộp chỉ bao bọc nội dung cần thiết */
    }
</style>