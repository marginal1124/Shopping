<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"
    import = "com.shopping.util.*"
%>
    
<%
User u = (User)session.getAttribute("user");
if(u==null){
	out.println("尚未登录");
	return;
}	
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
<a href="userModify.jsp" >修改个人信息</a>&nbsp;&nbsp;&nbsp;
<a href="index.jsp" >跳过</a>
</body>
</html>