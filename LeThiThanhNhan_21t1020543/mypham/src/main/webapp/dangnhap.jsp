<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Đăng nhập</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    body {
        background-color: #e6f7ff; /* Nền xanh dương nhạt */
        font-family: Arial, sans-serif;
    }

    .navbar-inverse {
        background-color: #0056b3; /* Navbar xanh dương đậm */
        border-color: #004080;
    }

    .navbar-inverse .navbar-brand,
    .navbar-inverse .nav > li > a {
        color: #ffffff;
    }

    .container {
        max-width: 400px;
        margin: 50px auto;
        background-color: #ffffff; /* Nền form trắng */
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #0056b3;
        text-align: center;
        margin-bottom: 20px;
    }

    .btn-primary {
        background-color: #0056b3; /* Nút xanh đậm */
        border-color: #004080;
    }

    .btn-primary:hover {
        background-color: #004080;
        border-color: #003366;
    }

    .form-control {
        border-radius: 5px;
        border: 1px solid #b3d9ff; /* Viền xanh nhạt */
    }

    .checkbox label {
        color: #0056b3;
    }

    .alert {
        text-align: center;
        margin-top: 15px;
        padding: 10px;
        border-radius: 5px;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Cosmetics</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <% String un = (String) session.getAttribute("dn"); 
         if (un == null) { 
      %>
      <li><a href="dangkyController"><span class="glyphicon glyphicon-log-in"></span> Đăng ký</a></li>
      <li><a href="dangnhapController"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
      <% } else { %>
      <li><a href="logoutController"><span class="glyphicon glyphicon-user"></span> Log out</a></li>
      <li style="color: white;">Xin chào <%= un %></li>
      <% } %>
    </ul>
  </div>
</nav>
<div class="container">
  <h2>Đăng nhập</h2>
  <form action="dangnhapController" method="post">
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" class="form-control" id="username" placeholder="Nhập username" name="txtun">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Nhập password" name="txtpass">
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember"> Lưu tài khoản</label>
    </div>
    <button type="submit" class="btn btn-primary btn-block" name="but" value="Login">Đăng nhập</button>
  </form>
  <% String tb = (String) request.getAttribute("tb"); %>
  <% if (tb != null) { %>
  <div class="alert alert-info">
    <%= tb %>
  </div>
  <% } %>
</div>
</body>
</html>
