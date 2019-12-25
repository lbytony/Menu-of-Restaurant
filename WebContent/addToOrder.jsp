<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.menu.db.util.*"%>
<%@ page import="cn.menu.db.action.*"%>
<%
	int did = Integer.parseInt(request.getParameter("did"));
	int oid = Integer.parseInt(request.getParameter("oid"));
	String link = request.getParameter("link");
	OrderDetails.addOne(oid, did);
	response.sendRedirect(link);
%>