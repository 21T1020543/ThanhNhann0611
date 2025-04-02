<%@page import="khachhangmodal.khachhang"%>
<%@page import="giohangmodal.hang"%>
<%@page import="giohangmodal.giohangbo"%>
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
  <title>Quản Lý Giỏ Hàng</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>

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

<div class="container mt-4">
  <div class="row">
    <!-- Danh mục -->
    <div class="col-md-3">
      <h5>Danh mục mỹ phẩm</h5>
      <ul class="list-group category-list">
        <% 
          ArrayList<loai> dsloai = (ArrayList<loai>) request.getAttribute("dsloai");
          for (loai l : dsloai) { 
        %>
          <li class="list-group-item">
            <a href="myphamController?ml=<%= l.getMaLoai() %>"><%= l.getTenLoai() %></a>
          </li>
        <% } %>
      </ul>
    </div>

    <!-- Giỏ hàng -->
    <div class="col-md-6">
      <h5>Giỏ hàng</h5>
      <form action="tamController2" method="post">
        <table class="table table-hover">
          <thead class="table-dark">
            <tr>
              <th>Chọn</th>
              <th>Tên mỹ phẩm</th>
              <th>Giá</th>
              <th>Số lượng</th>
              <th>Thành tiền</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody>
            <% 
              giohangbo gh = (giohangbo) session.getAttribute("gh");
              if (gh != null) {
                for (hang h : gh.ds) { 
            %>
              <tr>
                <td>
                  <input type="checkbox" name="ck" value="<%= h.getMamp() %>">
                </td>
                <td><%= h.getTenmp() %></td>
                <td><%= h.getGia() %></td>
                <td>
                  <input type="number" name="<%= h.getMamp() %>" value="<%= h.getSoluong() %>" style="width: 60px;">
                </td>
                <td><%= h.getThanhtien() %></td>
                <td>
                  <button type="submit" name="butsua" value="<%= h.getMamp() %>" class="btn btn-link">Sửa</button>
                  <a href="tamController2?mmp=<%= h.getMamp() %>" class="btn btn-danger btn-sm">Xóa</a>
                </td>
              </tr>
            <% 
                } 
              } 
            %>
          </tbody>
        </table>
        <div class="d-flex justify-content-between">
          <span><strong>Tổng cộng:</strong> <%= gh != null ? gh.Tong() : 0 %></span>
          <input type="submit" name="butxoa" value="Xóa" class="btn btn-warning">
        </div>
      </form>

      <form action="xacnhanController" method="post" class="mt-3">
        <button type="submit" name="butxacnhan" class="btn btn-primary">Xác nhận</button>
      </form>
    </div>

    <!-- Tìm kiếm -->
    <div class="col-md-3">
      <h5>Tìm kiếm</h5>
      <form action="myphamController" method="post">
        <input type="text" name="txttk" class="form-control mb-2" placeholder="Nhập từ khóa">
        <button type="submit" name="but1" class="btn btn-primary w-100">Tìm kiếm</button>
      </form>
    </div>
  </div>
</div>

</body>
</html>