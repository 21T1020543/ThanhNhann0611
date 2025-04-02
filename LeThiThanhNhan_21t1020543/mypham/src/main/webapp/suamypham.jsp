<%@page import="giohangmodal.giohangbo"%>
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
 giohangbo g =(giohangbo)session.getAttribute("gh"); 
String mmp= request.getParameter("mmp"); 
String tmp= request.getParameter("tmp"); 
String gia= request.getParameter("gia"); 
String sl= request.getParameter("txtsua"); 
g.Them(mmp,tmp ,Long.parseLong(gia),Long.parseLong(sl)); 
session.setAttribute("gh", g); 
response.sendRedirect("htgio.jsp"); 
%> 
</body>
</html>