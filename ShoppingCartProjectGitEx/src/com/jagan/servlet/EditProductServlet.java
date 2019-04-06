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
public class EditProductServlet extends HttpServlet {
	Connection con;

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
			String uName = httpSession.getAttribute("username").toString();
			
			if (uName != null) {
				PreparedStatement ps = con.prepareStatement("select * from  product17 where pcode=?");
				ps.setString(1, req.getParameter("pcode"));
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					PreparedStatement ps1 = con
							.prepareStatement("update product17 set pname=? , pqty=?, pprice=? where pcode=?");
					
					String pname=req.getParameter("pname");
					int pqty=Integer.parseInt(req.getParameter("pqty"));
					double pprice=Double.parseDouble(req.getParameter("pprice"));
					
					System.out.println(pname+","+pqty+","+pprice);
					
					ps1.setString(1, pname);
					ps1.setInt(2, pqty);
					ps1.setDouble(3, pprice);
					ps1.setString(4, req.getParameter("pcode"));
					
					System.out.println("after Setting");
					boolean status = ps1.executeUpdate() > 0;
					if (status) {
						pw.println("<center>Welcome:"+uName+"</center>");
						RequestDispatcher rd = req.getRequestDispatcher("AdminRole.html");
						rd.include(req, res);
						pw.println("<br><br><center>Product Updated Successfully...!</center>");
					}
				} else {
					RequestDispatcher rd = req.getRequestDispatcher("AdminRole.html");
					rd.include(req, res);
					pw.println("<br><br><center>Product not Available!</center>");
				}
			} else {
				pw.println("<center>SessionExpired..!</center>");
				RequestDispatcher rd = req.getRequestDispatcher("HomeLogin.html");
				rd.include(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
