<%@page import="adminmodal.adminxacnhanbean"%>
<%@page import="myphamModal.mypham"%>
<%@page import="myphamModal.myphambo"%>
<%@page import="loaiModal.loai"%>
<%@page import="java.util.ArrayList"%>
<%@page import="loaiModal.loaibo"%>
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
                        <a href="AdminqlmyphamController" class="nav-link active">
                            <i class="nav-icon fas fa-book"></i>
                            <p>Quản lý mỹ phẩm</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="AdminquanlyloaiController" class="nav-link">
                            <i class="nav-icon fas fa-tags"></i>
                            <p>Quản lý loại</p>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
    <!-- Content Wrapper -->
    <div class="content-wrapper">
      
        <!-- Main Content -->
       <%
    loaibo lbo = new loaibo();
    ArrayList<loai> ds = lbo.getLoai();
    myphambo mpbo = new myphambo();
    ArrayList<mypham> dsmypham = mpbo.getMypham();
%>
           <div class="container">
	
	  <h1 class="text-center " style="font-weight: bold;">Xác nhận đặt mua</h1>
	<form method='post' action='AdminxacnhanController'>

		<table class="table table-bordered " style="background-color: white; margin-top: 20px">
 				<thead>
	 				<% ArrayList<adminxacnhanbean> ds1 = (ArrayList<adminxacnhanbean>)request.getAttribute("ds");
					if(ds1.size() > 0)
					{%>
			            <tr>
			         	   <th width="150px">Họ tên khách hàng</th>
			         	    <th width="150px">Ngày mua</th>
			         	        <th width="150px">Số lượng mua</th>
			         	           <th width="100px" >Giá</th>
			         	    <th width="150px">Thành tiền</th>
			                <th width="200px">Mã Hóa Đơn</th>
			  				<th colspan="1" width="500px" class="text-center">Xác nhận/Hủy đơn hàng</th>
			  				
			            </tr>
			         <%} %>
		        </thead>
			<% ArrayList<adminxacnhanbean> ds2 = (ArrayList<adminxacnhanbean>)request.getAttribute("ds");
				for(adminxacnhanbean xn:ds2)
			{%>
				<tr>

					<td><%= xn.getHoten() %> </td>
					<td><%= xn.getNgayMua()%> </td>
					<td><%= xn.getSoLuongMua() %> </td>
					<td><%= xn.getGia() %> </td>
					<td><%= xn.getThanhTien() %> </td>
					<td><%= xn.getMaHoaDon() %> </td>
				
				
					<td><a href = "AdminxacnhanController?mct=<%=xn.getMaHoaDon()%>" class = "btn btn-success btn-white">Xác Nhận</a> 
					
				
					
					<td>
						<a href="AdminxacnhanController?mctxoa=<%=xn.getMaHoaDon()%>" class = "btn btn-danger btn-white">Hủy</a>
					</td>
	
				</tr>
			<%} %>
		</table>
	</form>
	</div>

    </div>
</div>
<!-- Include AdminLTE JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</body>
</html>