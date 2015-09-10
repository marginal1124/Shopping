<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page  import="com.shopping.util.*,java.util.*,java.sql.*" %>
<%@ include file="sessionCheck.jsp" %>
<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");

int pageNum =1;

if(action != null && action.trim().equals("simple")) {
	
	String strPageNum = request.getParameter("pageNum");
	if(strPageNum!=null){
		pageNum = Integer.decode(strPageNum);
	}
	
	if(pageNum<=0)
		pageNum =1;
	String keyword = request.getParameter("keyword");
	String [] strCategory = request.getParameterValues("categoryId");
	int [] categoryId = null;
	if(strCategory!=null&&strCategory.length!=0){
		categoryId = new int [strCategory.length];
		for (int i=0;i<strCategory.length;i++){
			categoryId[i] = Integer.parseInt(strCategory[i]);
		}
	}
	
	/* Timestamp startDate ;
	String strSD  = request.getParameter("startDate");
	if(strSD==null||strSD.equals("")){
		startDate = null;
	}else {
		startDate = Timestamp.valueOf(request.getParameter("startDate"));
	}
	
	Timestamp endDate ;
	String strED  = request.getParameter("startDate");
	if(strED==null||strED.equals("")){
		endDate = null;
	}else {
		endDate = Timestamp.valueOf(request.getParameter("endDate"));
	} */

	List<Product> products = new ArrayList<Product>();
	int sumSize = ProductManager.getManager().findProduct(products,categoryId, keyword, -1, 
			                                                        -1, -1, 
			                                                        -1, null, null, pageNum,5);
	
%>
 

<center>搜索结果</center>
	<table align="center" border="1">
			<tr>
			<td>ID</td>
			<td>name</td>
			<td>descr</td>
			<td>normalPrice</td>
			<td>memberPrice</td>
			<td>pdate</td>
			<td>categoryId</td>
			<td></td>
			</tr>
			<%
			for(Iterator<Product> it = products.iterator();it.hasNext();){
				Product p = it.next();		
			%>
			<tr>
			<td><%=p.getId() %></td>
			<td><%=p.getName() %></td>
			<td><%=p.getDescr() %></td>
			<td><%=p.getNormalPrice() %></td>
			<td><%=p.getMemberPrice() %></td>
			<td><%=p.getPdate() %></td>
			<td><%=CategoryDAO.findName(p.getCategoryId()) %></td>
			<td>

			</td>
			</tr>
			<%} %>
		</table>
		<center>
		<%-- <a  href="productSearch.jsp?pageNum=<%=pageNum-1 %>&action=complex&keyword=<%=keyword%>&categoryId=<%=category%>&lowNormalPrice=<%=lowNormalPrice%>&highNormalPrice=<%=highNormalPrice%>&lowMemberPrice=<%=lowMemberPrice%>&highMemberPrice=<%=highMemberPrice%>&startDate=<%=strSD%>&endDate=<%=strED%>">上一页</a>
		&nbsp;<a  href="productSearch.jsp?pageNum=<%=pageNum+1 %>&action=complex&keyword=<%=keyword%>&categoryId=<%=category%>&lowNormalPrice=<%=lowNormalPrice%>&highNormalPrice=<%=highNormalPrice%>&lowMemberPrice=<%=lowMemberPrice%>&highMemberPrice=<%=highMemberPrice%>&startDate=<%=strSD%>&endDate=<%=strED%>">下一页</a> --%>
		&nbsp;共 <%=sumSize %> 页
		</center>
<%
}
%> 
<%
List<Category> categories =Category.getCategories();

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title></title>
<script type="text/javascript">
<!--
	function checkdata(){
		with(document.forms["complex"]){
			if(lowNormalPrice.value==null||lowNormalPrice.value==""){
				lowNormalPrice.value =-1;
			}
			if(highNormalPrice.value==null||highNormalPrice.value==""){
				highNormalPrice.value =-1;
			}
			
			if(lowMemberPrice.value==null||lowMemberPrice.value==""){
				lowMemberPrice.value =-1;
			}
			if(highMemberPrice.value==null||highMemberPrice.value==""){
				highMemberPrice.value =-1;
			}
		}
}

-->
</script>
</head>
<body>

</br>
简单搜索
</br>
<form action="productSimpleSearch.jsp"  method="post">
<input type="hidden" name="action" value="simple">
类别:</br>
<%
for(Iterator<Category> it = categories.iterator();it.hasNext();){
	Category c = it.next();

%>
<input  type="checkbox" name="categoryId" value ="<%=c.getId()%>"><%=c.getName()%></br>

<%
} %>

关键字:<input type ="text" name ="keyword"></br>
<input type ="submit" value ="搜索">
</form>


</body>
</html>