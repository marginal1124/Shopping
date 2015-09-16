
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.shopping.util.*,com.shopping.dao.*,java.util.*,java.io.PrintWriter.*"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
System.out.println("id:"+id);
Category  c =CategoryDAO.loadById(id);
List<Category> childscategory = c.getChild(id);
StringBuffer str = new StringBuffer("[");
for(int i=0;i<childscategory.size();i++){
	Category child =childscategory.get(i);
	if(i<childscategory.size()-1){
		str.append("{\"id\":"+"\""+child.getId()+"\","+"\"name\":"+"\""+child.getName()+"\"}"+",");
	}else
		str.append("{\"id\":"+"\""+child.getId()+"\","+"\"name\":"+"\""+child.getName()+"\"}]");	
}
response.setContentType("text/html;charset=gbk");
response.setHeader("Cache-Control", "no-store"); //HTTP1.1
response.setHeader("Pragma", "no-cache"); //HTTP1.0
response.setDateHeader("Expires", 0); //prevents catching at proxy server
//String json = "({username:" + username + ",age:" + age });
//String json =  "{\"age\":\"22\",\"name\":\"wsk\"}";
System.out.println(str);
response.getWriter().write(str.toString()); 

%>
