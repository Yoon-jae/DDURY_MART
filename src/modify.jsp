<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>    
<%@ include file="getDBInfo.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<% 

// DB로 부터 읽어온 값들을 그대로 value 값에 넣어서 modify할 준비를 만든다.
String email = (String) session.getAttribute("s_EMAIL");
String listIndex = request.getParameter("listIndex");

Connection conn = null;
PreparedStatement pstmt = null;
String Query ="";
ResultSet rs = null;

String itemName = "";
String oldPrice = "";
String newPrice = "";
String itemSpot = "";
String itemExpiredTime = "";
String itemText = "";
String itemImg = "";
String itemStatus = "";

try {
	Class.forName("com.mysql.jdbc.Driver"); 
	conn = DriverManager.getConnection(db_url, db_id, db_pw);

	Query = "select * from itemListTB where db_number= '" + listIndex + "'" ;
	pstmt = conn.prepareStatement(Query);
	rs = pstmt.executeQuery(Query);

	if(rs.next()){
		itemName = rs.getString("db_item_Name");
		oldPrice = rs.getString("db_item_original_price");
		newPrice = rs.getString("db_item_discount_price");
		itemSpot = rs.getString("db_item_spot");
		itemExpiredTime = rs.getString("db_item_time");
		itemExpiredTime = itemExpiredTime.substring(0, itemExpiredTime.length()-5);
		itemText = rs.getString("db_item_text");
		itemImg = rs.getString("db_item_image");
		itemStatus = rs.getString("db_item_status");
	}
	
} catch(Exception e) {
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
<title>Modify Item</title>
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
        <p name="explainContents"><strong>Item List</strong></p>
    </div>
</div>
<div id="wrapper">
    <div id="featured-wrapper">
       <div id="bulletin-format" align="center">
<form action="modify_proc.jsp" method="post" enctype="multipart/form-data">
<table>
  <tr>
   <td>
   <table>
     <tr>
      <td>&nbsp;<input type="hidden" value="<%=listIndex%>" name="listIndex" /></td>
      <td align="center">상품명</td>
      <td><input name="item_name" size="139" type="text" value="<%=itemName%>" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">원가</td>
      <td>
      <input name="item_original_price" type="number" value="<%=oldPrice%>" size="60" maxlength="100">
    &nbsp&nbsp 할인된 가격
      <input name="item_discount_price" type="number" value="<%=newPrice%>" size="60" maxlength="100">
      </td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">위치</td>
      <td><input name="item_spot" type="text" size="139" value="<%=itemSpot%>" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr> 
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">지금부터 마감시간</td>
      <td><input name="item_expiredtime" type="number" value=30 min="30" max="300" step="30" size="139" maxlength="50">분 후</td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	<tr>
      <td>&nbsp;</td>
      <td align="center">상품사진</td>
      <td><input name="item_img" size="139" type="file" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">상품내용</td>
      <td><textarea name="item_contents" cols="139" rows="13"><%=itemText%></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="submit" value="수정">
       <input type="button" value="취소" onclick="window.location ='itemList.jsp'">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </form>
       </div>
    </div>
</div>
<div id="copyright" class="container">
    <p>&copy; Copyrights. All rights reserved. | Yoonjae, Cho <a href="https://github.com/Yoon-jae/DDURY_MART">201202154</a> | Web-programming term project <a href="http://cse.cnu.ac.kr" rel="nofollow"> in CNU</a>.</p>
</div>
</body>
</html>
