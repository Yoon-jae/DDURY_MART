<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import = "java.sql.*" %>    
<%@ include file="getDBInfo.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
request.setCharacterEncoding("utf-8");
String email = (String) session.getAttribute("s_EMAIL");
  
String savePath = application.getRealPath("/src/userImages");
int sizeLimit = 100 * 1024 * 1024;

String name="";
String originalPrice;
String discountPrice;
String spot="";
String time="";
String img="";
String text="";

Connection conn = null;
PreparedStatement pstmt = null;
String Query ="";

ResultSet rs = null;

try{	
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		String itemName = multi.getParameter("item_name");
		String itemOriginalPrice = multi.getParameter("item_original_price");
		String itemDiscountPrice = multi.getParameter("item_discount_price");
		String itemSpot = multi.getParameter("item_spot");
		String itemTime = multi.getParameter("item_expiredtime");
		String itemText = multi.getParameter("item_contents");
		
		String fileName = multi.getFilesystemName("item_img");
		String itemImg = "/userImages/" + fileName;
		
		Class.forName("com.mysql.jdbc.Driver"); 

		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		
		Query = "insert into itemListTB (db_mail, db_item_status, db_item_Name, db_item_original_price, db_item_discount_price, db_item_image, db_item_spot, db_item_time) values (?,?,?,?,?,?,?,?)" ;
		pstmt = conn.prepareStatement(Query);
		
		out.println(email);
		out.println(itemName);
		out.println(itemOriginalPrice);
		out.println(itemDiscountPrice);
		out.println(itemSpot);
		out.println(itemTime);
		out.println(itemText);
		out.println(itemImg);
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone ( TimeZone.getTimeZone ( "Asia/Seoul" ) );

		Calendar cal = Calendar.getInstance();
		cal.setTime(now);

		String currentTime = sdf.format(cal.getTime());
		out.println("현재시간 : " + currentTime);
		
		cal.add(Calendar.MINUTE, Integer.parseInt(itemTime));
		String addTime = sdf.format(cal.getTime());
		out.println("더해진 시간 : " + addTime);
		
		pstmt.setString(1,email);
		pstmt.setString(2,"open");
		pstmt.setString(3,itemName);
		pstmt.setString(4,itemOriginalPrice);
		pstmt.setString(5,itemDiscountPrice);
		pstmt.setString(6,itemImg);
		pstmt.setString(7,itemSpot);
		pstmt.setString(8,addTime);
		
		out.println("시간까지 저장");
		int updateResult = pstmt.executeUpdate();
		out.println(updateResult);
		out.println("DB 저장");
}catch(Exception e){
		e.printStackTrace();
		out.println(e.getMessage());
}finally{
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
<script>
//window.location = "itemList.jsp";
</script>