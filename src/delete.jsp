<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>    
<%@ include file="getDBInfo.jsp"%>
<%
	String email = (String) session.getAttribute("s_EMAIL");
	String listIndex = request.getParameter("listIndex");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String Query ="";
	ResultSet rs = null;

	String userMail = "";
	
try {
	Class.forName("com.mysql.jdbc.Driver"); 
	conn = DriverManager.getConnection(db_url, db_id, db_pw);

	Query = "update itemListTB set db_item_IsDelete=? where db_number=? and db_mail=?" ;
	pstmt = conn.prepareStatement(Query);

	pstmt.setString(1,"off");
	pstmt.setString(2,listIndex);
	pstmt.setString(3,email);
	
	pstmt.executeUpdate();
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
<script>
window.location = "itemList.jsp";
</script>