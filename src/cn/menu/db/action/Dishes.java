package cn.menu.db.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.menu.db.entity.Dish;
import cn.menu.db.util.DBUtil;

public class Dishes {
// 查找所有菜品
	public static List<Dish> findAll() {
		String sql = "select * from Dish";
		ResultSet rs = DBUtil.executeQuery(sql);
		List<Dish> list = new ArrayList<>();
		Dish dish = null;
		try {
			while (rs.next()) {
				dish = new Dish(rs.getInt("DID"), rs.getString("DName"), rs.getString("DPicPath"),
						rs.getBoolean("DKind"), rs.getDouble("DPrice"));
				list.add(dish);
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

// 查找特定种类菜品
	public static List<Dish> findAllByKind(boolean kind) {
		String sql = "SELECT * FROM Dish WHERE DKind=" + String.valueOf(kind);
		ResultSet rs = DBUtil.executeQuery(sql);
		List<Dish> list = new ArrayList<>();
		Dish dish = null;
		try {
			while (rs.next()) {
				dish = new Dish(rs.getInt("DID"), rs.getString("DName"), rs.getString("DPicPath"),
						rs.getBoolean("DKind"), rs.getDouble("DPrice"));
				list.add(dish);
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

	public static int getCount() {
		int count = 0;
		String sql = "select count(*) from Dish";
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

	public static int getCount(boolean dKind) {
		int count = 0;
		int kind = (dKind) ? 1 : 0;
		String sql = "select count(*) from Dish where DKind=" + kind;
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

	public static List<String> searchDish(String key) {
		String sql = "SELECT * FROM Dish WHERE DName LIKE %" + key + "%";
		ResultSet rs = DBUtil.executeQuery(sql);
		List<String> dishes = new ArrayList<String>();
		try {
			while (rs.next()) {
				dishes.add(rs.getString("DName"));
			}
			DBUtil.close(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dishes;
	}

	public static void delete(int DID) {
		String sql = "DELETE FROM Dish WHERE DID=" + DID;
		DBUtil.executeUpdate(sql);
	}

	public static void main(String[] args) {
		findAll();
	}
}