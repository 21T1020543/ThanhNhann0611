<%@page import="khachhangmodal.khachhang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myphamModal.mypham"%>
<%@page import="myphamModal.myphambo"%>
<%@page import="loaiModal.loai"%>
<%@page import="loaiModal.loaibo"%>
<%@page import="lichsumodal.lichsubean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Lịch Sử Mua Hàng</title>
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

    .navbar-brand, .navbar-nav .nav-link {
        color: #ffffff !important;
        font-weight: bold;
    }

    .navbar-nav .nav-link:hover {
        background-color: #004080;
        border-radius: 5px;
    }

    .navbar-right li {
        margin-left: 10px;
    }

    .highlighted-text {
        color: #ffffff;
        font-weight: bold;
    }

    .container {
        margin-top: 20px;
    }

    .table-hover tbody tr:hover {
        background-color: #e8f4ff;
    }

    .table-bordered th {
        background-color: #0056b3;
        color: #ffffff;
    }

    .table-bordered td {
        background-color: #ffffff;
    }

    a {
        color: #0056b3;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        color: #004080;
    }

    .btn-primary {
        background-color: #0056b3;
        border: none;
    }

    .btn-primary:hover {
        background-color: #004080;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav me-auto">
      <li class="nav-item"><a class="nav-link active" href="sachController">Trang chủ</a></li>
      <li class="nav-item"><a class="nav-link" href="htgioController">Giỏ hàng </a></li>
      <li class="nav-item"><a class="nav-link" href="xacnhanController">Xác nhận đặt mua</a></li>
      <li class="nav-item"><a class="nav-link" href="lichsuController">Lịch sử mua hàng</a></li>
    </ul>
    <ul class="navbar-nav">
      <% 
      khachhang kh = (khachhang) session.getAttribute("dn");
      if (session.getAttribute("dn") == null) { %>
        <li class="nav-item"><a class="nav-link" href="dangnhapController"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <% } else { %>
        <li class="nav-item"><a class="nav-link" href="logoutController"><span class="glyphicon glyphicon-user"></span> Log out</a></li>
        <li class="highlighted-text">Xin chào <%= kh.getHoten() %></li>
      <% } %>
    </ul>
  </div>
</nav>

<div class="container">
<h5>Danh mục mỹ phẩm</h5>
  <table class="table">
    <tr>
      <td valign="top" width="200px">
        <table class="table table-hover">
          <% 
          ArrayList<loai> dsloai = (ArrayList<loai>) request.getAttribute("dsloai");
          for (loai l : dsloai) { %>
            <tr>
              <td><a href="myphamController?ml=<%= l.getMaLoai() %>"><%= l.getTenLoai() %></a></td>
            </tr>
          <% } %>
        </table>
      </td>
      <td valign="top">
        <table class="table table-bordered">
          <thead>
            <% 
            ArrayList<lichsubean> dsls1 = (ArrayList<lichsubean>) request.getAttribute("dslichsu");
            if (dsls1 != null && dsls1.size() > 0) { %>
              <tr>
                <th>Tên Mỹ Phẩm</th>
                <th>Số lượng mua</th>
                <th>Giá</th>
                <th>Thành tiền</th>
                <th>Ngày mua</th>
                <th>Mã khách hàng</th>
                <th>Trạng thái</th>
              </tr>
            <% } %>
          </thead>
          <tbody>
            <% 
            if (kh != null) {
              ArrayList<lichsubean> dsls = (ArrayList<lichsubean>) request.getAttribute("dslichsu");
              if (dsls != null) {
                for (lichsubean s : dsls) {
                  if (s.getMakh() == kh.getMakh()) { %>
                    <tr>
                      <td><%= s.getTenmp() %></td>
                      <td><%= s.getSoLuongMua() %></td>
                      <td><%= s.getGia() %></td>
                      <td><%= s.getThanhTien() %></td>
                      <td><%= s.getNgayMua() %></td>
                      <td><%= s.getMakh() %></td>
                      <td style="color: #0056b3;"><%= s.isDamua() ? "Đã mua" : "Chờ xác nhận" %></td>
                    </tr>
                  <% } 
                }
              }
            } %>
          </tbody>
        </table>
      </td>
    </tr>
  </table>
</div>

</body>
</html>
