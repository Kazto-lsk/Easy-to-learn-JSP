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
//세션 정보중 Attribute가 ID인 값을 가져옵니다.
String id = (String)session.getAttribute("id");

//만약 로그인 정보가 없다면 로그인 폼으로 이동시킵니다.
if(id == null || id.equals("")){
	response.sendRedirect("login/loginform.jsp");
}


Connection conn = null;
PreparedStatement pstmt = null;

request.setCharacterEncoding("utf-8");
String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String contents = request.getParameter("contents");
String password = request.getParameter("password");

try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
	
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