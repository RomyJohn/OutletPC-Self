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
        <title>Outletpc Login</title>
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
            <div class="container-fluid d-flex justify-content-center align-items-center h-100">
                <div class="card bg-light">
                    <div class="card-body">
                        <a href="index.jsp">
                            <p class="text-center text-info" id="logo">
                                <i class="fas fa-laptop"></i><span class="text-dark">Outlet</span>PC
                            </p>
                        </a>
                        <br>
                        <p class="card-title">Login</p>
                        <br>
                        <div class="alert" role="alert"></div>
                        <form>
                            <div class="form-group">
                                <label for="username">Email or phone</label>
                                <input type="text" class="form-control" id="username" name="username">
                                <small class="error" id="error1"></small>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password">
                                <small class="error" id="error2"></small>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Continue</button>
                        </form>
                        <hr>
                        <p class="text-center"><a href="reset.jsp">Forgot Password?</a></p>
                        <p class="text-center">Don't have an account? <a href="signup.jsp">Signup</a></p>
                    </div>
                </div>
                <div class="spinner-border text-dark" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
        </section>

        <script src="/JS/validation.js"></script>

        <script>
            $(document).ready(function () {
                "use strict";

                removeMsg("#username", "#error1");
                removeMsg("#password", "#error2");

                $("form").on("submit", function (event) {
                    event.preventDefault();

                    let isValid1 = isEmpty("#username", "#error1", "Enter your email or phone number");
                    let isValid2 = isEmpty("#password", "#error2", "Enter your password");

                    if (isValid1 && isValid2)
                    {
                        $(".card").hide();
                        $(".spinner-border").show();
                        $.ajax({
                            url: "/login",
                            type: "post",
                            data: $(this).serialize(),
                            success: function (data) {
                                if (data.trim() === "success")
                                {
                                    window.location = "index.jsp";
                                } else
                                {
                                    showAlert("", "alert-danger", "Invalid Credentials!");
                                }
                            },
                            error: function (data) {
                                showAlert("", "alert-danger", "Server is not responding!");
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>
