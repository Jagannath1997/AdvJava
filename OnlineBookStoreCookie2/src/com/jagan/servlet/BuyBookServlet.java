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
public class BuyBookServlet extends HttpServlet {
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
			//collect the cookie object from request object
			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				PreparedStatement ps = con.prepareStatement("select * from  book17 where bcode=?");
				ps.setString(1, req.getParameter("bcode"));
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					String bookCode = rs.getString(1);
					int bookQty = rs.getInt(5);
					int updateBookQty = bookQty - 1;
					PreparedStatement ps1 = con.prepareStatement("update book17 set bqty=? where bcode=?");
					ps1.setInt(1, updateBookQty);
					ps1.setString(2, bookCode);
					ps1.executeUpdate();

					RequestDispatcher rd = req.getRequestDispatcher("Link2.html");
					rd.include(req, res);
					pw.println("<br><br>Book Buy Successfully...!");

				} else {
					RequestDispatcher rd = req.getRequestDispatcher("Link2.html");

					rd.include(req, res);
					pw.println("<br><br><center>Book not Available!</center>");
				}
			} else {
				pw.println("<center>Your Session Expired..!</center><br>");
				RequestDispatcher rd = req.getRequestDispatcher("UserLogin.html");
				rd.include(req, res);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
