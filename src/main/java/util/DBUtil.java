package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/final_db";
    private static final String USER = "root";
    private static final String PASSWORD = "Server@33";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

	public static void closeConnection(Connection connection) {
		// TODO Auto-generated method stub
		
	}
}
