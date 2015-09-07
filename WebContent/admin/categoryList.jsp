<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page 
import = "com.shopping.util.*,java.sql.*,java.util.*" 
%>
<%@ include file="sessionCheck.jsp" %>
<%
//get  users
List<Category>  categories= Category.getCategories();

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
			<td>name</td>
			<td>pid</td>
			<td>grade</td>
			
			<td></td>
			<td></td>
			</tr>
			<%
			for(Iterator<Category> it = categories.iterator();it.hasNext();){
				Category c = it.next();		
				String preStr ="";
				for(int i=0;i<c.getGrade();i++){
					preStr+="----";
				}
			%>
			
			<tr>
			<td><%=c.getId() %></td>
			<td><%=preStr + c.getName() %></td>
			<%-- <td><%=categories.getDescr() %></td>--%>
			<td><%=c.getPid() %></td>
			<td><%=c.getGrade() %></td> 
			<td>
			<a  href="categoryAdd.jsp?pid=<%=c.getId() %>">添加子类别</a>
			<%
			if(c.isIsleaf()){
			%>
				<a  href="productAdd.jsp?categoryId=<%=c.getId() %>">添加商品</a>
			<% 
			}
			%>
			
			</td>
			<td>
			<a  href="categoryDel.jsp?id=<%=c.getId()%>">Delete</a>
			</td>
			</tr>
			<%} %>
		</table>
</body>
</html>