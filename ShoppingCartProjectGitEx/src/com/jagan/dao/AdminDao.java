package com.jagan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.jagan.dbconnection.DriverConnection;

public class AdminDao{

	PreparedStatement ps;
	Connection connection;

	// this method will validate the username and password
	public boolean validate(String uname, String pword) {
		try {
			// get the Statement object
			connection = DriverConnection.getConnection();
			ps = connection.prepareStatement("select * from admintab17 where name=? and pword=?");
			ps.setString(1, uname);
			ps.setString(2, pword);
			ResultSet rs = ps.executeQuery();
			
			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} // end of catch
		return false;
	}
}
