<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<html>

<head>
  <title>ɾ������</title>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <style type="text/css">
    <!--
    body {
      background-color: #FFCCFF;
    }
    -->
  </style>
</head>

<body>
  <center>
    <%
    Connection con; 
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","123456");
	Statement stmt; 
	Statement s; 
	ResultSet rs; 
	String id=request.getParameter("id");
	try { 
		stmt=con.createStatement();
		String sql="delete from student where id="+id; 
		stmt.executeUpdate(sql); 
		s=con.createStatement(); 
		rs=s.executeQuery("SELECT * FROM student"); 
		out.print("<Table Border style='font-size: 10pt'>"); 
		out.print("<TR><td colspan=5 align=center>��������</td></tr>");
		out.print("<TR><td colspan=5 align=center><a href='add.jsp' target='_self'>��ӿ�����Ϣ</a></td></tr>"); 
		out.print("<TR>"); 
		out.print("<Td width=50 >"+"����"); 
		out.print("<Td width=100 >"+"����"); 
		out.print("<Td width=100>"+"��������"); 
		out.print("<Td width=100 colspan=2>"+"����"); 
		out.print("</TR>"); 
		while(rs.next()) {
			out.print("<TR>"); 
			out.print("<TD >"+rs.getString(2)+"</TD>"); 
			out.print("<TD >"+rs.getString(3)+"</TD>"); 
			out.print("<TD >"+rs.getString(4)+"</TD>"); 
			String idstr=rs.getString(1);
			out.print("<TD >"+idstr+"</TD>"); 
			out.print("<TD><a href='delete.jsp?id="+idstr+"'>ɾ��</a></TD>"); 
			out.print("<TD><a href='update.jsp?id="+idstr+"'>�޸�</a></TD>"); 
			out.print("</TR>") ; 
		}
		out.print("</Table>"); 
		con.close(); 
	} 
	catch (SQLException e1) { 
		out.print("SQL�쳣��������"); 
	} 
%>
  </center>
</body>

</html>