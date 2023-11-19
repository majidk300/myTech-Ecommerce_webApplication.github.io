
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page | mycart</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="components/css/login_style.css"/>

        <%@include file="components/all_common_css_js.jsp" %>

    </head>
    <body>

        <!--navbar-->
        <%@include file="navbar.jsp" %>
        <!--navbar_end-->


        <!--sign in-->
        <div class="container_body">



            <%                String messages = (String) session.getAttribute("message");
                //for logout
                if (messages != null && messages.trim().equals("Successfully logout !")) {
            %>
            <%@include file="components/message.jsp" %>
            <%                } //for invalid email or password 
            else {
            %>  
            <%@include file="components/message-error.jsp" %>
            <%                    }
            %>

            <div class="container" id="container">

                <div class="form-container sign-in-container">

                    <form action="loginServlet" method="post" class="form-sign-in">
                        <h1>Sign in</h1>
                        <div class="social-container">
                            <a href="#" class="social"><i class="fa fa-facebook-f"></i></a>
                            <a href="#" class="social"><i class="fa fa-google"></i></a>
                            <a href="#" class="social"><i class="fa fa-linkedin"></i></a>
                        </div>
                        <span>or use your account</span>
                        <input name="email" type="email" placeholder="Email" required/>
                        <input name="password" type="password" placeholder="Password" required/>
                        <a href="#" class="forgot">Forgot your password?</a>
                        <button class="custom-bg btn">Sign In</button>
                    </form>
                </div>
                <div class="overlay-container custom-bg">
                    <div class="overlay custom-bg">

                        <div class="overlay-panel overlay-right custom-bg">
                            <h1>Hello, Friend!</h1>
                            <p>Enter your personal details and start journey with us</p>
                            <a href="register.jsp"><button class="ghost  custom-bg btn" id="signUp" >Sign Up</button></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </body>
</html>
