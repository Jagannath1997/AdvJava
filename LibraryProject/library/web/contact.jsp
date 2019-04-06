<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Online Library | Contact :: library</title>
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
        
        <!-- Mail Us inner -->
        <div class="contact-page-w3ls inner-padding">
            <div class="container">
                <h3 class="heading-agileinfo">Mail Us<span>Cras eleifend hendrerit libero</span></h3>
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3539.812628729253!2d153.014155!3d-27.4750921!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b915a0835840a2f%3A0xdd5e3f5c208dc0e1!2sMelbourne+St%2C+South+Brisbane+QLD+4101%2C+Australia!5e0!3m2!1sen!2sin!4v1492257477691"></iframe>
                <div class="contact-info-w3ls">
                    <div class="contact-left-w3layouts">
                        <div class="contact-w3-agileits">
                            <img src="images/c1.jpg" alt="img">
                            <div class="right-contact-w3ls">
                                <h6>Daniel</h6>
                                <p class="work-w3">Director</p>
                                <div class="span-sub-w3ls">
                                    <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span><p class="number-w3">+91 9439864619</p>
                                </div>
                                <div class="span-sub-w3ls">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@example.com">daniel@elibrary.com</a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="contact-w3-agileits">
                            <img src="images/c2.jpg" alt="img">
                            <div class="right-contact-w3ls">
                                <h6>Smith Carl</h6>
                                <p class="work-w3">Principal</p>
                                <div class="span-sub-w3ls">
                                    <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span><p class="number-w3">+91 9439864619</p>
                                </div>
                                <div class="span-sub-w3ls">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@example.com">smith@elibrary.com</a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="contact-w3-agileits">
                            <img src="images/c3.jpg" alt="img">
                            <div class="right-contact-w3ls">
                                <h6>James Mac</h6>
                                <p class="work-w3">Teacher</p>
                                <div class="span-sub-w3ls">
                                    <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span><p class="number-w3">+91 9439864619</p>
                                </div>
                                <div class="span-sub-w3ls">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@example.com">james@elibrary.com</a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="contact-right-w3layouts">
                        <h5 class="title-w3">We Would Love To Hear From You!</h5>
                        <p class="head-w3-agileits">If you have any questions, please call us or fill in the form below and we will get back to you very soon.</p>
                        <form action="#" method="post">
                            <input type="text" name="your name" placeholder="YOUR NAME" required="">
                            <input type="email" name="your email" placeholder="YOUR EMAIL" required="">
                            <textarea name="your message" placeholder="YOUR MESSAGE" required=""></textarea>
                            <input type="submit" value="Send Message">
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- //Mail Us inner -->
        
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