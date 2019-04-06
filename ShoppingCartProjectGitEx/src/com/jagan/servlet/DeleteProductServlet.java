package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jagan.dbconnection.DriverConnection;

@SuppressWarnings("serial")
public class DeleteProductServlet extends HttpServlet {

	public Connection con;

	@Override
	public void init() throws ServletException {
		con = DriverConnection.getConnection();
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		try {
			HttpSession httpSession = req.getSession();
			String name=(String)httpSession.getAttribute("username");
			if (name != null) {
				PreparedStatement ps = con.prepareStatement("select * from  Product17 where pcode=?");
				ps.setString(1, req.getParameter("pcode"));
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					String productCode = rs.getString(1);
					PreparedStatement ps1 = con.prepareStatement("delete product17 where pcode=?");
					ps1.setString(1, productCode);
					boolean status = ps1.executeUpdate() >= 0;
					if (status) {
						pw.println("<center>Welcome: </center> "+name);
						RequestDispatcher rd = req.getRequestDispatcher("AdminRole.html");
						rd.include(req, res);
						pw.println("<br><center>Product Deleted Successfully...!</center>");
					}
				} else {
					RequestDispatcher rd = req.getRequestDispatcher("AdminRole.html");
					rd.include(req, res);
					pw.println("<br><br><center>Product Not Available..!</center>");
				}
			} else {
				pw.println("<center>Session Expired...!</center>");
				RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.html");
				rd.include(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
