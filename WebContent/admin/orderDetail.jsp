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

�µ��ˣ�<%=so.getUser().getUsername() %>
�µ�ʱ��<%=so.getoDate() %>
��ϸ��
<table border="1" width=60%>
<td></td>  
<td>  ��Ʒ����  </td>
<td>  ��Ʒ���� /Ԫ </td>
<td>  ��Ʒ����  </td>

<%
	List<SalesItem> items = so.getItems();
	for(int i=0;i<items.size();i++)
	{
		SalesItem item = items.get(i);
%>
  <tr><td> ��Ʒ<%=i+1 %> </td>
    <td><%= item.getProduct().getName() %></td>
    <td> <%=item.getUnitprice() %> Ԫ</td>
    <td> <%=item.getCount() %> Ԫ</td>

  </tr>
<%
	}
%>
</table>
</center>