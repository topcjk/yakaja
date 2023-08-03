package com.yakaja.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MainTelInfoDBConn {
	
	private Connection con;
	
	public Connection getConnection() {
		return con;
	}
	
	public MainTelInfoDBConn() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
	}
}
