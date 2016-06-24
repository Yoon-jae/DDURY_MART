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
		String listIndex = multi.getParameter("listIndex");
		String itemName = multi.getParameter("item_name");
		String itemOriginalPrice = multi.getParameter("item_original_price");
		String itemDiscountPrice = multi.getParameter("item_discount_price");
		String itemSpot = multi.getParameter("item_spot");
		String itemTime = multi.getParameter("item_expiredtime");
		String itemText = multi.getParameter("item_contents");
		String fileName = multi.getFilesystemName("item_img");
		String itemImg = "/DDURY_MART/src/userImages/" + fileName;
		
		Class.forName("com.mysql.jdbc.Driver"); 
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		
		Query = "update itemListTB set db_item_status=?, db_item_Name=?, db_item_original_price=?, db_item_discount_price=?, db_item_image=?, db_item_spot=?, db_item_time=?, db_item_IsDelete=?, db_item_text=? where db_number=?" ;
		pstmt = conn.prepareStatement(Query);
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone ( TimeZone.getTimeZone ( "Asia/Seoul" ) );

		Calendar cal = Calendar.getInstance();
		cal.setTime(now);

		String currentTime = sdf.format(cal.getTime());
		
		cal.add(Calendar.MINUTE, Integer.parseInt(itemTime));
		String addTime = sdf.format(cal.getTime());
		
		pstmt.setString(1,"open");
		pstmt.setString(2,itemName);
		pstmt.setString(3,itemOriginalPrice);
		pstmt.setString(4,itemDiscountPrice);
		pstmt.setString(5,itemImg);
		pstmt.setString(6,itemSpot);
		pstmt.setString(7,addTime);
		pstmt.setString(8,"on");
		pstmt.setString(9,itemText);
		pstmt.setString(10,listIndex);
		
		pstmt.executeUpdate();
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
window.location = "itemList.jsp";
</script>
