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

try{
  Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
  
  stmt = conn.createStatement();
  String sql = "select p_id,p_name,(Select avg(starpoint) from pcomment where pcomment.p_id = product.p_id) AS sp from product";
  
  rs = stmt.executeQuery(sql);
  
  while(rs.next()){
    String p_id = rs.getString("p_id");
    String pname = rs.getString("pname");
    float point = rs.getFloat("sp");
    
    out.println(p_id+","+pname+","+point+"<br>");
    }
    
}catch(Exception e){
  System.out.println(e.getMessage());
  
}finally{
  if(rs!=null) rs.close();
  if(smtmt!=null) smtmt.close();
  if(conn!=null) conn.close();
 }
 %>
  </body>
</html>
    
    
    
    
    
    
    
    
    
    
