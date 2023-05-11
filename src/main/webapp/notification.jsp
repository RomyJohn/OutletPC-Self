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
                    <div class="col-md-7 bg-white p-5 text-center">
                        <img src="Images/Profile/notification.png" alt="No Image"> 
                        <h5 class="mt-5">All caught up!</h5>
                        <p class="pb-5">There are no new notifications for you.</p>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="Plugins/footer.jsp"%>

        <script>
            $(document).ready(function () {
                "use strict";

                $("#list4").addClass("active");
            });
        </script>
    </body>
</html>
