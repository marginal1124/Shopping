
<%@ page language="java" contentType="text/html; charset=GB18030"
import = "com.shopping.util.*"
    pageEncoding="GB18030"%>
<%
User u = (User)session.getAttribute("user");
if(u==null){
	out.println("��δ��¼");
	return;
}	
%>  
 <%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if(action != null && action.trim().equals("userModify")) {
	String username = request.getParameter("username");
	
	String phone = request.getParameter("phone");
	String addr = request.getParameter("address");

	u.setUsername(username);	
	u.setPhone(phone);
	u.setAddr(addr);

	u.update();
	out.println("�޸ĳɹ�");
	return;
}
%>   
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>register</title>
<script language=JavaScript src="script/regcheckdata.js"></script>

</head>
<body>
<form name="form" action="userModify.jsp" method="post" onSubmit="return checkdata()" >
			<input type="hidden" name="action" value="userModify"/>
			<table width="750" align="center" border="2">
				<tr>
					<td colspan="2" align="center">�û��޸�</td>
				</tr>
				<tr>
					<td>�û�����</td>
					<td>
						<input type=text name="username" size="30" maxlength="10"  value=<%=u.getUsername()%>>
					</td>
				</tr>
			<!-- 	<tr>
					<td>���룺</td>
					<td>
						<input type=password name="pwd" size="15" maxlength="12">
					</td>
				</tr> -->
				
				<tr>
					<td>�绰��</td>
					<td>
						<input type=text name="phone" size="30" maxlength="10"  value=<%=u.getPhone() %>>
					</td>
				</tr>		
				<tr>
					<td>��ַ</td>
					<td>
						<textarea rows="5" cols="80" name="address" ><%=u.getAddr() %>
						</textarea>
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