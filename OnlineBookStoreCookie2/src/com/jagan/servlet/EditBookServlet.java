package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jagan.dao.DBConnection;

@SuppressWarnings("serial")
public class EditBookServlet extends HttpServlet {
	Connection con;

	@Override
	public void init() throws ServletException {
		con = DBConnection.getCon();
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		try {
			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				PreparedStatement ps = con.prepareStatement("select * from  book17 where bcode=?");
				ps.setString(1, req.getParameter("bcode"));
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					PreparedStatement ps1 = con.prepareStatement("update book17 set bprice=? where bcode=?");
					int bPrice = Integer.parseInt(req.getParameter("bprice"));
					ps1.setInt(1, bPrice);
					ps1.setString(2, rs.getString(1));
					boolean status = ps1.executeUpdate() > 0;
					if (status) {
						RequestDispatcher rd = req.getRequestDispatcher("Link1.html");
						rd.include(req, res);
						pw.println("<br><br><center>BookUpdated Successfully...!</center>");
					}
				} else {
					RequestDispatcher rd = req.getRequestDispatcher("Link1.html");
					rd.include(req, res);
					pw.println("<br><br><center>Book not Available!</center>");
				}
			} else {
				pw.println("<center>SessionExpired..!</center>");
				RequestDispatcher rd = req.getRequestDispatcher("Login.html");
				rd.include(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
