<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/snackbar.min.css"/> 
        <title>Shopping Cart - Outletpc</title>
        <style>
            body{
                background-color: #F1F3F6;
            }
            section .list-group, 
            section .col-lg-7,
            #hasNoProduct .container{
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            #hasNoProduct, 
            #hasProduct{
                display: none;
            }
            .positionLeft{
                float: right;
            }
            #hasNoProduct img {
                height: 200px;
                width: 200px;
            }
            section .list-group-item {
                border: 0px;
            }
        </style>
    </head>
    <body>
        <%@include file="Plugins/navbar.jsp"%>

        <section>
            <div id="hasNoProduct">
                <div class="container bg-white pt-4 pb-5 h-100">
                    <div class="col-12 text-center">
                        <h5 class="text-left">My Cart</h5>
                        <img src="Images/Cart/cart.svg" alt="No Image">
                        <%if (user == null) {%>
                        <h5 class="text-center mt-5">Missing Cart items?</h5>
                        <p class="text-center">Login to see the items you added previously</p>
                        <a href="login.jsp" class="btn btn-primary text-center px-5 mt-2">Login</a>
                        <%} else {%>
                        <h5 class="text-center mt-5">Your cart is empty!</h5>
                        <p class="text-center">Add items to it now.</p>
                        <a href="index.jsp" class="btn btn-primary text-center px-5 mt-2">Shop Now</a>
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="container-fluid pt-4 pb-5" id="hasProduct">
                <div class="row justify-content-around">
                    <div class="col-lg-7 bg-white p-3 mb-3">
                        <h6>My Cart (<span class="cartLength"></span>)</h6>
                        <hr>
                        <span id="placeCartData"></span>
                        <a href="buy1.jsp" class="btn btn-primary px-5 py-2 text-white positionLeft">Place Order</a>
                    </div>
                    <%@include file="Plugins/Buy/aside.jsp"%>
                </div>
            </div>
        </section>

        <%@include file="Plugins/footer.jsp"%>

        <script src="JS/snackbar.min.js"></script>

    </body>
</html>
