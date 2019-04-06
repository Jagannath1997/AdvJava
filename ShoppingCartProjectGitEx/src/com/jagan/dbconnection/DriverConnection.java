package com.jagan.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DriverConnection {
	// create a variable to hold Connection object
	private static Connection con;

	// static block which create the connection object once when class is loaded
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// end block
	/* this method will return the Connection object */
	public static Connection getConnection() {
		return con;
	}
}
