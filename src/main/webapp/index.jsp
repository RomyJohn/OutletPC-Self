<%@page import="java.text.DecimalFormat"%>
<%@page import="entities.ProductData"%>
<%@page import="controllers.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/owl.carousel.min.css"/>
        <link rel="stylesheet" href="CSS/owl.theme.default.min.css"/>
        <title>Online Shopping site for Computers : Outletpc</title>
        <style>
            body{
                background-color: #F1F3F6;
            }
            .owl-next:focus, 
            .owl-prev:focus {
                outline: none;
            }
            .fa-angle-left,
            .fa-angle-right,
            .fa-angle-left:hover,
            .fa-angle-right:hover{
                font-size: 1.8rem;
                color: #212529;
                background-color: white;
            }
            .slider .row img{
                height: 150px;
                width: 150px;
            }
            section .slider .card:hover{
                transform: scale(1.02);
            }
            section a,
            section a:hover{
                color: #212529;
            }
            section .carousel-item img{
                display: block;
                width: 100%;
            }
            .container-fluid{
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }

            @media screen and (max-width:767px)
            {
                section #c1-img1{
                    content: url("Images/Index/banner1_phone.jpg");
                }
                section #c1-img2{
                    content: url("Images/Index/banner2_phone.jpg");
                }
                section #c1-img3{
                    content: url("Images/Index/banner3_phone.jpg");
                }
                section #c1-img4{
                    content: url("Images/Index/banner4_phone.jpg");
                }
            }
        </style>
    </head>
    <body>
        <%@include file="Plugins/navbar.jsp"%>

        <section>
            <div id="banner" class="carousel slide carousel-fade" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#banner" data-slide-to="0" class="active"></li>
                    <li data-target="#banner" data-slide-to="1"></li>
                    <li data-target="#banner" data-slide-to="2"></li>
                    <li data-target="#banner" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-interval="5000">
                        <a href="productDescription.jsp?id=36">
                            <img src="Images/Index/banner1_desktop.jpg" alt="No Image" id="c1-img1">
                        </a>
                    </div>
                    <div class="carousel-item" data-interval="5000">
                        <a href="productDescription.jsp?id=23">
                            <img src="Images/Index/banner2_desktop.jpg" alt="No Image" id="c1-img2">
                        </a>
                    </div>
                    <div class="carousel-item" data-interval="5000">
                        <a href="productDescription.jsp?id=35">
                            <img src="Images/Index/banner3_desktop.jpg" alt="No Image" id="c1-img3">
                        </a>
                    </div>
                    <div class="carousel-item" data-interval="5000">
                        <a href="productDescription.jsp?id=14">
                            <img src="Images/Index/banner4_desktop.jpg" alt="No Image" id="c1-img4">
                        </a>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#banner" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#banner" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div class="container-fluid mt-3 slider bg-white py-4">
                <h5>Shop By Category</h5>
                <hr>
                <div class="owl-carousel owl-theme mt-5">
                    <%for (CategoryData list : categoriesList) {%>
                    <div class="item">
                        <div class="card text-center">
                            <div class="row justify-content-center">
                                <a href="products.jsp?id=<%= list.getId()%>&title=<%= list.getTitle()%>">
                                    <img src="Images/Category/<%= list.getImage()%>" alt="No Image">
                                </a>
                            </div>
                            <div class="card-body">
                                <h6><a href="products.jsp?id=<%= list.getId()%>&title=<%= list.getTitle()%>"><%= list.getTitle()%></a></h6>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>

            <%
                DecimalFormat currencyFormat = new DecimalFormat("##,##,###");

                Product products = context.getBean("product", Product.class);
                List<ProductData> productsList1 = products.getProducts();
                List<ProductData> productsList2 = products.getProducts();
                List<ProductData> productsList3 = products.getProducts(2);
                List<ProductData> productsList4 = products.getProducts(5);
            %>

            <div class="container-fluid mt-3 slider bg-white py-4">
                <h5>Deals Of The Day</h5>
                <hr>
                <div class="owl-carousel owl-theme mt-5">
                    <%for (ProductData list : productsList1) {%>
                    <%if (((list.getPrice() - list.getDiscount()) * 100 / list.getPrice()) > 40) {%>
                    <%@include file="Plugins/carousel.jsp"%>
                    <%}%>
                    <%}%>
                </div>
            </div>

            <div class="container-fluid mt-3 slider bg-white py-4">
                <h5>Discounts For You</h5>
                <hr>
                <div class="owl-carousel owl-theme mt-5">
                    <%for (ProductData list : productsList2) {%>
                    <%if (((list.getPrice() - list.getDiscount()) * 100 / list.getPrice()) > 30 && ((list.getPrice() - list.getDiscount()) * 100 / list.getPrice()) < 40) {%>
                    <%@include file="Plugins/carousel.jsp"%>
                    <%}%>
                    <%}%>
                </div>
            </div>

            <div class="container-fluid mt-3 slider bg-white py-4">
                <h5>Suggested For You</h5>
                <hr>
                <div class="owl-carousel owl-theme mt-5">
                    <%for (ProductData list : productsList3) {%>
                    <%if (list.getStock().equals("in")) {%>
                    <%@include file="Plugins/carousel.jsp"%>
                    <%}%>
                    <%}%>
                </div>
            </div>

            <div class="container-fluid mt-3 slider bg-white py-4">
                <h5>You May Like</h5>
                <hr>
                <div class="owl-carousel owl-theme mt-5">
                    <%for (ProductData list : productsList4) {%>
                    <%if (list.getStock().equals("in")) {%>
                    <%@include file="Plugins/carousel.jsp"%>
                    <%}%>
                    <%}%>
                </div>
            </div>

            <div class="container-fluid py-5 mt-5 bg-white">
                <div class="row justify-content-center">
                    <div class="col-11">
                        <h6>Outletpc The One-stop Shopping Destination</h6>
                        <p style="font-size:0.9rem;">E-commerce is revolutionizing the way we all shop in India. Why do you want to hop from one store to another in search of the latest computer components when you can find it on the Internet in a single click?. Outletpc houses everything you can possibly imagine, from trending components like motherboard, SMPS, hard disk, and processors. . You name it, and you can stay assured about finding them all here. For those of you with erratic working hours, Outletpc is your best bet. Shop in your PJs, at night or in the wee hours of the morning. This e-commerce never shuts down.</p>
                        <h6 class="mt-4">Great Deals + FREE Shipping!</h6>
                        <p style="font-size:0.9rem;">Shop our site for the best deals on computer parts with Free Shipping to the Continental USA! We stock 1000's of PC components from RAM and SSDs to CPU coolers and power supplies you're looking for. We offer you value on dozens of new items uploaded every day. Our staff of tech experts are just a phone call or email away if you have any questions.</p>
                        <h6 class="mt-4">Outletpc = Elite Service</h6>
                        <p style="font-size:0.9rem;">Shop our site for the best deals on computer parts with Free Shipping to the Continental USA! We stock 1000's of PC components from RAM and SSDs to CPU coolers and power supplies you're looking for. We offer you value on dozens of new items uploaded every day. Our staff of tech experts are just a phone call or email away if you have any questions.</p>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="Plugins/footer.jsp"%>

        <script src="JS/owl.carousel.min.js"></script>

        <script>
            $(document).ready(function () {
                "use strict";

                $('.owl-carousel').owlCarousel({
                    loop: true,
                    margin: 10,
                    responsiveClass: true,
                    dots: false,
                    navText: ["<i class='fas fa-angle-left'></i>", "<i class='fas fa-angle-right'></i>"],
                    responsive: {
                        200: {
                            items: 1,
                            nav: true,
                            loop: false
                        },
                        400: {
                            items: 2,
                            nav: true,
                            loop: false
                        },
                        600: {
                            items: 3,
                            nav: true,
                            loop: false
                        },
                        800: {
                            items: 4,
                            nav: true,
                            loop: false
                        },
                        900: {
                            items: 5,
                            nav: true,
                            loop: false
                        },
                        1000: {
                            items: 6,
                            nav: true,
                            loop: false
                        }
                    }
                });
            });
        </script>
    </body>
</html>
