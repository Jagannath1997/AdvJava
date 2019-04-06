<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%

    String userid = (String) session.getAttribute("userid");
    String loginPassword = (String) session.getAttribute("loginPassword");
    String role = (String) session.getAttribute("role");

    String currentPassword = request.getParameter("currentPassword");

    if (currentPassword.equals(loginPassword)) {
        
        String newPassword = request.getParameter("password");
        
        try {
            String sql = "update student set password=? WHERE (sid=? OR email=?) and role=?";
            Connection con = DBConn.getConn();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, newPassword);

            if (userid.indexOf("@") != -1) {
                ps.setInt(2, 0);
                ps.setString(3, userid);
            } else {
                ps.setInt(2, Integer.parseInt(userid));
                ps.setString(3, "");
            }
            
            ps.setString(4, role);

            int count = ps.executeUpdate();
            if (count == 1) {
                session.setAttribute("loginPassword", newPassword);
                request.setAttribute("msg", "Password changed successfully");
            } else {
                request.setAttribute("msg", "Failed to change Password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Exception Occured");
        }
    } else {
        request.setAttribute("msg", "Invalid current password...Try again");
    }

    RequestDispatcher rd = request.getRequestDispatcher(request.getParameter("pageName"));
    rd.forward(request, response);

%>