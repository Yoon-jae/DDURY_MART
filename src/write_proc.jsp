<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import = "java.sql.*" %>    
<%@ include file="getDBInfo.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%
request.setCharacterEncoding("utf-8");
String email = (String) session.getAttribute("s_EMAIL");
  
String itemName = request.getParameter("item_name");
String itemOriginalPrice = request.getParameter("item_original_price");
String itemDiscountPrice = request.getParameter("item_discount_price");
String itemSpot = request.getParameter("item_spot");
String itemTime = request.getParameter("item_time");
String itemText = request.getParameter("item_text");
String itemImg;



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
		String fileName = multi.getFilesystemName("item_img");
		itemImg = "/userImages/" + fileName;
		
		Class.forName("com.mysql.jdbc.Driver"); 

		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		
		Query = "insert into itemListTB (db_mail, db_item_status, db_item_Name, db_item_original_price, db_item_discount_price, db_item_image, db_item_spot, db_item_time) values (?,?,?,?,?,?,?,?)" ;
		pstmt = conn.prepareStatement(Query);
		
		out.println(itemName);
		out.println(itemOriginalPrice);
		out.println(itemDiscountPrice);
		out.println(itemSpot);
		out.println(itemTime);
		out.println(itemText);
		out.println(itemImg);
		
		pstmt.setString(1,email);
		pstmt.setString(2,"open");
		pstmt.setString(3,itemName);
		pstmt.setString(4,itemOriginalPrice);
		pstmt.setString(5,itemDiscountPrice);
		pstmt.setString(6,itemImg);
		pstmt.setString(7,itemSpot);
		pstmt.setString(8,itemTime);
		out.println("시간까지 저장");
		pstmt.executeUpdate();	
		out.println("DB 저장");
}catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
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