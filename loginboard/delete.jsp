<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
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
Statement stmt = null;
ResultSet rs = null;

String number = request.getParameter("number");
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
			if(stmt!=null) stmt.close();
			stmt = conn.createStatement();
			stmt.executeUpdate("delete from board where number="+number);
			response.sendRedirect("list.jsp");
		}
	}
}catch(Exception e) {
	out.println(e.getMessage());
}finally {
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
</body>
</html>