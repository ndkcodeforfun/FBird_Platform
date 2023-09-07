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
                    <a href="accountMainController?action=ViewShopDashboard" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
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


                        <li><a class="dropdown-item" style="width: 239px;" href="addRecipe.jsp">Thêm khẩu phần</a></li>
                        <li><a class="dropdown-item" style="width: 239px;" href="AllRecipe.jsp">Tất cả khẩu phần</a></li>
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
                        <h2 class="fs-2 m-0">Đánh giá shop</h2>
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
                                   
                                    <li><a class="dropdown-item" href="login.jsp">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>

                <div class="container-fluid px-4">
                    <div class="row my-5">
                        <!--                        <h3 class="fs-4 mb-3">Ngày đặt hàng</h3>-->
<div class="col" style="display: grid; grid-template-columns: auto 1fr auto; align-items: center;">
    <label for="productName" style="font-size: 18px; font-weight: bold;">Tên sản phẩm:</label>
    <input type="text" id="productName" name="productName" placeholder="Nhập tên sản phẩm" style="border-radius: 10px; height: 50px; font-size: 20px; margin-left: 5%; width: 700px;">
    <button type="button" class="btn btn-primary" style="border-radius: 20px; margin-right: 220px;">Tìm kiếm</button>
</div>

                    </div>

                    <div class="row g-3 my-2">
                        <div class="col-md-1">
                            <a href="allDelivery.jsp" class="p-1 bg-white shadow-sm d-flex justify-content-around align-items-center rounded fw-bold" style="text-decoration: none; color: black;">

                                Tất cả


                            </a>
                        </div>

                        <div class="col-md-1">
                            <a href="delivered.jsp"  class="p-1 bg-white shadow-sm d-flex justify-content-around align-items-center rounded fw-bold" style="text-decoration: none; color: black;">
                                1 sao
                            </a>
                        </div>

                        <div class="col-md-1">
                            <a href="nonDelivered.jsp" class="p-1 bg-white shadow-sm d-flex justify-content-around align-items-center rounded fw-bold" style="text-decoration: none; color: black;" >
                                2 sao
                            </a>
                        </div>
                        <div class="col-md-1">
                            <a href="nonDelivered.jsp" class="p-1 bg-white shadow-sm d-flex justify-content-around align-items-center rounded fw-bold" style="text-decoration: none; color: black;" >
                                3 sao
                            </a>
                        </div>
                        <div class="col-md-1">
                            <a href="nonDelivered.jsp" class="p-1 bg-white shadow-sm d-flex justify-content-around align-items-center rounded fw-bold" style="text-decoration: none; color: black;" >
                                4 sao
                            </a>
                        </div>
                        <div class="col-md-1">
                            <a href="nonDelivered.jsp" class="p-1 bg-white shadow-sm d-flex justify-content-around align-items-center rounded fw-bold" style="text-decoration: none; color: black;" >
                                5 sao
                            </a>
                        </div>
                        <table class="table bg-white rounded shadow-sm  table-hover">

                            <thead>
                                <tr>
                                    <th scope="col" width="50">#</th>
                                    <th scope="col">Thông tin sản phẩm</th>
                                    <th scope="col">Tên khách hàng</th>
                                    <th scope="col">Đánh giá khách hàng</th>
                                    <th scope="col"># Sao</th>
                                    <th scope="col">Trả lời đánh giá của bạn</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Cám chim 1</td>
                                        <td>Nam</td>
                                        <td>Chim của tao ăn được 1 ngày chết luôn</td>
                                        <td>5 sao</td>
                                        <td>Xin lỗi về vấn đề này, phiền bạn kiểm tra tin nhắn chờ từ shop để nhận đền bù thỏa đáng ạ</td>                                              
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Cám chim 2</td>
                                        <td>Kiên</td>
                                        <td>Đã mua không biết chất lượng ra sao nhưng shop đóng bao bì rất chắc chắn</td>
                                        <td>5 sao</td>
                                        <td>Shop cảm ơn bạn rất nhiều ạ, phiền bạn đánh giá 5 sao cho shop nhé!!!</td>
                                         
                                    </tr>
                                </tbody>
                        </table>

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


