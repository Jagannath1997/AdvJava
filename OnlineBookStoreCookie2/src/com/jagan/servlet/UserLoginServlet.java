package com.jagan.servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jagan.dao.DBConnection;

@SuppressWarnings("serial")
public class UserLoginServlet extends HttpServlet {
	public Connection con;

	@Override
	public void init() throws ServletException {
		con = DBConnection.getCon();
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		String uName = req.getParameter("uname");
		String pWord = req.getParameter("pword");

		try {
			PreparedStatement ps = con.prepareStatement("select * from usertab17 where name=? and pword=?");
			ps.setString(1, uName);
			ps.setString(2, pWord);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				/* create cookie object */
				Cookie cookie = new Cookie("fName", rs.getString(3));
				/*add the cookie in to response*/
				res.addCookie(cookie);
				pw.println("Welcome:" + rs.getString(3) + "<br><br>");
				RequestDispatcher rd = req.getRequestDispatcher("Link2.html");
				rd.include(req, res);
			} else {
				pw.println("Invalid uName or pWord...!<br><br>");
				RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
				rd.include(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
