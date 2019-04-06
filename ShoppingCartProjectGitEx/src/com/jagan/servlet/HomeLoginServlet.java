package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jagan.dao.UserDao;

@SuppressWarnings("serial")
public class HomeLoginServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		/* collect the user selected role from request object */
		String submit = req.getParameter("submit");
		/*check whether user as admin or not*/
		if (submit.equalsIgnoreCase("Admin")) {
			/* create the RequestDispatcher Object */
			RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.html");
			// forward the request
			rd.forward(req, res);
		} // if close
		/* create the RequestDispatcher Object */
		RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
		// forward the request
		rd.forward(req, res);
	}// doPost close
}// class close
