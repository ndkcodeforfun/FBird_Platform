<%@page import="fbird.category.CategoryDTO"%>
<%@page import="fbird.typeofbird.TypeOfBirdDTO"%>
<%@page import="fbird.product.ProductDTO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="vi">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Shop Dashboard</title>
        <link rel="icon" href="img/logo-shop.PNG" type="image/png">
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="dashboard-shop/styles.css" />

    </head>

    <body>
        <div class="d-flex" id="wrapper">
            <script src="scss/tinymce/tinymce.min.js"></script>
            <!-- Sidebar -->
            <div class="bg-white" id="sidebar-wrapper" style="width: 260px;">
                <div class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom">
                    <i class="fas fa-solid fa-dove " ></i>
                    <a href="MainController" class="home-link" style="color: #009d63; text-decoration: none; ">Fbird
                    </a>
                </div>
                <!--------------------------------------------------------------------------------------------------------------------------------------------------------->

                <div class="list-group list-group-flush my-3">
                    <a href="accountShop.jsp" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                            class="fas fa-tachometer-alt me-2"></i>Thống kê</a>
                    <!--------------------------------------------------------------------------------------------------------------------------------------------------------->

                    <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold dropdown-toggle" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-solid fa-truck me-2"></i>Vận chuyển
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="profileDropdown">

                        <li><a class="dropdown-item" style="width: 239px;" href="deliveryManagement.jsp">Quản lý vận chuyển</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="settingDeliveries.jsp">Cài đặt vận chuyển</a></li>
                    </ul>
                    <!--------------------------------------------------------------------------------------------------------------------------------------------------------->                            
                    <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold dropdown-toggle" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-regular fa-briefcase me-2"></i>Quản lý đơn hàng
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="profileDropdown">

                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewShopOrder&shop_id=${sessionScope.LOGIN_USER.getShop_id()}">Tất cả đơn</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="donHuy.jsp">Đơn hủy</a></li>
                    </ul>
                    <!--------------------------------------------------------------------------------------------------------------------------------------------------------->
                    <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold dropdown-toggle" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-regular fa-cube me-2"></i>Quản lý sản phẩm
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="profileDropdown">

                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewProduct&shop_id=${sessionScope.LOGIN_USER.getShop_id()}">Tất cả sản phẩm</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="sanPhamViPham.jsp">Sản phẩm vi phạm</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewCreateProduct">Thêm sản phẩm</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewRecipeOnShop&shop_id=${sessionScope.LOGIN_USER.getShop_id()}">Tất cả khẩu phần</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=AddRecipe&shop_id=${sessionScope.LOGIN_USER.getShop_id()}">Thêm khẩu phần</a></li>
                    </ul>
                    <!--------------------------------------------------------------------------------------------------------------------------------------------------------->
                    <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold dropdown-toggle" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-solid fa-store me-2"></i>Quản lý cửa hàng
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="profileDropdown">

                        <li><a class="dropdown-item" style="width: 239px;" href="danhGiaShop.jsp">Đánh giá shop</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="hoSoShop.jsp">Hồ sơ shop</a></li>

                    </ul>
                    <!--------------------------------------------------------------------------------------------------------------------------------------------------------->


                </div>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                        <h2 class="fs-2 m-0">Cập nhật sản phẩm</h2>
                    </div>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                                   role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-user me-2"></i>${sessionScope.LOGIN_USER.getFullname()}
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                    <li><a class="dropdown-item" href="hoSoShop.jsp">Hồ sơ</a></li>
                                    <li><a class="dropdown-item" href="MainController?action=Logout">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
                <%
