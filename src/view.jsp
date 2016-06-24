<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>    
<%@ include file="getDBInfo.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<% 
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
            <h1><a href="main.jsp">DDURY MART</a></h1>
            <span>in 궁동</span>
        </div>
        <div id="menu">
            <ul>
                <li><a href="main.jsp" accesskey="1" title="">Homepage</a></li>
                <li class="current_page_item"><a href="itemList.jsp" accesskey="2" title="">Item List</a></li>
                <li><a href="myPage.jsp" accesskey="3" title="">My page</a></li>
                <li><a href="#" accesskey="4" title="">Contact Us</a></li>
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
<table>
  <tr>
   <td>
   <table width="800">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">상품명</td>
      <td align="center" width="600" id="item-name"><%=itemName%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="150">원가 -> 할인된 가격</td>
      <td align="center" width="600" id="item-price"><%=oldPrice%>원 -> <%=newPrice%>원</td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">위치</td>
      <td align="center" width="600"><%=itemSpot%><button id="item-spot">지도보기</button></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">마감시간</td>
      <td align="center" width="600" id="item-time"><%=itemExpiredTime%><span><%=itemStatus%></span></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">상품내용</td>
      <td width="600" id="item-content"><img src=<%=itemImg%> width="300" height="300" float="left"><br><%=itemText%></td>
      <td width="0">&nbsp;</td>
    </tr>
     <tr><td width="0">&nbsp;</td><td width="399" colspan="2" height="200"></tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="600">
    <input type=button value="목록" onclick="window.location ='itemList.jsp'">
    <input type=button value="수정" onclick="window.location ='modify.jsp?listIndex=<%=listIndex%>'">
    <input type=button value="삭제" onclick="window.location ='delete.jsp?listIndex=<%=listIndex%>'">
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
<script>
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: {lat: 37.31, lng: -122.04}
  });
  var geocoder = new google.maps.Geocoder();

  document.getElementById('item-spot').addEventListener('click', function() {
    geocodeAddress(geocoder, map);
  });
}

function geocodeAddress(geocoder, resultsMap) {
  var address = itemSpot;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBB64rUU-Vm8dO2S2RI45g-7yEZW9HkmnA&signed_in=true&callback=initMap"async defer></script>

</html>
 