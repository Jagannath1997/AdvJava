<%@page import="com.util.mail.Mail"%>
<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String email = request.getParameter("email").trim();
    String role = request.getParameter("role").trim();
    try {
        String sql = "";
        if (role.equals("Student")) {
            sql = "select password from student WHERE email=? and role=?";
        } else if (role.equals("Librarian") || role.equals("Admin")) {
            sql = "select password from librarian WHERE email=? and role=?";
        }

        Connection con = DBConn.getConn();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, role);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String subject = "Forgot Password";
            String msgBody = "Your password is : ";

            msgBody = msgBody + rs.getString("password");

            // send mail
            Mail mail = Mail.getInstance();
            mail.setSenderCredentials("noreply.pharmaic@gmail.com", "pharmaic");
            mail.sendMail(email, subject, msgBody);
            
            out.println("Password has been sent to your registered mail id.");
            
        } else {
            out.println("This mail id is not registered.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Exception Occured");
    }
    
    out.flush();

%>