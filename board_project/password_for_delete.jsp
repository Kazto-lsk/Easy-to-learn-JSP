<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>password_for_delete page</title>
</head>
<body>

<%
	String number = request.getParameter("number");
%>
<h2>비밀번호 입력</h2>
<form action="delete.jsp" method="post">
	<input type=hidden name="number" value=<%=number%>><br>
	비밀번호 : <input type=password name="password"><br>
	<input type=submit value="글삭제">
</form>



</body>
</html>