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
				<li class="current_page_item"><a href="itemList.jsp" accesskey="2" title="">Item List</a></li>
				<li><a href="myPage.jsp" accesskey="3" title="">My page</a></li>
				<li><a href="contactUs.jsp" accesskey="4" title="">Contact Us</a></li>
				<li><a href="logout.jsp" accesskey="5" title="">logout</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="header-featured"> <p id="loginSession"><%=email%> 님 환영합니다.<p></div>
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
               
 			    <td width="50">글번호</td>
				<td width="100">상태</td>
                <td width="100">상품명</td>
                <td width="150">원가->할인가격</td>
                <td width="100">위치</td>
                <td width="100">마감시간</td>
                
                <td width="7"><img src="images/table_right.jpg" width="5" height="30" /></td>
                </tr>
                
				<%
				
				Query = "select * from itemListTB order by db_number desc" ;
				pstmt = conn.prepareStatement(Query);
				rs = pstmt.executeQuery(Query);
				if(listLength == 0) {
				%>
					 		<tr align="center" bgcolor="#FFFFFF" height="30">
							<td colspan="8">등록된 글이 없습니다.</td>
							</tr>	
							<%
				} else {
					while(rs.next()) {
						int listIndex = rs.getInt(1);
						String status = rs.getString(3);
						String name = rs.getString(4);
						String originalPrice = rs.getString(5);
						String discountPrice = rs.getString(6);
						String spot = rs.getString(8);
						String time = rs.getString(9);
						
						Date now = new Date();
						String oldstring = time;
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						sdf.setTimeZone ( TimeZone.getTimeZone ( "Asia/Seoul" ) );
						Date strDate = sdf.format(now);
						Date expired = sdf.format(oldstring);
						out.println("<script>console.log('expire: "+expired+"')</script>");
						out.println("<script>console.log('now: "+strDate+"')</script>");
						
						if(expired.getTime() - now.getTime() <= 0) {
							status = "closed";
							String Query2 = "update itemListTB set db_item_status='closed' where db_number = " + listIndex;
							PreparedStatement pstmt2 = conn.prepareStatement(Query2);
							pstmt2.executeUpdate();
							pstmt2.close();
						}
						
						time = time.substring(0, time.length()-5);
				%>
				<tr height="25" align="center">
					<td>&nbsp;</td>
					<td align="center"><a href="view.jsp?listIndex=<%=listIndex%>"><%=listIndex%></td>
					<td align="center"><%=status%></td>
					<td align="center"><a href="view.jsp?listIndex=<%=listIndex%>"><%=name%></td>
					<td align="center"><%=originalPrice%><span>-></span> <%=discountPrice%></td>
					<td align="center"><a href="view.jsp?listIndex=<%=listIndex%>"><%=spot%></td>
					<td align="center"><%=time%></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#D2D2D2"><td colspan="8"></td></tr>
				<%
					}
				}
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
