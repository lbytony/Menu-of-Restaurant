package cn.menu.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.menu.db.entity.User;
import cn.menu.service.UsersService;

public class DishesServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1054450329377184768L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "register":
			UsersService.register(request, response);
			break;
		case "login":
			UsersService.login(request, response);
			break;
		case "hqzh":
			// 判断用户是否登录过
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				response.getWriter().print("{\"msg\":\"no\"}");
				return;
			}
			response.getWriter().print("{\"msg\":\"" + user.getUName() + "\"}");
			break;
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String action = request.getParameter("action");
		switch (action) {
		// 退出登录
		case "delete":
			// TODO
			request.getSession().setAttribute("user", null);
			response.sendRedirect("/index");
			break;
		// 查询所有用户
		case "findAll":
			response.getWriter().print(UsersService.findall());
			return;
		case "findname":
			response.getWriter().print(UsersService.findname(request.getParameter("name")));
			return;
		}
	}
}
