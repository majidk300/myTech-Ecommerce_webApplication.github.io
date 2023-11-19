<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {

        session.setAttribute("message-error", "You  are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%@include file="components/all_common_css_js.jsp" %>

    </head>
    <body>

        <!--navbar-->
        <%@include file="navbar.jsp" %>
        <!--navbar_end-->

        <div class="container">

            <div class="row mt-5">

                <div class="col-md-6">
                    <!--card-->
                    <div class="card">

                        <div class="card-header">
                            <h3 class="text-center mt-1">Your selected items</h3>
                        </div>

                        <div class="card-body">
                            <div class="card-body-modal">
                            </div>
                        </div>

                    </div>

                </div>

                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">

                        <div class="card-header">
                            <h3 class="text-center mt-1">Your details for  details</h3>
                        </div>

                        <div class="card-body">
                            <form action="#" methe="post">

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>

                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input value="<%=user.getUserName()%>" type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="enter your name">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input value="<%=user.getUserPhone()%>" type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="enter your name">
                                </div>

                                <div class="mb-3">
                                    <label for="name" class="form-label">Your shoppping adress</label>
                                    <textarea value="<%=user.getUserAddress()%>" style="height: 100px;" class="form-control" id="exampleInputAdress" aria-describedby="emailHelp" placeholder="enter your adress"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>


            </div>

        </div>

        <!--modal-components-CheckOut -->
        <%@include file="components/common_modals.jsp" %>

    </body>
</html>
