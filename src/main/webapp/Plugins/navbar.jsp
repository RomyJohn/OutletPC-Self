<%@page import="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="java.util.List"%>
<%@page import="config.OutletpcApplication"%>
<%@page import="controllers.Category"%>
<%@page import="entities.UserData"%>
<%@page import="entities.CategoryData"%>

<%
    UserData user = (UserData) session.getAttribute("user");
    ApplicationContext context = new AnnotationConfigApplicationContext(OutletpcApplication.class);
    Category category = context.getBean("category", Category.class);
    List<CategoryData> categoriesList = category.getCategories();
%>

<style>
    nav {
        user-select: none;
    }
    .nav li{
        color: white;
    }
    nav .dropdown-item:active{
        background-color: #F8F9FA;
        color: #212529;
    }
    #searchContainer,
    #sidebar,
    #sidebar::-webkit-scrollbar {
        display: none;
    }
    #sidebar {
        scrollbar-width: none;
        height: 100vh;
        position: fixed;
        top: 0%;
        right: 0%;
        background-color: white;
        width: 40vw;
        border-left: 1px solid lightgray;
        font-size: 15px;
    }
    #navbarCloseIcon {
        font-size: 1.1rem;
        float: right;
    }
    #sidebar .list-group-item:hover{
        background: #EAEDED;
    }
    
    @media screen and (max-width: 768px) {
        #sidebar {
            width: 60vw;
        }
    }
    @media screen and (max-width: 425px) {
        #sidebar {
            width: 80vw;
        }
    }
</style>

<nav class="navbar bg-dark sticky-top">
    <a href="index.jsp" class="navbar-brand text-white">
        <i class="fas fa-laptop text-info"></i>Outlet<span class="text-info">PC</span>
    </a>
    <ul class="nav ml-auto">
        <li class="nav-item" id="searchIcon">
            <a class="nav-link" role="button"><i class="fas fa-search"></i></a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle pt-1" role="button" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                <% if (user == null) {%>
                <a href="#" class="dropdown-item" data-toggle="modal" data-target="#loginModal">
                    <i class="fas fa-sign-in-alt mr-2 text-primary"></i> Login
                </a>
                <div class="dropdown-divider"></div>
                <a href="signup.jsp" class="dropdown-item">
                    <i class="fas fa-user-plus mr-2 text-primary"></i> Sign Up
                </a>
                <%} else {%>
                <a href="profile.jsp" class="dropdown-item">
                    <i class="fas fa-user-circle mr-2 text-primary"></i> Profile
                </a>
                <div class="dropdown-divider"></div>
                <a href="orders.jsp" class="dropdown-item">
                    <i class="fas fa-shipping-fast mr-2 text-primary"></i> Orders
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" id="navbarLogout">
                    <i class="fas fa-power-off mr-2 text-primary"></i> Logout
                </a>
                <%}%>
            </div>
        </li>
        <li class="nav-item">
            <a href="cart.jsp" class="nav-link">
                <i class="fas fa-shopping-cart text-white"></i><span class="badge badge-pill badge-primary cartCount" style="font-weight:normal;"></span>
            </a>
        </li>
        <li class="nav-item " id="navbarMenuIcon">
            <a class="nav-link" role="button"><i class="fas fa-bars text-light"></i></a>
        </li>
    </ul>
</nav>

