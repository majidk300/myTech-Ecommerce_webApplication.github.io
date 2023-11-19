<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Registration Form | mycart </title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
     <%@include file="components/all_common_css_js.jsp" %>
     
     <!--register css-->
     <link rel="stylesheet" href="components/css/register_style.css">
     
     <style>
         @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
     </style>
     
   </head>
<body>
    
            <!--navbar-->
        <%@include file="navbar.jsp" %>
        <!--navbar_end-->
        
        <div class="body-container">
            
             <div class="box-container">
           <%@include file="components/message.jsp" %>
   <div class="container">
       
       <div class="title">Registration</div>
      
    <div class="content">
       
        
        <form action="RegisterServlet" method="post">
         
        <div class="user-details">
          <div class="input-box">
              
            <span class="details">Full Name</span>
            <input name="user_name"  type="text" placeholder="Enter your name" required>
          </div>
          <div class="input-box">
            <span  class="details">Phone Number</span>
            <input name="user_number" type="text" placeholder="Enter your phone number" required>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input name="user_email" type="text" placeholder="Enter your email" required>
          </div>
          
          <div class="input-box">
            <span class="details">Password</span>
            <input name="user_password" type="text" placeholder="Enter your password" required>
          </div>
            
            <div class="input-box">
            <span class="details">Address</span>
            <textarea name="user_address"  placeholder="Enter your address" class="form-control"  style="height:100px;"></textarea>
          </div>
            
            <div class="input-box">
            <span class="details">Photo</span>
            <input name="user_pic" type="file"style="opacity:0.85">
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Register">
        </div>
          
          <div>
          <input  class="btn bg-light" type="reset" value="Reset">
        </div>
          
      </form>
    </div>
  </div>
   </div>
        </div>
   
        
</body>
</html>