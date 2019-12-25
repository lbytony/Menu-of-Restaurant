package cn.menu.service;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.menu.db.action.Users;
import cn.menu.db.entity.User;
import cn.menu.db.util.DBUtil;
import cn.menu.db.util.R;

public class UsersService {
	static R r = new R();

	public static void register(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String role = request.getParameter("role");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String regdate = sdf.format(new java.util.Date());
		User user = new User();
		user.setUName(username);
		user.setUPassword(password);
		user.setUSex(Boolean.parseBoolean(sex));
		user.setURegDate(regdate);
		user.setURole(Boolean.parseBoolean(role));
		user = Users.insert(user);
		String msg = "注册失败";
		if (user != null) {
			request.getSession().setAttribute("user", user);
			msg = "注册成功";
		}
		try {
			response.getWriter().print("{\"msg\":\"" + msg + "\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void login(HttpServletRequest request, HttpServletResponse response) {
		String req = null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User();
		user.setUName(username);
		user.setUPassword(DBUtil.MD5(password));
		user = Users.password(user);
		if (user != null) {
			req = "ok";
			request.getSession().setAttribute("user", user);
		} else {
			req = "账号密码不一致!";
		}
		try {
			System.out.println(req);
			response.getWriter().print("{\"msg\":\"" + req + "\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String findall() {
		r.setCount(Users.getcount());
		r.setData(Users.findAll());
		return DBUtil.toJson(r);
	}

	public static String findname(String name) {
		r.setData(Users.findByName(name));
		return DBUtil.toJson(r);
	}
}
