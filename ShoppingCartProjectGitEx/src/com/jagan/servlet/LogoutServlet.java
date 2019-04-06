package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class LogoutServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		HttpSession httpSession = req.getSession();
		if (httpSession != null) {
			httpSession.invalidate();
			
			pw.println("<center>Logout Successfull..!</center>");
			RequestDispatcher rd = req.getRequestDispatcher("HomeLogin.html");
			rd.include(req, res);
		}
	}
}
