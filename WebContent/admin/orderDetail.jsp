<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page 
import = "com.shopping.util.*,java.sql.*,java.util.*" 
%>
<%@ include file="sessionCheck.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderManager.getManager().loadById(id);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>cart</title>
</head>
<center>

下单人：<%=so.getUser().getUsername() %>
下单时间<%=so.getoDate() %>
明细：
<table border="1" width=60%>
<td></td>  
<td>  商品名称  </td>
<td>  商品单价 /元 </td>
<td>  商品数量  </td>

<%
	List<SalesItem> items = so.getItems();
	for(int i=0;i<items.size();i++)
	{
		SalesItem item = items.get(i);
%>
  <tr><td> 商品<%=i+1 %> </td>
    <td><%= item.getProduct().getName() %></td>
    <td> <%=item.getUnitprice() %> 元</td>
    <td> <%=item.getCount() %> 元</td>

  </tr>
<%
	}
%>
</table>
</center>