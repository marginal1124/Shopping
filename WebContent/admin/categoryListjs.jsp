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
<script language="javascript" src="script/TV20.js"></script>

<title>Insert title here</title>
</head>
<body>
	<script language="javascript">
<!--
  addNode(-1,0,"hehe","images/top.gif");
	addNode(0,1,"haha","images/top.gif");
	addNode(0,2,"haha","images/top.gif");
	addNode(1,3,"haha","images/top.gif");
	addNode(1,4,"haha","images/top.gif");
	addNode(2,5,"haha","images/top.gif");
	addNode(2,6,"haha","images/top.gif");
	showTV();
-->
</script>
</body>
</html>