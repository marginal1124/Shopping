<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page 
import = "com.shopping.util.*,java.sql.*,java.util.*" 
%>
<%@ include file="sessionCheck.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderManager.getManager().loadById(id);
String action =  request.getParameter("action");
if(action!=null&&action.equals("modify")){
	String strStatus =  request.getParameter("status");
	int status = Integer.parseInt(strStatus);
	so.setStatus(status);
	so.updateStatus();
}
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
<form action="orderModify.jsp" method ="post">
<input type="hidden" name="action" value="modify">
<input type="hidden" name="id" value="<%=id %>">
<select name = "status">
<option value="0">δ����</option>
<option value="1">�Ѵ���</option>
<option value="2">�ϵ�</option>
</select>
</br>
<input type="submit" value="�ύ">
</form>

</center>