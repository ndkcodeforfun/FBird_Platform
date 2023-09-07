<%-- 
    Document   : productDetail
    Created on : Jun 23, 2023, 1:28:03 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="fbird.feedback.FeedbackDTO"%>
<%@page import="fbird.product.ProductDTO"%>
<%@page import="fbird.user.UserDTO"%>
<%@page import="fbird.optionalshopproductitem.OptionalshopproductitemDTO"%>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Nội dung sản phẩm</title>
        <link rel="icon" href="img/logo-shop.PNG" type="image/png">
        <meta charset="UTF-8">
        <% 
            List<ProductDTO> listProductDetailHeader = (List<ProductDTO>) request.getAttribute("LIST_ProductDetail");
           
            if (listProductDetailHeader != null && !listProductDetailHeader.isEmpty()) {
          
                for (ProductDTO LPD : listProductDetailHeader) {
               
        %>
        <title><%= LPD.getTitle() %></title>
        <%
                }
            }
        %>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

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

        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet1' type='text/css'>
        <script src="js/modernizr.js"></script> <!-- Modernizr -->
        <!--Search bar-->
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="productPage/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">

        <script src="https://kit.fontawesome.com/39834b73e4.js" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <div style="position: relative">
            <div id="reportForm" style="display: none; z-index: 10000; position: absolute; background: #00000080; top: 0; bottom: 0; left: 0; right: 0;">
                <div style="position: relative;">
                    <div style="position: absolute; top: 100px; left: 40%; background: #FFFFFF; width: 300px; height: 200px;">
                        <div onclick="closeReportForm()" style="cursor: pointer;"><i class="fas fa-window-close" style="margin-left: 280px;"></i></div>
                        <!--                        <div style="display: flex; justify-content: center; align-items: center;">
                                                    <select size="4" style="width: 300px; height: 200px;">
                                                        <option value="spam">Spam</option>
                                                        <option value="phishing">Hàng 18+</option>
                                                        <option value="inappropriate-content">Hàng fake</option>
                                                        <option value="other">Khác</option>
                                                    </select>    
                                                </div>-->
                    </div>
                </div>
            </div>
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
                            <%
UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
if(loginUser != null && loginUser.getRole() == 3) {
            
                            %>
                            <div class="nav-item nav-link" style="width: max-content">
                                <a  href="MainController?action=ViewCart&customer_id=<%= loginUser.getCustomer_id() %>"class="shopping">

                                    <i class="fa fa-shopping-cart" style="font-size:25px;"></i> 
                                </a>   
                            </div>
                            <%}else{%>
                            <div class="nav-item nav-link" style="width: max-content">
                                <a  href=""class="shopping">

                                    <i class="fa fa-shopping-cart" style="font-size:25px;"></i> 
                                </a>   
                            </div>
                            <%}%>

                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Danh mục</a>
                                <div class="dropdown-menu m-0">
                                    <a href="MainController?action=productpage" class="dropdown-item">Sản phẩm</a>
                                    <a href="MainController?action=foodpage&categoryID=1" class="dropdown-item">Thức ăn</a>
                                    <a href="MainController?action=foodpage&categoryID=4" class="dropdown-item">Thuốc</a>
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
                                    }}
                                    if(loginUser != null) {
            
                                %>
                            <div class="nav-item dropdown"> 
                                <a href="#" class="nav-item nav-link nav-contact bg-primary text-white px-3 ms-lg-3" data-bs-toggle="dropdown"><%= loginUser.getFullname() %></a>
                                <div class="dropdown-menu m-3">
                                    <a href="product.jsp" class="dropdown-item">Hồ sơ</a>
                                    <a href="MainController?action=Logout" class="dropdown-item">Đăng xuất</a>
                                </div>
                            </div>

                            <input style="display: none" name="customer_id" value="<%= loginUser.getCustomer_id() %>">
                            <%}else{%>
                            <a href="login.jsp" class="nav-item nav-link">Đăng nhập</a>
                            <a href="register.jsp" class="nav-item nav-link nav-contact bg-primary text-white px-5 ms-lg-5">Đăng ký<i class="bi bi-arrow-right"></i></a>
                                <%}%>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->

                <% 
               List<ProductDTO> listProductDetail = (List<ProductDTO>) request.getAttribute("LIST_ProductDetail");
           
               if (listProductDetail != null && !listProductDetail.isEmpty()) {
          
                   for (ProductDTO LPD : listProductDetail) {
               
                %>
                <div class="flex-box">
                    <div class="left" style="margin-top: 100px; margin-right:40px;">
                        <div class="big-img">
                            <img src="<%=LPD.getImage_1() %>">
                        </div>
                        <div class="images">
                            <div class="small-img">
                                <img src="<%=LPD.getImage_1() %>" onclick="showImg(this.src)" id="imgbuynow">
                            </div>
                            <div class="small-img">
                                <img src="<%=LPD.getImage_2() %>" onclick="showImg(this.src)">
                            </div>
                            <div class="small-img">
                                <img src="<%=LPD.getImage_3() %>" onclick="showImg(this.src)">
                            </div>
                            <div class="small-img">
                                <img src="<%=LPD.getImage_4() %>" onclick="showImg(this.src)">
                            </div>
                        </div>
                    </div>

                    <div class="right">
                        <div class="url">
                            <a class="url1" href="MainController"> Trang chủ</a> > <a class="url1" href="product.html">Sản phẩm</a> > <a class="url1" href="recipe.jsp">Khẩu phần cho chim</a>

                        </div>
                        <%if(loginUser != null) {%>
                        <form action="MainController" id="myForm1">

                            <div class="report-option" >

                                <a type="button" class='fas fa-exclamation-triangle' onclick="callAlert(<%=request.getAttribute("shop_product_item_id")%>, <%= loginUser.getCustomer_id() %>)"   style="margin-top: -28px; margin-left: 550px;"></a>

                            </div>
                        </form>
                        <%}else{%>
                        <div class="report-option" >

                            <a class='fas fa-exclamation-triangle' href="login.jsp"   style="margin-top: -28px; margin-left: 550px;"></a>

                        </div>
                        <%}%>
                        <div class="pname" style="margin-bottom: 1px;" id="titleproduct"><%=LPD.getTitle() %>

                        </div>





                        <div class="size" style="font-size:  18px;font-weight: bold; font-family: Arial, sans-serif;">Tùy chọn:

                            <%
           List<OptionalshopproductitemDTO> listOptional = (List<OptionalshopproductitemDTO>) request.getAttribute("LIST_Optional");
                int count=0;
           for (OptionalshopproductitemDTO lon : listOptional){
                                count++;
                                }

           if (listOptional != null && !listOptional.isEmpty()) {

               for (int i = 0; i < count; i++) {
                   if (i == 0) {
                            %>


                            <div class="product-item">
                                <div class="product-name">
                                    <label class="btn btn-primary active optionalName" style="margin-right: -50px;" id="optionalName">

                                        <input type="radio" name="optional" autocomplete="off" checked id="<%=listOptional.get(i).getOptional_shop_product_item_id() %>" value="<%=listOptional.get(i).getPrice() %>" onclick="updatePrice(<%=listOptional.get(i).getPrice() %>), totalPriceDefault()" inventory="<%=listOptional.get(i).getInventory() %>">
                                        <input style="display: none" name="optional_shop_product_item_id" value="<%=listOptional.get(i).getOptional_shop_product_item_id() %>">
                                        <%=listOptional.get(i).getName() %>

                                    </label>
                                    <div class="product-price" id="<%=listOptional.get(i).getName() %>Price" style="display: none;"></div>
                                </div>
                            </div>

                            <%
                                    } else {
                            %>

                            <div class="product-item">
                                <div class="product-name">
                                    <label class="btn btn-primary active optionalName" style="margin-right: -50px;" id="optionalName">

                                        <input type="radio" name="optional" autocomplete="off" id="<%=listOptional.get(i).getOptional_shop_product_item_id() %>" value="<%=listOptional.get(i).getPrice() %>" onclick="updatePrice(<%=listOptional.get(i).getPrice() %>), totalPriceDefault()" inventory="<%=listOptional.get(i).getInventory() %>">
                                        <input style="display: none" name="optional_shop_product_item_id" value="<%=listOptional.get(i).getOptional_shop_product_item_id() %>">
                                        <%=listOptional.get(i).getName() %>

                                    </label>
                                    <div class="product-price" id="<%=listOptional.get(i).getName() %>Price" style="display: none;"></div>
                                </div>
                            </div>

                            <%
                                    }
                                }
                            }
                            %>

                        </div>    
                            <div class="quantity" >    
                                <p style="font-weight: bold;">Kho: <a id="inventory"></a> </p> 
                            </div>
                        <div class="quantity" >
                            <p style="font-weight: bold;">Số lượng: <input type="number" name="productQuantity" min="1" max="" value="1" onchange="totalPriceDefault()"></p> 

                        </div>

                        <div class="selected-product-price" id="selectedPrice" style="visibility: hidden">0</div>
                        <div class="selected-product-price" style=" font-size: 35px;" id="selectedPrice1">0
                            <!--    chữ đ sau giá tiền nằm ở style .selected-product-price-->
                        </div>


                        <script>
                            window.addEventListener('DOMContentLoaded', totalPriceDefault());
                            // JavaScript function to update price when a product is selected
                            function updatePrice(price) {
                                var quantity = document.getElementsByName('productQuantity');
                                var displayPrice = document.getElementById('selectedPrice1');
                                displayPrice.innerHTML = (price * quantity[0].value);
                            }

                            // JavaScript function to update price based on quantity

                            function totalPriceDefault() {
                                var radioElement = document.querySelector('input[name="optional"]:checked');
                                var inventory = document.getElementById('inventory');
                                var quantity = document.getElementsByName('productQuantity')[0];
                                var display = document.getElementById('selectedPrice1');
                                if (radioElement) {
                                    if(radioElement.getAttribute('inventory')>0){
                                    inventory.innerHTML = radioElement.getAttribute('inventory');
                                }else{
                                    inventory.innerHTML=`Hết Hàng`;
                                }                             
                                    quantity.max = radioElement.getAttribute('inventory');
                                    var total = radioElement.value * quantity.value;
//                                    quantity.max = radioElement.getAttribute('inventory');
////                                    console.log(radioElement.getAttribute('inventory'));
                                    display.innerHTML = total;
                                } else {
                                    return;
                                }
                            }

                            function openReportForm() {
                                var reportForm = document.getElementById('reportForm');
                                var bodyElement = document.body;
                                reportForm.style.display = 'block';
                                bodyElement.style.overflow = 'hidden';
                            }

                            function closeReportForm() {
                                var reportForm = document.getElementById('reportForm');
                                var bodyElement = document.body;
                                reportForm.style.display = 'none';
                                bodyElement.style.overflow = 'auto';
                            }

                            function addtocartv2() {
                                var mess = document.querySelector('div[name="mess"]');
                                var optional_shop_product_item_id = document.querySelector('input[name="optional"]:checked').id;
                                var quantity = document.getElementsByName('productQuantity')[0].value;
                                var customer_id = document.getElementsByName('customer_id')[0].value;
                                var inventory = document.getElementById('inventory');
                                if(inventory.innerText==="Hết Hàng"){
                                mess.innerHTML = "Sản phẩm đã hết hàng";
                            }else{
                                submitForm("AddToCart", quantity, optional_shop_product_item_id, customer_id);
                                mess.innerHTML = "Đã thêm vào giỏ hàng";
                            }
                            }

                            // Example usage: updatePrice(productName, price);
                        </script>
                        <script>
                            function formatNumber(n) {
                                // format number 1000000 to 1,234,567
                                return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                            }
                            function ConvertToNumber(priceStr) {
                                var priceParts = priceStr.split(".");
                                var price = "";
                                for (var i = 0; i < priceParts.length; i++) {
                                    price += priceParts[i];
                                }
                                return Number.parseInt(price);
                            }
                            function buynow() {
                                var mess = document.querySelector('div[name="mess"]');
                                var inventory = document.getElementById('inventory');
                                console.log(inventory.innerText);
                                if(inventory.innerText==="Hết Hàng"){
                                mess.innerHTML = "Sản phẩm đã hết hàng";
                                }else{
                                sessionStorage.clear();
                                var titleproduct = document.getElementById('titleproduct').innerText;

                                var optionname = document.getElementsByClassName('optionalName'); // Use getElementsByClassName
                                for (var i = 0; i < optionname.length; i++) {
                                    var a = optionname[i]; // Use 'optionname' instead of 'optionalname'
                                    var b = a.querySelector("input[type=radio]");
                                    if (b.checked) {
                                        var optional = a.innerText;

                                    }
                                }
                                var customer_id = document.getElementsByName('customer_id')[0].value;
                                console.log(customer_id);
                                var shop_name0 = document.getElementById('shopname');
                                var shop_id0 = document.getElementById('shopId');
                                var quantity = document.getElementsByName('productQuantity')[0].value;
                                var price = ConvertToNumber(document.getElementById('selectedPrice1').innerText);
                                var imgbuynow = document.getElementById('imgbuynow');
                                var shop_name = shop_name0.innerText;
                                var shop_id = shop_id0.innerText;
                                var img = imgbuynow.getAttribute("src");
                                let Allelement = [];
                                let shop = [];
                                let shop_title=[];
                                let shopIdArray = [shop_id];
                                shop.push(shopIdArray);
                                if(!shop_title.includes(shop_name)){
                                 shop_title.push(shop_name);
                             }
                                sessionStorage.setItem("shop_id", JSON.stringify(shop));
                                sessionStorage.setItem("shop_name", JSON.stringify(shop_title));
                                let Element = [optional, titleproduct, img, price, quantity, shop_name];
                                Allelement.push(Element);
                                sessionStorage.setItem("Element", JSON.stringify(Allelement));
                                sessionStorage.setItem("allPrices", JSON.stringify(price));
//                              
                            window.location.href = "MainController?action=ViewOderAddress&customer_id="+customer_id;
                            }
                            }
                        </script>

                        <form action="MainController" id="myForm">

                            <div class="btn-box" id="hetHang">
                                <%if(loginUser != null) {
                                if(loginUser.getRole() == 3){
                                %>
                                <div style="display: none" id="customerId" value="<%= loginUser.getCustomer_id() %>"></div>
                                    <button class="btn btn-primary cart-btn" onclick="addtocartv2()" type="button">Thêm vào giỏ hàng</button>
                                    <a type="button" class="btn btn-primary buy-btn"   onclick="buynow()">Mua ngay</a>

                               
                                    <%} else {%>
                                    <button class="cart-btn"><a href="#" style="color: white;">Phân quyền của bạn không được mua hàng</a></button>
                                    <%}}else{%>
                              
                                    <a class="btn btn-primary cart-btn" href="login.jsp" type="button">Thêm vào giỏ hàng</a>
                                    <a type="button" class="btn btn-primary buy-btn"  href="login.jsp" >Mua ngay</a>
                                    <%}%>
                           


                            </div>
                            <div name="mess" style="color: red;margin-top: 5%; font-weight: bold;"></div>
                        </form>

                        <script>
                            function submitForm(action, qtt, op_id, cus_id) {
                                var form = document.getElementById("myForm");
                                var xhr = new XMLHttpRequest();
                                xhr.open("POST", "MainController?action=" + encodeURIComponent(action) + "&qtt=" + encodeURIComponent(qtt) + "&op_id=" + encodeURIComponent(op_id) + "&cus_id=" + encodeURIComponent(cus_id), true);
                                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                xhr.onreadystatechange = function () {
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                        // Xử lý kết quả tại đây (nếu cần)
                                        console.log(xhr.responseText);
                                    }
                                };
                                xhr.send(new FormData(form));
                            }
                            function submitForm1(action, shop_product_item_id, customer_id, value) {
                                var form = document.getElementById("myForm1");
                                var xhr = new XMLHttpRequest();
                                xhr.open("POST", "MainController?action=" + encodeURIComponent(action) + "&shop_product_item_id=" + encodeURIComponent(shop_product_item_id) + "&customer_id=" + encodeURIComponent(customer_id) + "&value=" + encodeURIComponent(value), true);
                                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                xhr.onreadystatechange = function () {
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                        // Xử lý kết quả tại đây (nếu cần)
                                        console.log(xhr.responseText);
                                    }
                                };
                                xhr.send(new FormData(form));
                            }
                            function submitForm3(action,  customer_id) {
                                var form = document.getElementById("myForm");
                                var xhr = new XMLHttpRequest();
                                xhr.open("POST", "MainController?action=" + encodeURIComponent(action) + "&customer_id=" + encodeURIComponent(customer_id), true);
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
                    </div>

                </div>


                <div style="margin-left: 20%; transform: translateX(-10%);">
                    <div style="margin-top: 20px; margin-bottom: 20px; background-color: #D5CAD0; display: flex; justify-content: space-around; width: 50%; text-align: center; padding: 10px;">
                        <a href="shopProduct.jsp">
                            <div class="avatar"
                                 style="background-image: url('<%=LPD.getAvatar() %>');">
                            </div>
                        </a>
                        <div class="shop-name" style="display: flex; flex-direction: column;">
                            <div id="shopId" style="display: none"><%=LPD.getShopID() %></div>
                            <div id="shopname"><%=LPD.getShop_name() %></div>
                            <div><a href="MainController?action=ViewShopProduct&shop_id=<%=LPD.getShopID() %>">Xem ngay</a></div>
                        </div>
                        <%
List<ProductDTO> listShopProductItemId = (List<ProductDTO>) request.getAttribute("LIST_ShopProductItemId");
List<FeedbackDTO> listAllFeedback = (List<FeedbackDTO>) request.getAttribute("LIST_AllFeedback");
 int countid=0;
 int countfeedback=0;
 for (ProductDTO LSPII : listShopProductItemId) {
      countid++;
 }
    
 for (FeedbackDTO LAF : listAllFeedback) {
     if (LAF != null ) {
      countfeedback++;
 }
 }
                        %>
                        <div style="display: flex; flex-direction: column;">
                            <div>Đánh giá</div>
                            <div style="color: red;"><%= countfeedback%></div>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <div>Sản phẩm</div>
                            <div style="color: red;"><%= countid %></div>
                        </div>

                        <div style="display: flex; flex-direction: column;">
                            <div>Số lượng đã bán</div>
                            <div style="color: red;">100k</div>
                        </div>

                    </div>
                </div>
            </div>

            <h3 class="border-start border-5 border-primary ps-3 mb-4" style=" color: #7ab730;margin-left: 180px; margin-top: 30px;">CHI TIẾT SẢN PHẨM</h3>
            <div class="product-description-container">
                <%=LPD.getDescription() %>
            </div>


            <% 
                               }
               
               }
            %>


            <h3 class="border-start border-5 border-primary ps-3 mb-4" style="color: #7ab730;margin-left: 180px; margin-top: 30px;">FEEDBACK</h3>

            <% 
            List<FeedbackDTO> listFeedback = (List<FeedbackDTO>) request.getAttribute("LIST_Feedback");
           
            if (listFeedback != null && !listFeedback.isEmpty()) {
          
                for (FeedbackDTO feedback : listFeedback) {
               
            %>



            <div style="margin-top: 50px;">
                <div class="mb-5">

                    <div class="d-flex mb-4" style="margin-left: 180px;">
                        <img src="<%= feedback.getAvatar() %>" class="img-fluid" style="width: 45px; height: 45px;">
                        <div class="ps-3">
                            <h6><a href=""><%= feedback.getFullname() %></a> <small><i><%= feedback.getFeedback_date() %></i></small></h6>
                            <%
                            for (int i = 0; i < feedback.getNumber_of_stars(); i++) {
                            %>
                            <span class="fas fa-star" style="color: orange; font-size: 12px;"></span>
                            <%
                            }
                            %>

                            <p><%= feedback.getFeedback() %></p>

                            <button class="btn btn-sm btn-light">Phản hồi</button>
                        </div>
                    </div>
                    <!--                <div class="d-flex mb-4" style="margin-left: 10px;">
                                        <img src="img/user.jpg" class="img-fluid" style="width: 45px; height: 45px;">
                                        <div class="ps-3">
                                            <h6><a href="">William</a> <small><i>20/6/2023</i></small></h6>
                                            <p>Cho hỏi có có ship ra nước ngoài không ạ</p>
                                            <button class="btn btn-sm btn-light">Phản hồi</button>
                                        </div>
                                    </div>
                                    <div class="d-flex ms-5 mb-4">
                                        <img src="img/user.jpg" class="img-fluid" style="width: 45px; height: 45px;">
                                        <div class="ps-3">
                                            <h6><a href="">Staff</a> <small><i>01 Jan 2045</i></small></h6>
                                            <p>Dạ shop em có hỗ trợ giao hàng ra nước ngoài ạ</p>
                                            <button class="btn btn-sm btn-light">Phản hồi</button>
                                        </div>
                                    </div>-->
                </div>

                <% 
                       }
               
       }
                %>
            </div>
            <!-- Comment List End -->

            <!--             Comment Form Start 
                        <div class="bg-light rounded p-5">
                            <h3 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">Bình luận</h3>
                            <form>
                                <div class="row g-3">
                                    <div class="col-12 col-sm-4">
                                        <input type="text" class="form-control bg-white border-0" placeholder="Tên của bạn" style="height: 55px;">
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <input type="email" class="form-control bg-white border-0" placeholder="Email của bạn" style="height: 55px;">
                                    </div>
                                    <div class="col-12 col-sm-8">
                                        <input type="text" class="form-control bg-white border-0" placeholder="Website" style="height: 55px;">
                                    </div>
                                    <div class="col-12 col-sm-8">
                                        <textarea class="form-control bg-white border-0" rows="5" placeholder="Bình luận"></textarea>
                                    </div>
                                    <div class="col-12 col-sm-8">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Bình luận</button>
                                    </div>
                                </div>
                            </form>
                        </div>-->

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
                            <h5 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">FBird</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-body mb-2" href="MainController"><i class="bi bi-arrow-right text-primary me-2"></i>Trang chủ</a>

                                <a class="text-body mb-2" href="member.html"><i class="bi bi-arrow-right text-primary me-2"></i>Thành viên</a>


                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h5 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">Loại hàng cho chim</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-body mb-2" href="food.jsp"><i class="bi bi-arrow-right text-primary me-2"></i>Thức ăn</a>
                                <a class="text-body mb-2" href="medicine.jsp"><i class="bi bi-arrow-right text-primary me-2"></i>Thuốc</a>
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
            <!-- Footer End -->
        </div>
        <script>
            let bigImg = document.querySelector('.big-img img');
            function showImg(pic) {
                bigImg.src = pic;
            }

            function callAlert(shop_product_item_id, customer_id) {
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
                                submitForm1("ReportProduct", shop_product_item_id, customer_id, value);
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

    /*   chỉnh thanh tố cáo --------------------------------*/
    .report-option {
        display: flex;
        align-items: center;
    }

    .report-option p {
        margin-right: 10px;
    }

    .report-option select {
        margin-right: 10px;
    }

    .report-option .confirm-button {
        margin-right: 10px;
    }
    /*    ---------------------------------*/
    .quantity input[type="number"] {
        width: 50px;
        padding: 5px;
        border: 1px solid #ccc;
        background-color: #95c559;
        color: #fff;
    }

    .quantity input[type="number"]:focus {
        border-color: blue;
    }

    .selected-product-price::after {
        content: 'đ';
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
