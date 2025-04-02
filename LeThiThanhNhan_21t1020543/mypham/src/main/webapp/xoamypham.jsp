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
String ms= request.getParameter("ms"); 

g.Xoa(ms);
session.setAttribute("gh", g); 
response.sendRedirect("htgio.jsp"); 


%> 
</body>
</html>