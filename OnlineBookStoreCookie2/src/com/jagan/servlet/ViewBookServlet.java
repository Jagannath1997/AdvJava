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
public class ViewBookServlet extends HttpServlet {

	private Connection con;

	@Override
	public void init() throws ServletException {
		con = DBConnection.getCon();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		try {
			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				/*collect the value from cookie*/
				String fName = cookies[0].getValue();
				PreparedStatement ps = con.prepareStatement("select * from book17");
				ResultSet rs = ps.executeQuery();
				pw.println("WELCOME : " + fName + "<br>");
				RequestDispatcher rd = req.getRequestDispatcher("Link1.html");
				rd.include(req, res);
				pw.println("<br>----Book Details----");
				while (rs.next()) {
					pw.println("<br>" + rs.getString(1) + "&nbsp&nbsp&nbsp" + rs.getString(2) + "&nbsp&nbsp&nbsp"
							+ rs.getString(3) + "&nbsp&nbsp&nbsp" + rs.getFloat(4) + "&nbsp&nbsp&nbsp" + rs.getInt(5));
				} // end while
			} else {
				pw.println("<center>Your SessionExpired..!</center><br>");
				RequestDispatcher rd = req.getRequestDispatcher("Login.html");
				rd.include(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
