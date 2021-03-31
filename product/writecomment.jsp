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
PreparedStatment pstmt = null;

request.setCharacterEncoding("utf-8");
String pid = request.GetParameter("pid");
String uid = request.GetParameter("uid");
String contents = request.GetParameter("contents");
String star = request.GetParameter("star");

try{
  Class.forName("org.mariadb.jdbc.Driver");
  conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
  
  String sql = "insert into pcomment(p_id, u_id, contents, starpoint, created) values(?,?,?,?,now())";
  pstmt = conn.preprareStatement(sql);
  pstmt.setString(1,pid);
  pstmt.setString(2, uid);
  pstmt.setString(3, contents);
  pstmt.setString(4, star);
  pstmt.excuteUpdate();

  response.sendRedirect("read.jsp?p_id="+pid);

}catch(Exception e){
  System.out.println(e.getMessage());
}finally{
  if(pstmt!=null) smtmt.close();
  if(pstmt!=null) conn.close();
 }
 %>
 
  </body></html>
