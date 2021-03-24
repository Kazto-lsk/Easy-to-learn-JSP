<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read Page</title>
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

try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from board where number = "+number);
	
	if(rs.next()) {
		int num = rs.getInt("number");
		String writer = rs.getString("writer");
		String subject = rs.getString("subject");
		String contents = rs.getString("contents");
		Date created = rs.getDate("created");
		
		out.println("번호: "+num+ "<br>");
		out.println("작성자:"+writer+"<br>");
		out.println("제목:"+subject+"<br>");
		out.println("글내용:"+contents+"<br>");
		out.println("작성일:"+created+"<br>");
	}
	
}catch (Exception e) {
	e.getMessage();
}finally {
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
<a href="password_for_delete.jsp?number=<%=number%>">글삭제</a>
<a href="editform.jsp?number=<%=number%>">글편집</a>
</body>
</html>