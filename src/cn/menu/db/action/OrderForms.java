package cn.menu.db.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.menu.db.entity.OrderForm;
import cn.menu.db.util.DBUtil;

public class OrderForms {
    public List<OrderForm> findAll() {
        String sql = "SELECT * FROM Dish";
        ResultSet rs = DBUtil.executeQuery(sql);
        List<OrderForm> list = new ArrayList<>();
        OrderForm of = null;
        try {
			assert rs != null;
			while (rs.next()) {
                of = new OrderForm(rs.getInt("OID"), rs.getInt("UID"), rs.getString("OTime"),
						rs.getString("OPTime"), rs.getDouble("OPrice"), rs.getBoolean("OStatus"));
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
}
