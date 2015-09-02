<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page 
import = "com.shopping.util.*,java.sql.*,java.util.*" 
%>
<%@ include file="sessionCheck.jsp" %>
<%
//get  users
List<User>  users = User.getUser();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<table style="table-layout: fixed;" align="center" border="0"
			cellpadding="0" cellspacing="0" width="97%">
			<tr>
			<td>ID</td>
			<td>Username</td>
			<td>Phone</td>
			<td>Addr</td>
			<td>Rdate</td>
			<td>处理</td>
			</tr>
			<%
			for(Iterator<User> it = users.iterator();it.hasNext();){
				User u = it.next();		
			%>
			<tr>
			<td><%=u.getId() %></td>
			<td><%=u.getUsername() %></td>
			<td><%=u.getPhone() %></td>
			<td><%=u.getAddr() %></td>
			<td><%=u.getRdate() %></td>
			<td>
			<a  href="userdelete.jsp?id=<%=u.getId()%>"  target="detail">删除</a>
			</td>
			</tr>
			<%} %>
		</table>
</body>
</html>