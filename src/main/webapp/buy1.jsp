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
        <title>Outletpc - Secure Payment: Login > Select Shipping Address > Review Order</title>
        <style>
            #placeBuyData,
            #buy2Fieldset{
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
                    <%@include file="Plugins/Buy/aside.jsp"%>
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

                $("#placeOrderModal .close, #placeOrderModal .btn").attr("onclick", "orderPlaced('cart')");
                $("#cardPay, #netPay").removeClass("pay2").addClass("pay1");
                updateData();
            });
        </script>
    </body>
</html>
