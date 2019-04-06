package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jagan.bean.UserRegBean;

@SuppressWarnings("serial")
public class RegServlet2 extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		/* collect rest data from html page */
		String addr = req.getParameter("addr");
		long phNo = Long.parseLong(req.getParameter("phno"));
		String mId = req.getParameter("mid");

		ServletContext sct = this.getServletContext();
		UserRegBean urb = (UserRegBean) sct.getAttribute("regBean");

		/* add data into UserRegBean object */
		urb.setAddr(addr);
		urb.setPhNo(phNo);
		urb.setmId(mId);

		pw.println("User Registration details are valid<br>");

		// create a form tag to send control to viewServlet to view details
		pw.println("<a href='vdetails'>ClickHere</a>");
		pw.println("<br>To View the Details");
	}

}
