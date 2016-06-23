<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>    
<%@include file="getDBInfo.jsp"%>
<%
String email= request.getParameter("MAKE_USER_EMAIL");
String passwd= request.getParameter("MAKE_USER_PASS");
String passwd_re= request.getParameter("MAKE_USER_PASS_RE");

Connection conn = null;
PreparedStatement pstmt = null;
String Query ="";

ResultSet rs = null;
try{	
		if(passwd.equals(passwd_re)){
				Class.forName("com.mysql.jdbc.Driver"); 

				conn = DriverManager.getConnection(db_url, db_id, db_pw);
				Query = "select * from userTB where db_email= '" + email + "'" ;
				pstmt = conn.prepareStatement(Query);

				rs = pstmt.executeQuery();


				if (rs.next()) {
					// ID 중복 검사
						out.println("<script>alert('해당 E-mail 는 이미 사용중입니다');</script>");
						out.println("<script>window.location = 'login.jsp';</script>");
				}else{
						if (rs!= null) {
								rs.close();
						}   
						if (pstmt!= null) {
								pstmt.close();
						}
						Query = "insert into userTB (db_email, db_pass) values (?,?)" ;
 						pstmt = conn.prepareStatement(Query);
						pstmt.setString(1,email);
						pstmt.setString(2,passwd);

						pstmt.executeUpdate();

						out.println("<script>alert('회원가입이 되셨습니다.');</script>");
						out.println("<script>window.location = 'login.jsp';</script>");
				}
		} else {
			// 2개의 패스워드가 일치하지 않으면 회원가입이 안됨
						out.println("<script>alert('password가 일치하지 않습니다');</script>");
						out.println("<script>window.location = 'login.jsp';</script>");
		}

} catch(Exception e){
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
