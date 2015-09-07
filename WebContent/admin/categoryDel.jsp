<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page  import="com.shopping.util.*" %>
<%@ include file="sessionCheck.jsp" %>
<%
int id =Integer.parseInt(request.getParameter("id"));
Category.deleteCategory(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>delete</title>
</head>
<body>
删除成功
<script type="text/javascript">
//window.parent.main.document.location.reload();

</script>
</body>
</html>