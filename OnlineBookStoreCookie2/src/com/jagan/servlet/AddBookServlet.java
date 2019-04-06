package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jagan.bean.BookBean;

@SuppressWarnings("serial")
public class AddBookServlet extends HttpServlet {

	/* get the data from AddBook html from */
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			String bCode = req.getParameter("bcode");
			String bName = req.getParameter("bname");
			String bAuthor = req.getParameter("bauthor");
			float bPrice = Float.parseFloat(req.getParameter("bprice"));
			int bQty = Integer.parseInt(req.getParameter("bqty"));

			/* create a BookBean class object and set the collected data */

			BookBean bb = new BookBean();
			bb.setbCode(bCode);
			bb.setbName(bName);
			bb.setbAuthor(bAuthor);
			bb.setbPrice(bPrice);
			bb.setbQty(bQty);
			/* set the BookBean object into request scope */
			req.setAttribute("bean", bb);
			/* send the request to update servlet */
			RequestDispatcher rd = req.getRequestDispatcher("update");
			rd.forward(req, res);
		} else {
			pw.println("<center>Your Session Expired..!</center>");
			RequestDispatcher rd = req.getRequestDispatcher("Login.html");
			rd.include(req, res);
		}
	}// end of service()..

}// end of class
