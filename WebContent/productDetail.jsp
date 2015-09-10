<%@page import="com.shopping.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page  import="com.shopping.util.*,java.util.*,java.sql.*" %>
<%
request.setCharacterEncoding("GB18030");
int productId =Integer.parseInt(request.getParameter("id")) ;
Product  product = ProductManager.getManager().loadById(productId);;
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>add</title>
</head>
<body>
</br>
</br>
</br>

<center>
<table border="1">
<tr>
<td>产品名称</td>

<td>正常价格</td>

<td>会员价格</td>

<td>类别</td>
<td>产品描述</td>
</tr>

<tr>
<td><%=product.getName() %></td>
<td><%=product.getNormalPrice() %></td>
<td><%=product.getMemberPrice() %></td>
<td><%=CategoryDAO.findName(product.getCategoryId())%></td>
<td><%=product.getDescr() %></td>

</tr>
</table>
</br>
</center>
<center>  <a href="buy.jsp?id=<%=productId %>">添加到购物车 </a></center>
</body>
</html>