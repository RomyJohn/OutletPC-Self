<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    UserData userProfile = (UserData) session.getAttribute("user");
    if (userProfile == null) {
        response.sendRedirect("index.jsp");
    }
%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controllers.User"%>
<%@page import="entities.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Order History - Outletpc</title>
        <style>
            body{
                background-color: #F1F3F6;
            }
            section .row{
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            section .col-md-4 img{
                height: 150px;
                width: 150px;
            }
        </style>
    </head>
    <body>
        <%@include file="Plugins/navbar.jsp"%>

        <%
            User userClass = context.getBean("user", User.class);
            List<Orders> ordersList = userClass.ordersList(user.getId());
            SimpleDateFormat dateFormat = new SimpleDateFormat("E, dd MMM yyyy");
            DecimalFormat currencyFormat = new DecimalFormat("##,##,###");
        %>

        <section>
            <div class="container">
                <%if (ordersList.isEmpty()) {%>
                <div class="row justify-content-center py-5 bg-white h-100">
                    <div class="col-12 text-center">
                        <img src="Images/Logo/error_2.png" alt="No Image">
                        <h5 class="text-center mt-5">You do not have any previous orders!</h5>
                        <a href="index.jsp" class="btn btn-primary text-center px-5 mt-2">Shop Now</a>
                    </div>
                </div>
                <%} else {%>
                <%for (Orders list : ordersList) {%>
                <a href="productDescription.jsp?id=<%=list.getProductId()%>" class="text-dark">
                    <div class="row justify-content-center bg-white my-3">
                        <div class="col-md-4 text-center py-2">
                            <img src="Images/Products/<%= list.getProductImage()%>" class="img-fluid" alt="No Image">
                        </div>
                        <div class="col-md-8">
                            <p class="pt-3"><%= list.getProductName()%></p>
                            <p>
                                <span class="text-danger mr-5">&#8377;<%= currencyFormat.format(list.getProductPrice() * list.getProductQuantity())%></span>
                                Qty: <%= list.getProductQuantity()%>
                            </p>
                            <p>Placed on: <%= dateFormat.format(list.getOrderDate())%></p>
                        </div>
                    </div>
                </a> 
                <%}
                    }%>
            </div>
        </section>

        <%@include file="Plugins/footer.jsp"%>

    </body>
</html>
