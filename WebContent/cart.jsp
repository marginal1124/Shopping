<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page  import="com.shopping.util.*,java.util.*,java.sql.*" %>    
    
<%
Cart cart = (Cart)session.getAttribute("cart");
if(cart==null){
	System.out.println("cart == null");
	cart = new Cart();
	session.setAttribute("cart", cart);
}
List<CartItem>  items = cart.getItem();

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>cart</title>
</head>
<body>
<%
if(cart==null)
	out.println("购物车为空");
%>
</br>
<center>购物车</center>
</br>
<center>
<form action="cartupdate.jsp" method="post">
<table border="1" width=60%>
<td></td>
<td>  商品名称  </td>
<td> 商品单价 /元 </td>
<td>商品数量  </td>

<%
	for(int i=0;i<items.size();i++){
		Product p =ProductManager.getManager().loadById(items.get(i).getProductId());
%>
  <tr><td> 商品<%=i+1 %> </td>
    <td><%=p.getName() %></td>
    <td> <%=items.get(i).getPrice() %> 元</td>
    <td> 
    <input type="text"  size =4 name="<%="p"+items.get(i).getProductId() %>" value ="<%=items.get(i).getCount()%>" >
    </td>

  </tr>
<%
	}
%>
</table>
 共 <%=Math.round(cart.getTotalSum()*100)/100%> 元
</br>
<input  type="submit" value="确认修改数量">
<input  type="button" value="确认订单"  onclick="submitCart()">
</form>
</center>

<script type="text/javascript">
function submitCart(){
	document.location.href="confirm.jsp";
}

</script>
</body>
</html>