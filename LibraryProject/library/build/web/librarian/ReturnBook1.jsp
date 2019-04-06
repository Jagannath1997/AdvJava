<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    int id = Integer.parseInt(request.getParameter("id").trim());
    int bookid = Integer.parseInt(request.getParameter("bookid").trim());
    try {
        int count = 0;

        Connection con = DBConn.getConn();
        PreparedStatement ps = con.prepareStatement("select issued from books where bookid=?");
        ps.setInt(1, bookid);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt(1);
        }

        if (count != 0) {
            ps = con.prepareStatement("update books set quantity=quantity+1,issued=issued-1 where bookid='" + bookid + "'");
            ps.executeUpdate();
            ps.close();

            ps = con.prepareStatement("delete from issue where id=? AND bookid=(?)");
            ps.setInt(1, id);
            ps.setInt(2, bookid);
            ps.executeUpdate();
            ps.close();

            ps = con.prepareStatement("delete from renewals where id=? AND bookid=(?)");
            ps.setInt(1, id);
            ps.setInt(2, bookid);
            ps.executeUpdate();
            ps.close();

            ps = con.prepareStatement("update books set status='available' where bookid=?");
            ps.setInt(1, bookid);
            ps.executeUpdate();
            ps.close();

            request.setAttribute("msg", "Book Returned Successfully");

        } else {
            request.setAttribute("msg", "This Book has not been issued to any student");
        }

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Book return Failed");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>