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
        <title>Outletpc Password Assistance</title>
        <style>
            section .card {
                width: 20rem;
            }
            section .card-title {
                font-size: 1.7rem;
            }
            section .alert{
                border: 1px solid lightgray;
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
                        <p class="card-title">Password assistance</p>
                        <p>Enter the email address or mobile phone number associated with your Outletpc account</p>
                        <br>
                        <div class="alert" role="alert"></div>
                        <form>
                            <div class="form-group">
                                <label for="username">Email or phone</label>
                                <input type="text" class="form-control" id="username" name="username">
                                <small class="error"></small>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Continue</button>
                            <hr>
                        </form>
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

                removeMsg("#username", ".error");

                $("form").on("submit", function (event) {
                    event.preventDefault();

                    let isValid = isEmpty("#username", ".error", "Enter your email or phone number");

                    if (isValid)
                    {
                        $(".card").hide();
                        $(".spinner-border").show();
                        $.ajax({
                            url: "/reset",
                            type: "post",
                            data: $(this).serialize(),
                            success: function (data) {
                                if (data.trim() === "error")
                                {
                                    showAlert("alert-light", "alert-danger", "Invalid email or phone number!");
                                } else
                                {
                                    $("input").val("");
                                    showAlert("alert-danger", "alert-light", "<span class='text-body'>Your account password <br> <span class='h6'>" + data + "</span></span>");
                                    setTimeout(function () {
                                        $(".alert").hide();
                                    }, 30000);
                                }
                            },
                            error: function (data) {
                                showAlert("alert-light", "alert-danger", "Server is not responding!");
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>
