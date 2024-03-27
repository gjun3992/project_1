package DBPKG;

import java.sql.*;

public class Util{ 

	//DB 연결
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con =DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","musthave","1234");
		System.out.println("성공");
		
		return con;
	}
}
