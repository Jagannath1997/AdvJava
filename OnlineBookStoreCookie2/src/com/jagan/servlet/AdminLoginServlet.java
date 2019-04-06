package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jagan.dao.DBConnection;

@SuppressWarnings("serial")
public class AdminLoginServlet extends HttpServlet {
	/* create variable to hold connection object */
	private Connection con;

	@Override
	public void init() throws ServletException {
		// get the connection object from DBCOnnection class by invoke getCon()method
		con = DBConnection.getCon();
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		// get the PrintWriter object
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		String uName = req.getParameter("uname");
		String pWord = req.getParameter("pword");
		try {
			/* fetch the data from db to check uname and pword is valid or not */
			PreparedStatement ps = con.prepareStatement("select * from admintab17 where name=? and pword=?");
			ps.setString(1, uName);
			ps.setString(2, pWord);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				// create the cookie object
				Cookie cookie = new Cookie("fName", rs.getString(3));
				res.addCookie(cookie);// add the cookie into response
				pw.println("<center>Welcome Mr." + rs.getString(3) + "</center><br>");
				/* send the req and res to Link1html page */
				RequestDispatcher rd = req.getRequestDispatcher("Link1.html");
				rd.include(req, res);
			} // if close

			/* if uName and Pword is wrong then req send to AdminLogin html page */
			else {
				pw.println("<center><fonr style='color:red'>Invalid Login details..!</font></center>");
				RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.html");
				rd.include(req, res);
			} // end of else
		} catch (Exception e) {
			e.printStackTrace();
		}

	}// close of service()

}// close of class
