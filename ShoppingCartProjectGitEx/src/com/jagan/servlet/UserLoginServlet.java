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
public class UserLoginServlet extends HttpServlet {

	HttpSession httpSession;
	/* hold the userdao class object */
	UserDao ud;

	@Override
	public void init() throws ServletException {
		/* Create the object of Userdao class */
		ud = new UserDao();
		System.out.println("userdao object create inside init()..!");
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		/* clooect the user entered data from request object */
		String uName = req.getParameter("uname");
		String pWord = req.getParameter("pword");
		PrintWriter pw = res.getWriter();
		res.setContentType("text/hmtl");
		/* check uname & pword is correct or not */
		if (ud.validate(uName, pWord)) {
			// Collect the HttpSession object
			httpSession = req.getSession();
			/* set the username in httpsession object */
			httpSession.setAttribute("username", uName);
			/* create the RequestDispatcher Object */
			pw.println("<center>Welcome:"+uName+"</center>");
			RequestDispatcher rd = req.getRequestDispatcher("UserRole.html");
			// forward the request
			rd.include(req, res);
		} // if close

		else {/* create the RequestDispatcher Object */
			pw.println("<center>Inavalid Userdetails..!</center>");
			RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
			// forward the request
			rd.include(req, res);
		}
	}// doPost close
}// class close