List<CategoryDTO> listCategory = (List<CategoryDTO>) request.getAttribute("CATEGORY");
List<TypeOfBirdDTO> listTypeOfBird = (List<TypeOfBirdDTO>) request.getAttribute("TYPE_OF_BIRD");
                %>
                <div class="container-fluid px-4">

                    <div class="row my-5">
                        <!--                        <h3 class="fs-4 mb-3">Ngày đặt hàng</h3>-->
                        <form action="MainController" method="POST">
                            <div class="col">
                                <div class="container" style="display: grid; grid-template-rows: repeat(4,0fr); gap:10px;">
                                    <%
                                        List<ProductDTO> detail = (List<ProductDTO>) request.getAttribute("PRODUCT_DETAIL");
                                        if(detail != null){
                                        if(detail.size() > 0){
                                    %>
                                    <input type="hidden" name="shopProductItemID" value="<%= detail.get(0).getShopProductItemID()%>">
                                    <label for="productName" style="font-size: 18px; font-weight: bold;" >Tên sản phẩm:  </label> <input type="text" id="productName" name="productName" value="<%= detail.get(0).getTitle()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="typeOfBird" style="font-size: 18px; font-weight: bold;">Dành cho chim: </label> 
                                    <select id="typeOfBird" name="typeOfBird" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;">

                                        <%
                                        for (TypeOfBirdDTO bird : listTypeOfBird){
                                        if(bird.getType_of_bird_name().equals(detail.get(0).getType_of_bird_name())){
                                        %>
                                        <option value="<%= bird.getType_of_bird_id() %>"><%= bird.getType_of_bird_name() %></option>
                                        <%
                                            }
                                            }
                                        %>
                                        <%
                                        for (TypeOfBirdDTO bird : listTypeOfBird){
                                        if(!bird.getType_of_bird_name().equals(detail.get(0).getType_of_bird_name())){
                                        %>
                                        <option value="<%= bird.getType_of_bird_id() %>"><%= bird.getType_of_bird_name() %></option>
                                        <%
                                            }
                                            }
                                        %>



                                    </select>
                                    <label for="typeProduct" style="font-size: 18px; font-weight: bold;">Loại hàng:</label>
                                    <select id="typeProduct" name="typeProduct" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;">
                                        <%
                                        for (CategoryDTO cate : listCategory){
                                        if(cate.getCategoryName().equals(detail.get(0).getCategory_name())){
                                        %>
                                        <option value="<%= cate.getCategoryID() %>"><%= cate.getCategoryName() %></option>
                                        <%
                                            }
                                            }
                                        %>
                                        <%
                                        for (CategoryDTO cate : listCategory){
                                        if(!cate.getCategoryName().equals(detail.get(0).getCategory_name())){
                                        %>
                                        <option value="<%= cate.getCategoryID() %>"><%= cate.getCategoryName() %></option>
                                        <%
                                            }
                                            }
                                        %>

                                    </select>

                                    
                                        <label for="description" style="font-size: 18px; font-weight: bold;">Mô tả sản phẩm: </label> <textarea rows="4" cols="50" type="text" id="description" name="description" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"><%= detail.get(0).getDescription()%></textarea></br>
                                    <%
                                    
                                    for(int i = 0; i <= detail.size() - 1; i++){
                                    
                                    %>
                                    <span style="font-size: 18px; font-weight: bold;">---------------------------------------------------Tùy chọn <%= i + 1%>--------------------------------------------------------</span>
                                    <input type="hidden" id="optional_id" name="optional_id<%= i + 1%>"  value="<%= detail.get(i).getOptional_shop_product_item_id()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="option1" style="font-size: 18px; font-weight: bold;">Giá tùy chọn <%= i + 1%>:</label> <input type="text" id="description" name="option<%= i + 1%>" placeholder="Nhập tùy chọn" value="<%= detail.get(i).getNameOption()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="priceOption1" style="font-size: 18px; font-weight: bold;">Giá tùy chọn <%= i + 1%>:</label> <input type="number" id="description" name="priceOption<%= i + 1%>" placeholder="Nhập giá" value="<%= detail.get(i).getPriceView()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="inventory" style="font-size: 18px; font-weight: bold;" >Số lượng tùy chọn <%= i + 1%>:  </label> <input type="text" id="productName" name="inventory<%= i + 1%>" value="<%= detail.get(i).getInventory()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
<!--                                    <label for="option2" style="font-size: 18px; font-weight: bold;">Tùy chọn 2:</label> <input type="text" id="description" name="option1" placeholder="Nhập tùy chọn" value="<%= detail.get(1).getNameOption()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="priceOption2" style="font-size: 18px; font-weight: bold;">Giá tùy chọn 2:</label> <input type="number" id="description" name="priceOption1" placeholder="Nhập giá" value="<%= detail.get(1).getPriceView()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="inventory" style="font-size: 18px; font-weight: bold;" >Số lượng tùy chọn 2:  </label> <input type="text" id="productName" name="inventory2" value="<%= detail.get(1).getInventory()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="option2" style="font-size: 18px; font-weight: bold;">Tùy chọn 2:</label> <input type="text" id="description" name="option1" placeholder="Nhập tùy chọn" value="<%= detail.get(2).getNameOption()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="priceOption2" style="font-size: 18px; font-weight: bold;">Giá tùy chọn 2:</label> <input type="number" id="description" name="priceOption1" placeholder="Nhập giá" value="<%= detail.get(2).getPriceView()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="inventory" style="font-size: 18px; font-weight: bold;" >Số lượng tùy chọn 2:  </label> <input type="text" id="productName" name="inventory2" value="<%= detail.get(2).getInventory()%>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>-->
                                    <%
                                        
                                        }
                                    %>
                                    
                                </div>

                                <%}}%>

                            </div>


                                    <button type="submit" name="action" value="Update Product" class="btn btn-primary" style="margin-top: 30px; border-radius: 20px;">Cập nhật sản phẩm</button>
                                    <p>${msg}<p>
                            <!--<input type="button" name="action" value="Create" style="margin-top: 30px; border-radius: 20px;/>-->
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>


<script>
    var el = document.getElementById("wrapper");
    var toggleButton = document.getElementById("menu-toggle");

    toggleButton.onclick = function () {
        el.classList.toggle("toggled");
    };
    // function add ảnh ở dưới 
    function onFileSelect(event) {
        var file = event.target.files[0];
        var reader = new FileReader();

        reader.onload = function () {
            var image = document.getElementById("productImage");
            image.src = reader.result;
        };

        reader.readAsDataURL(file);
    }

    document.getElementById("productImage").addEventListener("change", onFileSelect);

</script>

</body>

</html>

<style>
    .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    input:checked + .slider {
        background-color: #2196F3;
    }

    input:focus + .slider {
        box-shadow: 0 0 1px #2196F3;
    }

    input:checked + .slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }
</style>

