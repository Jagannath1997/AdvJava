package com.jagan.servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;

import com.jagan.dao.DBConnection;

@SuppressWarnings("serial")
public class ForgotUserServlet extends GenericServlet {
	public Connection con;

	@Override
	public void init() throws ServletException {
		con = DBConnection.getCon();
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		long phNo = Long.parseLong(req.getParameter("phno"));

		try {

			PreparedStatement ps = con.prepareStatement("select * from usertab17 where phno=?");
			
			ps.setLong(1, phNo);
			
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				String uName = rs.getString(1);

				RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
				pw.println("Your UserName is :  " + uName);

				rd.include(req, res);

			} else {
				pw.println("Wrong Phone Number..");
				RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
				rd.include(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
