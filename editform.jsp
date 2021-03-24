<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editform.jsp</title>
</head>
<body>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
int num=0; String writer=""; String subject=""; String contents="";

String number = request.getParameter("number");
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?&useSSL=false","jspuser","jsppass");
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from board where number="+number);
	
	if(rs.next()) {
		num = rs.getInt("number");
		writer = rs.getString("writer");
		subject = rs.getString("subject");
		contents = rs.getString("contents");
	}
}catch(Exception e) {
	out.println(e.getMessage());
}finally {
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
<h2>게시판글편집</h2>
<form action="edit.jsp" method="post">
	<input type=hidden name="number" value=<%=num%>>
	작성자 : <input type=text name="writer" value=<%=writer%>><br>
	제목 : <input type=text name="subject" value=<%=subject%>><br>
	글내용 : <textarea rows=10 cols=60 name="contents"><%=contents%></textarea><br>
	비밀번호 : <input type=password name="password"><br>
	<input type=submit value="글편집">
</form>
</body>
</html>