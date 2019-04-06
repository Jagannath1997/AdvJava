package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jagan.bean.ProductBean;

@SuppressWarnings("serial")
public class ViewCartDetailsServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		HttpSession httpSession = req.getSession();
		String uname = (String) httpSession.getAttribute("username");
		if (uname == null) {
			RequestDispatcher rd = req.getRequestDispatcher("HomeLogin.html");
			rd.forward(req, res);
			return;
		} // if
		pw.println("<center>Welcome:" + uname + "</center>");
		RequestDispatcher rd = req.getRequestDispatcher("UserRole.html");
		rd.include(req, res);

		Collection productList = (Collection) httpSession.getAttribute("products");

		if (productList == null) {
			pw.println("You Have Not Added any product to cart..!");
		} // if
		else {
			pw.println("Your Cart Products..!<br><br>");
			Iterator iterator = productList.iterator();
			while (iterator.hasNext()) {
				ProductBean pBean = (ProductBean) iterator.next();
				pw.println(pBean.getPcode() + "&nbsp&nbsp&nbsp" + pBean.getPname() + "&nbsp&nbsp&nbsp" + pBean.getPqty()
						+ "&nbsp&nbsp&nbsp" + "<br>");

			}
		}
	}// method

}// class
