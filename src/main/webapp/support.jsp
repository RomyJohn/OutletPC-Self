<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/snackbar.min.css"/> 
        <title>Support - Outletpc</title>
        <style>
            section .col-md-5 img {
                height: 30px;
                width: 30px;
            }
            section .col-md-5 .card-body, section .col-md-6{
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            section .container>.col-md-5{
                height: 65vh;
            }

            @media screen and (min-width: 768px) {
                section .col-md-5 .card-body{
                    height: 25rem;
                }
            }
            @media screen and (max-width: 768px) {
                section > img {
                    display: none;
                }
            }
        </style>
    </head>
    <body class="bg-light">
        <%@include file="Plugins/navbar.jsp"%>

        <section>
            <img src="Images/Support/banner.jpg" width="100%" height="auto" alt="No Image">
            <div class="container my-4 text-center">
                <h3 class="pb-3">Contact Us</h3>
                <div class="row justify-content-around">
                    <div class="col-md-5 mb-5 bg-white px-0">
                        <div class="card">
                            <div class="card-body pt-4">
                                <h5 class="pb-3 text-info">Office Locations</h5>
                                <p><span>Contact : </span>1800 208 9898, 0120 - 3881000</p>
                                <p><span>Email : </span>services.outletpc@gmail.com</p>
                                <p style="line-height:1.4rem;"><span>Place : </span>Outletpc Internet Private Limited,<br>
                                    Buildings Alyssa, Begonia &
                                    Clove Embassy Tech Village,<br>
                                    Outer Ring Road, Devarabeesanahalli Village,<br>
                                    Bengaluru, 560103,
                                    Karnataka, India</p>
                                <br>
                                <h6>Working 24/7 including holidays</h6>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5 mb-5 bg-white px-0">
                        <div class="card">
                            <div class="card-body pt-4">
                                <h5 class="pb-3 text-info">Explore</h5>
                                <h6>Convenience at you fingertips</h6>
                                <p class="py-2">Introducing Outletpc a smart app for smart assistance</p>
                                <a href="https://www.apple.com/za/ios/app-store/">
                                    <img src="Images/Support/apple_store.svg" alt="No Image">
                                </a>
                                <a href="https://www.microsoft.com/en-us/store/apps/windows">
                                    <img src="Images/Support/microsoft_store.svg" class="mx-4" style="height:40px;width:40px;" alt="No Image">
                                </a>
                                <a href="https://play.google.com/store/apps?hl=en">
                                    <img src="Images/Support/play_store.svg" alt="No Image">
                                </a>
                                <p class="py-3">Download the Outletpc app today</p>
                                <h6 class="pb-2">Follow us on</h6>
                                <a href="https://www.facebook.com/">
                                    <img src="Images/Support/facebook.svg" alt="No Image">
                                </a>
                                <a href="https://www.instagram.com/accounts/login/?hl=en">
                                    <img src="Images/Support/instagram.svg" class="ml-3" alt="No Image">
                                </a>
                                <a href="https://www.linkedin.com/login">
                                    <img src="Images/Support/linkedin.svg" class="mx-3" alt="No Image">
                                </a>
                                <a href="https://twitter.com/LOGIN">
                                    <img src="Images/Support/twitter.svg" alt="No Image">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center text-left">
                    <div class="col-md-6 mb-5 bg-white px-0">
                        <div class="card">
                            <div class="card-body pt-4">
                                <h5 class="text-info pb-4 text-center">Query About</h5>
                                <form id="form1">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Name" id="name">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Your Email" id="email">
                                        <small class="error" id="error3"></small>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Your Mobile Number" maxlength="10" id="number">
                                        <small class="error" id="error4"></small>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" rows="3" placeholder="Query" id="query"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <p>Expert care, attention to detail, quick turnaround, convenience and timely service. Step into our
                            service centers and enjoy a one-stop solution to all your problems.</p>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="Plugins/footer.jsp"%>

        <script src="JS/snackbar.min.js"></script>
        <script src="JS/validation.js"></script>

        <script>
            $(document).ready(function () {
                "use strict";

                removeMsg("#name", "");
                removeMsg("#email", "#error3");
                removeMsg("#number", "#error4");
                removeMsg("#query", "");

                $("#form1").on("submit", function (event) {
                    event.preventDefault();

                    let mail = /^[A-Za-z0-9.!@#$&]{1,30}[@]{1}[A-Za-z]{2,10}[.]{1}[A-Za-z]{2,5}$/;
                    let num = /^[0-9]{10}$/;

                    let isValid1 = isEmpty("#name", "", "");
                    let isValid2 = isEmpty("#email", "", "");
                    let isValid3 = isEmpty("#number", "", "");
                    let isValid4 = isEmpty("#query", "", "");


                    if (isValid2) {
                        isValid2 = expression(mail, "#email", "#error3", "Not a valid email address");
                    }
                    if (isValid3) {
                        isValid3 = expression(num, "#number", "#error4", "Not a valid phone number");
                    }

                    if (isValid1 && isValid2 && isValid3 && isValid4)
                    {
                        success("Query submitted - Thank you");
                    }
                });
            });
        </script>
    </body>
</html>
