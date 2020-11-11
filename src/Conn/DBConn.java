package Conn;
import java.sql.*;
public class DBConn {
	private static Connection conn = null;
	private static final String url = "jdbc:mysql://localhost:3306/fxtiemo_top?useUnicode=true&characterEncoding=UTF-8";
//	private static final String user = "fxtiemo_top";
	private static final String password = "123456";
	

	private static final String user = "root";
//	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}