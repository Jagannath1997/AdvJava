package com.jagan.servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;

import com.jagan.dao.DBConnection;

@SuppressWarnings("serial")
public class ForgotPasswordServlet extends GenericServlet {
	public Connection con;

	@Override
	public void init() throws ServletException {
		con = DBConnection.getCon();
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		String uName = req.getParameter("uname");
		String pWord1 = req.getParameter("pword1");
		String pWord2 = req.getParameter("pword2");
		System.out.println(uName);
		try {
			PreparedStatement ps = con.prepareStatement("select * from usertab17 where name=?");
			ps.setString(1, uName);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				if (pWord1.equals(pWord2)) {
					PreparedStatement ps2 = con.prepareStatement("update usertab17 set pword=? where name=?");
					ps2.setString(1, pWord1);
					ps2.setString(2, uName);
					
					int status = ps2.executeUpdate();
					if (status==1) {
						RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
						pw.println("Password Changed Successfull..<br><br>New Password is :"+pWord1);
						rd.include(req, res);
					} else {

					}
				} else {

					RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
					pw.println("Both Password Doesnot match..");
					rd.include(req, res);
				}
			} else {
				pw.println("Wrong Username..");
				RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
				rd.include(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
