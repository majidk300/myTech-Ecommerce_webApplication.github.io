<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.dao.categoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.productDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.category" %>
<%@page import="com.learn.mycart.entities.Product" %>
<%

    User user = (User) session.getAttribute("current-user");
    String userName = (String) user.getUserName();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= userName%></title>

        <%@include file="components/all_common_css_js.jsp" %>
    </head>
    <body>

        <!--navbar-->
        <%@include file="navbar.jsp" %>
        <!--navbar_end-->
        
        
        <div class="container mt-3">
            <div class="row mb-5">


                <!--product category start-->
                <div class="col-md-3">
                    <div class="card mb-4" style="border-radius:5px 5px 0 0;">
                        <% 
                            
                            String activecategoryId = request.getParameter("category");
                            boolean allProduct = false;
                            if(activecategoryId==null || activecategoryId!=null && activecategoryId.equals(String.valueOf("all"))){
                                  allProduct=true;
                            }

                        %>
                        <a href="index.jsp?category=all" class="card-header allProducttitle<%=allProduct?"custom-bg custom-bg text-light":""%>" style="border-radius:5px 5px 0 0; text-decoration:none; color:#004d40;font-weight:bold">All Products</a>
                        <div class="list-group list-group-flush">

                            <%categoryDao cDao = new categoryDao(FactoryProvider.getFactory());
                                List<category> lst = cDao.getCategory();

                                for (category c : lst) {

                                    boolean isActive = false;

                                    if (activecategoryId != null && activecategoryId.equals(String.valueOf(c.getCategoryId()))) {
                                        isActive = true;
                                    }

                            %>   

                            <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item product-category-lis<%=isActive ? "custom-bg custom-bg text-light" : ""%>"><%=c.getCategoryTitle()%></a>

                            <%
                                }
                            %>

                        </div>
                    </div>

                </div>

                <!--product category end-->

                <!--Product cards start --> 
                <div class="col-md-9 ">

                    <div class="card">


                        <div class="card-body">


                            <div class="row">

                                <%
                                    String cat = request.getParameter("category");

                                    productDao pDao = new productDao(FactoryProvider.getFactory());
                                    List<Product> list = null;

                                    if (cat == null || cat.trim().equals("all")) {
                                        list = pDao.getallProducts();
                                    } else {
                                        int cid = Integer.parseInt(cat);
                                        list = pDao.getallProductById(cid);
                                    }

                                    for (Product p : list) {


                                %>

                                <div class="col-md-4 mb-4">

                                    <div class="card box-shadow-all">

                                        <div class="text-center">
                                            <img class="card-img-top text-center m-2" style="max-height:200px; width:auto;" src="components/img/imgProduct/<%=p.getpPhoto()%>" alt="" />
                                        </div>

                                        <div class="card-body">
                                            <p class="h6"><%=Helper.get10Words(p.getpName())%></p>
                                            <p class="m-0">
                                                <i class="fa fa-star" style="color: gold"></i>
                                                <i class="fa fa-star" style="color: gold"></i>
                                                <i class="fa fa-star" style="color: gold"></i>
                                                <i class="fa fa-star" style="color: gold"></i>
                                                <i class="fa fa-star-half" style="color: gold ; "></i>
                                            </p>
                                            <p class="h5 m-0"><span>&#8377; </span><span><%=p.getPriceAfterApplyDiscount()%></span> <span class="text-secondary discount-label">/-  &#8377; <span class="lineThrough"><%=p.getpPrice()%></span> -   <%= p.getpDiscount()%>% off</span></p>
                                        </div>
                                        <!--//card footer section start-->
                                        <div class="card-footer bg p-0  card-icons-footer custom-bg">
                                            <div class="btn-group" role="group">
                                                <button type="button" class="btn custom-bg add-card-btn" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getpPrice()%>)">
                                                    <i class="fa fa-cart-plus"></i>
                                                    <span class="add-card">Add Cart</span>
                                                </button>
                                                <button type="button" class="btn custom-bg">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </button>
                                                <button type="button" class="btn custom-bg">
                                                    <i type="radio" class="fa fa-heart"></i>
                                                </button>
                                            </div>
                                        </div>

                                    </div>

                                </div>


                                <%
                                    }

                                    if (list.size() == 0) {
                                %>
                                <h3>No items in this category</h3>
                                <%
                                    }

                                %>


                            </div>
                        </div>

                        <!--card footer pagination start-->
                        <div class="card-footer p-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="pagination m-0">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <p class="text-right mb-0 mt-1">Showing 1 to 12 of 12 (1 Pages)</p>
                                </div>
                            </div>
                        </div>
                        <!--card footer pagination end-->
 
                    </div>

                </div>
            </div>
        </div>
        

        <!--modal-components-CheckOut -->
        <%@include file="components/common_modals.jsp" %>

    </body>
</html>
