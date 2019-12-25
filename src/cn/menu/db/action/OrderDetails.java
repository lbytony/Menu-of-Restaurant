package cn.menu.db.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.menu.db.entity.OrderDetail;
import cn.menu.db.util.DBUtil;

public class OrderDetails {
	public static List<OrderDetail> findAll(int OID) {
		String sql = "SELECT * FROM OrderDetail WHERE OID=" + OID;
		ResultSet rs = DBUtil.executeQuery(sql);
		List<OrderDetail> list = new ArrayList<>();
		OrderDetail od = null;
		try {
			assert rs != null;
			while (rs.next()) {
				sql = "SELECT * FROM Dish WHERE DID=" + rs.getInt("DID") + ";";
				ResultSet rs1 = DBUtil.executeQuery(sql);
				rs1.next();
				od = new OrderDetail(rs.getInt("ODID"), rs.getInt("OID"), rs.getInt("DID"), rs.getInt("DCount"),
						rs1.getString("DName"), rs1.getDouble("DPrice") * rs.getInt("DCount"));
				list.add(od);
				rs1.close();
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

	public static void addOne(int OID, int DID) {
		String sql = "SELECT * FROM OrderDetail WHERE OID=" + OID + " AND DID=" + DID + ";";
		ResultSet rs = DBUtil.executeQuery(sql);
		System.out.println(sql);
		int count = 0;
		try {
			if (rs.next()) {
				try {
					count = rs.getInt("DCount");
					count++;
				} catch (SQLException e) {
					e.printStackTrace();
				}
				sql = "UPDATE OrderDetail SET DCount=" + count + " WHERE OID=" + OID + " AND DID=" + DID;
				DBUtil.executeUpdate(sql);
			} else {
				sql = "INSERT OrderDetail(ODID, OID, DID, DCount) VALUES(NULL, " + OID + ", " + DID + ", 1)";
				DBUtil.executeUpdate(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(sql);
	}

	public static void deleteOne(int DID) {
		String sql = "SELECT * FROM OrderDetail WHERE DID=" + DID + ";";
		ResultSet rs = DBUtil.executeQuery(sql);
		System.out.println(sql);
		int count = 0;
		try {
			if (rs.next()) {
				if (rs.getInt("DCount") != 1) {
					count = rs.getInt("DCount") - 1;
					sql = "UPDATE OrderDetail SET DCount=" + count + " WHERE DID=" + DID;
					DBUtil.executeUpdate(sql);
				} else {
					sql = "DELETE FROM OrderDetail WHERE DID=" + DID;
					DBUtil.executeUpdate(sql);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(sql);
	}

}
