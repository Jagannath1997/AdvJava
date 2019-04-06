<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String sname = request.getParameter("sname").trim();
    int regno = Integer.parseInt(request.getParameter("regno").trim());
    String branch = request.getParameter("branch").trim();
    String email = request.getParameter("email").trim();
    String password = request.getParameter("password").trim();
    String address = request.getParameter("address").trim();
    String mobile = request.getParameter("mobile").trim();
    
    try {
        Connection con = DBConn.getConn();
        Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement("insert into student(SID,SNAME,EMAIL,PASSWORD,ADDRESS,MOBILE,ROLE,REGNO,BRANCH) values(?,?,?,?,?,?,?,?,?)");
        ResultSet rs = st.executeQuery("SELECT max(sid) from student");
        int sid = 0;
        if (rs.next()) {
            sid = rs.getInt(1);
        }
        if(sid == 0)
            sid=3000;
            
        sid++;
        
        ps.setInt(1, sid);
        ps.setString(2, sname);
        ps.setString(3, email);
        ps.setString(4, password);
        ps.setString(5, address);
        ps.setString(6, mobile);
        ps.setString(7, "Student");
        ps.setInt(8, regno);
        ps.setString(9, branch);
        ps.executeUpdate();

        request.setAttribute("msg", "Registration Compleated Successfully, your id is : " + sid);
        
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Registration Failed");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);
%>
