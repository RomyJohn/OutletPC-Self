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
        <link rel="stylesheet" href="CSS/alertify.min.css"> 
        <title>My Profile</title>
        <style>
            #profileContainerFooter p,
            #profileContainerFooter h6,
            .modal li,
            .modal h6,
            .modal p{
                font-size: 0.9rem;
            }
            .col-md-7 .btn{
                display: none;
            }
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
                        <h5 class="pb-4">Personal Information</h5>
                        <form id="form1" class="disabledForm">
                            <h6>
                                <label for="name">Name</label>
                                <a role="button" class="text-primary ml-5" onclick="enableForm(this, '#button1', '#name', '#error1', '#form1')">Edit</a>
                            </h6>
                            <div class="form-row">
                                <div class="col-sm-8">
                                    <input type="text" class="form-control mb-1" disabled name="name" id="name" style="text-transform:capitalize;" value="<%= userProfile.getName()%>">
                                </div>
                                <div class="col-sm-4">
                                    <button class="btn btn-primary px-5" type="submit" id="button1">Save</button>
                                </div>
                            </div>
                            <small class="error" id="error1"></small>
                        </form>
                        <form id="form2" class="mt-5 disabledForm">
                            <h6>
                                <label for="email">Email Address</label>
                                <a role="button" class="text-primary ml-5" onclick="enableForm(this, '#button2', '#email', '#error2', '#form2')">Edit</a>
                            </h6>
                            <div class="form-row">
                                <div class="col-sm-8">
                                    <input type="text" class="form-control mb-1" disabled name="email" id="email" <%if (!userProfile.getEmail().equals("null"))%> value="<%= userProfile.getEmail()%>">
                                </div>
                                <div class="col-sm-4">
                                    <button class="btn btn-primary px-5" type="submit" id="button2">Save</button>
                                </div>
                            </div>
                            <small class="error" id="error2"></small>
                        </form>
                        <form id="form3" class="mt-5 disabledForm">
                            <h6>
                                <label for="number">Mobile Number</label>
                                <a role="button" class="text-primary ml-5" onclick="enableForm(this, '#button3', '#number', '#error3', '#form3')">Edit</a>
                            </h6>
                            <div class="form-row">
                                <div class="col-sm-8">
                                    <input type="text" class="form-control mb-1" disabled name="number" id="number" maxlength="10" value="<%= userProfile.getNumber()%>">
                                </div>
                                <div class="col-sm-4">
                                    <button class="btn btn-primary px-5" type="submit" id="button3">Save</button>
                                </div>
                            </div>
                            <small class="error" id="error3"></small>
                        </form>
                        <div id="profileContainerFooter">
                            <h5 class="pt-5 pb-4">FAQs</h5>
                            <h6 style="color:black;">What happens when I update my email address (or mobile number)?</h6>
                            <p class="py-2">Your login email id (or mobile number) changes, likewise. You'll receive all your account related communication on your updated email address (or mobile number).</p>
                            <h6 style="color:black;">What happens to my existing Outletpc account when I update my email address (or mobile number)?</h6>
                            <p class="py-2 mb-4">Updating your email address (or mobile number) doesn't invalidate your account. Your account remains fully functional. You'll continue seeing your Order history, saved information and personal details.</p>
                            <a href="#" data-toggle="modal" data-target="#deactivateModal"><h6 style="font-size:1rem;" class="text-primary">Deactivate Account</h6></a>
                        </div>
                        <img src="Images/Profile/foot.png" class="w-100 mt-4 img-fluid" alt="No Image">
                    </div>
                </div>
            </div>
        </section>

        <div class="modal fade" id="deactivateModal" tabindex="-1" aria-labelledby="deactivateModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-body">
                        <a role="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </a>
                        <br>
                        <div class="row">
                            <div class="col-md-6">
                                <h6 style="font-size:1.1rem;">When you deactivate your account</h6>
                                <ul class="pl-3 pb-3 pt-4">
                                    <li>You are logged out of your Outletpc Account</li>
                                    <li>Your public profile on Outletpc is no longer visible</li>
                                    <li>Your cart items are no longer accessible</li>
                                    <li>You will be unsubscribed from receiving promotional emails from Outletpc</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6 class="pb-4" style="font-size:1.1rem;">Are you sure you want to leave?</h6>
                                <form id="form4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" disabled value="<%= userProfile.getNumber()%>">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="dpassword" name="password" placeholder="Enter your password">
                                        <small class="error" id="error4"></small>
                                    </div>
                                    <button class="btn btn-primary btn-block" type="submit">Confirm Deactivation</button>
                                </form>
                                <h6 class="text-center text-primary pt-4"><a role="button" data-dismiss="modal" aria-label="Close">NO, LET ME STAY!</a></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="Plugins/footer.jsp"%>

        <script>
            const enableForm = (element, button, input, error, form) => {
                if ($(element).html().trim() === "Edit")
                {
                    $(element).html("Cancel");
                    $(button).show();
                    $(input).removeAttr("disabled").css("cursor", "auto");
                    $("#address").css("cursor", "auto");
                } else {
                    $(element).html("Edit");
                    $(button).hide();
                    $(input).attr("disabled", true).removeClass("is-invalid").css("cursor", "no-drop");
                    $("#address").css("cursor", "no-drop");
                    $(form).trigger("reset");
                    $(error).html("");
                }
            };
        </script>

        <script src="/JS/alertify.min.js"></script>

        <script>
            $(document).ready(function () {
                "use strict";

                $("#list1").addClass("active");

                // ( -------------------- Update Name -------------------- ) //

                removeMsg("#name", "#error1");

                $("#form1").on("submit", function (event) {
                    event.preventDefault();

                    let isValid = isEmpty("#name", "#error1", "Enter your name");

                    if (isValid)
                    {
                        $.ajax({
                            url: "/updateName",
                            type: "post",
                            data: $(this).serialize(),
                            success: function (data)
                            {
                                if (data.trim() === "success")
                                {
                                    success("Account Updated");
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

                // ( -------------------- Update Email -------------------- ) //

                removeMsg("#email", "#error2");

                $("#form2").on("submit", function (event) {
                    event.preventDefault();
                    let isValid = true;
                    let mail = /^[A-Za-z0-9.!@#$&]{1,30}[@]{1}[A-Za-z]{2,10}[.]{1}[A-Za-z]{2,5}$/;

                    if ($("#email").val() !== "") {
                        isValid = expression(mail, "#email", "#error2", "Not a valid email address");
                    }

                    if (isValid)
                    {
                        $.ajax({
                            url: "/updateEmail",
                            type: "post",
                            data: $(this).serialize(),
                            success: function (data)
                            {
                                if (data.trim() === "success")
                                {
                                    success("Account Updated");
                                } else if (data.trim() === "eused") {
                                    warning("Email is already in use");
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

                // ( -------------------- Update Number -------------------- ) //

                removeMsg("#number", "#error3");

                $("#form3").on("submit", function (event) {
                    event.preventDefault();
                    let num = /^[0-9]{10}$/;

                    let isValid = isEmpty("#number", "#error3", "Enter your mobile number");

                    if (isValid) {
                        isValid = expression(num, "#number", "#error3", "Not a valid phone number");
                    }

                    if (isValid)
                    {
                        $.ajax({
                            url: "/updateNumber",
                            type: "post",
                            data: $(this).serialize(),
                            success: function (data)
                            {
                                if (data.trim() === "success")
                                {
                                    success("Account Updated");
                                } else if (data.trim() === "nused") {
                                    warning("Number is already in use");
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

                // ( -------------------- Deactivate Account -------------------- ) //

                removeMsg("#dpassword", "#error4");

                $("#deactivateModel .close, section, .navbar, footer").on("click", function () {
                    $("#form4 input").removeClass("is-invalid");
                    $("#form4").trigger("reset");
                    $("#error4").html("");
                });

                $("#form4").on("submit", function (event) {
                    event.preventDefault();

                    let isValid = isEmpty("#dpassword", "", "");

                    if (isValid)
                    {
                        let pass = <%= userProfile.getPassword()%>;
                        if (pass == $("#dpassword").val()) {
                            alertify.confirm('Deactivate Account', 'You will lost all your activties!', function () {
                                $.ajax({
                                    url: "/deactivateAccount",
                                    type: "post",
                                    data: $(this).serialize(),
                                    success: function (data) {
                                        if (data.trim() === "success")
                                        {
                                            alertify.alert('OutletPC', 'Account deactivated successfully!', function () {
                                                $.ajax({
                                                    url: "/logout",
                                                    success: function (data)
                                                    {
                                                        if (data.trim() === "success")
                                                            window.location = "index.jsp";
                                                    }
                                                });
                                            });
                                        } else {
                                            error();
                                        }
                                    },
                                    error: function (data) {
                                        error();
                                    }
                                });
                            }
                            , function () {
                            }).set('labels', {ok: 'Deactivate', cancel: 'Cancel'});
                        } else
                        {
                            $("#dpassword").addClass("is-invalid");
                            $("#error4").html("Invalid password");
                        }
                    }
                });
            });
        </script>
    </body>
</html>
