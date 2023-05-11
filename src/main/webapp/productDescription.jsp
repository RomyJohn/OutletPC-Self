<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="controllers.Product"%>
<%@page import="entities.Reviews"%>
<%@page import="entities.Specifications"%>
<%@page import="entities.ProductData"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/owl.carousel.min.css">
        <link rel="stylesheet" href="CSS/owl.theme.default.min.css">
        <link rel="stylesheet" href="CSS/snackbar.min.css"/> 
        <style>
            .owl-next:focus, 
            .owl-prev:focus {
                outline: none;
            }
            section .container-fluid .col-md-4> img:hover{
                cursor: pointer;
            }
            section #productCarousel .row img{
                height: 150px;
                width: 150px;
            }
            section #productCarousel .card:hover{
                transform: scale(1.02);
            }
            section #productCarousel a,
            section #productCarousel a:hover{
                color: #212529;
            }
            .fa-angle-left,
            .fa-angle-right,
            .fa-angle-left:hover,
            .fa-angle-right:hover{
                font-size: 1.8rem;
                color: #212529;
                background-color: white;
            }
            section>.container-fluid .btn{
                width: 135px;
            }
            .container-fluid{
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            #form1{
                display: none;
            }
            section>.container-fluid .col-md-4 a img{
                height: 50px;
                width: 50px;
                border: 1px solid lightgray;
            }
            body{
                background-color: #F1F3F6;
            }
            #imageModal{
                height: 700px;
            }

            @media screen and (max-width:382px){
                #cartButton{
                    margin-bottom: 1rem;
                }
                #imageModal{
                    height: 400px;
                }
            } 
        </style>
    </head>
    <body>
        <%@include file="Plugins/navbar.jsp"%>

        <%
            DecimalFormat currencyFormat = new DecimalFormat("##,##,###");
            SimpleDateFormat dateFormat = new SimpleDateFormat("E, dd MMM yyyy");
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DATE, 5);
            Product product = context.getBean("product", Product.class);
            int id = Integer.parseInt(request.getParameter("id"));
            ProductData productData = product.getProductDescription(id);
            Specifications specifications = product.getProductSpecifications(id);
            CategoryData categoryData = productData.getCategoryData();
            List<ProductData> productsList = product.getProducts(categoryData.getId());
            List<Reviews> reviewsList = product.getReviews(id);
        %>

        <title><%= productData.getTitle()%></title>

        <section>
            <div class="container-fluid py-5 bg-white">
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <div class="card">
                            <div class="row">
                                <div class="col-md-4 text-center mb-4">
                                    <div class="row justify-content-center mb-4">
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <a role="button"><img src="Images/Products/<%= productData.getImage().replace(".", ".1.")%>" class="image" onmouseenter="imgSrc(this)" onmouseenter="imgSrc(this)" alt="No Image" style="border:2px solid #0067D5;"></a>
                                            <a role="button"><img src="Images/Products/<%= productData.getImage().replace(".", ".2.")%>" class="image mx-2" onmouseenter="imgSrc(this)" alt="No Image"></a>
                                            <a role="button"><img src="Images/Products/<%= productData.getImage().replace(".", ".3.")%>" class="image" onmouseenter="imgSrc(this)" alt="No Image"></a>
                                        </div>
                                    </div>
                                    <img src="Images/Products/<%= productData.getImage().replace(".", ".1.")%>" class="img-fluid productImage" alt="No Image" data-toggle="modal" data-target="#imageZoom">
                                </div>

                                <div class="modal fade" id="imageZoom" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body" id="imageModal">
                                                <a role="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </a>
                                                <div class="d-flex justify-content-center align-items-center h-100">
                                                    <img src="Images/Products/<%= productData.getImage().replace(".", ".1.")%>" class="img-fluid productImage" alt="No Image">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5><%= productData.getTitle()%></h5>
                                        <h6 class="py-1" style="font-size:0.9rem;"> 
                                            <%if (productData.getStock().equals("in")) {%>
                                            <span class="badge badge-success p-2 rounded-pill" style="font-weight:normal;">In Stock</span>
                                            <%} else {%>
                                            <span class="badge badge-danger p-2 rounded-pill" style="font-weight:normal;">Out Of Stock</span>
                                            <%}%> 
                                        </h6>
                                        <h6>
                                            <span style="font-size:0.9rem;">Brand:</span> <%= productData.getBrand()%>
                                        </h6>
                                        <%if (productData.getStock().equals("in")) {%>    
                                        <h6 class="py-1">
                                            <span style="font-size:0.9rem;">Price:</span><span class="text-danger" style="font-size:1.1rem;"> &#8377;<%= currencyFormat.format(productData.getDiscount())%></span>
                                            <span id="price" class="ml-1 text-secondary"><del>&#8377;<%= currencyFormat.format(productData.getPrice())%></del></span>
                                            <%if (((productData.getPrice() - productData.getDiscount()) * 100 / productData.getPrice()) > 10) {%>
                                            <span class="text-success"><%= (productData.getPrice() - productData.getDiscount()) * 100 / productData.getPrice()%>% off</span>
                                            <%}%>
                                        </h6>
                                        <h6>
                                            <span style="font-size:0.9rem;" class="mr-1">Delivery by:</span> 
                                            <%= dateFormat.format(calendar.getTime())%>
                                        </h6>
                                        <h6 style="font-size:0.9rem;" class="pb-4 pt-2">Share
                                            <a href="https://www.facebook.com/">
                                                <img src="Images/Support/facebook.svg" class="ml-1" alt="No Image" style="height:25px;width:25px;">
                                            </a>
                                            <a href="https://www.instagram.com/accounts/login/?hl=en">
                                                <img src="Images/Support/instagram.svg" class="mx-1" alt="No Image" style="height:25px;width:25px;">
                                            </a>
                                            <a href="https://twitter.com/LOGIN">
                                                <img src="Images/Support/twitter.svg" alt="No Image" style="height:25px;width:25px;">
                                            </a>
                                        </h6>
                                        <%} else {%>
                                        <h5 class="pt-3 text-danger">Sold Out</h5>
                                        <h6 class="pb-3">This item is currently out of stock!</h6>        
                                        <%}%>
                                        <button type="button" class="btn btn-info mr-2" id="cartButton" <%if (productData.getStock().equals("out")) {%>disabled<%}%> onclick="addToCart(<%= productData.getId()%>, '<%= productData.getTitle()%>', <%= productData.getDiscount()%>, <%= productData.getPrice()%>, '<%= productData.getImage()%>')">
                                            <i class="fas fa-shopping-cart"></i> Add to Cart
                                        </button>
                                        <button type="button" class="btn btn-primary" id="buyButton" onclick="buyProduct(<%= productData.getId()%>, '<%= productData.getTitle()%>', <%= productData.getDiscount()%>, <%= productData.getPrice()%>, '<%= productData.getImage()%>')" <%if (productData.getStock().equals("out")) {%>disabled<%}%>>
                                            <i class="fas fa-bolt"></i> Buy Now
                                        </button>
                                        <p class="text-secondary pt-2" style="font-size:0.9rem;">Free delivery by Outlepc</p>
                                        <hr class="my-4">
                                        <h5 class="pb-2">Technical Details</h5>
                                        <ul class="pl-3">
                                            <li><%= specifications.getSpec1()%></li>
                                            <li><%= specifications.getSpec2()%></li>
                                            <li><%= specifications.getSpec3()%></li>
                                            <li><%= specifications.getSpec4()%></li>
                                            <li><%= specifications.getSpec5()%></li>
                                            <li><%= specifications.getSpec6()%></li>
                                        </ul>
                                        <hr class="my-4">
                                        <h5 class="pb-2">Product Description</h5>
                                        <p><%= productData.getDescription()%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid py-4 my-4 bg-white" id="productCarousel">
                <h5>You might be interested in</h5>
                <hr>
                <div class="owl-carousel owl-theme mt-5">
                    <%for (ProductData list : productsList) {
                            if (list.getId() == id) {
                                continue;
                            }%>
                    <%@include file="Plugins/carousel.jsp"%>
                    <%}%>
                </div>
            </div>

            <div class="container-fluid py-4 bg-white">
                <div class="row justify-content-around">
                    <div class="col-md-6 mb-5 text-center">
                        <h5>Review this product</h5>
                        <h6 class="pt-4">Share your thoughts with other customers</h6>
                        <button class="btn btn-secondary mt-2 mb-3" style="width:16rem;" <%if (user == null) {%>  data-toggle="modal" data-target="#loginModal" <%} else {%> id="review"<%}%>>Write product review</button>
                        <form id="form1">
                            <div class="form-group">
                                <input type="hidden" <%if (user != null) {%>value="<%= user.getName()%>"<%}%> name="username">
                                <input type="hidden" value="<%= id%>" name="productId">
                                <textarea class="form-control" placeholder="Write your review..." rows="5" name="review"></textarea>
                                <button type="submit" class="btn btn-warning mt-2" style="width:10rem;">Submit</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <h5 class="text-center mb-4">Customer reviews</h5>
                        <%if (reviewsList.isEmpty()) {%>
                        <h6 class="text-center">No customer reviews</h6>
                        <%} else {%>
                        <%for (Reviews list : reviewsList) {%>
                        <h6><i class="fas fa-user-circle mr-1"></i> <%=list.getUsername()%> </h6>
                        <p style="font-size:0.9rem;color:#566573;">Reviewed on <%= dateFormat.format(list.getReviewDate())%></p>
                        <p> <%=list.getReview()%></p>
                        <br>
                        <%}
                            }%>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="Plugins/footer.jsp"%>

        <script>
            const imgSrc = (element) => {
                $(".productImage").attr("src", element.src);
                $(".image").css("border", "1px solid lightgray");
                $(element).css("border", "2px solid #0067D5");
            };

            $(document).ready(function () {
                "use strict";

                $("#review").on("click", function () {

                    if ($(this).html().trim() === "Cancel")
                    {
                        $("#form1").hide();
                        $(this).html("Write product review");
                    } else {
                        $("#form1").show();
                        $("#form1 textarea").removeClass("is-invalid");
                        $(this).html("Cancel");
                    }
                });

                removeMsg("#form1 textarea", "");

                $("#form1").on("submit", function (event) {
                    event.preventDefault();
                    let isValid = true;
                    if ($("#form1 textarea").val().trim() === "")
                    {
                        $("#form1 textarea").addClass("is-invalid");
                        isValid = false;
                    }
                    if (isValid)
                    {
                        $.ajax({
                            url: "/uploadReview",
                            method: "post",
                            data: $(this).serialize(),
                            success: function (data) {
                                if (data.trim() === "success")
                                {
                                    success("Review submitted - Thank you");
                                } else {
                                    error();
                                }
                            },
                            error: function () {
                                error();
                            }
                        });
                    }
                });

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

        <script src="JS/snackbar.min.js"></script>
        <script src="JS/owl.carousel.min.js"></script>
        <script src="JS/validation.js"></script>
    </body>
</html>
