<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    int id = Integer.parseInt(request.getParameter("tid").trim());
    int bookid = Integer.parseInt(request.getParameter("bookid").trim());
    String dateofreserve = request.getParameter("dateofreserve").trim();

    try {
        Connection con = DBConn.getConn();
        Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement("INSERT INTO reservation VALUES (?,?,?,?)");
        ResultSet rs = st.executeQuery("SELECT max(rid) FROM reservation");
        int rid = 0;

        if (rs.next()) {
            rid = rs.getInt(1) + 1;
        }

        ps.setInt(1, rid);
        ps.setInt(2, id);
        ps.setInt(3, bookid);
        ps.setString(4, dateofreserve);
        ps.executeUpdate();
        
        request.setAttribute("msg", "Book Reserved. Your Reservation ID is : " + rid);
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Falied to reserve book");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>