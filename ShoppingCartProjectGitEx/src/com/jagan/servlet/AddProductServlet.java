package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jagan.bean.ProductBean;
import com.jagan.dbconnection.DriverConnection;

@SuppressWarnings("serial")
public class AddProductServlet extends HttpServlet {

	private Connection con;

	@Override
	public void init() throws ServletException {
		con = DriverConnection.getConnection();
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		HttpSession httpSession = req.getSession();
		String name = (String) httpSession.getAttribute("username");
		if (name != null) {
			String pCode = req.getParameter("pcode");
			String pName = req.getParameter("pname");
			int pQty = Integer.parseInt(req.getParameter("pqty"));
			double pPrice = Double.parseDouble(req.getParameter("pprice"));

			try {

				PreparedStatement ps = con
						.prepareStatement("insert into product17(pcode,pname,pqty,pprice)values(?,?,?,?)");

				ps.setString(1, req.getParameter("pcode"));
				ps.setString(2, req.getParameter("pname"));
				ps.setInt(3, Integer.parseInt(req.getParameter("pqty")));
				ps.setDouble(4, Double.parseDouble(req.getParameter("pprice")));

				int k = ps.executeUpdate();

				if (k > 0) {

					pw.println("<center>Welcome : " + name + "</center><br><br>");
					RequestDispatcher rd = req.getRequestDispatcher("AdminRole.html");
					rd.include(req, res);
					pw.println(
							"<br><h3 align=center color=red><fonr style='color:red'>Product Added Successfully.</font></h3>");
				} else {
					pw.println(
							"\"<br><h3 align=center color=red><fonr style='color:red'>Product not Added .</font></h3>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			pw.println("<center>Your Session Expired..!</center>");
			RequestDispatcher rd = req.getRequestDispatcher("HomeLogin.html");
			rd.include(req, res);
		}
	}

}// end of class
