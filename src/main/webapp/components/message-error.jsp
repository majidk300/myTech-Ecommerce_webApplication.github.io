<%

    String message = (String) session.getAttribute("message-error");

    if (message != null) {

%>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong><%=message%></strong>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%

    session.removeAttribute("message-error");
    
    }

%>