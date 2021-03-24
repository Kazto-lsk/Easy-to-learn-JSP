<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//세션을 만료 시킵니다.
	session.invalidate();

	//세션이 만료되었다면, 로그인 폼으로 이동합니다.
	response.sendRedirect("loginform.jsp");



%>
</body>
</html>