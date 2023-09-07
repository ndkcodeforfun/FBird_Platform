<%-- 
    Document   : order.jsp
    Created on : Jul 14, 2023, 4:33:31 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="fbird.user.UserDTO"%>
<%@page import="fbird.order.OrderDTO"%>
<%@page import="java.util.List"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết đơn hàng</title>
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
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0 mb-5" style="margin-top: -80px;">
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
        <div class="container">
            <div class="title">
                <h2>Chi tiết đơn hàng</h2>
            </div>
            <div class="url">
                <a class="url1" href="MainController"> Trang chủ&nbsp;</a> > <a class="url1" href="MainController?action=ViewCustomerOrder&customer_id=<%= loginUser.getCustomer_id()%>&status=">&nbsp;Chi tiết đơn hàng </a>

            </div>
            <div class="address-row" id="addresstest">
                <%
            List<OrderDTO> listOrderProduct = (List<OrderDTO>) request.getAttribute("LIST_ORDER_PRODUCT");
            if(listOrderProduct != null){
                if(listOrderProduct.size() > 0){
                %>
                <div class="d-flex">

                    <form>
                        <!--                    <a href="../src/java/fbird/controller/ViewAddressController.java"></a>-->






                        <label>
                            <span style="width: 60px;">Địa chỉ:</span>
                            <input type="text" name= "houseadd" value="<%=listOrderProduct.get(0).getOrder_address()%>" readonly="" style="width: 350px; height: 40px;"></input>
                        </label>

                        <label>
                            <span style="width: 60px;">SĐT:</span>
                            <input type="text" name= "houseadd" value="<%=listOrderProduct.get(0).getOrder_phone()%>" readonly="" style="width: 350px; height: 40px;"></input>
                        </label>
                        <label>
                            <span style="width: 60px;">Ngày mua:</span>
                            <input type="text" name= "houseadd" value="<%=listOrderProduct.get(0).getOrder_date()%>" readonly="" style="width: 350px; height: 40px;"></input>
                        </label>
                        <label>
                            <span style="width: 60px;">Tổng giá:</span>
                            <input type="text" name= "houseadd" value="<%=listOrderProduct.get(0).getTotal_price_order()%>" readonly="" style="width: 350px; height: 40px;"></input>
                        </label>




                </div>

                <div class="row mb-4 d-flex justify-content-between align-items-center" id="element">

                </div>

                </form>

                <div class="product-container">
                    <div class="row mt-3">
                        <%
                            for(OrderDTO x: listOrderProduct){
                        %>
                        <div class="col-md-2 col-lg-2 col-xl-2">
                            <img src="<%= x.getImage_1()%>" id="imgDisplay" class="img-fluid rounded-3" alt="Cotton T-shirt">
                        </div>
                        <div class="col-md-4 col-lg-4 col-xl-4">
                            <h6 id="nameDisplay" class="text-muted"><%= x.getShop_name()%></h6> 
                            <h6 id="titleDisplay" class="text-black mb-0"><%= x.getTitle()%></h6></br>
                            <h6 id="titleDisplay" class="text-black mb-0">Loại sản phẩm: <%= x.getName()%></h6>
                        </div>
                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                            <p id="quantityDisplay" name="quantity" type="number" readonly><%= x.getAmount()%></p>
                        </div>
                        <div class="col-md-3 col-lg-2 pt-4 col-xl-2 offset-lg-1">
                            <h6 id="priceElement"><%= x.getSell_price()*x.getAmount()%></h6>
                            <div id="inputfb">
                                <button  id="feedbackbtn" value="open" onclick="feedback()">Phản hồi</button>                 
                            </div>
                            
<!--                            <div>
                            <div style="display: flex;">
                            <input style="margin-right: 10%" id="feedback">
                            <button style="width: 50px; height: 50px; padding: 10px; font-size: 16px;" id="feedbackbtn" value="x" onclick="feedback()">x</button>
                            </div>
                            <div id="inputfb2">
                                <button  id="feedbackbtn2" value="open">Phản hồi</button>                 
                            </div>
                            </div>-->
                            
                        </div>
                        <%}}}%>
                    </div>

                </div>

            </div>
        </div>



        <script src="https://www.paypal.com/sdk/js?client-id=Ac7kMHZaJoJw3hIlaEXI1VO3WLpTmsOHivGxlRZQbilUXOOibAXSj4YUkVl7Nvx_Kqk-wlCnA0hdtZ9f&disable-funding=credit,card"></script>
        <script>
            var presentAddressSelect = document.getElementById("addr");
            var presentAddress = presentAddressSelect.options[presentAddressSelect.selectedIndex].value;

            var presentPhoneSelect = document.getElementById("phn");
            var presentPhone = presentPhoneSelect.options[presentPhoneSelect.selectedIndex].value;

            var totalPriceDisplay = document.getElementById("allPriceDisplay");

            var allPrice = JSON.parse(sessionStorage.getItem("allPrices"));
            var shippingOptionSelect = document.getElementById("shippingOption");
            var shippingCost = parseFloat(shippingOptionSelect.value);
            var totalPriceInVND = allPrice + shippingCost;

            //                        console.log(data.imgElementValue);

            function sendDataToServlet(details) {
                var allElement = JSON.parse(sessionStorage.getItem("Element"));
                var allShopId = JSON.parse(sessionStorage.getItem("shop_id"));

                if (Array.isArray(allElement)) {
                    if (Array.isArray((allShopId))) {
                        var dataToSend = {
                            allElement: allElement, // Sending the entire 'allElement' array
                            allShopId: allShopId,
                            shippingOptionSelect: shippingOptionSelect.value,
                            presentAddress: presentAddress,
                            presentPhone: presentPhone,
                            totalPrice: totalPriceInVND.valueOf(),
                            paypalTransactionID: details.id
                        };

                        // Create a new AJAX request to send data to the servlet
                        const xhr = new XMLHttpRequest();
                        xhr.open("POST", "OrderPayPalTransactionController", true);
                        xhr.setRequestHeader("Content-Type", "application/json");

                        // Convert the data to JSON and send it to the servlet
                        xhr.send(JSON.stringify(dataToSend));

                    }
                }
            }

            var total = (allPrice + shippingCost) / 23500;
            paypal.Buttons({
                style: {
                    color: 'blue',
                    shape: 'pill'
                },
                createOrder: function (data, actions) {
                    return actions.order.create({
                        purchase_units: [{
                                amount: {
                                    value: total.toFixed(2)
                                }
                            }]
                    });
                },
                onApprove: function (data, actions) {
                    return actions.order.capture().then(function (details) {
                        console.log(details)
                        sendDataToServlet(details)
                        window.location.replace("http://localhost:8084/FBird/orderSuccess.jsp")
                    })
                },
                onCancel: function (data) {
                    window.location.replace("http://localhost:8084/FBird/orderFail.jsp")
                }
            }).render('#paypal-payment-button');
        </script>
        <script>
            function feedback() {
                var feedbackbtn = document.getElementById('feedbackbtn');
                var inputfb = document.getElementById('inputfb');
                var a = '<div>\n\
                        <div style="display: flex;">\n\
        <input style="margin-right: 10%" id="feedback">\n\
        <button style="width: 50px; height: 50px; padding: 10px; font-size: 16px;" id="feedbackbtn" value="x" onclick="feedback()">x</button>\n\
                            </div>\n\
<div id="inputfb2">\n\
<button  id="feedbackbtn2" value="open">Phản hồi</button> \n\
</div>\n\
                            </div>';
        
                var b = `<button id="feedbackbtn" value="open" onclick="feedback()">Phản hồi</button>            `;
                if (feedbackbtn.value === "open") {
                    inputfb.innerHTML = a;
                } else {
                    inputfb.innerHTML = b;
                }
            }
        </script>
        <a href="#" class="btn btn-primary py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
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
    </body>
