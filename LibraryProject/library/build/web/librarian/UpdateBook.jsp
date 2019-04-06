<%@page import="dao.DBConn"%>
<%@page import="java.sql.*"%>
<%
    Connection con = DBConn.getConn();
    PreparedStatement ps = con.prepareStatement("select * from books WHERE BOOKID=?");
    ps.setInt(1, Integer.parseInt(request.getParameter("bookID")));
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
            <%@include file="LibrarianNavigation.jsp"%>
        </div>	
        <!-- //Header -->


        <%
            if (rs.next()) {
        %>
        <div class="form-wrapper">
            <%@include file="../msg.jsp"%>
            <h3 class="form-title">Update Book</h3>
            <form action="UpdateBook1.jsp" method="post">
                <input type="hidden" name="pageName" value="UpdateBook.jsp">
                <input type="hidden" name="bookID" value="<%=request.getParameter("bookID")%>">
                <div class="form-group">
                    <label>Book Title:</label>
                    <input type="text" class="form-control" name="booktitle" value="<%=rs.getString("BOOKTITLE")%>">
                </div>
                <div class="form-group">
                    <label>Author:</label>
                    <input type="text" class="form-control" name="author" value="<%=rs.getString("AUTHOR")%>">
                </div>
                <div class="form-group">
                    <label>Publication:</label>
                    <input type="text" class="form-control" name="publications" value="<%=rs.getString("PUBLICATIONS")%>">
                </div>
                <div class="form-group">
                    <label>No of Pages:</label>
                    <input type="text" class="form-control" name="noofpages" value="<%=rs.getString("TOTALPAGES")%>">
                </div>
                <div class="form-group">
                    <label>Price:</label>
                    <input type="text" class="form-control" name="price" value="<%=rs.getString("PRICE")%>">
                </div>
                <!--                <div class="form-group">
                                    <label>Quantity:</label>
                                    <input type="text" class="form-control" name="qty" value="<%=rs.getString("BOOKTITLE")%>">
                                </div>-->
                <!--                <div class="form-group">
                                    <label>Status:</label>
                                    <select class="form-control" name="status"> 
                                        <option value="avilable">AVILABLE</option>
                                        <option value="notavilable">NOT AVILABLE</option>
                                    </select>
                                </div>-->
                <button type="submit" class="btn btn-primary">Update Book</button>
                <a href="ViewAllBooks.jsp" class="btn btn-danger">Back</a>
            </form>
        </div>
        <%
            }
        %>

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
        
        <!--settings for "bootstrapValidator" plugin-->
        <!--<link href="/cdn/css/bootstrap.min-3.3.6.css" rel="stylesheet">-->
        <link href="../css/bootstrapValidator.min.css" rel="stylesheet">
        <!--<script src="/cdn/js/jquery-1.12.1.min.js"></script>-->
        <!--<script src="/cdn/js/bootstrap.min-3.3.6.js"></script>-->
        <script src="../js/bootstrapValidator.min.js"></script>
        <script src="../js/custom.js"></script>
        
    </body>
</html>