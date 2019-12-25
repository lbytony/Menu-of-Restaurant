<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.menu.db.util.*"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	try {
		String sql = "SELECT UPassword, URole, UID FROM Users WHERE UName='" + username + "'";
		ResultSet rs = DBUtil.executeQuery(sql);
		String mdpass = DBUtil.MD5(password);
		System.out.println(mdpass);
		while (rs.next()) {
			String pass = rs.getString("UPassword");
			if (pass.equals(mdpass)){
				boolean isUser = rs.getBoolean("URole");
				int uid = rs.getInt("UID");
				if (isUser) {
					response.sendRedirect("menu.jsp?id=" + uid + "&username=" + username + "&flag=true");
				} else {
					response.sendRedirect("admin.jsp?id=" + uid + "&username=" + username);
				}
				
			} else { 
				out.println("<script>alert('no record')</script>");
				response.sendRedirect("login.jsp");
			}
		}
	} catch (Exception e) {
		System.out.println(e);
	}
%>