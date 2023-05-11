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
            section .btn-primary{
                padding-left: 3.4rem;
                padding-right: 3.5rem;
            }

            @media screen and (max-width:396px){
                fieldset button{
                    margin-bottom: 1rem;
                }
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
                        <h5>Manage Address</h5>
                        <h6 class="pt-4 pb-3">
                            <a role="button" class="text-primary" onclick="enableForm(this, 'fieldset, fieldset input', '#form1')">Edit</a>
                        </h6>
                        <fieldset disabled class="disabledForm mb-5">
                            <form id="form1">
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md">
                                            <label for="pin">Pin Code</label>
                                            <input type="text" class="form-control mb-3" name="pin" id="pin" minlength="6" maxlength="6" <%if (userProfile.getPin() != 0)%> value="<%= userProfile.getPin()%>">
                                        </div>
                                        <div class="col-md">
                                            <label for="locality">Locality</label>
                                            <input type="text" class="form-control" name="locality" id="locality" <%if (userProfile.getLocality() != null)%> value="<%= userProfile.getLocality()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address (Area and Street)</label>
                                    <textarea class="form-control mb-4" id="address" rows="3" name="address"><%if (userProfile.getAddress() != null) {%><%= userProfile.getAddress()%><%}%></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md">
                                            <label for="district">City/District/Town</label>
                                            <input type="text" class="form-control mb-3" name="district" id="district" <%if (userProfile.getDistrict() != null)%> value="<%= userProfile.getDistrict()%>">
                                        </div>
                                        <div class="col-md">
                                            <label for="states">State</label>
                                            <input list="statesList" class="custom-select" name="states" id="states" <%if (userProfile.getStates() != null)%> value="<%= userProfile.getStates()%>">
                                            <datalist id="statesList">
                                                <option value="Andhra Pradesh">Andhra Pradesh</option>
                                                <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                                <option value="Assam">Assam</option>
                                                <option value="Bihar">Bihar</option>
                                                <option value="Chandigarh">Chandigarh</option>
                                                <option value="Chhattisgarh">Chhattisgarh</option>
                                                <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                                                <option value="Daman and Diu">Daman and Diu</option>
                                                <option value="Delhi">Delhi</option>
                                                <option value="Lakshadweep">Lakshadweep</option>
                                                <option value="Puducherry">Puducherry</option>
                                                <option value="Goa">Goa</option>
                                                <option value="Gujarat">Gujarat</option>
                                                <option value="Haryana">Haryana</option>
                                                <option value="Himachal Pradesh">Himachal Pradesh</option>
                                                <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                                <option value="Jharkhand">Jharkhand</option>
                                                <option value="Karnataka">Karnataka</option>
                                                <option value="Kerala">Kerala</option>
                                                <option value="Madhya Pradesh">Madhya Pradesh</option>
                                                <option value="Maharashtra">Maharashtra</option>
                                                <option value="Manipur">Manipur</option>
                                                <option value="Meghalaya">Meghalaya</option>
                                                <option value="Mizoram">Mizoram</option>
                                                <option value="Nagaland">Nagaland</option>
                                                <option value="Odisha">Odisha</option>
                                                <option value="Punjab">Punjab</option>
                                                <option value="Rajasthan">Rajasthan</option>
                                                <option value="Sikkim">Sikkim</option>
                                                <option value="Tamil Nadu">Tamil Nadu</option>
                                                <option value="Telangana">Telangana</option>
                                                <option value="Tripura">Tripura</option>
                                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                                <option value="Uttarakhand">Uttarakhand</option>
                                                <option value="West Bengal">West Bengal</option>
                                            </datalist>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary mr-5">Save</button>
                                <button type="reset" class="btn btn-primary px-5" id="reset">Cancel</button>
                            </form>
                        </fieldset>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="Plugins/footer.jsp"%>

        <script>
            const enableForm = (element, input, form) => {
                if ($(element).html().trim() === "Edit")
                {
                    $(element).html("Cancel");
                    $(input).removeAttr("disabled").css("cursor", "auto");
                    $("#address").css("cursor", "auto");
                } else {
                    $(element).html("Edit");
                    $(input).attr("disabled", true).removeClass("is-invalid").css("cursor", "no-drop");
                    $("#address").css("cursor", "no-drop");
                    $(form).trigger("reset");
                }
            };

            $(document).ready(function () {
                "use strict";

                $("#list2").addClass("active");

                $("#reset").on("click", function () {
                    $("form input, textarea").removeClass("is-invalid");
                });

                removeMsg("#pin", "");
                removeMsg("#address", "");
                removeMsg("#district", "");
                removeMsg("#states", "");

                $("#form1").on("submit", function (event) {
                    event.preventDefault();

                    let isValid1 = isEmpty("#pin", "", "");
                    let isValid2 = isEmpty("#address", "", "");
                    let isValid3 = isEmpty("#district", "", "");
                    let isValid4 = isEmpty("#states", "", "");

                    if (isValid1 && isValid2 && isValid3 && isValid4)
                    {
                        $.ajax({
                            url: "/updateAddress",
                            type: "post",
                            data: $(this).serialize(),
                            success: function (data)
                            {
                                if (data.trim() === "success")
                                {
                                    success("Address updated successfully");
                                } else
                                {
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
