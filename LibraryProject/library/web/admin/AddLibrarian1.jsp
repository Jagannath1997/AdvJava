<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String name = request.getParameter("name").trim();
    String email = request.getParameter("email").trim();
    String mobile = request.getParameter("mobile").trim();
    String password = request.getParameter("password").trim();
    String address = request.getParameter("address").trim();
    String city = request.getParameter("city").trim();

    try {
        Connection con = DBConn.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT max(userid) FROM librarian");

        int uid = 0;

        if (rs.next()) {
            uid = rs.getInt(1);
        }
        
        if(uid == 0)
            uid=2000;
            
        uid++;

        PreparedStatement ps = con.prepareStatement("INSERT INTO librarian VALUES(?,?,?,?,?,?,?,?)");
        ps.setInt(1, uid);
        ps.setString(2, name);
        ps.setString(3, email);
        ps.setLong(4, Long.parseLong(mobile));
        ps.setString(5, password);
        ps.setString(6, address);
        ps.setString(7, city);
        ps.setString(8, "Librarian");
        ps.executeUpdate();
        
        request.setAttribute("msg", "Librarian added successfully with id : " + uid);

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Failed to add librarian");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>
