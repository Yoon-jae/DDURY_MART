<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>    
<%@ include file="getDBInfo.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<% 
String email = (String) session.getAttribute("s_EMAIL");
Connection conn = null;
PreparedStatement pstmt = null;
String Query ="";
ResultSet rs = null;

int listLength = 0;

try {
	Class.forName("com.mysql.jdbc.Driver"); 
	conn = DriverManager.getConnection(db_url, db_id, db_pw);

	Query = "select count(*) from itemListTB" ;
	pstmt = conn.prepareStatement(Query);
	rs = pstmt.executeQuery(Query);

	if(rs.next()){
			listLength = rs.getInt(1);
	}
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title> Welcome to DDURRY MART</title>
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
			<h1><a href="main.jsp">DDURY MART</a></h1>
			<span>in 궁동</span>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="main.jsp" accesskey="1" title="">Homepage</a></li>
				<li><a href="itemList.jsp" accesskey="2" title="">Item List</a></li>
				<li><a href="myPage.jsp" accesskey="3" title="">My page</a></li>
				<li><a href="contactUs.jsp" accesskey="4" title="">Contact Us</a></li>
				<li><a href="logout.jsp" accesskey="5" title="">logout</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="header-featured-main"> <p id="loginSession"><%=email%> 님 환영합니다.<p></div>
<div id="banner-wrapper">
	<div id="banner" class="container">
		<p>여기는 <strong>떠리마트</strong>입니다.</p>
	</div>
</div>
<div id="wrapper">
	<div id="featured-wrapper">
		<div id="featured" class="container">
<%
				
	Query = "select * from itemListTB order by db_number desc" ;
	pstmt = conn.prepareStatement(Query);
	rs = pstmt.executeQuery(Query);
	int columnIndex = 1;
		while(rs.next() && columnIndex<=4) {
			int listIndex = rs.getInt(1);
			String status = rs.getString(3);
			if(status.equals("closed")) continue;
			String name = rs.getString(4);
			String originalPrice = rs.getString(5);
			String discountPrice = rs.getString(6);
			String imgpath = rs.getString(7);
			String spot = rs.getString(8);
			String time = rs.getString(9);
			String text = rs.getString(11);
				
			Date now = new Date();
			String oldstring = time;
			Date expired = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldstring);
						
			time = time.substring(0, time.length()-5);
%>
			<div class="column<%=columnIndex%>" float="inline-block"> <a href="view.jsp?listIndex=<%=listIndex%>"><span class="icon"><img src="<%=imgpath%>" style="width:150px; height:150px"></span>
				<div class="title">
					<h2><%=name%></h2>
				</div>
				<p><%=text%></p>
			</div>
<%
					columnIndex++;
		}
%>
		</div>
	</div>
</div>
<%
		rs.close();
		pstmt.close();
		conn.close();
	}  catch(Exception e) {
		e.printStackTrace();
		out.println(e.getMessage());
	} finally {
		if (rs!= null) {
				rs.close();
		}  
		if (pstmt!= null) {
				pstmt.close();
		}

		if (conn!= null) {
				conn.close();
		}

	}
%>
<div id="copyright" class="container">
	<p>&copy; Copyrights. All rights reserved. | Yoonjae, Cho <a href="https://github.com/Yoon-jae/DDURY_MART">201202154</a> | Web-programming term project <a href="http://cse.cnu.ac.kr" rel="nofollow"> in CNU</a>.</p>
</div>
</body>
</html>