package com.jagan.servlet;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jagan.bean.UserRegBean;

@SuppressWarnings("serial")
public class RegServlet1 extends HttpServlet {

	/* collect the user registration data from html form */
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String uName = req.getParameter("uname");
		String pWord = req.getParameter("pword");
		String fName = req.getParameter("fname");
		String lName = req.getParameter("lname");

		/* create a UserRegBean class and set the collected data */
		UserRegBean urb = new UserRegBean();
		urb.setuName(uName);
		urb.setpWord(pWord);
		urb.setfName(fName);
		urb.setlName(lName);
		/*
		 * get the ServletContext object and set the UserRegBean object as an Attribute
		 */
		ServletContext sct = this.getServletContext();
		sct.setAttribute("regBean", urb);
		/*
		 * forward the req and res object to Register2.html to register rest information
		 */
		RequestDispatcher rd = req.getRequestDispatcher("Register2.html");
		rd.forward(req, res);
	}

}
