<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String userid = request.getParameter("userid").trim();
    String password = request.getParameter("password").trim();
    String role = request.getParameter("role").trim();
    try {
        String sql = "";
        if (role.equals("Student")) {
            sql = "select * from student WHERE (sid=? OR email=?) and password=?";
        } else if (role.equals("Teacher")) {
            sql = "select * from teacher WHERE (tid=? OR email=?) and password=?";
        } else if (role.equals("Librarian")) {
            sql = "select * from librarian WHERE (userid=? OR email=?) and password=?";
        } else if (role.equals("Admin")) {
            sql = "select * from librarian WHERE (userid=? OR email=?) and password=?";
        }

        Connection con = DBConn.getConn();
        PreparedStatement ps = con.prepareStatement(sql);
        if(userid.indexOf("@") != -1){
            ps.setInt(1, 0);
            ps.setString(2, userid);
        }else{
            ps.setInt(1, Integer.parseInt(userid));
            ps.setString(2, "");
        }
        ps.setString(3, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            
            session.setAttribute("userid", userid);
            session.setAttribute("loginPassword", password);
            session.setAttribute("role", role);
            session.setAttribute("name", rs.getString(2));
            
            if (role.equals("Student")) {
                response.sendRedirect("student/StudentHome.jsp");
            } else if (role.equals("Teacher")) {
                response.sendRedirect("teacher/TeacherHome.jsp");
            } else if (role.equals("Librarian")) {
                response.sendRedirect("librarian/LibrarianHome.jsp");
            } else if (role.equals("Admin")) {
                response.sendRedirect("admin/AdminHome.jsp");
            }
        } else {
            request.setAttribute("msg", "Invalid Userid/Password");
            RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
            rd.forward(request, response);
        }

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "Exception Occured");
        RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
        rd.forward(request, response);
    }


%>