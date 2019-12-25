package cn.menu.db.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.menu.db.entity.OrderForm;
import cn.menu.db.util.DBUtil;

public class OrderForms {
	public static List<OrderForm> findAll() {
		String sql = "SELECT * FROM Dish";
		ResultSet rs = DBUtil.executeQuery(sql);
		List<OrderForm> list = new ArrayList<>();
		OrderForm of = null;
		try {
			assert rs != null;
			while (rs.next()) {
				of = new OrderForm(rs.getInt("OID"), rs.getInt("UID"), rs.getString("OTime"), rs.getString("OPTime"),
						rs.getDouble("OPrice"), rs.getBoolean("OStatus"));
				list.add(of);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				assert rs != null;
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public static int getCount() {
		int count = 0;
		String sql = "SELECT count(*) FROM OrderForm";
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

	public static int newOne(int uid) {
		int oid = 0;
		try {
			String sql = "INSERT INTO OrderForm(OID, UID, OTime, OPrice) VALUES(NULL" + ", " + uid + ", NOW(), 0)";
			System.out.println(sql);
			DBUtil.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e);
		}
		try {
			String sql = "SELECT * FROM OrderForm WHERE UID=" + uid + " ORDER BY OID DESC";
			ResultSet rs = DBUtil.executeQuery(sql);
			if (rs.next()) {
				oid = rs.getInt("OID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return oid;
	}

	public static int getByUID(int uid) {
		String sql = "SELECT * FROM OrderForm WHERE UID=" + uid;
		ResultSet rs = DBUtil.executeQuery(sql);
		try {
			if (rs.next()) {
				try {
					return rs.getInt("OID");
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
			} else {
				return 0;
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return 0;
	}
}
