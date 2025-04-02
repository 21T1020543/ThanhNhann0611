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
                        <a href="AdminquanlmyphamController" class="nav-link active">
                            <i class="nav-icon fas fa-book"></i>
                            <p>Quản lý mỹ phẩm</p>
                        </a>
                    </li>
                     <li class="nav-item">
                        <a href="AdminquanlyloaiController" class="nav-link">
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
    loaibo lbo = new loaibo();
    ArrayList<loai> ds = lbo.getLoai();
    myphambo sbo = new myphambo();
    ArrayList<mypham> dsmypham = sbo.getMypham();
%>
           <div class="container">
	<form method="post" action="AdminqlmyphamController" enctype="multipart/form-data">
    	<table class="table table-bordered table-striped table-hover" style="margin-top: 20px">
	 		<%String mamp = (String)request.getAttribute("mamp");
	 		String tenmp = (String)request.getAttribute("tenmp");
			String nhasanxuat = (String)request.getAttribute("nhasanxuat");
			String gia = (String)request.getAttribute("gia");
		
			String soluong = (String)request.getAttribute("soluong");
			String anh = (String)request.getAttribute("anh"); 
			if(mamp != null)
			{%>
	        <tr>
	            <th class="text-center">Mã Mỹ phẩm</th>
	            <td><input type="text" name="txtmamp" value="<%= mamp %>"></td>
	            <th class="text-center">Tên Mỹ phẩm</th>
	            <td><input type="text" name="txttenmp" value="<%= tenmp %>"></td>
	            <th class="text-center">Nhà sản xuất</th>
	            <td><input type="text" name="txtnhasanxuat" value="<%= nhasanxuat %>"></td>
	        </tr>
	 
	        <tr>
	            <th class="text-center">Giá</th>
	            <td><input type="text" name="txtgia" value="<%= gia %>"></td>
	            <th class="text-center">Số lượng</th>
	            <td><input type="text" name="txtsoluong" value="<%= soluong %>"></td>
	            <th class="text-center">Ngày nhập</th>
	            <td><input type="text" name="txtngaynhap" value="" placeholder="dd/mm/yyyy"></td>
	        </tr>
	        <tr>
	            <th class="text-center">Ảnh</th>
	            <td><input type="file" name="txtfile"></td>
	            <th class="text-center">Mã loại</th>
	            <td>
	                <select name="txtmaloai" class="form-select">
	                    <% for (int i = 0; i < ds.size(); i++) { %>
	                        <option value="<%= ds.get(i).getMaLoai() %>"><%= ds.get(i).getTenLoai() %></option>
	                    <% } %>
	                </select>
	            </td>
	        </tr>
	        <%}else {%>
	        <tr>
	            <th class="text-center">Mã mỹ phẩm</th>
	            <td><input type="text" name="txtmamp" value=""></td>
	            <th class="text-center">Tên Mỹ phẩm</th>
	            <td><input type="text" name="txttenmp" value=""></td>
	            <th class="text-center">Nhà sản xuất</th>
	            <td><input type="text" name="txtnhasanxuat" value=""></td>
	        </tr>
	 
	        <tr>
	            <th class="text-center">Giá</th>
	            <td><input type="text" name="txtgia" value=""></td>
	            <th class="text-center">Số lượng</th>
	            <td><input type="text" name="txtsoluong" value=""></td>
	            <th class="text-center">Ngày nhập</th>
	            <td><input type="text" name="txtngaynhap" value="" placeholder="dd/mm/yyyy"></td>
	        </tr>
	        <tr>
	            <th class="text-center">Ảnh</th>
	            <td><input type="file" name="txtfile"></td>
	  
	     
	            <th class="text-center">Mã loại</th>
	            <td>
	                <select name="txtmaloai" class="form-select">
	                    <% for (int i = 0; i < ds.size(); i++) { %>
	                        <option value="<%= ds.get(i).getMaLoai() %>"><%= ds.get(i).getTenLoai() %></option>
	                    <% } %>
	                </select>
	            </td>
	        </tr>
	        
	        <%} %>
	        <tr>
	            <td colspan="6" class="text-center" style="width: 100px; ">
	            <!-- 	<input type="hidden" name="action" value="thongke">
	            	<input type = "submit" name='th' value="Add"> -->
	                <input style="width: 150px " type="submit" name="action" value="Add" class="btn btn-primary btn-white">
	               	<input style="width: 150px" type="submit" name="action" value="Update" class="btn btn-success btn-white">
	            </td>

	        </tr>

	</table>
	</form>
	  <h1 class="text-center " style="font-weight: bold;">Quản Lý mỹ phẩm</h1>
	<form method="post" action="AdminqlmyphamController" >
        <table class="table table-bordered table-striped ">
        	<thead>
	            <tr style="color: black;">
	                <th >Mã mỹ phẩm</th>
	                <th>Tên mỹ phẩm</th>
	     
	                <th>Nhà sản xuất</th>
	                <th>Giá</th>
	                <th>Số lượng</th>
	                <th>Ảnh</th>
	                
	            </tr>
	        </thead>
    
        <% for (int i = 0; i < dsmypham.size(); i++) { %>
            <tr>
                <td><%= dsmypham.get(i).getMaMP() %></td>
                <td><%= dsmypham.get(i).getTenMP() %></td>
               <td><%= dsmypham.get(i).getNhaSanXuat() %></td>
                <td><%= dsmypham.get(i).getGia() %></td>
                <td><%= dsmypham.get(i).getSoLuong() %></td>
                <td>
    				<img src="<%= dsmypham.get(i).getAnh() %>" alt="Ảnh sản phẩm" style="width: 100px; height: auto; border-radius: 8px;">
				</td>
                <td>
                	<!-- <input type="submit" name="sl" value="Select" class="btn btn-success"> -->
                	 <a href="AdminqlmyphamController?mamp=<%=dsmypham.get(i).getMaMP()%>&tenmp=<%=dsmypham.get(i).getTenMP()%>
                	 &nhasanxuat=<%=dsmypham.get(i).getNhaSanXuat()%>&gia=<%=dsmypham.get(i).getGia()%>&soluong=<%=dsmypham.get(i).getSoLuong()%>
                	 &anh=<%=dsmypham.get(i).getAnh()%>" class="btn btn-success btn-white">Sửa</a>
                </td>
                <td>
                	<!-- <input type="submit" name="sl" value="Select" class="btn btn-success"> -->
                	
                <a href="AdminqlmyphamController?mctxoa=<%=dsmypham.get(i).getMaMP() %>" class="btn btn-danger btn-white">Xóa</a>
                </td>
            </tr>
        <% } %>
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