<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>List Page</title>
</head>
<body>
<%
Connection conn = null;
PreparedStatement pstmt = null;

request.setCharacterEncoding("utf-8");
String pid = request.getParameter("pid");
String uid = request.getParameter("uid");
String contents = request.getParameter("contents");
String star = request.getParameter("star");

try{
  Class.forName("org.mariadb.jdbc.Driver");
  conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
  
  String sql = "insert into pcomment(p_id, u_id, contents, starpoint, created) values(?,?,?,?,now())";
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(1,pid);
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
