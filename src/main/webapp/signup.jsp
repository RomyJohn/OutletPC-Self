<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Outletpc Sign Up</title>
        <style>
            section .card {
                width: 20rem;
            }
            section .card-title {
                font-size: 1.7rem;
            }
        </style>
    </head>
    <body class="bg-light">
        <section>
            <div class="container-fluid bg-light d-flex justify-content-center align-items-center h-120">
                <div class="card bg-light">
                    <div class="card-body">
                        <a href="index.jsp">
                            <p class="text-center text-info" id="logo">
                                <i class="fas fa-laptop"></i><span class="text-dark">Outlet</span>PC
                            </p>
                        </a>
                        <br>
                        <p class="card-title">Create Account</p>
                        <br>
                        <div class="alert" role="alert"></div>
                        <form>
                            <div class="form-group">
                                <label for="name">Your name</label>
                                <input type="text" class="form-control" id="name" name="name">
                                <small class="error" id="error1"></small>
                            </div>
                            <div class="form-group">
                                <label for="number">Mobile number</label>
                                <input type="text" class="form-control" id="number" name="number" maxlength="10">
                                <small class="error" id="error2"></small>
                            </div>
                            <div class="form-group">
                                <label for="email">Email (optional)</label>
                                <input type="text" class="form-control" id="email" name="email">
                                <small class="error" id="error3"></small>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="At least 6 characters">
                                <small class="error" id="error4"></small>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Continue</button>
                        </form>
                        <hr>
                        <p class="text-center">Already have an account? <a href="login.jsp">Sign In</a></p>
                    </div>
                </div>
                <div class="spinner-border text-dark" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
        </section>

        <script src="JS/validation.js"></script>

        <script>
            $(document).ready(function () {
                "use strict";

                removeMsg("#name", "#error1");
                removeMsg("#number", "#error2");
                removeMsg("#email", "#error3");
                removeMsg("#password", "#error4");

                $("form").on("submit", function (event) {
                    event.preventDefault();
                    let mail = /^[A-Za-z0-9.!@#$&]{1,30}[@]{1}[A-Za-z]{2,10}[.]{1}[A-Za-z]{2,5}$/;
                    let num = /^[0-9]{10}$/;
                    let pass = /^[A-Za-z0-9 @#$&_]{6,20}$/;

                    let isValid1 = isEmpty("#name", "#error1", "Enter your name");
                    let isValid2 = isEmpty("#number", "#error2", "Enter your mobile number");
                    let isValid3 = true;
                    let isValid4 = isEmpty("#password", "#error4", "Enter your password");


                    if (isValid2) {
                        isValid2 = expression(num, "#number", "#error2", "Not a valid phone number");
                    }
                    if ($("#email").val() !== "") {
                        isValid3 = expression(mail, "#email", "#error3", "Not a valid email address");
                    }
                    if (isValid4) {
                        isValid4 = expression(pass, "#password", "#error4", "Password must be at least 6 characters");
                    }

                    if (isValid1 && isValid2 && isValid3 && isValid4)
                    {
                        $("section .card").hide();
                        $(".spinner-border").show();
                        $.ajax({
                            url: "/signup",
                            type: "post",
                            data: $(this).serialize(),
                            success: function (data) {
                                if (data.trim() === "success")
                                {
                                    $("input").val("");
                                    showAlert("alert-danger alert-warning", "alert-success", "You are registered successfully");
                                    setTimeout(function () {
                                        $(".alert").hide();
                                    }, 5000);
                                } else if (data.trim() === "nused")
                                {
                                    showAlert("alert-danger alert-success", "alert-warning", "Number is already in use");
                                } else if (data.trim() === "eused")
                                {
                                    showAlert("alert-danger alert-success", "alert-warning", "Email is already in use");
                                } else
                                {
                                    showAlert("alert-success alert-warning", "alert-danger", "Server is not responding!");
                                }
                            },
                            error: function (data) {
                                showAlert("alert-success alert-warning", "alert-danger", "Server is not responding!");
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>
