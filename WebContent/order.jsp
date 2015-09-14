<% request.setCharacterEncoding("GB18030"); %>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page  import="com.shopping.util.*,java.util.*,java.sql.*" %>    
    
<%
Cart cart = (Cart)session.getAttribute("cart");
if(cart==null){
	System.out.println("order:cart == null");
	cart = new Cart();
	session.setAttribute("cart", cart);
}

User  u = (User)session.getAttribute("user");
if(u==null){
	u =new User();
	u.setId(-1);
}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>cart</title>
</head>
<body>
<%
//String addr = new String(request.getParameter("addr").getBytes("ISO-8859-1"),"GB18030");
String addr = request.getParameter("addr");
System.out.println(addr);
SalesOrder so = new SalesOrder();
so.setAdrr(addr);
so.setCart(cart);
so.setUser(u);
so.setoDate(new Timestamp(System.currentTimeMillis()));
so.setStatus(0);
so.save();

%>    
    <center> 下单成功</center>
</body>
</html>