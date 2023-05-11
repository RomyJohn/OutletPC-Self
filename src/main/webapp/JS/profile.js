"use strict";

$("#logoutProfile").on("click", function (event) {
    event.preventDefault();
    $.ajax({
        url: "/logout",
        success: function (data)
        {
            if (data.trim() === "success")
                window.location = "index.jsp";
        }
    });
});

$(window).on("load resize", function () {
    if (window.matchMedia("(max-width:575px)").matches)
    {
        $(".col-md-7").removeClass("p-5").addClass("pt-5");
    } else {
        $(".col-md-7").addClass("p-5").removeClass("pt-5");
    }
});
