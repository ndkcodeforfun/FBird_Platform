<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="fbird.cart.CartDTO"%>
<%@page import="fbird.user.UserDTO"%>
<html>
    <head>
        <title>Giỏ hàng</title>
        <link rel="icon" href="img/logo-shop.PNG" type="image/png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="add-to-cart/addtocart.css">
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.css"
            rel="stylesheet"
            />
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"
        ></script>
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
        <section class="h-100 h-custom" style="background-color: #7ab730;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">

                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Giỏ hàng</h1>

                                            </div>

                                            <% 
                                                 UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                  List<CartDTO> listCart = (List<CartDTO>) request.getAttribute("LIST_All_Cart_Item");
                                  int count = 0;
                                  if (listCart != null && !listCart.isEmpty()) {         
                                      for (CartDTO cart : listCart) {
                                      count++;
            
                                            %>
                                            <hr class="my-4">
                                           
                                            <div class="row mb-4 d-flex justify-content-between align-items-center cart-items-container">
                                                <%if(cart.getInventory()==0){%>
                                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                    <input type="checkbox" disabled>
                                                </div>
                                                <%}else{%>
                                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                    <input type="checkbox" id="myCheckbox" onchange="handleCheckboxChange()">
                                                </div>
                                                <%}%>
                                                <div class="col-md-2 col-lg-2 col-xl-2">
                                                    <img src="<%= cart.getImage_1() %>" id="img-product" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                </div>
                                                <div class="col-md-3 col-lg-3 col-xl-3">
                                                    <h6  class="text-muted"><%= cart.getShop_name() %></h6>
                                                    <h6  id="name-product" class="text-black mb-0"><%= cart.getTitle() %></h6>
                                                    <h6 id="title-product" class="text-black mb-0"><%= cart.getName() %></h6>
                                                </div>
                                                <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                    <!--                    <button class="btn btn-link px-2" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                                            <i class="fas fa-minus" id="down-<%= cart.getOptional_shop_product_item_id() %>"></i>
                                                                        </button>-->
                                                    <input id="quantity-<%= cart.getOptional_shop_product_item_id() %>" min="1" max="<%= cart.getInventory() %>" name="quantity-<%= cart.getOptional_shop_product_item_id() %>" value="<%= cart.getQuantity() %>" onchange="updateElementPrice(<%= cart.getOptional_shop_product_item_id() %>)" type="number" class="form-control form-control-sm" />
                                                    <!--                    <button class="btn btn-link px-2" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                                            <i class="fas fa-plus"></i>
                                                                        </button> -->
                                                </div>
                                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                    <h6 class="mb-0" name="pricedefault" id="pricedefault-<%= cart.getOptional_shop_product_item_id() %>" style="display: none"><%= cart.getPrice() %>đ</h6>
                                                    <h6 class="mb-0 product-price" id="totalprice-<%= cart.getOptional_shop_product_item_id() %>"></h6>
                                                </div>
                                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                    <a href="MainController?action=DeleteCartItem&cart_item_id=<%= cart.getCart_item_id() %>&customer_id=<%= loginUser.getCustomer_id() %>" class="text-muted"><i class="fas fa-times"></i></a>
                                                </div>
                                                 <div style="display: none"><%= cart.getShop_id() %></div>
                                                 <%if(cart.getInventory()==0){%>
                                                 <div name="mess" style="color: red;margin-top: 5%; font-weight: bold; text-align: center">Sản Phẩm đã hết hàng</div>
                                                 <%}%>
                                            </div>
                                            <script>

                                                window.onload = () => {
                                                    var cartItemsContainer = document.getElementsByClassName("cart-items-container");
                                                    var totalPrice = 0;

                                                    // Tính tổng giá tiền ban đầu
                                                    for (var i = 0; i < cartItemsContainer.length; i++) {
                                                        var quantityInput = cartItemsContainer[i].childNodes[7].childNodes[3];
                                                        var priceElement = cartItemsContainer[i].childNodes[9].childNodes[1];
                                                        var priceText = priceElement.innerText;
                                                        var price = parseFloat(priceText.split("đ")[0]);

                                                        // Lưu giá tiền ban đầu vào thuộc tính "data-price"
                                                        quantityInput.setAttribute("data-price", price);

                                                        var quantity = parseInt(quantityInput.value);
                                                        var itemTotalPrice = quantity * price;


                                                        // Hiển thị tổng giá tiền cho mỗi mục trong giỏ hàng
                                                        var totalElement = cartItemsContainer[i].childNodes[9].childNodes[3];
                                                        totalElement.innerText = formatNumber(itemTotalPrice + "") + "đ";
                                                        var allPrices = document.getElementById("allprice");
                                                        allPrices.innerText = 0 + "đ";
                                                        sessionStorage.setItem("allPrices", JSON.stringify(totalPrice));
                                                    }
                                                    for (var i = 0; i < checkboxes.length; i++) {
                                                        checkboxes[i].addEventListener("change", handleCheckboxChange);
                                                    }
                                                };

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

                                                function handleCheckboxChange() {
                                                    sessionStorage.clear();
                                                    var cartItemsContainer = document.getElementsByClassName("cart-items-container");
                                                    var totalPrice = 0;
                                                    let Allelement = [];
                                                    let shop = [];
                                                    let shop_title=[];
                                                    for (var i = 0; i < cartItemsContainer.length; i++) {
                                                        var checkbox = cartItemsContainer[i].querySelector('input[type="checkbox"]');
                                                        var imgElement = cartItemsContainer[i].childNodes[3].childNodes[1];
                                                        var shop_name0 = cartItemsContainer[i].childNodes[5].childNodes[1];
                                                        var name = cartItemsContainer[i].childNodes[5].childNodes[3];
                                                        var title = cartItemsContainer[i].childNodes[5].childNodes[5];
                                                        var shop_id = cartItemsContainer[i].childNodes[13].innerText;
                                                     


                                                        var srcValue = imgElement.getAttribute("src");
                                                        var nameValue = name.innerText;
                                                        var titleValue = title.innerText;
                                                        var shop_name = shop_name0.innerText;


                                                        var totalElement = cartItemsContainer[i].childNodes[9].childNodes[3];
                                                        var quantityInput = cartItemsContainer[i].childNodes[7].childNodes[3];
                                                        var quantity = parseInt(quantityInput.value);
                                                        var price = ConvertToNumber((totalElement.innerText));
                                                        if (checkbox.checked) {
                                                            let Element = [nameValue, titleValue, srcValue, price, quantity, shop_name];
                                                            let shopIdArray = [shop_id];
                                                            shop.push(shopIdArray);
                                                            if(!shop_title.includes(shop_name)){
                                                            shop_title.push(shop_name);
                                                        }
                                                            sessionStorage.setItem("shop_id", JSON.stringify(shop));
                                                            sessionStorage.setItem("shop_name", JSON.stringify(shop_title));
                                                            
                                                            Allelement.push(Element);                                                           
                                                            sessionStorage.setItem("Element", JSON.stringify(Allelement));
                                                            totalPrice += price;
                                                            
                                                        }
                                                    }

                                                    var allPrices = document.getElementById("allprice");
                                                    allPrices.innerText = formatNumber(totalPrice + "") + "đ";
                                                    sessionStorage.setItem("allPrices", JSON.stringify(totalPrice));
                                                }

                                                // Function to handle checkbox change and quantity input change
                                                function handleInputChange(event) {
                                                    updateElementPrice(event);
                                                    handleCheckboxChange();
                                                }

                                                // Gắn sự kiện onchange cho các input số lượng và checkbox
                                                var quantityInputs = document.querySelectorAll('.cart-items-container input[type="number"]');
                                                var checkboxes = document.querySelectorAll('.cart-items-container input[type="checkbox"]');
                                                for (var i = 0; i < quantityInputs.length; i++) {
                                                    quantityInputs[i].addEventListener("change", handleInputChange);
                                                    checkboxes[i].addEventListener("change", handleCheckboxChange);
                                                }
                                                // In ra tổng giá tiền của tất cả sản phẩm

                                                // Cập nhật giá tiền khi thay đổi số lượng
                                                function updateElementPrice(event) {

                                                    var quantityInput = event.target;
                                                    var price = ConvertToNumber(quantityInput.getAttribute("data-price"));
                                                    var quantity = parseInt(quantityInput.value);
                                                    var totalElement = quantityInput.parentNode.parentNode.childNodes[9].childNodes[3];
                                                    var itemTotalPrice = quantity * price;
                                                    totalElement.innerText = formatNumber(itemTotalPrice + "") + "đ";


                                                }


                                                // Gắn sự kiện onchange cho các input số lượng
                                                var quantityInputs = document.querySelectorAll('.cart-items-container input[type="number"]');
                                                for (var i = 0; i < quantityInputs.length; i++) {
                                                    quantityInputs[i].addEventListener("change", updateTotalPrice);
                                                }

                                            </script>
                                            <%
                                                    }
                                                }
                                            %>




                                            <hr class="my-4">

                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="MainController" class="text-body"><i
                                                            class="fas fa-long-arrow-alt-left me-2"></i>Về trang chủ</a></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Tóm tắt</h3>
                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">Sản phẩm: <%=count %></h5>  
                                            </div>

                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Tổng đơn</h5>
                                                <div class="allprice" id="allprice"></div>
                                            </div>

                                            <a type="button" class="btn btn-dark btn-block btn-lg" data-mdb-ripple-color="dark" href="MainController?action=ViewOderAddress&customer_id=<%= loginUser.getCustomer_id() %>" >Mua ngay</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                // Hàm cập nhật tổng đơn và số lượng sản phẩm
                function updateCartSummary() {
                    var productRows = document.querySelectorAll(".row.mb-4");
                    var totalQuantity = 0;
                    var totalPrice = 0;

                    productRows.forEach(function (row) {
                        var quantityInput = row.querySelector("input[name='quantity']");
                        var priceElement = row.querySelector(".product-price");

                        var quantity = parseInt(quantityInput.value);
                        var price = parseInt(priceElement.textContent.replace("đ", ""));

                        totalQuantity += quantity;
                        totalPrice += quantity * price;

                        // Cập nhật giá tiền cho sản phẩm
                        priceElement.textContent = (quantity * price) + "đ";
                    });

                    // Cập nhật số lượng sản phẩm và tổng đơn trong phần tóm tắt
                    var productCountElement = document.querySelector(".mb-5 h5.text-uppercase");
                    var totalAmountElement = document.querySelector(".d-flex.justify-content-between.mb-5 h5");

                    productCountElement.textContent = "Sản phẩm: " + totalQuantity;
                    totalAmountElement.textContent = totalPrice + "đ";
                }
            </script>
        </section>
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