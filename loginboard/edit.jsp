<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
</head>
<body>
<%
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

request.setCharacterEncoding("utf-8");
String number = request.getParameter("number");
String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String contents = request.getParameter("contents");
String input_password = request.getParameter("password");

try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select password from board where number="+number);
	
	if(rs.next()) {
		String password = rs.getString("password");
		if(password.equals(input_password) == false) {
			response.sendRedirect("read.jsp?number="+number);
		}
		else {
			String sql = "update board set writer=?, subject=?, contents=?, where number=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, writer);
			pstmt.setString(2, subject);
			pstmt.setString(3, contents);
			pstmt.setString(4, number);
			
			pstmt.executeUpdate();
			response.sendRedirect("list.jsp");
		}
	}
}catch (Exception e){
	out.println(e.getMessage());
}finally{
	if(rs!=null) rs.close(); 
	if(stmt!=null) stmt.close();
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
}
%>

<h1>내가 입력한 패스워드<%=input_password%></h1>
</body>
</html>