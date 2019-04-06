package com.jagan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.jagan.bean.BookBean;
import com.jagan.dao.DBConnection;

@SuppressWarnings("serial")
public class UpdateBookServlet extends GenericServlet {

	private Connection con;

	@Override
	public void init() throws ServletException {
		con = DBConnection.getCon();
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		/* get BookBean object from request */
		BookBean bb = (BookBean)req.getAttribute("bean");
		
		// getservletContext object and collect the fName value
		ServletContext sct = this.getServletContext();
		
		String fName = (String) sct.getAttribute("fName");

		try {
			/* code to insert book data to book17table */
			PreparedStatement ps = con
					.prepareStatement("insert into book17(bcode,bname,bauthor,bprice,bqty)values(?,?,?,?,?)");
			
			// set the value to ps object
			ps.setString(1, bb.getbCode());
			ps.setString(2, bb.getbName());
			ps.setString(3, bb.getbAuthor());
			ps.setFloat(4, bb.getbPrice());
			ps.setInt(5, bb.getbQty());
			
			int k = ps.executeUpdate();
			

			if (k > 0) {
				
				// if book is added then send the cotrol to Link1 html
				pw.println("<center>WELCOME : " + fName + "</center><br><br>");
				RequestDispatcher rd = req.getRequestDispatcher("Link1.html");
				rd.include(req, res);
				
				pw.println("<br><h3 align=center color=red><fonr style='color:red'>Book Data Updated Successfully.</font></h3>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
