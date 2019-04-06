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

import com.jagan.bean.UserRegBean;
import com.jagan.dbconnection.DriverConnection;

@SuppressWarnings("serial")
public class FinalRegServlet extends GenericServlet {

	// create a Connection variable of Connection type
	public Connection con;

	@Override
	public void init() throws ServletException {
		
		/* collect the connection object from DBConnection Dao class by invoking
		  getCon() method*/
		 
		con = DriverConnection.getConnection();
	}//end of init() method

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		ServletContext sct = this.getServletContext();
		UserRegBean urb = (UserRegBean) sct.getAttribute("regBean");

		try {
			//create the PreparedStatement object by passing insert query
			PreparedStatement ps=con.prepareStatement
					("insert into UserTab17(name,pword,fname,lname,addr,phno,mailid)values(?,?,?,?,?,?,?)");
			
			ps.setString(1,urb.getuName());
			ps.setString(2,urb.getpWord());
			ps.setString(3,urb.getfName());
			ps.setString(4,urb.getlName());
			ps.setString(5,urb.getAddr());
			ps.setLong(6,urb.getPhNo());
			ps.setString(7,urb.getmId());
			
			boolean k=ps.executeUpdate()>0;
			
			if(k) {
				pw.println("<center><fonr style='color:blue'>User Registration Successfull.</font></center><br><br>");
				
				RequestDispatcher rd=req.getRequestDispatcher("UserLogin.html");
				rd.include(req,res);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}//end catch
	}//end service().
}//end class
