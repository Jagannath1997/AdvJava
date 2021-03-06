<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    String bookTitle = request.getParameter("bookTitle").toLowerCase();
    Connection con = DBConn.getConn();
    PreparedStatement ps = con.prepareStatement("select * from books WHERE LOWER(BOOKTITLE) LIKE '%" + bookTitle + "%'");
    ResultSet rs = ps.executeQuery();
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
            <%@include file="StudentNavigation.jsp"%>
        </div>	
        <!-- //Header -->

        <div class="container" style="margin-top: 50px; padding-bottom: 50px;">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Book Title</th>
                            <th>Author</th>
                            <th>Publication</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString("BOOKID")%></td>
                            <td><%=rs.getString("BOOKTITLE")%></td>
                            <td><%=rs.getString("AUTHOR")%></td>
                            <td><%=rs.getString("PUBLICATIONS")%></td>
                            <td><%=rs.getString("STATUS")%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                    <a href="BooksByTitle.jsp" class="btn btn-danger">Back</a>
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