<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"
    import = "com.shopping.util.*"
%>
    
<%
User u = (User)session.getAttribute("user");
if(u==null){
	out.println("��δ��¼");
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
<a href="userModify.jsp" >�޸ĸ�����Ϣ</a>&nbsp;&nbsp;&nbsp;
<a href="index.jsp" >����</a>
</body>
</html>