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
Statement stmt = null;
ResultSet rs = null;
String pid = request.getParameter("p_id");
try{
  Class.forName("org.mariadb.jdbc.Driver");
  conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
  
  stmt = conn.createStatement();
  rs = stmt.executeQuery("select * from pcomment where p_id = '"+pid+"' ");
  
  if(rs.next()){
    String p_id = rs.getString("p_id");
    String contents = rs.getString("contents");
    String starpoint = rs.getString("starpoint");
    
    out.println(u_id+","+contents+","+starpoint+"<br>");

    }
}catch(Exception e){
  System.out.println(e.getMessage());
}finally{
  if(rs!=null) rs.close();
  if(smtmt!=null) smtmt.close();
  if(conn!=null) conn.close();
 }
 %>
  
 <form action="writecomment.jsp" method="post">
   <input type="hidden" name="pid" value="<%=pid%>" >
   작성자 ID : <input type="text" name="uid"><br>
   
   <textarea rows="5" cols="50" name="contents"> </textarea><br>
   별점 <select name="star">
    <option>1</option>
    <option>2</option>
    <option>3</option>
    <option>4</option>
    <option>5</option>
   </select>
  </form>
   
  
  
  
  
  
  
  
 
  </body></html>
