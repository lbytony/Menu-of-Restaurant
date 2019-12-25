package cn.menu.db.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.menu.db.entity.User;
import cn.menu.db.util.DBUtil;

public class Users {
	public static List<User> findAll() {
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

	public static List<User> findAllByRole(boolean role) {
		String sql = "select * from Users WHERE URole=" + String.valueOf(role);
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

	/**
	 * 进行账号密码核对
	 * 
	 * @param users
	 * @return
	 */
	public static User password(User user) {
		String username = user.getUName();
		String password = user.getUPassword();
		try {
			String sql = "SELECT * FROM Users WHERE UName='" + username + "'";
			ResultSet rs = DBUtil.executeQuery(sql);
			String mdpass = password;
			System.out.println("mdpass:" + mdpass);
			while (rs.next()) {
				String pass = rs.getString("UPassword");
				if (pass.equals(mdpass)) {
					User u = new User(rs.getInt("UID"), rs.getString("UName"), rs.getString("UPassword"),
							rs.getString("URegDate"), rs.getBoolean("URole"), rs.getBoolean("USex"));
					return u;
				} else {
					return null;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * 添加操作
	 * 
	 * @param users
	 * @return
	 */
	public static User insert(User user) {
		String sql = "SELECT COUNT(*) FROM Users WHERE UName=?";
		Object[] in = { user.getUName() };
		ResultSet rs = DBUtil.executeQuery(sql, in);
		try {
			if (rs.next()) {
				if (rs.getInt(1) > 0)
					return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (!rs.isClosed()) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		sql = "INSERT INTO Users(UName, UPassword, USex, URegDate, UID) VALUES(?, ?, ?, ?, NULL)";
		Object[] args = { user.getUName(), DBUtil.MD5(user.getUPassword()), user.isUSex(), user.getURegDate() };
		if (DBUtil.executeUpdate(sql, args) > 0)
			return password(user);
		else {
			return null;
		}
	}

	/**
	 * 删除操作
	 * 
	 * @param users
	 * @return
	 */
	public static boolean delete(User user) {
		String sql = "DELETE FROM Users WHERE UID=?";
		Object[] in = { user.getUID() };
		if (DBUtil.executeUpdate(sql, in) > 0)
			return true;
		return false;
	}

	/**
	 * 进行修改操作
	 * 
	 * @param users
	 * @return
	 */
	public static boolean update(User user) {
		String sql = "UPDATE Users SET UName=?, UPassword=?, USex=?, URegDate=? WHERE UID=?";
		Object[] in = { user.getUName(), DBUtil.MD5(user.getUPassword()), user.isUSex(), user.getURegDate(),
				user.getUID() };
		if (DBUtil.executeUpdate(sql, in) > 0)
			return true;
		return false;
	}

	public static User getUserByUName(String UName) {
		User user = null;
		String sql = "SELECT COUNT(*) FROM Users WHERE UName=?";
		ResultSet rs = DBUtil.executeQuery(sql);
		try {
			if (rs.next()) {
				user = new User(rs.getInt("UID"), rs.getString("UName"), rs.getString("UPassword"),
						rs.getString("URegDate"), rs.getBoolean("URole"), rs.getBoolean("USex"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * 模糊查询姓名操作判断是否模糊查询
	 * 
	 * @param name
	 * @return
	 */
	public static List<User> findByName(String name) {
		String sql = "SELECT * FROM Users WHERE UName LIKE '%" + name + "%'";
		List<User> list = new ArrayList<>();
		ResultSet rs = DBUtil.executeQuery(sql);
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

	public static void main(String[] args) {
		User user = new User();
		user.setUName("admin");
		user.setUPassword(DBUtil.MD5("admin"));
		System.out.println(user.getUPassword());
		User user2 = password(user);
		System.out.println(user2.getUPassword());
	}
}
