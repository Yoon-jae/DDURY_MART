<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>    
<%@ include file="getDBInfo.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<% 
// Item의 상세한 내용을 여주는 것.
String email = (String) session.getAttribute("s_EMAIL");
String listIndex = request.getParameter("listIndex");

Connection conn = null;
PreparedStatement pstmt = null;
String Query ="";
ResultSet rs = null;

String userMail = "";
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
		userMail = rs.getString("db_mail");
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
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
                <li><a href="#" accesskey="4" title="">Contact Us</a></li>
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
      <td align="center" width="600"><%=itemSpot%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">마감시간</td>
      <td align="center" width="600" id="item-time"><%=itemExpiredTime%>
    	<% if(itemStatus.equals("open")) { %>
		<img src="images/open.jpg" width=40px height=20px>
		<% } else {
		%>
		<img src="images/closed.jpg" width=40px height=20px>
		<%					
	    }				
		%>
	  </td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="100">상품내용</td>
      <td width="700" id="item-content">
	  <div>
	  <img src=<%=itemImg%> width="300" height="300" style="display:inline-block">
	  <div id="mapContainer" width="300" height="300" style="display:inline-block"></div>
	  </div>
	  <br><br><%=itemText%>
	  </td>
      <td width="0">&nbsp;</td>
    </tr>
     <tr><td width="0">&nbsp;</td><td width="399" colspan="2" height="200"></tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="600">
    <input type=button value="목록" onclick="window.location ='itemList.jsp'">
	<%
	if(email.equals(userMail)) {
	%>
		    <input type=button value="수정" onclick="window.location ='modify.jsp?listIndex=<%=listIndex%>'">
		    <input type=button value="삭제" onclick="wantADelete()">
	<%
	}
	%>
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
    <p>&copy; Copyrights. All rights reserved. | Yoonjae, Cho <a href="https://github.com/Yoon-jae/DDURY_MART">201202154</a> | Web-programming term project <a href="http://cse.cnu.ac.kr" rel="nofollow"> in CNU</a>.</p>
</div>
</body>
<script>
function wantADelete() {
	var con = confirm("글을 삭제하시겠습니까?");
	if(con) {
		window.location ='delete.jsp?listIndex=<%=listIndex%>';
	}
}

function initialize(LAT,LANG,ZOOM,ADDR){
      var mapProp = {
         center:new google.maps.LatLng(LAT, LANG),
         zoom: ZOOM,
         panControl:true,
         zoomControl:true,
         mapTypeControl:true,
         scaleControl:true,
         streetViewControl:true,
         overviewMapControl:true,
         rotateControl:true,   
         mapTypeId: google.maps.MapTypeId.ROADMAP
//         mapTypeId: google.maps.MapTypeId.HYBRID
      };
      
      var maps = document.createElement("div");
      maps.setAttribute("style","width:300px;height:300px; float:left;");
	  
      var map = new google.maps.Map(maps, mapProp);
	  
      document.getElementById("mapContainer").appendChild(maps);
      
      placeMarker(new google.maps.LatLng(LAT,LANG));
  
	  function placeMarker(location) {
		var marker = new google.maps.Marker({
            position: location,
            map: map,
            animation:google.maps.Animation.BOUNCE
            // animation:google.maps.Animation.DROP
            // icon:'pinkball.png'
         });

		var infowindow = new google.maps.InfoWindow({
           content: ADDR
	    });
		infowindow.open(map,marker);
	  }

}
   
function draw(addr,lat,lng){
    var latValue = parseFloat(lat);
    var langValue = parseFloat(lng);
    var zoomValue = 15;
    initialize(latValue,langValue,zoomValue,addr);
    // 처음 load시 보이게 하는 것.
    //google.maps.event.addDomListener(window,'load', initialize);
}

function googleapisView() {
    var address = encodeURIComponent('<%=itemSpot%>');
    var geocode = "http://maps.googleapis.com/maps/api/geocode/json?address="+address+"&sensor=false";
    jQuery.ajax({
        url: geocode,
        type: 'POST',
           success: function(myJSONResult){
                    if(myJSONResult.status == 'OK') {
						var ADDR = "";
                        var LAT = "";
						var LNG = "";
                        var i;
                        for (i = 0; i < myJSONResult.results.length; i++) {
						  ADDR = myJSONResult.results[i].formatted_address;
                          LAT = myJSONResult.results[i].geometry.location.lat;
                          LNG = myJSONResult.results[i].geometry.location.lng;
                        }
                        draw(ADDR,LAT,LNG);
                    } else if(myJSONResult.status == 'ZERO_RESULTS') {
                        alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
                    } else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
                        alert("할당량이 초과되었습니다.");
                    } else if(myJSONResult.status == 'REQUEST_DENIED') {
                        alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
                    } else if(myJSONResult.status == 'INVALID_REQUEST') {
                        alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
                    }
            }
    });
}

</script>
<script src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAN1eZtSlGJ8DnTIEtbXPWBAWQsd3HvHOs&sensor=false&callback=googleapisView"></script>

</html>
 