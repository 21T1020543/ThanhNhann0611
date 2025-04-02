<%@page import="Tam.CgioHang"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
CgioHang g=(CgioHang)session.getAttribute("gh"); 
String th= request.getParameter("th"); 
String sl= request.getParameter("txtsua"); 
g.Them(th, 111,Integer.parseInt(sl)); 
session.setAttribute("gh", g); 
response.sendRedirect("DatHang.jsp"); 
%> 
</body>
</html>