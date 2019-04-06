<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String userID = request.getParameter("userID").trim();
    String name = request.getParameter("name").trim();
    String email = request.getParameter("email").trim();
    String mobile = request.getParameter("mobile").trim();
    String password = request.getParameter("password").trim();
    String address = request.getParameter("address").trim();
    String city = request.getParameter("city").trim();

    try {
        Connection con = DBConn.getConn();
        PreparedStatement ps = con.prepareStatement("UPDATE librarian SET name=?,email=?,mobile=?,password=?,address=?,city=? where userid=?");
        
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setLong(3, Long.parseLong(mobile));
        ps.setString(4, password);
        ps.setString(5, address);
        ps.setString(6, city);
        ps.setInt(7, Integer.parseInt(userID));
        ps.executeUpdate();
        
        request.setAttribute("msg", "Librarian updated successfully");

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Failed to update librarian");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>
