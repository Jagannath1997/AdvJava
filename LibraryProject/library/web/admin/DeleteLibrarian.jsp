<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String userID = request.getParameter("userID");
    try {
        Connection con = DBConn.getConn();
        PreparedStatement ps = con.prepareStatement("DELETE FROM librarian WHERE userid=?");
        ps.setString(1, userID);
        ps.executeUpdate();
        
        request.setAttribute("msg", "Librarian Deleted Successfully");

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Failed to Delete Librarian");
    }

    response.sendRedirect("ViewAllLibrarian.jsp");
%>







