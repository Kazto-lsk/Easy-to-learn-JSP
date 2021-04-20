<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	String uid = (String)session.getAttribute("id");
	if(uid == null || uid.equals("")){
%>
<script>
	alert('로그인이 필요합니다.');
	window.history.back();
</script>
<% } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String pid = request.getParameter("pid");
String cid = request.getParameter("cid");

try{
	//Class.forName("com.mysql.jdbc.Driver");
  Class.forName("org.mariadb.jdbc.Driver");
  //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lsk","root","ysc");
  conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
  
  stmt = conn.createStatement();
  rs = stmt.executeQuery("Select u_id from pcomment where c_id = '"+cid+"' ");
  
  if(rs.next()){
	  String u_id = rs.getString("u_id");
	  String c_id = rs.getString("c_id");
	  String p_id = rs.getString("p_id");
	  String contents = rs.getString("contents");
	  int starpoint = rs.getInt("starpoint");
	  
	  String[] sel = new String[5];
	  sel[starpoint-1] = "selected";
	  
	  if(!uid.equals(u_id)){
		  out.println("<script> alert('수정 권한이 없는걸..?'); window.history.back(); </script>");
	  }else{
		  %>
		  <hr>
		  <form action="edit_comment.jsp" method="post">
			<input type="hidden" name="pid" value="<%=pid%>">
		  </form>
		  
		  <%
	  }
	  
	  
  }
 
}catch(Exception e){
  System.out.println(e.getMessage());
}finally{
  if(stmt!=null) stmt.close();
  if(conn!=null) conn.close();
 }
%>

</body>
</html>