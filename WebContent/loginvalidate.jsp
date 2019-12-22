<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="cn.menu.db.util.*" %>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	try {
		String sql = "SELECT UPassword FROM Users WHERE UName='" + username + "'";
		ResultSet rs = DBUtil.executeQuery(sql);
		String mdpass = md5.MD5(password);
		System.out.println(mdpass);
		while (rs.next()) {
			String pass = rs.getString("UPassword");
			if (pass.equals(mdpass)){
				response.sendRedirect("menu.jsp?user=" + username);
			} else {
				response.sendRedirect("login.jsp");
			}
		}
	} catch (Exception e) {
		System.out.println(e);
	}
%>