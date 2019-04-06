<div class="collapse navbar-collapse cl-effect-13" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
        <li><a href="<%=application.getInitParameter("baseURL")%>" class="active">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="services.jsp">Services</a></li>
        <li><a href="gallery.jsp">Gallery</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Signin/Signup<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="student/StudentRegister.jsp">New Student</a></li>
                <li><a href="teacher/TeacherRegister.jsp">New Teacher</a></li>
                <li><a href="<%=application.getInitParameter("signInURL")%>">Signin</a></li>
            </ul>
        </li>
    </ul>
</div>