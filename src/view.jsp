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
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,600,600,700,900" rel="stylesheet" />
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
<table>
  <tr>
   <td>
   <table width="800">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">상품명</td>
      <td width="600" id="item-name"></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="150">원가 -> 할인된 가격</td>
      <td width="600" id="item-price"></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">위치</td>
      <td width="600" id="item-spot"></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">마감시간</td>
      <td width="600" id="item-time"></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">상품내용</td>
      <td width="600" id="item-content"></td>
      <td width="0">&nbsp;</td>
    </tr>
     <tr><td width="0">&nbsp;</td><td width="399" colspan="2" height="200"></tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="600">
    <input type=button value="목록" onclick="window.location ='itemList.jsp'">
    <input type=button value="수정" onclick="window.location ='modify.jsp'">
    <input type=button value="삭제" onclick="window.location ='delete.jsp'">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
       </div>
    </div>
</div>
<div id="copyright" class="container">
    <p>&copy; Copyrights. All rights reserved. | Yoonjae, Cho <a href="#">201202154</a> | Web-programming term project <a href="http://cse.cnu.ac.kr" rel="nofollow"> in CNU</a>.</p>
</div>
</body>
</html>
 