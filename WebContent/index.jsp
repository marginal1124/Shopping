
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.shopping.util.*,com.shopping.dao.*"%>
<%
request.setCharacterEncoding("GB18030");
final   int  num =6;
List<Product> latestPro = ProductManager.getManager().latestProduct(num);

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
	response.sendRedirect("index.jsp");		
	
}
%>
<%
List<Category> categorys = Category.getCategories();
List<Category>  topCategory =  new ArrayList<Category>();
System.out.println(categorys.size()+" "+topCategory.size());
for(int i=0;i<categorys.size();i++){
	Category c = categorys.get(i);
	if(c.getGrade()==0)
		topCategory.add(c);
}
%>

<html>
<head>
<me content="zh-cn"></me>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>商城 - 网上精品会员店</title>
<link href="images/new.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/new.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="MM_preloadImages('images/00-2.gif','images/01-2.gif','images/02-2.gif','images/03-2.gif','images/04-2.gif',
		'images/05-2.gif','images/06-2.gif','images/07-2.gif','images/08-2.gif','images/09-2.gif')">
<script src="images/piaochuang.js"></script>
<script src="script/jquery.min.js"></script>
<table align="left" border="0" cellpadding="0" cellspacing="0" width="980">
  <tbody>
    <tr>
      <td><!--显示头部信息程序-->
        <table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <!-- <td width="10"></td>
              <td width="135"><a href="thinkshop.cn.htm"></a></td>
              <td width="50"></td>
              <td width="120"><a target="_blank" href="index_bat.php.htm"><img src="images/dazong.gif" border="0" height="47" width="90"></a></td>
              <td width="120"><a target="_blank" href="happybirthday.php.htm"><img src="images/shenri.gif" border="0" height="47" width="95"></a></td>
              <td width="120"><a target="_blank" href="brandshop.php.htm"><img src="images/pingpai.gif" border="0" height="47" width="96"></a></td>
              <td width="120"><a target="_blank" href="powered by Discuz!.htm"><img src="images/luntan.gif" border="0" height="47" width="95"></a></td>
              <td width="120"><a target="_blank" href="gc.htm"><img src="images/thinkcard.gif" border="0" height="47" width="90"></a></td>
              <td align="right" valign="bottom"><map name="FPMap_inctop">
                  <area href="point_exg.php.htm" shape="rect" coords="13,2,81,16" target="_blank">
                  <area href="my_thinkshop.php.htm" shape="rect" coords="92, 1, 158, 15" target="_blank">
                  <area href="extend.php.htm" shape="rect" coords="170, 0, 233, 16" target="_blank">
                </map>
                <img src="images/top_right.gif" usemap="#FPMap_inctop" border="0" height="22" width="238"></td> -->
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td height="61"><table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td width="6"><img src="images/left.gif" height="35" width="6"></td>
              <td align="left" background="images/topbg.gif" valign="middle" width="897"><table align="left" border="0" cellpadding="0" cellspacing="0" width="713">
                  <tbody>
                    <tr class="style1" align="center">
					
                      <td align="left">
                      
					  		<!-- <a href="" onMouseOver="on_trview(代替c.getId(),'in')">
								<img src="images/00.gif" name="Image0" border="0">
								？？？？？？<span style="color:#FFFFFF">代替c.getName()</span>
							</a>
						 -->
					  </td>
					  
                    </tr>
                  </tbody>
                </table></td>
              <td rowspan="2" align="right" width="77"><a href="shoppingpricebuy.php.htm" target="_blank"><img src="images/gouwu_new.gif" border="0" height="61" width="77"></a></td>
            </tr>
            <tr>
              <td colspan="2"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td rowspan="2" bgcolor="#ededed" width="1"><img src="images/line.gif" height="1" width="1"></td>
                      <td bgcolor="#ffffff" height="1" width="850"><img src="images/line.gif" height="1" width="1"></td>
                    </tr>
                    <tr>
                      <td background="images/topbg2.gif" height="25"><table style="border-collapse: collapse;" class="twoji" border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                          
	                            <tr id="pma_" style="display: none;">
	                              <td style="position: relative; left: 0pt;" height="25" width="100%">
	                              	&nbsp; 
	                              	代替parent.getId()
								  </td>	                              	
	                            </tr>
                          
                          </tbody>
                        </table></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td bgcolor="#dadce8" height="1"><img src="images/line.gif" height="1" width="1"></td>
    </tr>
    <tr>
      <td><table border="0" cellpadding="0" cellspacing="0" width="980">
          <tbody>
            <tr>
              <td bgcolor="#ededed" width="1"><img src="images/line.gif" height="1" width="1"></td>
              <td background="images/topbg3.gif" height="31" width="123">　</td>
              <td align="center" background="images/topbg3.gif" width="28"><img src="images/zoom.gif" height="31" width="20"></td>
              <script>
