
<%@page import="Tam.CgioHang"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Bán Hàng</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body> 
<form method='post' action ='DatHang.jsp'> 
 
  <label for="name">Tên hàng:</label>
 <input type='text' name='txtth' id="name"  class="form-control" placeholder="Nhâp tên hàng"><br> 

 <label for="gia">Giá:</label>
 <input type='text' name='txtgia' id="gia" class="form-control" placeholder="Nhập giá hàng"><br> 
 <label for="sl">Số lượng:</label>
 <input type='text' name='txtsl' id="sl"  class="form-control" placeholder="Nhâp số lượng hàng"><br> 
   <button type="submit" name="un1" class="btn btn-success">Đặt Hàng</button>
</form> 
Giỏ Hàng
<%String th= request.getParameter("txtth"); 
String gia= request.getParameter("txtgia"); 
String sl= request.getParameter("txtsl"); 
if(th!=null&&gia!=null&&sl!=null){ 
CgioHang g= new CgioHang(); 
//Neu mua hang lan dau 
if(session.getAttribute("gh")==null){ 
session.setAttribute("gh", g);//Tao gio 
} 
//Gian session: gh vao bien: g 
g=(CgioHang)session.getAttribute("gh"); 
//Them hang vao bien: g 
g.Them(th,Integer.parseInt(gia),  
Integer.parseInt(sl)); 
//Luu bien vao session 
session.setAttribute("gh", g); 
} 
//Hien thi do trong session: gh 
if(session.getAttribute("gh")!=null){ 
CgioHang g= new CgioHang(); 
g=(CgioHang)session.getAttribute("gh"); 
int sh=g.ds.size();%> 
<table border='1' width='100%'> 
<%for(int i=0;i<sh;i++){ %> 
<tr> 
<td> 
<%=g.ds.get(i).getTenhang() %> 
</td> 
<td><%=g.ds.get(i).getGia() %></td> 
<td><%=g.ds.get(i).getSoluong() %> 
<form method='post' action='Sua.jsp?th=<%=g.ds.get(i).getTenhang()%>'> 
<input type='text' name='txtsua'> 
<input type='submit' name='tt' value='Sua'> 
</form> 
</td> 
<td><%=g.ds.get(i).getThanhtien()%></td> 
</tr> 
<%}%> 
</table> 
<div align='right'>Tongtien
 : <%=g.Tongtien() %></div> 
<%}%>


</body> 
</html>