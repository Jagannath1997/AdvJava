<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Online Library | Services :: library</title>
        <!-- custom-theme -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Emphasize Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- // custom-theme -->
        <!--css links-->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" /><!--bootstrap-->
        <link href="css/font-awesome.css" rel="stylesheet"><!--font-awesome-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" /><!--stylesheet-->
        <!--//css links-->
        <!--fonts-->
        <link href="//fonts.googleapis.com/css?family=Raleway:200,300,400,500,600,700" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=PT+Serif:400,700" rel="stylesheet">
        <!--//fonts-->
    </head>
    <body>
        <!-- Header -->
        <div id="home" class="banner inner-banner-w3l">
            <div class="header-nav">
                <nav class="navbar navbar-default">

                    <%@include file="NavHeader.jsp"%>
                    <%@include file="InnerPageNavigation.jsp"%>

                    <div class="clearfix"> </div>	
                </nav>
                <div class="clearfix"> </div>
            </div>
        </div>	
        <!-- //Header -->

        <!-- services inner -->
        <div class="agileinfo_services_grids inner-padding">
            <div class="container">
                <h3 class="heading-agileinfo">Featured services<span>We are giving special services</span></h3>
                <div class="col-md-4 agileinfo_services_grid">
                    <div class="agileinfo_services_grid1">
                        <i class="fa fa-female" aria-hidden="true"></i>
                        <h4>Mother’s Helpers</h4>
                        <p>Quisque consectetur, sem id sagittis sodales, augue diam consequat mi, 
                            sed suscipit turpis diam eget nisl.</p>
                    </div>
                </div>
                <div class="col-md-4 agileinfo_services_grid">
                    <div class="agileinfo_services_grid1">
                        <i class="fa fa-group" aria-hidden="true"></i>
                        <h4>Friendly Support</h4>
                        <p>Quisque consectetur, sem id sagittis sodales, augue diam consequat mi, 
                            sed suscipit turpis diam eget nisl.</p>
                    </div>
                </div>
                <div class="col-md-4 agileinfo_services_grid">
                    <div class="agileinfo_services_grid1">
                        <i class="fa fa-book" aria-hidden="true"></i>
                        <h4>Educational Events</h4>
                        <p>Quisque consectetur, sem id sagittis sodales, augue diam consequat mi, 
                            sed suscipit turpis diam eget nisl.</p>
                    </div>
                </div>
                <div class="col-md-4 agileinfo_services_grid">
                    <div class="agileinfo_services_grid1">
                        <i class="fa fa-paint-brush" aria-hidden="true"></i>
                        <h4>Art Programs</h4>
                        <p>Quisque consectetur, sem id sagittis sodales, augue diam consequat mi, 
                            sed suscipit turpis diam eget nisl.</p>
                    </div>
                </div>
                <div class="col-md-4 agileinfo_services_grid">
                    <div class="agileinfo_services_grid1">
                        <i class="fa fa-group" aria-hidden="true"></i>
                        <h4>Social Programs</h4>
                        <p>Quisque consectetur, sem id sagittis sodales, augue diam consequat mi, 
                            sed suscipit turpis diam eget nisl.</p>
                    </div>
                </div>
                <div class="col-md-4 agileinfo_services_grid">
                    <div class="agileinfo_services_grid1">
                        <i class="fa fa-trophy" aria-hidden="true"></i>
                        <h4>Special Olympics</h4>
                        <p>Quisque consectetur, sem id sagittis sodales, augue diam consequat mi, 
                            sed suscipit turpis diam eget nisl.</p>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //services inner -->
        
        <%@include file="footer.jsp"%>
        
        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!--//js -->
        <script src="js/SmoothScroll.min.js"></script>
        <!--Scrolling-top -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
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
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
    </body>
</html>