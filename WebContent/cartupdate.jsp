<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page  import="com.shopping.util.*,java.util.*,java.sql.*" %>    
    
<%
Cart cart = (Cart)session.getAttribute("cart");
if(cart==null){
	cart = new Cart();
	session.setAttribute("cart", cart);
}
List<CartItem>  items = cart.getItem();

for(int i=0;i<items.size();i++){
	
	CartItem item = items.get(i);
	String strCount = request.getParameter("p"+item.getProductId());
	System.out.println(strCount);
	if(strCount!=null&&strCount.length()!=0){
		item.setCount(Integer.parseInt(strCount));
		System.out.println(Integer.parseInt(strCount));
	}
}
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>update</title>
</head>
<body>
修改成功
<script type="text/javascript">
function go(){
	document.location.href="cart.jsp";
}

setTimeout(go,1000);
</script>

</body>
</html>