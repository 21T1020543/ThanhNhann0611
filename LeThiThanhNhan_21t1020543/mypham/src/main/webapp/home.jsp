<%@page import="khachhangmodal.khachhang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myphamModal.mypham"%>
<%@page import="myphamModal.myphambo"%>
<%@page import="loaiModal.loai"%>
<%@page import="loaiModal.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Cosmetics</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
        background-color: #f0f8ff; /* Xanh nhạt */
        font-family: 'Arial', sans-serif;
    }

    .navbar {
        background-color: #0056b3; /* Xanh đậm */
    }

    .navbar-brand, .nav-link {
        color: #ffffff !important;
        font-weight: bold;
    }

    .nav-link:hover {
        background-color: #004080;
        border-radius: 5px;
    }

    .container {
        margin-top: 20px;
    }

    .list-group-item a {
        text-decoration: none;
        color: #0056b3;
        font-weight: bold;
    }

    .list-group-item a:hover {
        color: #004080;
    }

    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card-img-top {
        border-radius: 10px 10px 0 0;
        max-height: 200px;
        object-fit: cover;
    }

    .card-title {
        color: #0056b3;
        font-weight: bold;
    }

    .btn-primary {
        background-color: #0056b3;
        border: none;
    }

    .btn-primary:hover {
        background-color: #004080;
    }

    .pagination-container {
        display: flex;
        justify-content: center;
        margin: 20px 0;
    }

    .pagination-container a {
        margin: 0 5px;
        padding: 8px 12px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-decoration: none;
        color: #333;
    }

    .pagination-container a:hover {
        background-color: #0056b3;
        color: white;
        border-color: #0056b3;
    }

    .form-control:focus {
        border-color: #0056b3;
        box-shadow: 0 0 5px #0056b3;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Cosmetics</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item"><a class="nav-link active" href="myphamController">Trang chủ</a></li>
        <li class="nav-item"><a class="nav-link" href="htgioController">Giỏ hàng </a></li>
        <li class="nav-item"><a class="nav-link" href="xacnhanController">Xác nhận đặt mua</a></li>
        <li class="nav-item"><a class="nav-link" href="lichsuController">Lịch sử mua hàng</a></li>
      </ul>
      <ul class="navbar-nav">
        <% if (session.getAttribute("dn") == null) { %>
          <li class="nav-item"><a class="nav-link" href="dangkyController">Đăng ký</a></li>
          <li class="nav-item"><a class="nav-link" href="dangnhapController">Đăng nhập</a></li>
        <% } else { 
          khachhang kh = (khachhang) session.getAttribute("dn"); 
        %>
          <li class="nav-item"><a class="nav-link" href="logoutController">Đăng xuất</a></li>
          <li class="nav-item"><span class="nav-link">Xin chào, <%= kh.getHoten() %></span></li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="row">
    <div class="col-md-2">
      <h5 class="mb-3">Danh mục</h5>
      <ul class="list-group">
        <c:forEach var="l" items="${dsloai}">
          <li class="list-group-item">
            <a href="myphamController?ml=${l.getMaLoai()}">${l.getTenLoai()}</a>
          </li>
        </c:forEach>
      </ul>
    </div>
    <div class="col-md-8">
      <div class="row">
        <% ArrayList<mypham> ds = (ArrayList<mypham>) request.getAttribute("dsmypham");
           for (mypham mp : ds) { %>
          <div class="col-md-4 mb-4">
            <div class="card">
              <img src="<%= mp.getAnh() %>" class="card-img-top" alt="<%= mp.getTenMP() %>">
              <div class="card-body">
                <h5 class="card-title"><%= mp.getTenMP() %></h5>
                <p class="card-text">Giá: <%= mp.getGia() %> VND</p>
                <a href="giohangController?mmp=<%= mp.getMaMP() %>&tmp=<%= mp.getTenMP() %>&gia=<%= mp.getGia() %>" class="btn btn-primary">Mua ngay</a>
              </div>
            </div>
          </div>
        <% } %>
      </div>
    </div>
    <div class="col-md-2">
      <form action="myphamController" method="post" class="form-control p-3">
        <input type="text" name="txttk" placeholder="Tìm kiếm" class="form-control mb-2">
        <button type="submit" name="but1" class="btn btn-primary w-100">Tìm kiếm</button>
      </form>
    </div>
  </div>
</div>

<div class="pagination-container">
  <% int endPValue = (Integer) request.getAttribute("endP");
     String ml = request.getParameter("ml");
     for (int it = 1; it <= endPValue; it++) { %>
    <a href="myphamController?<%= ml != null ? "ml=" + ml + "&" : "" %>index=<%= it %>"><%= it %></a>
  <% } %>
</div>
</body>
</html>
