<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>    
<%@include file="getDBInfo.jsp"%>
<%
String email= request.getParameter("USER_EMAIL");
String pass= request.getParameter("USER_PASS");

String userEmail="";
String userPass="";

Connection conn = null;
PreparedStatement pstmt = null;
String Query ="";

ResultSet rs = null;

try{
		Class.forName("com.mysql.jdbc.Driver"); 

		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		Query = "select * from userTB where db_email= '" + email + "'" ;
		pstmt = conn.prepareStatement(Query);

		rs = pstmt.executeQuery();



		while (rs.next()) {
				userEmail = rs.getString("db_email");
				userPass = rs.getString("db_pass");
		}

		if(userEmail.equals(email) && userPass.equals(pass)) 
		{
				session.setAttribute("s_EMAIL", userEmail);
				session.setAttribute("s_PASS", userPass);
				session.setMaxInactiveInterval(600); // Session 유지 시간 제한.
				response.sendRedirect("main.jsp");
		} else {
				out.println("<script>alert('계정이 없거나 비밀번호가 일치하지 않습니다');</script>");
				out.println("<script>window.location = 'login.jsp';</script>");
		}
} catch(Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
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