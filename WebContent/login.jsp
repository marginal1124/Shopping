<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page 
import = "com.shopping.util.*,java.sql.*,java.util.*" 
%>
<%
session.removeAttribute("cart");
String action = request.getParameter("action");
if(action!=null&&action.equals("login")){
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User u = null;
	try{
		u = User.validate(username, password);
	}catch(UserNotFoundException e){
		out.println("user not found");
		return;
	}catch(PasswordNotCorrectException e){
		out.println("password not found");
		return;
	}
	session.setAttribute("user", u);
	response.sendRedirect("selfService.jsp");		
	
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
<form name="form" action="login.jsp" method="post" >
			<input type="hidden" name="action" value="login"/>
			<table width="750" align="center" border="2">
				<tr>
					<td colspan="2" align="center">�û���¼</td>
				</tr>
				<tr>
					<td>�û�����</td>
					<td>
						<input type=text name="username" size="30" maxlength="10">
					</td>
				</tr>
				<tr>
					<td>���룺</td>
					<td>
						<input type=password name="password" size="15" maxlength="12">
					</td>
				</tr>		
				
				<tr>
					<td></td>
					<td>
						<input type="submit" value="�ύ">
						<input type="reset" value="����">
					</td>
				</tr>
				
			</table>
		</form>
</body>
</html>