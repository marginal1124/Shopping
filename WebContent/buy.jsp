<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page  import="com.shopping.util.*,java.util.*,java.sql.*" %>  
 
<%

Cart cart = (Cart)session.getAttribute("cart");
if(cart==null){
	cart = new Cart();
	//注意要把新 new  的购物车放入session！！！
	session.setAttribute("cart", cart);
}
User u =  (User) session.getAttribute("user");
%>  
<%
int id = Integer.parseInt(request.getParameter("id"));
Product product = ProductManager.getManager().loadById(id);
CartItem item =  new CartItem();
item.setProductId(id);
if(u==null){
	item.setPrice(product.getNormalPrice());
}else{
	item.setPrice(product.getMemberPrice());
}

item.setCount(1);

cart.addItem(item);

response.sendRedirect("cart.jsp");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title></title>
</head>
<body>

</body>
</html>