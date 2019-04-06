<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String tname = request.getParameter("tname").trim();
    String dept = request.getParameter("dept").trim();
    String email = request.getParameter("email").trim();
    String password = request.getParameter("password").trim();
    String address = request.getParameter("address").trim();
    String mobile = request.getParameter("mobile").trim();
    
    try {
        Connection con = DBConn.getConn();
        Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement("insert into teacher(TID,TNAME,EMAIL,PASSWORD,ADDRESS,MOBILE,ROLE,DEPT) values(?,?,?,?,?,?,?,?)");
        ResultSet rs = st.executeQuery("SELECT max(tid) from teacher");
        int tid = 0;
        if (rs.next()) {
            tid = rs.getInt(1);
        }
        if(tid == 0)
            tid=4000;
            
        tid++;
        
        ps.setInt(1, tid);
        ps.setString(2, tname);
        ps.setString(3, email);
        ps.setString(4, password);
        ps.setString(5, address);
        ps.setString(6, mobile);
        ps.setString(7, "Teacher");
        ps.setString(8, dept);
        ps.executeUpdate();

        request.setAttribute("msg", "Registration Compleated Successfully, your id is : " + tid);
        
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Registration Failed");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>
