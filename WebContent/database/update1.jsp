<%@ page contentType="text/html"; charset="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
  background-color: #FFCCFF;
}
-->
</style></head>
<body>
<%String id=request.getParameter("id");
 Connection con; 
 String name=null;
 String age=null;
 String birth=null;
 String id1=null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","123456");
Statement sql; 
ResultSet rs; 
try
{ 
sql=con.createStatement(); 
rs=sql.executeQuery("SELECT * FROM student");
while(rs.next()) 
{ 
 name=rs.getString(2);
 age=rs.getString(3);
 birth=rs.getString(4);
 id1=rs.getString(1);
}
con.close(); 
} 
catch(SQLException e1) 
{ 
out.print("SQL异常！！！！"); 
} 
%>
<center>
<form action="update2.jsp">
<center>
 <p>  </p>
 <p>姓名：
  <input name="name" type="text" size="15" value="<%=name%>">
 </p>
 <p>
 年龄：
  <input name="age" type="text" size="15" value="<%=age%>">
 </p>
 <p>出生日期：
  <input name="birth" type="text" size="15" value="<%=birth%>">
  <input name="id1" type="hidden" value="<%=id1%>" />
</p>
 <p><input name="g" type="submit" value="修改">     <input name="h" type="reset" value="重置"></p>
</form>
</center>
</body>
</html>