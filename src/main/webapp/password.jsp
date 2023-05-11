<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    UserData userProfile = (UserData) session.getAttribute("user");
    if (userProfile == null) {
        response.sendRedirect("index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <style>
            body{
                background-color: #F1F3F6;
            }
        </style>
    </head>
    <body>
        <%@include file="Plugins/navbar.jsp"%>

        <section>
            <div class="container py-4">
                <div class="row justify-content-around">
                    <%@include file="Plugins/profileNavigation.jsp"%>
                    <div class="col-md-7 bg-white p-5">
                        <h5 class="pb-4">Change Password</h5>
                        <div class="row justify-content-around">
                            <div class="col-md-6 pt-1">
                                <h6>Your new password must:</h6>
                                <ul class="pl-3">
                                    <li>Be at least 6 characters in length</li>
                                    <li>Not be same as your current password</li>
                                    <li>Not contain common passwords.</li>
                                </ul>
                            </div>
                            <div class="col-md-6 mb-5">
                                <form id="form1">
                                    <div class="form-group">
                                        <label for="currentPassword">Current Password</label>
                                        <input type="password" class="form-control" id="currentPassword" name="currentPassword">
                                    </div>
                                    <div class="form-group">
                                        <label for="newPassword">New Password</label>
                                        <input type="password" class="form-control" id="newPassword" name="password">
                                        <small class="error" id="error1"></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="cpassword">Re-enter Password</label>
                                        <input type="password" class="form-control" id="cpassword" name="cpassword">
                                        <small class="error" id="error2"></small>
                                    </div>
                                    <button class="btn btn-primary btn-block" type="submit">Change</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="Plugins/footer.jsp"%>

        <script>
            $(document).ready(function () {
                "use strict";

                $("#list3").addClass("active");

                removeMsg("#currentPassword", "");
                removeMsg("#newPassword", "#error1");
                removeMsg("#cpassword", "#error2");

                $("#form1").on("submit", function (event) {
                    event.preventDefault();
                    let pass = /^[A-Za-z0-9 @#$&_]{6,20}$/;

                    let isValid1 = isEmpty("#currentPassword", "", "");
                    let isValid2 = isEmpty("#newPassword", "", "");
                    let isValid3 = isEmpty("#cpassword", "", "");

                    if (isValid2)
                    {
                        isValid2 = expression(pass, "#newPassword", "#error1", "Password must be at least 6 characters");
                    }

                    if (isValid1 && isValid2 && isValid3) {
                        $.ajax({
                            url: "/updatePassword",
                            type: "post",
                            data: $(this).serialize(),
                            success: function (data)
                            {
                                if (data.trim() === "success")
                                {
                                    success("Password Updated");
                                } else if (data.trim() === "nomatch") {
                                    $("#cpassword").addClass("is-invalid");
                                    $("#error2").html("Password is not matching");
                                } else if (data.trim() === "invalid") {
                                    warning("Current password is invalid");
                                } else if (data.trim() === "pused") {
                                    warning("Enter different password");
                                } else {
                                    error();
                                }
                            },
                            error: function (data)
                            {
                                error();
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>
