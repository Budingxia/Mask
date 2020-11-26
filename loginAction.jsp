<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <body>
<%
   request.setCharacterEncoding("utf-8");
   String users=request.getParameter("username");
   String pass=request.getParameter("password");
   boolean flag=false;
   PreparedStatement sql=null;  
   ResultSet rs=null;
   Connection conn=null;
%>
<% 
    String driver = "com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://127.0.0.1:3306/test";  
    String use = "root";   
    String password = "";  
    Class.forName(driver);  
    conn= DriverManager.getConnection(url,use,password);  
    sql =conn.prepareStatement("select * from login where name=? and password=?");
    sql.setString(1,users);
    sql.setString(2,pass);
    rs=sql.executeQuery();
    if (rs.next()) {  
    flag=true;
     }
   rs.close();
   sql.close();
   conn.close();
 %>
<!-- 判断是否是正确的登录用户 -->
<% if (flag==true){ %>
<jsp:forward page="display.jsp"/>
<%} 
else
if (flag==false){
%>
<jsp:forward page="login.jsp?message=login_error"/>
<%} %>
</body>
</html>



