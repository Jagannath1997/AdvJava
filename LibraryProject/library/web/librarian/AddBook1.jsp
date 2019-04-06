<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String booktitle = request.getParameter("booktitle").trim();
    String author = request.getParameter("author").trim();
    String publications = request.getParameter("publications").trim();
    String noofpages = request.getParameter("noofpages").trim();
    String price = request.getParameter("price").trim();
    int quantity = Integer.parseInt(request.getParameter("qty").trim());
    String status = request.getParameter("status").trim();
    try {
        Connection con = DBConn.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT max(bookid) FROM books");

        int bid = 0;

        if (rs.next()) {
            bid = rs.getInt(1);
        }
        
        if(bid == 0)
            bid=1000;
            
        bid++;

        PreparedStatement ps = con.prepareStatement("INSERT INTO books VALUES (?,?,?,?,?,?,?,?,?)");
        ps.setInt(1, bid);
        ps.setString(2, booktitle);
        ps.setString(3, author);
        ps.setString(4, publications);
        ps.setString(5, noofpages);
        ps.setString(6, price);
        ps.setInt(7, quantity);
        ps.setInt(8, 0);
        ps.setString(9, status);
        ps.executeUpdate();
        
        ps.close();

        ps = con.prepareStatement("INSERT INTO inventory VALUES (?,?,?,?)");
        ps.setInt(1, bid);
        ps.setString(2, booktitle);
        ps.setString(3, author);
        ps.setInt(4, quantity);
        ps.executeUpdate();

        request.setAttribute("msg", "Book added Successfully");

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Failed to add Book");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>







