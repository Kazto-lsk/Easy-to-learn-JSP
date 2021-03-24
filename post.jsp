<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Page</title>
</head>
<body>
<%
Connection conn = null;
PreparedStatement pstmt = null;

request.setCharacterEncoding("utf-8");
String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String contents = request.getParameter("contents");
String password = request.getParameter("password");

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","jspuser","jsppass");
	
	String sql = "insert into board(writer, subject, contents, password, created) values(?,?,?,?,now())";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, writer);
	pstmt.setString(2, subject);
	pstmt.setString(3, contents);
	pstmt.setString(4, password);
	pstmt.executeUpdate();
	
	response.sendRedirect("list.jsp");
}catch(Exception e) {
	e.getMessage();
}finally {
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
}
%>
</body>
</html>