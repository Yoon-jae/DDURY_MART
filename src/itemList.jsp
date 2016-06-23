<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Escalier 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20131022
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title> Item List</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="css/normailize.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="#">DDURY MART</a></h1>
			<span>in 궁동</span>
		</div>
		<div id="menu">
			<ul>
				<li><a href="main.jsp" accesskey="1" title="">Homepage</a></li>
				<li><a href="aboutUs.jsp" accesskey="2" title="">About Us</a></li>
				<li class="current_page_item"><a href="itemList.jsp" accesskey="3" title="">Item List</a></li>
				<li><a href="myPage.jsp" accesskey="4" title="">My page</a></li>
				<li><a href="#" accesskey="5" title="">Contact Us</a></li>
				<li><a href="logout.jsp" accesskey="6" title="">logout</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="header-featured"> </div>
<div id="banner-wrapper">
	<div id="banner" class="container">
		<p><strong>Item List</strong></p>
	</div>
</div>
<div id="wrapper">
	<div id="featured-wrapper">
	   <div id="bulletin-format" align="center">
	       <table width="60%" cellpadding="0" cellspacing="0" border="0">
                <tr height="5"><td width="5"></td></tr>
                <tr style="background:url('images/table_mid.jpg') repeat-x; text-align:center;">
                <td width="5"><img src="images/table_left.jpg" width="5" height="30" /></td>
                <td width="50">상태</td>
                <td width="100">상품명</td>
                <td width="50">원가->할인가격</td>
                <td width="100">위치</td>
                <td width="100">마감시간</td>
                <td width="50">글번호</td>
                
                <td width="7"><img src="images/table_right.jpg" width="5" height="30" /></td>
                </tr>
                <tr height="25" align="center"></tr>
           </table>
 
           <table width="60%" cellpadding="0" cellspacing="0" border="0">
                <tr width="100%"><td colspan="4" height="5" width="0"></td></tr>
                <tr align="center"><td><input type="button" value="글쓰기" onclick="window.location ='write.jsp'"></td></tr>
           </table>
	   </div>
	</div>
</div>
<div id="copyright" class="container">
	<p>&copy; Copyrights. All rights reserved. | Yoonjae, Cho <a href="#">201202154</a> | Web-programming term project <a href="http://cse.cnu.ac.kr" rel="nofollow"> in CNU</a>.</p>
</div>
</body>
</html>