<div id="sidebar" class="sticky-top">
    <div class="card">
        <div class="card-body bg-dark">
            <a class="pr-3 text-white" id="navbarCloseIcon" role="button"><i class="fas fa-times"></i></a>
            <h5 style="text-transform:capitalize;" class="text-white">
                <% if (user == null) {%>
                <a href="login.jsp" class="text-white">Hello, Login</a>
                <%} else {%>
                Hello, <%= user.getName()%>
                <%}%>
            </h5>
        </div>
    </div>
    <div class="list-group list-group-flush">
        <a href="#" class="list-group-item disabled">SHOP BY CATEGORY</a>
        <%for (CategoryData list : categoriesList) {%>
        <a href="products.jsp?id=<%= list.getId()%>&title=<%= list.getTitle()%>" class="list-group-item list-group-item-action" style="color:#212529;"><%= list.getTitle()%></a>
        <%}%>
        <a href="#" class="list-group-item disabled">HELP & SETTINGS</a>
        <a <%if (user != null) {%>href="/profile.jsp"<%} else {%>href="/login.jsp"<%}%> class="list-group-item list-group-item-action" style="color:#212529;">Your Account</a>
        <a href="/support.jsp" class="list-group-item list-group-item-action" style="color:#212529;">Support</a>
    </div>
</div>

<div class="container-fluid bg-dark sticky-top" id="searchContainer">
    <div class="row justify-content-center py-5">
        <div class="col-md-6">
            <form action="search.jsp">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                    </div>
                    <input type="text" class="form-control" name="search" placeholder="Search for products, brands and more">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button" id="searchCloseIcon"><i class="fas fa-times"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <a role="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </a>
                <br>
                <div class="row justify-content-center">
                    <div class="card" style="width:25rem;">
                        <div class="card-body">
                            <p class="card-title" style="font-size:1.7rem;">Login</p>
                            <br>
                            <div class="alert" role="alert"></div>
                            <form id="loginForm">
                                <div class="form-group">
                                    <label for="username">Email or phone</label>
                                    <input type="text" class="form-control" id="username" name="username">
                                    <small class="error" id="error_1"></small>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                    <small class="error" id="error_2"></small>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Continue</button>
                            </form>
                            <hr>
                            <p class="text-center"><a href="reset.jsp">Forgot Password?</a></p>
                            <p class="text-center">Don't have an account? <a href="signup.jsp">Signup</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/JS/validation.js"></script>

<script>
    $(document).ready(function () {
        "use strict";

        $("#navbarMenuIcon").on("click", function () {
            $("#sidebar").slideDown();
        });
        $("section, footer, #navbarCloseIcon, #sidebar .list-group-item").on("click", function () {
            $("#sidebar").slideUp();
        });
        $("#searchIcon").on("click", function () {
            $(".navbar").slideUp();
            $("#searchContainer").slideDown();
            $("section, footer").css("opacity", "0.5");
        });
        $("section, footer, #searchCloseIcon").on("click", function () {
            $("#searchContainer").slideUp();
            $(".navbar").slideDown();
            $("section, footer").css("opacity", "1");
        });
        $("#navbarLogout").on("click", function (event) {
            event.preventDefault();

            $.ajax({
                url: "/logout",
                success: function (data)
                {
                    if (data.trim() === "success")
                        location.reload();
                }
            });
        });

        removeMsg("#username", "#error_1");
        removeMsg("#password", "#error_2");

        $("section, .navbar, footer").on("click", function () {
            $("#loginModal .card-body .alert").hide();
            $("#loginForm input").removeClass("is-invalid").val("");
            $("#loginModal .error").html("");
        });

        $("#loginForm").on("submit", function (event) {
            event.preventDefault();

            let isValid1 = isEmpty("#username", "#error_1", "Enter your email or phone number");
            let isValid2 = isEmpty("#password", "#error_2", "Enter your password");

            if (isValid1 && isValid2)
            {
                $("#loginForm .btn").attr("disabled", true);
                $.ajax({
                    url: "/login",
                    type: "post",
                    data: $(this).serialize(),
                    success: function (data) {
                        if (data.trim() === "success")
                        {
                            location.reload();
                        } else
                        {
                            $("#loginForm .btn").removeAttr("disabled");
                            $(".alert").addClass("alert-danger").html("Invalid Credentials!").show();
                        }
                    },
                    error: function (data) {
                        $("#loginForm .btn").removeAttr("disabled");
                        $(".alert").addClass("alert-danger").html("Server is not responding!").show();
                    }
                });
            }
        });
    });
</script>
