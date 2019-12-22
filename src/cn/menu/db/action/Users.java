package cn.menu.db.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.menu.db.entity.User;
import cn.menu.db.util.DBUtil;

public class Users {
	public List<User> findAll() {
		String sql = "select * from Users";
		ResultSet rs = DBUtil.executeQuery(sql);
		List<User> list = new ArrayList<>();
		User user = null;
		try {
			while (rs.next()) {
				user = new User(rs.getInt("UID"), rs.getString("UName"), rs.getString("UPassword"),
						rs.getString("URegDate"), rs.getBoolean("URole"), rs.getBoolean("USex"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public static int getcount() {
		int count = 0;
		String sql = "select count(*) from Users";
		ResultSet rs = DBUtil.executeQuery(sql);
		try {
			while (rs.next()) {
				count = rs.getInt(1);
			}
			DBUtil.close(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public static int getCount(boolean uRole) {
		int count = 0;
		int role = 1;
		String sql = "select count(*) from Users where URole=" + role;
		ResultSet rs = DBUtil.executeQuery(sql);
		try {
			while (rs.next()) {
				count = rs.getInt(1);
			}
			DBUtil.close(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}
