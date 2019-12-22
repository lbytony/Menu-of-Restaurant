/**
 *
 */
package cn.web.jdbc.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * @author lbyto
 *
 */
public class JDBC {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
		String DB_URL = "jdbc:mysql://172.19.38.100:4000?useSSL=false&serverTimezone=Asia/Shanghai";
		String DB_USERNAME = "restaurant";
		String DB_PASSWORD = "restaurant";

		try {
			Class.forName(DB_DRIVER);
			Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
			Statement statement = connection.createStatement();
			statement.execute("USE `RestaurantMenu`");
			ResultSet resultSet = statement.executeQuery("SELECT * FROM `Users`");
			System.out.println(resultSet);
			while (resultSet.next()) {
				System.out.println(resultSet.getString("UName"));
			}
			resultSet.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("THEEE");
	}

}
