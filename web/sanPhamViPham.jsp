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


                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=AddRecipe&shop_id=${sessionScope.LOGIN_USER.getShop_id()}">Thêm khẩu phần</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewRecipeShop&shop_id=${sessionScope.LOGIN_USER.getShop_id()}">Tất cả khẩu phần</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="sanPhamViPham.jsp">Sản phẩm vi phạm</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewProduct&shop_id=${sessionScope.LOGIN_USER.getShop_id()}">Tất cả sản phẩm</a></li>
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
                        <h2 class="fs-2 m-0">Sản phẩm vi phạm</h2>
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

                    <div class="row my-5">
                        <h3 class="fs-4 mb-3">Gần đây</h3>
                        <div class="col">
                            <table class="table bg-white rounded shadow-sm  table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" width="50">#</th>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col">Thời gian cập nhật</th>
                                        <th scope="col">Hạn sửa lỗi</th>
                                        <th scope="col">Loại vi phạm</th>
                                        <th scope="col">Lý do vi phạm</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Cám chim 1</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>               
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Cám chim 2</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Cám chim 3</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Cám chim 4</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Cám chim 5</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">6</th>
                                        <td>Cám chim 6</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">7</th>
                                        <td>Cám chim 7</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">8</th>
                                        <td>Cám chim 8</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">9</th>
                                        <td>Cám chim 9</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">10</th>
                                        <td>Cám chim 10</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">11</th>
                                        <td>Cám chim 11</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                    <tr>
                                        <th scope="row">12</th>
                                        <td>Cám chim 12</td>
                                        <td>2/2/2023</td>
                                        <td>4/2/2023</td>
                                        <td>Hàng nhái</td>
                                        <td>#</td>  
                                    </tr>
                                </tbody>
                            </table>
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
    </script>
</body>

</html>

