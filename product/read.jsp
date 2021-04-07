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
	//Class.forName("com.mysql.jdbc.Driver");
  Class.forName("org.mariadb.jdbc.Driver");
  
//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lsk","root","ysc");
  conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/lsk","root","ysc");
  
  stmt = conn.createStatement();
  rs = stmt.executeQuery("select * from product where p_id='"+pid+"' ");
  
  if(rs.next()){
    String p_id = rs.getString("p_id");
    String pname = rs.getString("pname");
    String pdesc = rs.getString("pdesc");
    
    int price = rs.getInt("price");
    
    out.println("번호 : "+p_id+"<br>");
    out.println("상품명 : "+pname+"<br>");
    out.println("상품 설명 : "+pdesc+"<br>");
    out.println("가격 : "+price+"<br>");
    }
}catch(Exception e){
  System.out.println(e.getMessage());
}finally{
  if(rs!=null) rs.close();
  if(stmt!=null) stmt.close();
  if(conn!=null) conn.close();
 }
 %>
  
 <hr>
  <jsp:include page="clist.jsp" flush="false">
      <jsp:param name="pid" value="<%=pid%>" />
  </jsp:include>
 
  </body></html>
