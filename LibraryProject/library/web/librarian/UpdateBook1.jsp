<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String bookID = request.getParameter("bookID");
    String booktitle = request.getParameter("booktitle").trim();
    String author = request.getParameter("author").trim();
    String publications = request.getParameter("publications").trim();
    String noofpages = request.getParameter("noofpages").trim();
    String price = request.getParameter("price").trim();
    try {
        Connection con = DBConn.getConn();
        PreparedStatement ps = con.prepareStatement("UPDATE books SET BOOKTITLE=?,AUTHOR=?,PUBLICATIONS=?,TOTALPAGES=?,PRICE=? WHERE BOOKID=?");
        ps.setString(1, booktitle);
        ps.setString(2, author);
        ps.setString(3, publications);
        ps.setString(4, noofpages);
        ps.setString(5, price);
        ps.setString(6, bookID);
        ps.executeUpdate();
        
        request.setAttribute("msg", "Book Updated Successfully");

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Failed to Update Book");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>







