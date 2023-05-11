<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/snackbar.min.css"/> 
        <link rel="stylesheet" href="CSS/buy.css"/> 
        <title>Outletp - Secure Payment: Login > Select Shipping Address > Review Order</title>
        <style>
            #placeCartData,
            #buy1Fieldset{
                display: none;
            }
        </style>
    </head>
    <body>
        <%@include file="Plugins/navbar.jsp"%>

        <section>
            <div class="container-fluid pt-4 pb-5 bg-light">
                <div class="row justify-content-around">
                    <%@include file="Plugins/Buy/section.jsp"%>
                    <div class="col-lg-4 px-0">
                        <ul class="list-group mb-3 rounded-0 bg-white">
                            <li class="list-group-item menu-item text-secondary pb-0 pt-3">PRICE DETAILS</li>
                            <hr>
                            <li class="list-group-item menu-item pt-0">Price (<span class="cartLength2"></span>) <span class="positionLeft productTotal2"></span></li>
                            <li class="list-group-item menu-item">Delivery Fee <span class="text-success positionLeft">FREE</span></li>
                            <li class="list-group-item menu-item pb-0">GST <span class="positionLeft gst2"></span></li>
                            <hr>
                            <li class="list-group-item menu-item py-0" style="font-size:1.1rem;">Total Amount <span class="positionLeft cartTotal2"></span></li>
                            <hr>
                            <li class="list-group-item menu-item text-success pt-0 pb-3">You will save <span class="totalSaving2"></span> on this order</li>
                        </ul>
                        <h6 class="text-secondary pl-1" style="font-size:0.92rem;">Safe and Secure Payments. Easy returns. 100% Authentic products.</h6>                                                                                          
                    </div>
                </div>
            </div>
            <%@include file="Plugins/Buy/modal.jsp"%>
        </section>

        <%@include file="Plugins/footer.jsp"%>

        <script src="JS/buy.js"></script>
        <script src="JS/snackbar.min.js"></script>

        <script>
            $(document).ready(function () {
                "use strict";

                $("#placeOrderModal .close, #placeOrderModal .btn").attr("onclick", "orderPlaced('buy')");
                $("#cardPay, #netPay").removeClass("pay1").addClass("pay2");
                updateData();
            });
        </script>
    </body>
</html>
