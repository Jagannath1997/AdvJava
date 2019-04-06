<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String bookID = request.getParameter("bookID");
    try {
        Connection con = DBConn.getConn();
        PreparedStatement ps = con.prepareStatement("DELETE FROM books WHERE BOOKID=?");
        ps.setString(1, bookID);
        ps.executeUpdate();
        
        request.setAttribute("msg", "Book Deleted Successfully");

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Failed to Delete Book");
    }

    response.sendRedirect("ViewAllBooks.jsp");
%>







