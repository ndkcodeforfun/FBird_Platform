<%@page import="fbird.category.CategoryDTO"%>
<%@page import="fbird.typeofbird.TypeOfBirdDTO"%>
<%@page import="java.util.List"%>
<%@page import="fbird.recipe.RecipeDTO"%>
<%@page import="fbird.optionalshopproductitem.OptionalshopproductitemDTO"%>

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

                        <li><a class="dropdown-item" style="width: 239px;" href="tatCaDonHang.jsp">Tất cả đơn</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="donHuy.jsp">Đơn hủy</a></li>
                    </ul>
                    <!--------------------------------------------------------------------------------------------------------------------------------------------------------->
                    <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold dropdown-toggle" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-regular fa-cube me-2"></i>Quản lý sản phẩm
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="profileDropdown">
                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewProduct&shop_id=${sessionScope.LOGIN_USER.getShop_id()}">Tất cả sản phẩm</a></li>

                        <li><a class="dropdown-item" style="width: 239px;" href="addRecipe.jsp">Thêm khẩu phần</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="AllRecipe.jsp">Tất cả khẩu phần</a></li>

                        <li><a class="dropdown-item" style="width: 239px;" href="sanPhamViPham.jsp">Sản phẩm vi phạm</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewCreateProduct">Thêm sản phẩm</a></li>
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
                        <h2 class="fs-2 m-0">Thêm sản phẩm</h2>
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

                <div class="container-fluid px-4">
                    <%
        List<RecipeDTO> listRecipe = (List<RecipeDTO>) request.getAttribute("LIST_RECIPE");
                    %>

                    <div class="row my-5">
                        <!--                        <h3 class="fs-4 mb-3">Ngày đặt hàng</h3>-->
                        <!--                                                <div id="imageUploadForm">
                                                <form action="MaiController" method="POST" enctype="multipart/form-data">
                                                    <span style="font-size: 18px; font-weight: bold;">Ảnh sản phẩm:</span> <input type="file" name="productImage" id="productImage" accept="image/*"><input type="button" value="Upload" onclick="uploadImage()">
                                                </form>
                                                </div>-->
                        <form action="MainController">
                            <div class="col">
                                <input type="hidden" name="recipe_id" value="${requestScope.recipe_id}"/>
                                <div class="container" style="display: grid; grid-template-rows: repeat(4,0fr); gap:10px;">
                                    <label for="productName" style="font-size: 18px; font-weight: bold;" >Tên khẩu phần:  </label> <input type="text" id="productName" value="<%=listRecipe.get(0).getTitle_recipe()%>" name="recipeName" placeholder="Nhập tên khẩu phần" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <label for="typeOfBird" style="font-size: 18px; font-weight: bold;">Dành cho chim: </label> 
                                    <select id="typeOfBird" name="typeOfBird" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;">

                                        <%
                                        List<TypeOfBirdDTO> listType = (List<TypeOfBirdDTO>) request.getAttribute("LIST_TYPE");
                                               
                                        if (listType != null && !listType.isEmpty()) {


                                                for (TypeOfBirdDTO listTP : listType) {
                                               if(listTP.getType_of_bird_name().equals(listRecipe.get(0).getTypeOfBirdName())){                                   
                                        
                                        %>
                                        <option value="<%= listTP.getType_of_bird_id()%>"><%=listTP.getType_of_bird_name()%></option>
                                        <%
                                            }
                                            }
                                        %> 

                                        <option value="">Chọn loại chim</option>

                                        <%
                                            
                                            for (TypeOfBirdDTO listTP : listType) {
                                            if(!listTP.getType_of_bird_name().equals(listRecipe.get(0).getTypeOfBirdName())){                                   
                                            
                                        %>
                                        <option value="<%= listTP.getType_of_bird_id()%>"><%=listTP.getType_of_bird_name()%></option>
                                        <%
                                            }
                                            }
                                        %>
                                        <%
                                            }

                                        %>

                                    </select>

                                        <label for="description" style="font-size: 18px; font-weight: bold;">Mô tả sản phẩm:</label> <input type="text" id="description" value="<%=listRecipe.get(0).getDescription()%>" name="description" placeholder="Nhập mô tả" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <span style="font-size: 18px; font-weight: bold;">---------------------------------------------------Chọn sản phẩm--------------------------------------------------------</span>
                                    <% for(int i = 0; i <= listRecipe.size() - 1; i++){
                                    %>
                                        <input type="hidden" name="recipe_product_id<%= i+1%>" value="<%=listRecipe.get(i).getRecipeProductID()%>"/>
                                    <label for="Product1" style="font-size: 18px; font-weight: bold;">Sản phẩm <%= i + 1 %>:</label>
                                    <select id="Product<%= i+1 %>" name="Product<%= i+1 %>" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;">
                                        
                                        
                                        <% 
                                    List<OptionalshopproductitemDTO> listOptional = (List<OptionalshopproductitemDTO>) request.getAttribute("LIST_OPTIONAL");
                                    if (listOptional != null && !listOptional.isEmpty()) {
                                        
            
                                        for (OptionalshopproductitemDTO listOP : listOptional) {
                                        if(listOP.getName().equals(listRecipe.get(i).getNameProductOptional())){
                                        %>

                                        <option value="<%=listOP.getTitle()%>: <%=listOP.getName()%>: <%= listOP.getOptional_shop_product_item_id()%>" price="<%=listOP.getPrice()%>"><%=listOP.getTitle()%>: <%=listOP.getName()%></option>
                                        <%
                                            }
                                        }
                                        for (OptionalshopproductitemDTO listOP : listOptional) {
                                        if(!listOP.getName().equals(listRecipe.get(i).getNameProductOptional())){
                                        %>

                                        <option value="<%=listOP.getTitle()%>: <%=listOP.getName()%>: <%= listOP.getOptional_shop_product_item_id()%>" price="<%=listOP.getPrice()%>"><%=listOP.getTitle()%>: <%=listOP.getName()%></option>
                                        <%
                                            }
                                        }
                                        %>
                                        <%
                                        }
                                        %>

                                    </select>
                                    <label for="inventory" style="font-size: 18px; font-weight: bold;" >Số lượng sản phẩm <%= i + 1 %>:  </label> <input type="number" id="productName" name="inventory<%= i+1 %>" value="<%=listRecipe.get(i).getQuantity()%>" placeholder="Nhập số lượng sản phẩm" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>
                                    <%}%>

                                    <div id="aaa"> <label for="inventory" style="font-size: 18px; font-weight: bold;" >Tổng giá khẩu phần: </label> <input  id="totalPrice" name="totalPrice" value="" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br></div>

                                </div>



                            </div>


                            <button type="submit" name="action" value="Update Recipe" class="btn btn-primary" style="margin-top: 30px; border-radius: 20px;">Cập nhật khẩu phần</button>
                            <!--<input type="button" name="action" value="Create" style="margin-top: 30px; border-radius: 20px;/>-->
                        </form>
                                    <h5>${requestScope.SUCCESS_MESSAGE}</h5>
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
    function totalPrice(){
        var product1 = document.getElementById("Product1");
        var selectedprivce1 = product1.options[product1.selectedIndex];
        var price1 = parseFloat(selectedprivce1.getAttribute("price"));
        var quantity1 = parseFloat(document.getElementsByName('inventory1')[0].value);
        
        var product2 = document.getElementById("Product2");
        var selectedprivce2 = product2.options[product2.selectedIndex];
        var price2 = parseFloat(selectedprivce2.getAttribute("price"));
        var quantity2 = parseFloat(document.getElementsByName('inventory2')[0].value);
        
        var product3 = document.getElementById("Product3");
        var selectedprivce3 = product3.options[product3.selectedIndex];
        var price3 = parseFloat(selectedprivce3.getAttribute("price"));
        var quantity3 = parseFloat(document.getElementsByName('inventory3')[0].value);
        
        var product4 = document.getElementById("Product4");
        var selectedprivce4 = product4.options[product4.selectedIndex];
        var price4 = parseFloat(selectedprivce4.getAttribute("price"));
        var quantity4 = parseFloat(document.getElementsByName('inventory4')[0].value);
        
        var product5 = document.getElementById("Product5");
        var selectedprivce5 = product5.options[product5.selectedIndex];
        var price5 = parseFloat(selectedprivce5.getAttribute("price"));
        var quantity5 = parseFloat(document.getElementsByName('inventory5')[0].value);
        
        
var totalprice = 0; // Khởi tạo totalprice với giá trị ban đầu là 0

console.log(price1);
console.log(quantity1);

if (!isNaN(price1) && !isNaN(quantity1)) {
    totalprice += price1 * quantity1;
}

if (!isNaN(price2) && !isNaN(quantity2) && !isNaN(price1) && !isNaN(quantity1)) {
    totalprice += (price2 * quantity2) + (price1 * quantity1);
}

if (!isNaN(price3) && !isNaN(quantity3) && !isNaN(price2) && !isNaN(quantity2) && !isNaN(price1) && !isNaN(quantity1)) {
    totalprice += (price3 * quantity3) + (price2 * quantity2) + (price1 * quantity1);
}

if (!isNaN(price4) && !isNaN(quantity4) && !isNaN(price3) && !isNaN(quantity3) && !isNaN(price2) && !isNaN(quantity2) && !isNaN(price1) && !isNaN(quantity1)) {
    totalprice += (price4 * quantity4) + (price3 * quantity3) + (price2 * quantity2) + (price1 * quantity1);
}

if (!isNaN(price5) && !isNaN(quantity5) && !isNaN(price4) && !isNaN(quantity4) && !isNaN(price3) && !isNaN(quantity3) && !isNaN(price2) && !isNaN(quantity2) && !isNaN(price1) && !isNaN(quantity1)) {
    totalprice += price5 * quantity5 + (price4 * quantity4) + (price3 * quantity3) + (price2 * quantity2) + (price1 * quantity1);
}
var totalpricedisplay = document.getElementById('aaa');
var a = `<label for="inventory" style="font-size: 18px; font-weight: bold;" >Tổng giá khẩu phần: </label> <input  id="totalPrice" name="totalPrice" value="`+ totalprice +`" style="border-radius: 10px; margin-bottom: 1%; width: 70%; height: 50px; font-size: 20px; margin-left: 5%;"></br>`;
console.log(totalprice);
totalpricedisplay.innerHTML = a;
    
    }
    


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