function Validator_s(theForm)
{
	if (theForm.searchproducttype1.value=="all" && (theForm.searchname.value=="" || theForm.searchname.value=="请输入您所要查找的商品名称") && (theForm.searchcode.value=="" || theForm.searchcode.value=="商品编号"))
	{
		alert(" 请输入查询关键字。");
		theForm.searchname.focus();
		return (false);
	}
}
</script>

<script>
var request;
function secondSearchtype(){
	var id = document.getElementById("category1");
	var selectId = id.options[id.selectedIndex].value;
	
	var url = "getChildCategory.jsp?id="+selectId;
	
		request = new XMLHttpRequest();
	
	
	request.open("GET",url,true);	
	request.onreadystatechange = callback;		
	request.send(null);	
}
function callback(){
	 if(request.readyState==4){
		if(request.status==200){

			$("#category2").empty();
			var json = request.responseText;			
			var res=eval("("+json+")");			
			var category2 = document.getElementById("category2");			
			for(var i=0;i< res.length;i++){
				var opt = document.createElement("option");
				opt.value=res[i].id;
				opt.innerHTML=res[i].name;
				category2.appendChild(opt);
			}
		}		
	 }	
}

</script>
              <form method="post" name="form2"  action="product_search.php" onSubmit="return Validator_s(this)">
              </form>
              <td background="images/topbg3.gif" valign="middle" width="521"><input name="Bsearch" value="Y" type="hidden">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td align="left" valign="middle" width="83%">
                      <select id="category1"  onchange="secondSearchtype()" style="font-size: 9pt;color: rgb(85, 85, 85);">
                          <option selected value=0>--所有商品分类--</option>
                          <%
                         // System.out.println(topCategory.size());
                          for(int i=0;i<topCategory.size();i++){
                        	 Category top = topCategory.get(i);  
                        	
                          %>
                          <option value=<%=top.getId() %>> <%= top.getName() %></option>
                          <%
                          }%>
                        </select>
                        <select id="category2"  style="font-size: 9pt; width:80px ; color: rgb(85, 85, 85);">
                        <option selected value=0>--商品--</option>
                        </select>
                        <!-- <input name="searchname" style="font-size: 9pt; color: rgb(85, 85, 85);" onFocus="if(this.value=='请输入您所要查找的商品名称'){this.value='';}" onBlur="if(this.value==''){this.value='请输入您所要查找的商品名称';}" value="请输入您所要查找的商品名称" size="25" maxlength="30" type="text"> -->
                        <input name="searchcode" style="font-size: 9pt; color: rgb(85, 85, 85);" onFocus="if(this.value=='商品编号'){this.value='';}" onBlur="if(this.value==''){this.value='商品编号';}" value="商品编号" size="8" maxlength="6" type="text">
                        <input src="images/go.gif" style="position: relative; top: 2px;" border="0" height="17" type="image" width="20">
                        &nbsp;<a href="index_search.php.htm"><img src="images/gaoji.gif" style="position: relative; top: 3px;" border="0" height="19" width="66"></a> </td>
                      <td align="left" valign="middle" width="17%"></td>
                    </tr>
                  </tbody>
                </table></td>
              <td align="right" background="images/topbg3.gif" width="306">
              	<!--
              	<iframe name="buysta" src="images/buysta.htm" frameborder="0" height="14" scrolling="no" width="100%"></iframe>
              	-->
              	</td>
              <td bgcolor="#ededed" width="1"></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td valign="top" width="190"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td onMouseOver="on_trview('0','')" align="center" height="40"><img src="images/login.gif" height="39" width="190"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td width="176"><img src="images/loginbg1.gif" height="19" width="188"></td>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td align="center" bgcolor="#e2e4f0"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                  <form method="post" action="login.jsp">
                                  <input type="hidden" name="action"  value="login">
                                  <tbody>
                                    <tr>
                                      <td align="left" height="25" width="73%">会员号：
                                        <input id="heh" name="username" size="10" style="font-size: 12px;" type="text"></td>
                                      <td rowspan="2" width="27%">
                                      	<input src="images/down.gif" name="B1" border="0" height="45" type="image" width="45"></td>
                                    </tr>
                                    <tr>
                                      <td align="left">密　码：
                                        <input name="password" size="10" style="font-size: 11px;" type="password"></td>
                                    </tr>
                                    <tr>
                                      <td colspan="2" height="30"><p align="center">[<a href="register.jsp">新用户注册</a>] &nbsp;</p></td>
                                    </tr>
                                  </tbody>
                                  </form>
                                </table></td>
                            </tr>
                            <tr>
                              <td bgcolor="#aab3d5" height="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><img src="images/tel.gif" height="87" width="190"></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td colspan="3"><img src="images/news.gif" height="32" width="190"></td>
                            </tr>
                            <tr>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td align="center" bgcolor="#e2e4f0"><table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="90%">
                                  <tbody>
                                    <tr>
                                      <td align="left"> 
                                      ·<font color="#cc0000">与舒适办公为伴,让轻松便<br>
                                        &nbsp;携相随(04.20-04.26)</font>&nbsp;<img src="images/hot_gif.gif"><br>
                                        ·精品分呈,彰显不凡品质！<br>
                                        ·神奇与实用并存,星座礼物.<br>
                                        ·无限关爱3m优视灯关爱灯下..<br>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="center" height="10" valign="top"><a href="http://www.thinkshop.cn/sales_info.php?ef=list"><img src="images/more.gif" border="0" height="5" width="158"></a></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#e2e4f0" height="8"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#aab3d5" height="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td colspan="3"><img src="images/jingcai.gif" height="32" width="190"></td>
                            </tr>
                            <tr>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td align="center" bgcolor="#e2e4f0"><table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="90%">
                                  <tbody>
                                    <tr>
                                      <td class="twoji" align="left">·
                                      	文章..<br>
                                        ·3M手机防窥膜,特别的爱给特..<br>
                                        ·梁彦春出任贝尔金中国区总..<br>
                                        ·狂飚300M 802.11n无线路由<br>
                                        ·Pre-N 2代宽带无线路由器<br>
                                        ·金山毒霸杀毒U盘重装上阵<br>
                                        ·数码音频转播器真假说明<br>
                                        ·贝克曼清洁博士系列介绍<br></td>
                                    </tr>
                                    <tr>
                                      <td align="center" height="10" valign="top">                                    
                                      <img src="images/more.gif" border="0" height="5" width="158"></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                              <td rowspan="3" bgcolor="#aab3d5" width="1">
                              <img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#e2e4f0" height="8"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#aab3d5" height="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td bgcolor="#6874bf" valign="top"><input name="qid" value="7" type="hidden">
                        <input value="Y" name="Bsubmit" type="hidden">
                        <table style="border-collapse: collapse;" bordercolorlight="#FF0000" bordercolordark="#FF0000" border="0" bordercolor="#111111" cellpadding="0" cellspacing="0">
                          <!-- <script>function windowOpener0(){controlWindow=window.open('','thinkshop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=100,height=100');}</script>
                          <form action="question.php" method="post" onSubmit="windowOpener0()" target="thinkshop">
                          </form> -->
                          <tbody>
                            <!-- <tr>
                              <td colspan="5"><img src="images/wen_top.gif" height="17" width="190"></td>
                            </tr> -->
                           <!--  <tr>
                              <td rowspan="2" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td rowspan="2" class="wenjuan" width="10">&nbsp;</td>
                              <td class="twoji" bgcolor="#ffffff" height="24" width="168">当您在公共场所使用手机收发短信时，有人正在偷看您的手机屏幕，您有何感觉？</td>
                              <td rowspan="2" class="wenjuan" width="10">&nbsp;</td>
                              <td rowspan="2" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#ffffff" height="80"><input value="22" name="qd_serial" type="radio">
                                非常厌恶这种行为<br>
                                <input value="23" name="qd_serial" type="radio">
                                无所谓，不予理睬<br>
                                <input value="24" name="qd_serial" type="radio">
                                乐意共享我的信息<br>
                                &nbsp;&nbsp;&nbsp;
                                <input src="images/tijiao.gif" border="0" height="20" type="images" width="60">
                                <a href="http://www.thinkshop.cn/question.php?qid=7&amp;Bsubmit=Y" onClick="js_callpage(href);return false"><img src="images/chongxie.gif" border="0" height="20" width="60"></a></td>
                            </tr> -->
                            <tr>
                              <td colspan="5"><img src="images/wen_up.gif" height="30" width="190"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                  </tbody>
                </table></td>
              <td onMouseOver="on_trview('0','')" width="10"></td>
              <td valign="top" width="780"><!-- <map name="FPMap_brand">
                  <area coords="5, 6, 65, 29" shape="rect" href="http://www.thinkshop.cn/index_pma.php?pma_code=21">
                  <area coords="75, 6, 147, 28" shape="rect" href="http://www.thinkshop.cn/brand_belkin.php">
                  <area coords="157, 7, 187, 29" shape="rect" href="http://www.thinkshop.cn/brand_3m.php">
                  <area coords="194, 6, 277, 30" shape="rect" href="http://www.thinkshop.cn/brand_logitech.php">
                  <area coords="353, 6, 417, 28" shape="rect" href="http://www.thinkshop.cn/brandshop.php?brand=%C5%B7%C4%B7%C1%FA">
                  <area coords="423, 5, 499, 29" shape="rect" href="http://www.thinkshop.cn/brandshop.php?brand=%CF%A3%B8%F1%CB%AE%C6%BF">
                  <area coords="507, 5, 597, 28" shape="rect" href="http://www.thinkshop.cn/brandshop.php?brand=%C8%F0%CA%BF%BE%FC%B5%B6">
                  <area coords="607, 6, 690, 28" shape="rect" href="http://www.thinkshop.cn/brandshop.php?brand=%B1%B4%BF%CB%C2%FC%B2%A9%CA%BF">
                  <area coords="696, 4, 774, 29" shape="rect" href="http://www.thinkshop.cn/index_catalog.php?pma_code=8&amp;cat_code=228">
                  <area coords="283, 6, 349, 28" shape="rect" href="http://www.thinkshop.cn/brandshop.php?brand=%C8%F1%BD%DD%CD%F8%C2%E7">
                </map> -->
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td onMouseOver="on_trview('0','')" height="8"></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td bgcolor="#4352af" width="519"><table style="border-collapse: collapse;"
                               border="0" bordercolor="#111111" cellpadding="0" cellspacing="0" height="266" width="519">
                                  <tbody>
                                    <tr>
                                      <td width="100%">
                                      <a style="left: 518px ! important; top: 0px ! important;"
                                       class="abp-objtab visible ontop" href="images/index_banner.swf"></a>
                                        </td>
                                    </tr>
                                  </tbody>
                                </table></td>
                              <td valign="top" width="260"><table bgcolor="#4352af" border="0" cellpadding="0" 
                              cellspacing="0" height="100%" width="100%">
                                  <tbody>
                                    <tr>
                                      <td align="right"><img src="images/newp_top.gif" height="38" width="257"></td>
                                    </tr>
                                    <tr>
                                      <td align="center" bgcolor="#4352af" height="98" valign="top"><table border="0" 
                                      cellpadding="0" cellspacing="0" width="242">
                                          <tbody>
                                            <tr>
                                            <!-- 新增商品 -->
                                              <td align="left" height="118" valign="middle"><span class="white">
                                               <%
                                          		for(int i = 0;i<latestPro.size();i++)
                                         		 {
                                        	  %>
                                              ·<a href="productDetail.jsp?id=<%=latestPro.get(i).getId() %>" class="white"><%=latestPro.get(i).getName() %>&nbsp;&nbsp;&nbsp;&nbsp;会员价：<%=latestPro.get(i).getMemberPrice() %></a><br>
                                                
                                                <%
                                              	  }
                                                %>
                                                </span></td>
                                            </tr>
                                          </tbody>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td align="center" bgcolor="#4352af">
                                      	<table background="images/242-98.gif" border="0" cellpadding="0" cellspacing="0" width="242">
                                          <tbody>
                                            <tr>
                                              <td align="center" height="98" width="138">
                                              	<table style="border-collapse: collapse;" border="0" bordercolor="#111111" cellpadding="0" cellspacing="0" width="90%">
                                                  <tbody>
                                                    <tr>
                                                      <td align="left" height="40"><strong>
                                                     	 <a href="" onClick="return false"><span id="img_title" onClick="javascript:goUrl()">
                                                     	 </span></a></strong></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="left"><p class="white"><span id="img_price1"></span><br>
                                                          <span id="img_price2"></span></p></td>
                                                    </tr>
                                                  </tbody>
                                                </table></td>
                                              <td align="center" height="98" valign="middle" width="104">
                                              	<span onClick="javascript:goUrl()" style="">
                                             	  <img src="images/br0465.gif" id="imgInit" style="border-color: black; color: rgb(0, 0, 0);" name="imgInit" border="0" height="90" width="75">
                                               </span></td>
                                            </tr>
                                            
                                          </tbody>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td align="right"><img src="images/newp_up.gif" height="12" width="260"></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td width="584" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tbody>
                                    <tr>
                                      <td width="10"></td>
                                      <td width="553" valign="top">
									  
									  
									  
									  <table border="0" cellpadding="0" cellspacing="0" width="553">
                                          <tbody>
                                          
                                          <%
                                          for (int i=0; i<10; i += 2) {
                                          	/* Category first = topCategories.get(i);
                                          	Category second = null;
                                          	if((i+1) < topCategories.size()) {
                                          		second = topCategories.get(i+1);
                                          	} */
                                           %>
	                                            <tr>
	                                              <td width="47%">
	                                              	<a href="">
	                                              		11
	                                              	</a>
	                                              </td>
	                                              <td width="7%"></td>
	                                              <td width="46%">
	                                              	<a href="">
	                                              		12
	                                              	</a>
	                                              </td>
	                                            </tr>
	                                            <tr>
	                                              <td class="twoji">
	                                              	13
	                                              </td>
	                                              <td>　</td>
	                                              <td class="twoji">
	                                              14
	                                              </td>
	                                            </tr>
                                           <%
                                           }
                                            %>
                                          </tbody>
                                        </table>
                                      </td>
                                      <td width="20"></td>
                                    </tr>
                                  </tbody>
                              </table></td>
                              <td align="right" valign="top" width="196"><table border="0" cellpadding="0" cellspacing="0" width="196">
                                  <tbody>
                                    <tr>
                                    <!--top  商品-->
                                      <td><img src="images/paihang_top.gif" height="88" width="196"></td>
                                    </tr>
                                    <tr>
                                      <td align="center" background="images/paihang_bg.gif"><table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" width="170">
                                          <tbody>
                                         
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif">最热
                                              &nbsp;&nbsp;&nbsp;&nbsp; 会员价：
                                              </td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                           
                                      
                                          </tbody>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td><img src="images/paihang_up.gif" height="17" width="196"></td>
                                    </tr>
                                    <tr>
                                      <td height="5"></td>
                                    </tr>
                                    
                                  </tbody>
                                </table></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="35" valign="center">
                      	<img src="images/pingpai_new.gif" usemap="#FPMap_brand" border="0" height="31" width="780">
                      </td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
   
    </tr>
  </tbody>
</table>
<script src="images/addnum.htm"></script>
</body>
</html>
