<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %> 
<%
String name=request.getParameter("name");
String age=request.getParameter("age");
String birth=request.getParameter("birth");
String id1=request.getParameter("id1");
System.out.println(id1);
Connection con=null;
try
{ 
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","123456");
Statement sql; 
sql=con.createStatement(); 
String sql2="update student set name='"+name+"',age='"+age+"',birth='"+birth+"' where id="+id1;
System.out.print(sql2);
int s=sql.executeUpdate(sql2);
}
catch(Exception e){
System.out.println(e);
}
%>
恭喜你，修改成功！<br />
<a href="chakan.jsp">查看</a>