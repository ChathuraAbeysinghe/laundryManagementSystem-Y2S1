package Delivery;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

	private static String url = "jdbc:mysql://localhost:3306/laundry_management";
	private static String user = "root";
	private static String pwd = "MySQL@12345#";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			 con = DriverManager.getConnection(url, user, pwd);
			
		} catch (Exception e) {
			System.out.println("Database connection is faild...!");
		}
		
		return con;
	}
}
