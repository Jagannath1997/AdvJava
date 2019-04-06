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
import com.jagan.dao.ProductDao;

@SuppressWarnings("serial")
public class ViewProductServlet extends HttpServlet {

	ProductDao productDao;

	@Override
	public void init() throws ServletException {
		/* create the productdao object */
		productDao = new ProductDao();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();

		HttpSession httpSession = req.getSession(false);
		/* collect the name from session object */
		String uname = (String) httpSession.getAttribute("username");
		if (uname == null) {
			pw.println("<center>Session Expired...!</center>");
			RequestDispatcher rd = req.getRequestDispatcher("HomeLogin.html");
			rd.include(req, res);
			return;
		}
		/* collect the Product object from product colection */
		Collection<ProductBean> products = productDao.getProducts();

		if (products == null) {
			pw.println("<center>Product Not Available</center>");
			RequestDispatcher rd = req.getRequestDispatcher("UserRole.html");
			rd.include(req, res);
			return;

		} else {
			pw.println("<center>Welcome: "+uname+"</center>");
			RequestDispatcher rd = req.getRequestDispatcher("UserRole.html");
			rd.include(req, res);
			/* iterate the product from collection */
			Iterator<ProductBean> iterator = products.iterator();
			
			pw.println("<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--Product Details--<br/>");
			pw.println("<br>CODE&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNAME&nbsp&nbsp&nbspQTY&nbsp&nbspPRICE&nbsp&nbspEQty<br>");

			pw.println("---------------------------------------------------<br>");

			while (iterator.hasNext()) {
				
				ProductBean p = (ProductBean) iterator.next();

				pw.println("<form method='post' action='" + res.encodeURL("addproductToCart") + "'>");

				pw.println("<input type='checkbox' name='products' value='" + p.getPcode() + "'/>");

				pw.println("<input type='hidden' name='" + p.getPcode() + "Name'value='" + p.getPname() + "'/>");

				pw.println(p.getPcode() + "&nbsp&nbsp&nbsp" + p.getPname() + "&nbsp&nbsp&nbsp" + p.getPqty()
						+ "&nbsp&nbsp&nbsp" + p.getPprice() + "&nbsp&nbsp&nbsp<input size='4' type='text' name='"
						+ p.getPcode() + "'/>" + "<br>");
			}
		} // else

		pw.println("<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='submit' value='AddProductsToCart'/></form>");

	}// method

	ProductDao productDao2;
}// class
