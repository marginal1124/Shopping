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
	out.println("���ﳵΪ��");
%>
</br>
<center>���ﳵ</center>
</br>
<center>
<form action="cartupdate.jsp" method="post">
<table border="1" width=60%>
<td></td>
<td>  ��Ʒ����  </td>
<td> ��Ʒ���� /Ԫ </td>
<td>��Ʒ����  </td>

<%
	for(int i=0;i<items.size();i++){
%>
  <tr><td> ��Ʒ<%=i+1 %> </td>
    <td><%=ProductManager.getManager().loadById(items.get(i).getProductId()).getName() %></td>
    <td> <%=items.get(i).getPrice()%> Ԫ</td>
    <td> 
    <input type="text"  size =4 name="<%="p"+items.get(i).getProductId() %>" value ="<%=items.get(i).getCount()%>">
    </td>

  </tr>
<%
	}
%>
</table>

</br>
<input  type="submit" value="�ύ">
</form>
</center>


</body>
</html>