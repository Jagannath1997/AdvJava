<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
<h4 class="msg" style="border: 1px dashed #ccc; padding: 5px; color: #339900;">
    <%=msg%>
</h4>
<%
    }
%>