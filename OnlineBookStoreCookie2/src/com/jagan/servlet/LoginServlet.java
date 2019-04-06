package com.jagan.servlet;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	
		// get the user select data from html page
		@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
			String submit = req.getParameter("submit");
		/* select operation based on user entered data */
		if (submit.equals("Admin")) {

			/*
			 * create the RequestDispatcher object and forward the req and res to AdminLogin
			 * page
			 */
			RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.html");
			rd.forward(req, res);

		}
		/*if we select user then if condition we false and else will continue */
		else {
			/*
			 * create the RequestDispatcher object and forward the req and res to UserLogin
			 * page
			 */
			RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
			rd.forward(req, res);
		} // close else

	}// close of service()

}// close class