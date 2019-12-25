<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.menu.db.util.*"%>
<%@ page import="cn.menu.db.action.*"%>
<%
	int id = Integer.parseInt(request.getParameter("did"));
	String link = request.getParameter("link");
	OrderDetails.deleteOne(id);
	response.sendRedirect(link);
%>