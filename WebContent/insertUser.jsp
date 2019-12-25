<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.menu.db.util.*"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String sex = request.getParameter("sex");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String regdate = sdf.format(new java.util.Date());
	Connection con = null;
	try {
		String sql = "INSERT INTO Users(UName, UPassword, USex, URegDate, UID) VALUES('" + username + "', MD5('" + password + "'), " + sex + ", '" + regdate + "', NULL" + ")";
		int s = DBUtil.executeUpdate(sql);
		if (s != 0) {
			int uid = -1;
			sql = "SELECT * FROM Users WHERE UName='" + username + "' ORDER BY UID DESC";
			ResultSet rs = DBUtil.executeQuery(sql);
			if (rs.next()) {
				uid = rs.getInt("UID");
			}
			response.sendRedirect("menu.jsp?id=" + uid + "&username=" + username + "&link=");
		}
	} catch(Exception e) {
		System.out.println(e);
	}
%>