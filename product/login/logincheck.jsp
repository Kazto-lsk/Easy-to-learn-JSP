<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String id = request.getParameter("id");
String input_password = request.getParameter("password");

try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select password from user where u_id ='"+id+"'");
	
	if(rs.next()){
		String password = rs.getString("password");
		
		if(password.equals(input_password)){
			session.setAttribute("id", id);
			response.sendRedirect("../plist.jsp");
		}
	}
	
	response.sendRedirect("loginform.jsp");

}catch (Exception e){
	out.println(e.getMessage());
}finally{
	if(rs!=null) rs.close(); 
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}

%>