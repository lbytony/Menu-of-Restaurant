<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="cn.menu.db.util.*" %>>
<%
	String dishname = request.getParameter("dishname");
	String dishphoto = request.getParameter("dishphoto");
	int kind = Integer.parseInt(request.getParameter("kind"));
	double price = Double.parseDouble(request.getParameter("price"));
	Connection con = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://172.19.38.100:4000/RestaurantMenu", "restaurant", "restaurant");
		Statement sql; 
		sql = con.createStatement(); 
		String sql2 = "INSERT INTO Dish(DName, DPicPath, DKind, UID) VALUES('" + dishname + "', '" + dishphoto + "', " + price + ", NULL" + ")";
		System.out.println(sql2);
		sql.executeUpdate(sql2);
	} catch(Exception e) {
		System.out.println(e);
	}
%>
<html>
<script>
	if (comfirm('添加成功！') === true) {
		request.sendRedirect("login.jsp");
	}
</script>
</html>