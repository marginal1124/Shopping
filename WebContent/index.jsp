<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.shopping.util.*,com.shopping.dao.*"%>
<%
request.setCharacterEncoding("GB18030");
final   int  num =6;
List<Product> latestPro = ProductManager.getManager().latestProduct(num);

%>

<html>
<head>
<me content="zh-cn"></me>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�̳� - ���Ͼ�Ʒ��Ա��</title>
<link href="images/new.css" rel="stylesheet" type="text/css">

<!-- <script language="JavaScript">
var imgUrl=new Array();
var imgLink=new Array();
var imgTitle=new Array();
var imgPrice1=new Array();
var imgPrice2=new Array();
var adNum=0;imgUrl[1]='http://www.thinkshop.cn/pimages/br0465.gif';
	imgLink[1]='index_pi.php?productcode=BR0465';
	imgTitle[1]='��������ñʼǱ����Ա�Я������ɫ��ϥ���ͣ�';
	imgPrice1[1]='�۸񣺣�339.00';
	imgPrice2[1]='��Ա�۸񣺣�319.00';imgUrl[2]='http://www.thinkshop.cn/pimages/br0461.gif';
	imgLink[2]='index_pi.php?productcode=BR0461';
	imgTitle[2]='��������ñʼǱ����Я������ɫ�������ͣ�';
	imgPrice1[2]='�۸񣺣�339.00';
	imgPrice2[2]='��Ա�۸񣺣�319.00';imgUrl[3]='http://www.thinkshop.cn/pimages/gt1176.gif';
	imgLink[3]='index_pi.php?productcode=GT1176';
	imgTitle[3]='��������ñʼǱ���Я�ڴ�������';
	imgPrice1[3]='�۸񣺣�369.00';
	imgPrice2[3]='��Ա�۸񣺣�359.00';imgUrl[4]='http://www.thinkshop.cn/pimages/gt0873.gif';
	imgLink[4]='index_pi.php?productcode=GT0873';
	imgTitle[4]='3M 14.1 ���Է���Ƭ';
	imgPrice1[4]='�۸񣺣�459.00';
	imgPrice2[4]='��Ա�۸񣺣�449.00';var imgPre=new Array();
var j=0;
for (i=1;i<imgUrl.length;i++) {
if( (imgUrl[i]!="") && (imgLink[i]!="") ) {
j++;
} else {
break;
}
}

function playTran(){
	if (document.all)
	imgInit.filters.revealTrans.play();
}

var key=0;

function nextAd(){
	if(adNum<j)adNum++ ;
	else adNum=1;

	if( key==0 ){
		key=1;
	} else if (document.all){
		imgInit.filters.revealTrans.Transition=10;
		imgInit.filters.revealTrans.apply();
 		playTran();
	}
	document.images.imgInit.src=imgUrl[adNum];
	document.images.imgInit.title=imgTitle[adNum];
	img_title.innerHTML='<font color=#FFFFff>'+imgTitle[adNum]+'</font>';
	img_price1.innerHTML=imgPrice1[adNum];
	img_price2.innerHTML=imgPrice2[adNum];
	theTimer=setTimeout("nextAd()", 6000);
}

function goUrl(){
jumpUrl=imgLink[adNum];
jumpTarget='_blank';
if (jumpUrl != ''){
if (jumpTarget != '')
window.open(jumpUrl,jumpTarget);
else
location.href=jumpUrl;
}
}
</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/new.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="MM_preloadImages('images/00-2.gif','images/01-2.gif','images/02-2.gif','images/03-2.gif','images/04-2.gif',
		'images/05-2.gif','images/06-2.gif','images/07-2.gif','images/08-2.gif','images/09-2.gif')">
<script src="images/piaochuang.js"></script>
<table align="left" border="0" cellpadding="0" cellspacing="0" width="980">
  <tbody>
    <tr>
      <td><!--��ʾͷ����Ϣ����-->
        <table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td width="10"></td>
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
                <img src="images/top_right.gif" usemap="#FPMap_inctop" border="0" height="22" width="238"></td>
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
                      
					  		<a href="" onMouseOver="on_trview(����c.getId(),'in')">
								<!--<img src="images/00.gif" name="Image0" border="0">-->
								������������<span style="color:#FFFFFF">����c.getName()</span>
							</a>
						
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
	                              	����parent.getId()
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
              <td background="images/topbg3.gif" height="31" width="123">��</td>
              <td align="center" background="images/topbg3.gif" width="28"><img src="images/zoom.gif" height="31" width="20"></td>
              <script>
