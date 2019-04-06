package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jagan.dao.DBConnection;

@SuppressWarnings("serial")
public class LogoutServlet extends HttpServlet {
	public Connection con;

	@Override
	public void init() throws ServletException {
		con = DBConnection.getCon();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		// get the Cookie object
		Cookie[] cookies = req.getCookies();
		cookies[0].setMaxAge(0);// set age=0
		cookies[0].setValue("");// set value=null

		pw.println("<center><font style='color:white'>Logout Successfull..</font></center>");
		RequestDispatcher rd = req.getRequestDispatcher("Login.html");
		rd.include(req, res);
	}// doGet

	@Override
	public void destroy() {
		if (con != null) {
			try {
				con.close();// close the DataBase connection
			} catch (Exception e) {
				e.printStackTrace();
			} // catch
		} // if
	}// destroy
}
