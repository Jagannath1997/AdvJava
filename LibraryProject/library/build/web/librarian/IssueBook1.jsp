<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    int id = Integer.parseInt(request.getParameter("id").trim());
    int bookid = Integer.parseInt(request.getParameter("bookid").trim());
    String dateofissue = request.getParameter("dateofissue").trim();

    try {
        Connection con = DBConn.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select bookid from issue where id='" + id + "' and bookid='" + bookid + "'");
        if (rs.next()) {
            request.setAttribute("msg", "This book has already been issued to this student");
        } else {
            rs.close();
            rs = st.executeQuery("select count(*) from issue where id='" + id + "'");

            int count = 0;
            if (rs.next() && rs.getInt(1) != 0) {
                count = rs.getInt(1);
            }

            if (count <= 3) {

                count = 0;
                rs.close();
                rs = st.executeQuery("select quantity from books where bookid='" + bookid + "'");
                if (rs.next()) {
                    count = rs.getInt(1);
                }

                if (count == 0) {
                    PreparedStatement ps = con.prepareStatement("update books set status='notavailable' where bookid='" + bookid + "'");
                    ps.executeUpdate();

                    request.setAttribute("msg", " Book not available");

                } else {
                    rs.close();
                    rs = st.executeQuery("select max(issueid) from issue");

                    int issueid = 0;
                    if (rs.next()) {
                        issueid = rs.getInt(1) + 1;
                    }

                    PreparedStatement ps = con.prepareStatement("insert into issue values(?,?,?,?)");
                    ps.setInt(1, issueid);
                    ps.setInt(2, id);
                    ps.setInt(3, bookid);
                    ps.setString(4, dateofissue);
                    ps.executeUpdate();
                    ps.close();

                    ps = con.prepareStatement("update books set quantity=quantity-1,issued=issued+1 where bookid='" + bookid + "'");
                    ps.executeUpdate();
                    ps.close();

                    ps = con.prepareStatement("delete from reservation where bookid='" + bookid + "'");
                    ps.executeUpdate();

                    request.setAttribute("msg", " Book id : " + bookid + " Issued To Student/Teacher id : " + id + " On " + dateofissue);
                }

            } else {
                request.setAttribute("msg", "This student/teacher has already taken 3 books." + "<br>" + "So issuing book is not possible without returning any book.");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Book Issue failed");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>