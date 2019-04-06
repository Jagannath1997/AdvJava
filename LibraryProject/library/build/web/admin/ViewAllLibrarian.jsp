<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    Connection con = DBConn.getConn();
    PreparedStatement pstmt = con.prepareStatement("select * from librarian WHERE role='Librarian'");
    ResultSet rs = pstmt.executeQuery();
%>


<!DOCTYPE html>
<html>
    <head>
        <title>Online Library | Librarian Home :: library</title>
        <!-- custom-theme -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Emphasize Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- // custom-theme -->
        <!--css links-->
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" /><!--bootstrap-->
        <link href="../css/font-awesome.css" rel="stylesheet"><!--font-awesome-->
        <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" /><!--stylesheet-->
        <link href="../css/custom.css" rel="stylesheet"><!--stylesheet-->
        <!--//css links-->
        <!--fonts-->
        <link href="//fonts.googleapis.com/css?family=Raleway:200,300,400,500,600,700" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=PT+Serif:400,700" rel="stylesheet">
        <!--//fonts-->
    </head>
    <body>
        <!-- Header -->
        <div id="home" class="banner inner-banner-w3l">
            <%@include file="AdminNavigation.jsp"%>
        </div>	
        <!-- //Header -->

        <div class="container" style="margin-top: 50px; padding-bottom: 50px;">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Password</th>
                            <th>Address</th>
                            <th>City</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString("USERID")%></td>
                            <td><%=rs.getString("NAME")%></td>
                            <td><%=rs.getString("EMAIL")%></td>
                            <td><%=rs.getString("MOBILE")%></td>
                            <td><%=rs.getString("PASSWORD")%></td>
                            <td><%=rs.getString("ADDRESS")%></td>
                            <td><%=rs.getString("CITY")%></td>
                            <td>
                                <a href="UpdateLibrarian.jsp?userID=<%=rs.getString("USERID")%>" class="btn btn-primary">Update</a>
                                <a href="DeleteLibrarian.jsp?userID=<%=rs.getString("USERID")%>" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <%@include file="../footer.jsp"%>

        <!-- js -->
        <script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
        <!--//js -->
        <script src="../js/SmoothScroll.min.js"></script>
        <!--Scrolling-top -->
        <script type="text/javascript" src="../js/move-top.js"></script>
        <script type="text/javascript" src="../js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!--//Scrolling-top -->
        <!-- smooth scrolling -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */
                $().UItoTop({easingType: 'easeOutQuart'});
            });
        </script>
        <a href="#home" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
        <!-- //smooth scrolling -->
        <script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
    </body>
</html>