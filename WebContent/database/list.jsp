<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<HTML>
<style type="text/css">
  <!--
  body {
    background-color: #99CCFF;
  }
  -->
</style>

<BODY>
  <font color="#FFFFFF">
    <center>
      <%
      Connection con; 
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","123456");
Statement sql; 
ResultSet rs; 
try
{ 
sql=con.createStatement(); 
rs=sql.executeQuery("SELECT * FROM student");
out.print("<Table Border style='font-size: 10pt'>"); 
out.print("<TR><td colspan=5 align=center>考生数据</td></tr>"); 
out.print("<TR><td colspan=5 align=center><a href='add.jsp' target='_self'>添加考生信息</a></td></tr>"); 
out.print("<TR>"); 
out.print("<Td width=50 >"+"姓名"); 
out.print("<Td width=100 >"+"年龄"); 
out.print("<Td width=100>"+"出生日期"); 
out.print("<Td width=100 colspan=2>"+"操作"); 
out.print("</TR>"); 
while(rs.next()) 
{ out.print("<TR>"); 
out.print("<TD >"+rs.getString(2)+"</TD>"); 
out.print("<TD >"+rs.getString(3)+"</TD>"); 
out.print("<TD >"+rs.getString(4)+"</TD>"); 
String idstr=rs.getString(1);
out.print("<TD><a href='delete.jsp?id="+idstr+"'>删除</a></TD>"); 
out.print("<TD><a href='update.jsp?id="+idstr+"'>修改</a></TD>"); 
out.print("</TR>") ; 
}
out.print("</Table>"); 
con.close(); 
} 
catch(SQLException e1) 
{ 
out.print("SQL异常！！！！"); 
} 
%>
    </center>
</BODY>

</HTML>