<div class="header-nav">
    <nav class="navbar navbar-default">
        
        <%@include file="../NavHeader.jsp"%>
        
        <div class="collapse navbar-collapse cl-effect-13" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=application.getInitParameter("adminHomeURL")%>" class="active">Home</a></li>
                <li><a href="AddLibrarian.jsp">Add Librarian</a></li>
                <li><a href="ViewAllLibrarian.jsp">View Librarian</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi, <%=session.getAttribute("name")%><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="ChangePassword.jsp">Change Password</a></li>
                        <li><a href="<%=application.getInitParameter("baseURL")%>">Logout</a></li>
                    </ul>
                </li>
            </ul>

        </div>
        <div class="clearfix"> </div>	
    </nav>
    <div class="clearfix"> </div>
</div>