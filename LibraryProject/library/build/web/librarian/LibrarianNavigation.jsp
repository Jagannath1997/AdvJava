<div class="header-nav">
    <nav class="navbar navbar-default">
        
        <%@include file="../NavHeader.jsp"%>
        
        <div class="collapse navbar-collapse cl-effect-13" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=application.getInitParameter("librarianHomeURL")%>" class="active">Home</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Book<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="AddBook.jsp">Add New Book</a></li>
                        <li><a href="ViewAllBooks.jsp">View All Books</a></li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">List All Books<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="BooksByTitle.jsp">List Books Based on Title</a></li>
                        <li><a href="BooksByAuthor.jsp">List Books Based on Author</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Issue Book<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="IssueBook.jsp">Issue Book</a></li>
                        <li><a href="RenewalBook.jsp">Renewal Book</a></li>
                        <li><a href="ReturnBook.jsp">Return Book</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Others<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="ListOfReservedBooks.jsp">List Of Book Reservation</a></li>
                        <li><a href="ListOfIssuedBooks.jsp">List Of Issued Books</a></li>
                        <li><a href="ListOfRenewalBooks.jsp">List Of Renewal Books</a></li>
                        <li><a href="ListOfAllStudents.jsp">List Of All Students</a></li>
                        <li><a href="Inventory.jsp">Inventory</a></li>
                    </ul>
                </li>
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