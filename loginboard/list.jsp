<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Page</title>
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
try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select number, writer, subject, created from board");
	while(rs.next()){
		int number = rs.getInt("number");
		String writer = rs.getString("writer");
		String subject = rs.getString("subject");
		Date created = rs.getDate("created");
		
		String new_subject="<a href=read.jsp?number="+number+">"+subject+"</a>";
		
		out.println(number+","+writer+","+new_subject+","+created+"<br>");
	}
}catch (Exception e){
	out.println(e.getMessage());
}finally{
	if(rs!=null) rs.close(); 
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
<a href="postform.jsp">글쓰기</a>
</body>
</html>