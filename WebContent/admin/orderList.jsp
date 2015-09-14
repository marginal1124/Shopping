<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page 
import = "com.shopping.util.*,java.sql.*,java.util.*" 
%>
<%@ include file="sessionCheck.jsp" %>
<%
final int PAGE_SIZE = 5;

String strPageNum = request.getParameter("pageNum");
int pageNum =1;
if(strPageNum!=null){
	pageNum =Integer.decode(strPageNum);
}
if(pageNum<1)
	pageNum=1;
%>
<% 
//get  users
List<SalesOrder>  orders = new ArrayList<SalesOrder>();
int count = OrderManager.getManager().getOrders(orders,pageNum,PAGE_SIZE);
if(pageNum>count)
	pageNum=1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<table align="center" border="1"
			>
			<tr>
			<td>ID</td>
			<td>username</td>
			<td>addr</td>
			<td>odate</td>
			<td>status</td>
			
			<td></td>
			</tr>
			<%
			for(Iterator<SalesOrder> it = orders.iterator();it.hasNext();){
				SalesOrder so = it.next();	
				/* System.out.println("id"+p.getId()+"name"+p.getName()+"descr"+p.getDescr()+"price"+p.getNormalPrice()+"price"+p.getMemberPrice()+"cid"+p.getCategoryId()); */
			%>
			<tr>
			<td><%=so.getId() %></td>
			<td><%=so.getUser().getUsername() %></td>
			<td><%=so.getAdrr() %></td>			
			<td><%=so.getoDate() %></td>
			<td><%=so.getStatus() %></td>
			
			<td>
			
			<a  href="orderDetail.jsp?id=<%=so.getId() %> "  target="detail">订单明细</a>
			<a  href="orderModify.jsp?id=<%=so.getId() %> " target="detail">订单修改</a>
			</td>
			</tr>
			<%} %>
		</table>
		
		<center>第<%=pageNum %>页&nbsp;共<%=count %>页
		&nbsp;<a href="orderList.jsp?pageNum=<%= 1%>">第一页</a>
		&nbsp;<a href="orderList.jsp?pageNum=<%= pageNum-1%>">上一页</a>
		&nbsp;<a href="orderList.jsp?pageNum=<%= pageNum+1%>">下一页</a>
		&nbsp;<a href="orderList.jsp?pageNum=<%= count%>">最后一页</a>
		
		</center>
</body>
</html>