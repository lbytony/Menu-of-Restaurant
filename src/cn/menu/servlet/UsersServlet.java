package cn.menu.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.menu.db.entity.User;
import cn.menu.service.UsersService;

@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7706703658269797307L;

	UsersService usersService = new UsersService();

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "register":
			usersService.register(request, response);
			break;
		case "login":
			usersService.login(request, response);
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
			response.getWriter().print(usersService.findall());
			return;
		case "findname":
			response.getWriter().print(usersService.findname(request.getParameter("name")));
			return;
		}
	}
}
