<%@page import="khachhangmodal.khachhang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myphamModal.mypham"%>
<%@page import="myphamModal.myphambo"%>
<%@page import="loaiModal.loai"%>
<%@page import="loaiModal.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Đăng Ký</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    body {
        background-color: #e6f7ff; /* Xanh dương nhạt */
        font-family: Arial, sans-serif;
    }

    .navbar-inverse {
        background-color: #0056b3; /* Navbar xanh đậm */
        border-color: #004080;
    }

    .navbar-inverse .navbar-nav > li > a,
    .navbar-inverse .navbar-brand {
        color: #ffffff;
    }

    .navbar-inverse .navbar-nav > li > a:hover {
        background-color: #004080;
        color: #ffffff;
    }

    .container {
        max-width: 500px;
        margin: 50px auto;
        background-color: #ffffff; /* Form màu trắng */
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #0056b3;
        text-align: center;
        margin-bottom: 20px;
    }

    .form-control {
        border-radius: 5px;
        border: 1px solid #b3d9ff; /* Viền xanh nhạt */
    }

    .btn-primary {
        background-color: #0056b3; /* Nút xanh đậm */
        border-color: #004080;
    }

    .btn-primary:hover {
        background-color: #004080;
        border-color: #003366;
    }

    .alert-danger {
        margin-top: 15px;
        border-radius: 5px;
        text-align: center;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <a class="navbar-brand" href="#">Cosmetics</a>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <% 
      khachhang kh = (khachhang) session.getAttribute("dn");
      if (kh == null) {
      %>
      <li><a href="dangkyController"><span class="glyphicon glyphicon-log-in"></span> Register</a></li>
      <li><a href="dangnhapController"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <% } else { %>
      <li><a href="logoutController"><span class="glyphicon glyphicon-user"></span> Log out</a></li>
      <li class="highlighted-text">Xin chào <%= kh.getHoten() %></li>
      <% } %>
    </ul>
  </div>
</nav>

<div class="container">
  <form class="form-signup" action="dangkyController" method="post">
    <h2 class="form-signup-heading">Đăng Ký</h2>
    <input type="text" id="txthoten" name="txthoten" class="form-control" placeholder="Họ Tên" required autofocus>
    <input type="text" id="txtdiachi" name="txtdiachi" class="form-control" placeholder="Địa Chỉ" required>
    <input type="text" id="txtsdt" name="txtsdt" class="form-control" placeholder="Số Điện Thoại" required>
    <input type="email" id="txtemail" name="txtemail" class="form-control" placeholder="Email" required>
    <input type="text" id="txtun" name="txtun" class="form-control" placeholder="Username" required>
    <input type="password" id="txtpass" name="txtpass" class="form-control" placeholder="Password" required>
    <button class="btn btn-primary btn-block" type="submit" name="dk">Đăng Ký</button>
  </form>
  <% String mmp = (String) request.getAttribute("message"); 
     if (mmp != null) {
  %>
  <div class="alert alert-danger" role="alert">
    <%= mmp %>
  </div>
  <% } %>
</div>
</body>
</html>
