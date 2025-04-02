<%@page import="myphamModal.myphambo"%>
<%@page import="hoadon.hoadonbo"%>
<%@page import="khachhangmodal.khachhang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="khachhangmodal.khachhangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <!-- Include AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">Trang chủ</a>
            </li>
             <li class="nav-item d-none d-sm-inline-block">
                <a href="AdminxacnhanController" class="nav-link">Xác nhận đặt mua</a>
            </li>
        </ul>
    </nav>
    <!-- Sidebar -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="#" class="brand-link">
         
            <span class="brand-text font-weight-light">Admin</span>
        </a>
        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" role="menu">
                
                    <li class="nav-item">
                        <a href="AdminqlmyphamController" class="nav-link">
                            <i class="nav-icon fas fa-book"></i>
                            <p>Quản lý mỹ phẩm</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="AdminqquanlyloaiController" class="nav-link">
                         <i class="nav-icon fas fa-book"></i>
                            <p>Quản lý loại</p>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <!-- Content Header -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">

                    </div>
                </div>
            </div>
        </section>
        <!-- Main Content -->
             <%
    khachhangbo khbo = new khachhangbo();
    hoadonbo hdbo = new hoadonbo();
 	myphambo sbo = new myphambo();
%>
        
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                <div class="col-lg-3 col-6">
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3><%=hdbo.getDoanhThu()%> VNĐ</h3>
                                <p>Doanh thu</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-chart-line"></i>
                            </div>
                          
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3><%=khbo.getSoLuongKhachHang() %></h3>
                                <p>Khách hàng đang có</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-user-plus"></i>
                            </div>
                            
                        </div>
                    </div>
				<div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3><%=sbo.getSoLuongMyPhamHienCo() %></h3>
                                <p>Tổng số lượng mỹ phẩm hiện có</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-book"></i>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                    <div class="small-box bg-danger">
                            <div class="inner">
                                <h3><%=hdbo.getSoLuongMyPhamBanRa() %></h3>
                                <p>Số lượng mỹ phẩm bán ra</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-book"></i>
                            </div>
                         
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                    <div class="small-box bg-secondary">
                            <div class="inner">
                                <h3><%=sbo.getSoMyPhamDangHetHang() %></h3>
                                <p>Số sách đang hết hàng</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-book"></i>
                            </div>
                           
                        </div>
                    </div>
                   
                    </div>                   
                </div>
           
            </div>
        </section>
    </div>
</div>
<!-- Include AdminLTE JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</body>
</html>