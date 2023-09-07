<!DOCTYPE html>
<html lang="vi">
        <%@page import="java.util.List"%>
    <%@page import="fbird.report.ReportedProductDTO"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Admin Dashboard</title>
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


                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold dropdown-toggle" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-solid fa-truck me-2"></i>Quản lý tài khoản
                </a>
                <ul class="dropdown-menu" aria-labelledby="adminDropdown">

                    <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewAccount">Xem tài khoản</a></li>
                    <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewReportedShop">Xem báo cáo tài khoản</a></li>
                </ul>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold dropdown-toggle" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-regular fa-briefcase me-2"></i>Cài đặt sản phẩm
                </a>
                <ul class="dropdown-menu" aria-labelledby="adminDropdown">

                    
                    <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewTypeOfBird&search=">Loại chim</a></li>
                    <li><a class="dropdown-item" style="width: 239px;" href="MainController?action=ViewReportedProduct&search=">Sản phẩm khiếu nại</a></li>
                </ul>
                <a href="MainController?action=Logout" class="list-group-item list-group-item-action bg-transparent second-text fw-bold" >
                    <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                </a>


            </div>
            <!-- /#sidebar-wrapper -->
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                        <h2 class="fs-2 m-0">Xem khiếu nại</h2>
                    </div>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>


                </nav>

                <div class="container-fluid px-4">

                    <div class="row my-5">
                        <h3 class="fs-4 mb-3">Tìm kiếm sản phẩm:</h3>
                        <form action="ViewReportedProductController" method="GET">
                            <input type="text" name="search" placeholder="Nhập tên sản phẩm">
                            <button type="submit">Tìm kiếm</button>
                        </form>
                        <div class="col">
                            <table class="table bg-white rounded shadow-sm  table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" width="50">#</th>
                                        <th scope="col">Tên sản phẩm</th>
                                        <th scope="col">Người khiếu nại </th>
                                        <th scope="col">Lý do </th>

                                    </tr>
                                </thead>
                                <tbody>
                                                                        <% 
                                    List<ReportedProductDTO> ListReport = (List<ReportedProductDTO>) request.getAttribute("LIST_REPORT");
                                    if (ListReport != null && !ListReport.isEmpty()) {
                                        int count = 0;
            
                                        for (ReportedProductDTO lrp : ListReport) {
                                        count++;
                                    %>
                                    <tr>
                                <td><%= count%></td>
                                
                                
                                <td><%=lrp.getDetail()%></td>
                                
                                <td><%=lrp.getTitle() %></td>
                                <td><%=lrp.getFullname()%></td>
                                    </tr>
                                    
                                                                    <%
                                    }
                                }
                                %>

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
