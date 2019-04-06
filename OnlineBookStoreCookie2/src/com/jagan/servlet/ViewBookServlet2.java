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
public class ViewBookServlet2 extends HttpServlet {
	public Connection con;

	@Override
	public void init() throws ServletException {
		con = DBConnection.getCon();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		try {
			// get the cookie object from request
			Cookie[] cookies = req.getCookies();
			// check cookie is null or not
			if (cookies != null) {
				String fName = cookies[0].getValue();
				PreparedStatement ps = con.prepareStatement("select * from book17");
				ResultSet rs = ps.executeQuery();
				pw.println("Welcome:" + fName + "<br><br>");

				RequestDispatcher rd = req.getRequestDispatcher("Link2.html");
				rd.include(req, res);
				pw.println("<br><br>--Book Details--");

				while (rs.next()) {
					pw.println("<br>" + rs.getString(1) + "&nbsp&nbsp&nbsp" + rs.getString(2) + "&nbsp&nbsp&nbsp"
							+ rs.getString(3) + "&nbsp&nbsp&nbsp" + rs.getFloat(4) + "&nbsp&nbsp&nbsp" + rs.getInt(5));
				}
			} else {
				pw.println("<center>SessionExpired..</center>");
				RequestDispatcher rd = req.getRequestDispatcher("Login.html");
				rd.include(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
