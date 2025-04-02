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
                <a href="homeAdmin.jsp" class="nav-link">Trang chủ</a>
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
                        <a href="AdminquanlyloaiController" class="nav-link active">
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
    myphambo mpbo = new myphambo();
    ArrayList<mypham> dsmypham = mpbo.getMypham();
%>
           <div class="container">
	<form method="post" action="AdminquanlyloaiController" enctype="multipart/form-data">
    	<table class="table table-bordered table-striped table-hover" style="margin-top: 20px">
	 		<%String maloai = (String)request.getAttribute("maloai");
	 		String tenloai = (String)request.getAttribute("tenloai");
		
			if(maloai != null)
			{%>
	        <tr>
	            <th class="text-center">Mã Loại</th>
	            <td><input type="text" name="txtmaloai" value="<%= maloai %>"></td>
	            <th class="text-center">Tên Loại</th>
	            <td><input type="text" name="txttenloai" value="<%= tenloai %>"></td>
	        
	        </tr>
	 
	    
	      
	        <%}else {%>
	        <tr>
	            <th class="text-center">Mã Loại</th>
	            <td><input type="text" name="txtmaloai" value=""></td>
	            <th class="text-center">Tên Loại</th>
	            <td><input type="text" name="txttenloai" value=""></td>
	           
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
	  <h1 class="text-center " style="font-weight: bold;">Quản Lý Loại Mỹ phẩm</h1>
	<form method="post" action="AdminquanlyloaiController" >
        <table class="table table-bordered table-striped ">
        	<thead>
	            <tr style="color: black;">
	                <th >Mã loại</th>
	                <th>Tên loại</th>
	     
	               
	                <th></th>
	                <th></th>
	            </tr>
	        </thead>
    
        <% for (int i = 0; i < ds.size(); i++) { %>
            <tr>
                <td><%= ds.get(i).getMaLoai() %></td>
                <td><%= ds.get(i).getTenLoai() %></td>
              
                <td>
                	<!-- <input type="submit" name="sl" value="Select" class="btn btn-success"> -->
                	 <a href="AdminquanlyloaiController?maloai=<%=ds.get(i).getMaLoai()%>&tenloai=<%= ds.get(i).getTenLoai()%>"
                	  class="btn btn-success btn-white">Update</a>
                </td>
                <td>
                <a href="AdminquanlyloaiController?maloaixoa=<%=ds.get(i).getMaLoai()%>" class="btn btn-danger btn-white">Delete</a>
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