function Validator_s(theForm)
{
	if (theForm.searchproducttype1.value=="all" && (theForm.searchname.value=="" || theForm.searchname.value=="����������Ҫ���ҵ���Ʒ����") && (theForm.searchcode.value=="" || theForm.searchcode.value=="��Ʒ���"))
	{
		alert(" �������ѯ�ؼ��֡�");
		theForm.searchname.focus();
		return (false);
	}
}
</script>
              <form method="post" action="product_search.php" onSubmit="return Validator_s(this)">
              </form>
              <td background="images/topbg3.gif" valign="middle" width="521"><input name="Bsearch" value="Y" type="hidden">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td align="left" valign="middle" width="83%"><select name="searchproducttype1" style="font-size: 9pt; color: rgb(85, 85, 85);">
                          <option selected="selected" value="all">--������Ʒ--</option>
                          <option value="21">ThinkPad���</option>
                          <option value="5">�ʼǱ����</option>
                          <option value="4">�ʼǱ���</option>
                          <option value="2">��������</option>
                          <option value="20">�����豸</option>
                          <option value="22">����ר��</option>
                          <option value="12">������Ʒ</option>
                          <option value="23">AV����</option>
                          <option value="3">�칫����</option>
                          <option value="8">������Ʒ</option>
                          <option value="24">���ϴ��</option>
                          <option value="26">��ѣ����</option>
                          <option value="1">���޷���</option>
                        </select>
                        <input name="searchname" style="font-size: 9pt; color: rgb(85, 85, 85);" onFocus="if(this.value=='����������Ҫ���ҵ���Ʒ����'){this.value='';}" onBlur="if(this.value==''){this.value='����������Ҫ���ҵ���Ʒ����';}" value="����������Ҫ���ҵ���Ʒ����" size="25" maxlength="30" type="text">
                        <input name="searchcode" style="font-size: 9pt; color: rgb(85, 85, 85);" onFocus="if(this.value=='��Ʒ���'){this.value='';}" onBlur="if(this.value==''){this.value='��Ʒ���';}" value="��Ʒ���" size="8" maxlength="6" type="text">
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
                                  <form method="post" action="Login.jsp">
                                  
                                  <tbody>
                                    <tr>
                                      <td align="left" height="25" width="73%">��Ա�ţ�
                                        <input name="username" size="10" style="font-size: 12px;" type="text"></td>
                                      <td rowspan="2" width="27%">
                                      	<input src="images/down.gif" name="B1" border="0" height="45" type="image" width="45"></td>
                                    </tr>
                                    <tr>
                                      <td align="left">�ܡ��룺
                                        <input name="password" size="10" style="font-size: 11px;" type="password"></td>
                                    </tr>
                                    <tr>
                                      <td colspan="2" height="30"><p align="center">[<a href="Register.jsp">���û�ע��</a>] &nbsp;[<a href="passwdview.php.htm" onClick="js_callpage(href);return false">��������</a>]</p></td>
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
                                      ��<font color="#cc0000">�����ʰ칫Ϊ��,�����ɱ�<br>
                                        &nbsp;Я����(04.20-04.26)</font>&nbsp;<img src="images/hot_gif.gif"><br>
                                        ����Ʒ�ֳ�,���Բ���Ʒ�ʣ�<br>
                                        ��������ʵ�ò���,��������.<br>
                                        �����޹ذ�3m���ӵƹذ�����..<br>
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
                                      <td class="twoji" align="left">��
                                      	����..<br>
                                        ��3M�ֻ�����Ĥ,�ر�İ�����..<br>
                                        �����崺���α������й�����..<br>
                                        �����300M 802.11n����·��<br>
                                        ��Pre-N 2���������·����<br>
                                        ����ɽ����ɱ��U����װ����<br>
                                        ��������Ƶת�������˵��<br>
                                        ����������಩ʿϵ�н���<br></td>
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
                              <td class="twoji" bgcolor="#ffffff" height="24" width="168">�����ڹ�������ʹ���ֻ��շ�����ʱ����������͵�������ֻ���Ļ�����кθо���</td>
                              <td rowspan="2" class="wenjuan" width="10">&nbsp;</td>
                              <td rowspan="2" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#ffffff" height="80"><input value="22" name="qd_serial" type="radio">
                                �ǳ����������Ϊ<br>
                                <input value="23" name="qd_serial" type="radio">
                                ����ν���������<br>
                                <input value="24" name="qd_serial" type="radio">
                                ���⹲���ҵ���Ϣ<br>
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
                                            <!-- ������Ʒ -->
                                              <td align="left" height="118" valign="middle"><span class="white">
                                               <%
                                          		for(int i = 0;i<latestPro.size();i++)
                                         		 {
                                        	  %>
                                              ��<a href="productDetail.jsp?id=<%=latestPro.get(i).getId() %>" class="white"><%=latestPro.get(i).getName() %>&nbsp;&nbsp;&nbsp;&nbsp;��Ա�ۣ�<%=latestPro.get(i).getMemberPrice() %></a><br>
                                                
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
	                                              <td>��</td>
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
                                    <!--top  ��Ʒ-->
                                      <td><img src="images/paihang_top.gif" height="88" width="196"></td>
                                    </tr>
                                    <tr>
                                      <td align="center" background="images/paihang_bg.gif"><table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" width="170">
                                          <tbody>
                                         
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif">����
                                              &nbsp;&nbsp;&nbsp;&nbsp; ��Ա�ۣ�
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
