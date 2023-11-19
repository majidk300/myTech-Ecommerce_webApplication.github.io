<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.dao.userDao"%>
<%@page import="com.learn.mycart.dao.productDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.categoryDao"%>
<%@page import="com.learn.mycart.entities.category"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Product"%>

<%
    User user = (User) session.getAttribute("current-user");

    String userName = (String) user.getUserName();

    if (user == null) {

        session.setAttribute("message-error", "You  are not logged in !! Login first");
        response.sendRedirect("login.jsp");

        return;
    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("message-error", "You  are not admin ! access denied");
            response.sendRedirect("login.jsp");

            return;
        }
    }

%>

 <!--category Id--> 
  <%categoryDao cDao = new categoryDao(FactoryProvider.getFactory());
   List<category> list = cDao.getCategory();
   
   Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());
  
   %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel : <%= userName%> </title>

        <link rel="stylesheet" href="components/css/admin.css"><!-- admin css -->

        <%@include file="components/all_common_css_js.jsp" %>

    </head>
    <body>

        <!--navbar-->
        <%@include file="navbar.jsp" %>
        <!--navbar_end-->



        <div class="container mb-3 mt-2">

            <!--message-->
            <div class="container-fluid text-center">
                <%@include file="components/message.jsp" %> 
            </div>
            <!--message ens-->

            <!--first row--> 
            <div class="row mt-1">

                <!--first row first column--> 
                <div class="col-md-4 mt-3">

                    <div class="card box-shadow-all">

                        <div class="card-body text-center">
                            <div class="container">
                                <img src="components/img/users.png" class="img-fluid rounded-circle" alt="..." style="max-width:130px">
                            </div>
                            <h3 class="mt-2"><%=m.get("userCount")%></h1>
                                <h3 class="text-uppercase text-muted">Users</h1>

                                    </div>

                                    </div>

                                    </div>

                                    <!--first row second column--> 
                                    <div class="col-md-4 mt-3">

                                        <div class="card box-shadow-all">

                                            <div class="card-body text-center">
                                                <div class="container">
                                                    <img src="components/img/categories.png" class="img-fluid rounded-circle" alt="..." style="max-width:130px">
                                                </div>
                                                <h3 class="mt-2"><%=list.size()%></h1>
                                                    <h3 class="text-uppercase text-muted">Categories</h1>

                                                        </div>

                                                        </div>

                                                        </div>

                                                        <!--first row third column--> 
                                                        <div class="col-md-4 mt-3">

                                                            <div class="card box-shadow-all">

                                                                <div class="card-body text-center">
                                                                    <div class="container">
                                                                        <img src="components/img/product.png" class="img-fluid rounded-circle" alt="..." style="max-width:130px">
                                                                    </div>
                                                                    <h3 class="mt-2"><%=m.get("productCount")%></h1>
                                                                        <h3 class="text-uppercase text-muted">Products</h1>

                                                                            </div>

                                                                            </div>

                                                                            </div>

                                                                            </div>

                                                                            <!--second row-->
                                                                            <div class="row mt-2">

                                                                                <!--second row first column-->
                                                                                <div class="col-md-6 mt-3">

                                                                                    <div class="card box-shadow-all" data-bs-toggle="modal" data-bs-target="#add-category-modal">

                                                                                        <div class="card-body text-center">
                                                                                            <div class="container">
                                                                                                <img src="components/img/addcategories.png" class="img-fluid rounded-circle" alt="..." style="max-width:130px">
                                                                                            </div>
                                                                                            <p class="mt-2">Click  here to add new categories</p>
                                                                                            <h3 class="text-uppercase text-muted">Add Categories</h1>

                                                                                        </div>

                                                                                    </div>

                                                                                </div>

                                                                                <!--second row second column-->
                                                                                <div class="col-md-6 mt-3">

                                                                                    <div class="card box-shadow-all" data-bs-toggle="modal" data-bs-target="#add-product-modal">

                                                                                        <div class="card-body text-center">
                                                                                            <div class="container">
                                                                                                <img src="components/img/add-to-cart.png" class="img-fluid rounded-circle" alt="..." style="max-width:130px">
                                                                                            </div>
                                                                                            <p class="mt-2">Click here to add new product</p>
                                                                                            <h3 class="text-uppercase text-muted">Add Products</h1>

                                                                                        </div>

                                                                                    </div>

                                                                                </div>


                                                                            </div>


                                                                            </div>


                                                                            <!--add category modal--> 
                                                                            <!-- Modal -->
                                                                            <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                                <div class="modal-dialog modal-lg">
                                                                                    <div class="modal-content">

                                                                                        <!--head title-->
                                                                                        <div class="modal-header text-light custom-bg">
                                                                                            <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                        </div>

                                                                                        <div class="modal-body">

                                                                                            <form action="PeroductOperationServlet" method="post">

                                                                                                <input type="hidden" name="operation" value="addcategory">

                                                                                                <!--category title-->
                                                                                                <div class="form-group">
                                                                                                    <input type="text" class="form-control" name="catTitle" placeholder="Enter category title"  required/>
                                                                                                </div>

                                                                                                <!--category description-->
                                                                                                <div class="form-group mt-3">
                                                                                                    <textarea class="form-control" style="height:250px" placeholder="Enter category description" name="catDescription" required></textarea>
                                                                                                </div>

                                                                                                <!--buttons-->
                                                                                                <div class="container text-center mt-3">
                                                                                                    <button class="btn btn-outline custom-bg text-white">Add Category</button>
                                                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                                </div>

                                                                                            </form>

                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <!--add category model end-->

                                                                            <!--++++++++++++++++++++++++++++++++++++++++++++++++-->
                                                                            <!--++++++++++++++++++++++++++++++++++++++++++=+++++-->

                                                                            <!--add product modal-->

                                                                            <!-- Modal -->
                                                                            <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                                <div class="modal-dialog modal-lg">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header text-light custom-bg">
                                                                                            <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
                                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                        </div>
                                                                                        <div class="modal-body">

                                                                                            <!--form start-->
                                                                                            <form action="PeroductOperationServlet" method="post" enctype="multipart/form-data">      

                                                                                                <input type="hidden" name="operation" value="addproduct"/>

                                                                                                <!--product title-->
                                                                                                <div class="form-group">
                                                                                                    <input type="text" class="form-control" name="pName" placeholder="Enter name of product"  required/>
                                                                                                </div>

                                                                                                <!--product description-->
                                                                                                <div class="form-group mt-3">
                                                                                                    <textarea style="height:150px;" class="form-control" name="pDescription" placeholder="Enter product description" required></textarea>
                                                                                                </div>

                                                                                                <!--product price--> 
                                                                                                <div class="form-group mt-3">
                                                                                                    <input type="number" class="form-control" name="pPrice" placeholder="Enter price of product"  required/>
                                                                                                </div>

                                                                                                <!--product descount-->
                                                                                                <div class="form-group mt-3">
                                                                                                    <input type="number" class="form-control" name="pDescount" placeholder="Enter descount of product"  required/>
                                                                                                </div>

                                                                                                <!--product Quantity-->
                                                                                                <div class="form-group mt-3">
                                                                                                    <input type="number" class="form-control" name="pQuantity" placeholder="Enter quantity of product"  required/>
                                                                                                </div>

                                                                                               
                                                                                                <div class="form-group mt-3">

                                                                                                    <select name="catId" class="form-select form-control" id="" required>
                                                                                                        <option selected>Open this select category</option>
                                                                                                        <%for (category c : list) {
                                                                                                        %>

                                                                                                        <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

                                                                                                        <%
                                                                                                            }
                                                                                                        %>
                                                                                                    </select>
                                                                                                </div>

                                                                                                <!--product file--> 
                                                                                                <div class="form-group mt-3">
                                                                                                    <label for="pPic">
                                                                                                        Select picture of product
                                                                                                    </label>
                                                                                                    <br>
                                                                                                    <input type="file" id="pPic" name="pPic" required />
                                                                                                </div>

                                                                                                <!--buttons-->
                                                                                                <div class="container text-center mt-3">
                                                                                                    <button class="btn btn-outline custom-bg text-white">Add Product</button>
                                                                                                    <button type="button"  class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                                </div>

                                                                                            </form>
                                                                                            <!--form end-->

                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </div>


                                                                            <!--add product modal end-->



                                                                            <!--modal-components-CheckOut -->
                                                                            <%@include file="components/common_modals.jsp" %>

                                                                            </body>
                                                                            </html>
