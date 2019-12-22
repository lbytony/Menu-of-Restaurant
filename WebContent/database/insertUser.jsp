<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="cn.menu.db.util.*" %>>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String sex = request.getParameter("sex");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String regdate = sdf.format(new java.util.Date());
	Connection con = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://172.19.38.100:4000/RestaurantMenu", "restaurant", "restaurant");
		Statement sql; 
		sql = con.createStatement(); 
		String sql2 = "INSERT INTO Users(UName, UPassword, USex, URegDate, UID) VALUES('" + username + "', MD5('" + password + "'), " + sex + ", '" + regdate + "', NULL" + ")";
		System.out.println(sql2);
		sql.executeUpdate(sql2);
	} catch(Exception e) {
		System.out.println(e);
	}
%>
<html>
<script>
	if (comfirm('注册成功！') === true) {
		request.sendRedirect("login.jsp");
	}
</script>
</html>