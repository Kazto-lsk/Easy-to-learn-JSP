<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>List Page</title>
</head>
<body>

<%
	String uid = (String)session.getAttribute("id");
	if(uid == null || uid.equals("")){
		response.sendRedirect("login/loginform.jsp");
	}

%>


<%
Connection conn = null;
PreparedStatement pstmt = null;

request.setCharacterEncoding("utf-8");
String pid = request.getParameter("pid");

//상단에서 사용하기 때문에 사용하지 않습니다.
//String uid = request.getParameter("uid");

String contents = request.getParameter("contents");
String star = request.getParameter("star");

try{
	//Class.forName("com.mysql.jdbc.Driver");
  Class.forName("org.mariadb.jdbc.Driver");
  //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lsk","root","ysc");
  conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","lsk","ysc");
  
  String sql = "insert into pcomment(p_id, u_id, contents, starpoint, created) values(?,?,?,?,now())";
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(1, pid);
  pstmt.setString(2, uid);
  pstmt.setString(3, contents);
  pstmt.setString(4, star);
  pstmt.executeUpdate();

  response.sendRedirect("read.jsp?p_id="+pid);

}catch(Exception e){
  System.out.println(e.getMessage());
}finally{
  if(pstmt!=null) pstmt.close();
  if(conn!=null) conn.close();
 }
 %>
 
  </body></html>
