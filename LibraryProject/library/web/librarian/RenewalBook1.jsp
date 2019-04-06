<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    int id = Integer.parseInt(request.getParameter("id").trim());
    int bookid = Integer.parseInt(request.getParameter("bookid").trim());
    String dateofrenewal = request.getParameter("dor").trim();
    try {
        Connection con = DBConn.getConn();
        PreparedStatement ps = con.prepareStatement("INSERT INTO renewals VALUES(?,?,?)");
        ps.setInt(1, id);
        ps.setInt(2, bookid);
        ps.setString(3, dateofrenewal);
        ps.executeUpdate();

        request.setAttribute("msg", "Book Renewal Successfully");
        
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Book Renewal Failed");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>