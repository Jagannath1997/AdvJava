package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jagan.bean.ProductBean;

public class AddProductToCartServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		HttpSession httpSession = req.getSession();
		String uname = httpSession.getAttribute("username").toString();
		if (uname == null) {
			RequestDispatcher rd = req.getRequestDispatcher("HomeLogin.html");
			rd.forward(req, res);
			return;
		} // if close

		ArrayList<ProductBean> productsList = (ArrayList<ProductBean>) httpSession.getAttribute("products");

		/* check whether products contain data or not */
		if (productsList == null) {
			productsList = new ArrayList<ProductBean>();
			/* set the product list into httpsession */
			httpSession.setAttribute("products", productsList);
		} // if close

		String[] pcodes = req.getParameterValues("products");// products is checkbox name='products'

		for (int i = 0; i < pcodes.length; i++) {

			if (req.getParameter(pcodes[i]).equals(""))
				continue;

			ProductBean pBean = new ProductBean();
			pBean.setPcode(pcodes[i]);
			int j = productsList.indexOf(pBean);
			if (j != -1) {
				pBean = (ProductBean) productsList.get(j);
				pBean.setPqty(Integer.parseInt(req.getParameter(pcodes[i])));
			} // if close
			else {
				pBean.setPname(req.getParameter(pcodes[i] + "Name"));
				pBean.setPqty(Integer.parseInt(req.getParameter(pcodes[i])));
				productsList.add(pBean);
			} // else

		} // end of for
		pw.println("Item added to cart..");
		RequestDispatcher rd = req.getRequestDispatcher("UserRole.html");
		rd.include(req, res);
	}

}
