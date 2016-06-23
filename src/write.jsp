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
<form action="write_proc.jsp" method="post" enctype="multipart/form-data">
<table>
  <tr>
   <td>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">상품명</td>
      <td><input name="item_name" size="139" type="text" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">원가</td>
      <td>
      <input name="item_original_price" type="number" size="60" maxlength="100">
    &nbsp&nbsp 할인된 가격
      <input name="item_discount_price" type="number" size="60" maxlength="100">
      </td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">위치</td>
      <td><input name="item_spot" type="text" size="139" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr> 
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">지금부터 마감시간</td>
      <td><input name="item_expiredtime" type="number" min="30" max="300" step="30" value="30" size="139" maxlength="50">분 후</td>
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
      <td><textarea name="item_contents" cols="139" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="submit" value="등록">
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
    <p>&copy; Copyrights. All rights reserved. | Yoonjae, Cho <a href="#">201202154</a> | Web-programming term project <a href="http://cse.cnu.ac.kr" rel="nofollow"> in CNU</a>.</p>
</div>
</body>
</html>
