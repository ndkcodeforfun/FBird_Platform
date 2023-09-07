<!DOCTYPE html>
<html lang="vi">
    <%@page import="java.util.List"%>
    <%@page import="fbird.typeofbird.TypeOfBirdDTO"%>
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

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                        <h2 class="fs-2 m-0">Quản lý loại chim</h2>
                    </div>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>


                </nav>

                <div class="container-fluid px-4">
                    <div class="row g-3 my-2">
                        <div class="col-md-3">
                            <a href="MainController?action=ViewTypeOfBird&search=" class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded fw-bold" style="text-decoration: none; color: black;">

                                Xem loại chim


                            </a>
                        </div>

                        <div class="col-md-3">
                            <a href="themLoaiChim.jsp"  class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded fw-bold" style="text-decoration: none; color: black;">
                                Thêm loại chim
                            </a>
                        </div>

                    </div>

                    <div class="row my-5">
                        <h3 class="fs-4 mb-3">Tìm kiếm loại chim:</h3>
                        <form action="SearchTypeOfBirdController" method="GET">
                              <div class="input-container">
    <input type="text" name="search" placeholder="Nhập tên chim">
    <!-- Thêm nút tìm kiếm nếu cần -->
    <button type="submit" class="search-button">Tìm kiếm</button>
 </div>

                        </form>
                        <div class="col">

                            <table class="table bg-white rounded shadow-sm  table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" width="50">#</th>
                                        <th scope="col">Tên chim</th>
                                        <th scope="col"> </th>
                                    </tr>
                                </thead>

                                <tbody>


                                    <% 
                                    List<TypeOfBirdDTO> listTOB = (List<TypeOfBirdDTO>) request.getAttribute("LIST_TYPE_OF_BIRD");
                                    if (listTOB != null && !listTOB.isEmpty()) {
                                        int count = 0;
            
                                        for (TypeOfBirdDTO tob : listTOB) {
                                        count++;
                                    %>
                                    <tr>
                                        <td><%= count%></td>
                                        <td>  <%= tob.getType_of_bird_name() %> </td>


                                <form action="DeleteTypeOfBirdController" method="post">
                                    <td>
                                        <input type="hidden" name="name" value="<%= tob.getType_of_bird_name() %>">
                                        <input type="submit" value="Xóa chim" class="fw-bold" style="text-decoration: none; color: black;"/>
                                    </td>
                                </form>
                                <%
                                    }
                                }
                                %>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- /#page-content-wrapper -->


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
    
    
    
    
    
/*    -------------------------------------------*/
     /* Container cho input */
    .input-container {
      display: flex;
/*      align-items: center;*/
/*      justify-content: center;*/
      margin-bottom: 10px;
    }

    /* Input */
    input[type="text"] {
      padding: 10px;
      border: 2px solid #7ab730; /* Định dạng viền input */
      border-radius: 5px; /* Bo tròn góc input */
      font-size: 16px;
      outline: none; /* Loại bỏ viền xung quanh input khi focus */
      width: 300px; /* Độ rộng input */
    }

    /* Placeholder */
    input[type="text"]::placeholder {
      color: #999; /* Màu chữ của placeholder */
      font-style: italic;
    }

    /* Hover và focus */
    input[type="text"]:hover,
    input[type="text"]:focus {
      border-color: #6c963a; /* Định dạng viền input khi hover và focus */
    }

    /* Nút tìm kiếm (nếu bạn có nút tìm kiếm bên cạnh input) */
    .search-button {
      padding: 10px 15px;
      background-color: #7ab730;
      border: none;
      color: #fff;
      border-radius: 5px;
      cursor: pointer;
      margin-left: 10px;
      font-size: 16px;
    }

    .search-button:hover {
      background-color: #6c963a;
    }
</style>