</html>
<style>
    /*@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700');*/

    body{

        font-family: 'Roboto Condensed', sans-serif;
        color: #262626;
        margin: 5% 0;
    }
    .container{
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
    }
    @media (min-width: 1200px)
    {
        .container{
            max-width: 1140px;
        }
    }
    .d-flex{
        display: flex;
        flex-direction: row;
        background: #f6f6f6;
        border-radius: 0 0 5px 5px;
        padding: 25px;
    }
    form{
        flex: 4;
    }
    .Yorder{
        flex: 2;

    }
    .title{
        background-color: #7AB730;
        border-radius:5px 5px 0 0 ;
        padding: 20px;
        color: #f6f6f6;
    }
    h2{
        margin: 0;
        padding-left: 15px;
    }
    .required{
        color: red;
    }
    label, table{
        display: block;
        margin: 15px;
    }
    label>span{
        float: left;
        width: 25%;
        margin-top: 12px;
        padding-right: 10px;
    }
    input[type="text"], input[type="tel"], input[type="email"], select
    {
        width: 70%;
        height: 30px;
        padding: 5px 10px;
        margin-bottom: 10px;
        border: 1px solid #dadada;
        color: #888;
    }
    select{
        width: 72%;
        height: 45px;
        padding: 5px 10px;
        margin-bottom: 10px;
    }
    .Yorder{
        margin-top: 15px;
        height: 600px;
        padding: 20px;
        border: 1px solid #dadada;
    }
    table{
        margin: 0;
        padding: 0;
    }
    th{
        border-bottom: 1px solid #dadada;
        padding: 10px 0;
    }
    tr>td:nth-child(1){
        text-align: left;
        color: #2d2d2a;
    }
    tr>td:nth-child(2){
        text-align: right;
        color: #52ad9c;
    }
    td{
        border-bottom: 1px solid #dadada;
        padding: 25px 25px 25px 0;
    }

    p{
        display: block;
        color: #888;
        margin: 0;
        padding-left: 25px;
    }
    .Yorder>div{
        padding: 15px 0;
    }

    button{
        width: 100%;
        margin-top: 10px;
        padding: 10px;
        border: none;
        border-radius: 30px;
        background: #7AB730;
        color: #fff;
        font-size: 15px;
        font-weight: bold;
    }
    button:hover{
        cursor: pointer;
        background: #428a7d;
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
    .shop-name-container {
        border: 1px solid #ccc;
        font-weight: bold;
        padding: 10px;
        margin-bottom: 10px;
        border-width: 3px;
        border-color: black;
    }

    .product-container {
        border: 1px solid #ccc;

        padding: 10px;
        margin-bottom: 10px;
    }
    .url{
        display: flex;
        align-content: space-between;
    }
    .url1:hover{
        color: green;
    }
</style>
