<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<% 
String email = (String) session.getAttribute("s_EMAIL");
%>
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
<link rel="shortcut icon" href="/DDURY_MART/src/images/mart_favicon.ico" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title> Contact Us</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />

<link href="css/main.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="main.jsp">DDURY MART</a></h1>
			<span>in Daejeon</span>
		</div>
		<div id="menu">
			<ul>
				<li><a href="main.jsp" accesskey="1" title="">Homepage</a></li>
				<li><a href="itemList.jsp" accesskey="2" title="">Item List</a></li>
				<li><a href="myPage.jsp" accesskey="3" title="">My page</a></li>
				<li class="current_page_item"><a href="contactUs.jsp" accesskey="4" title="">Contact Us</a></li>
				<li><a href="logout.jsp" accesskey="5" title="">logout</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="header-featured"> <p id="loginSession"><%=email%> 님 환영합니다.<p></div>
<div id="banner-wrapper">
	<div id="banner" class="container">
		<p name="explainContents"><strong>Contact us</strong></p>
	</div>
</div>
<div id="wrapper">
	<div id="featured-wrapper">
		<div>
			<img src='images/contactUsImg.jpg' width="300" height="300"><br><br>
			<span id="cuNAME">Yoonjae, Cho</span><br><br>
			<span id="cuEMAIL">yoonjae.cho92@gmail.com</span><br><br>
			<span id="cuPHONE">>+82)10-2686-3035</span>
		</div>
	</div>
</div>
<div id="copyright" class="container">
	<p>&copy; Copyrights. All rights reserved. | Yoonjae, Cho <a href="https://github.com/Yoon-jae/DDURY_MART">201202154</a> | Web-programming term project <a href="http://cse.cnu.ac.kr" rel="nofollow"> in CNU</a>.</p>
</div>
</body>
</html>
