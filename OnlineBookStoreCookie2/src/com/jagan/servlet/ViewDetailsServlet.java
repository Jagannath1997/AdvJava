package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.jagan.bean.UserRegBean;

@SuppressWarnings("serial")
public class ViewDetailsServlet extends GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		ServletContext sct = this.getServletContext();
		/* get the UserRegBean object from servletcontext object */
		UserRegBean urb = (UserRegBean) sct.getAttribute("regBean");

		/* show the details */
		pw.println("UserName:" + urb.getuName()+"<br><br>");
		pw.println("Password:" + urb.getpWord()+"<br><br>");
		pw.println("FirstName:" + urb.getfName()+"<br><br>");
		pw.println("LastName:" + urb.getlName()+"<br><br>");
		pw.println("Address:" + urb.getAddr()+"<br><br>");
		pw.println("PhoneNo:" + urb.getPhNo()+"<br><br>");
		pw.println("MailId:" + urb.getmId()+"<br><br>");

		pw.println("<br>");
		/*
		 * by clicking register botton control will go to FinalRegServlet to submit the
		 * data into DB
		 */
		pw.println("<form action='reg' metho='post'>");
		pw.println("<input type='submit' value='Register'>");
		pw.println("</form>");

	}

}
