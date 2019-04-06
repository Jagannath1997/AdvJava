package com.jagan.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	// create a variable to hold Connection object
	private static Connection con;

	private DBConnection() {
	}

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

	public static Connection getCon() {
		return con;
	}
}
