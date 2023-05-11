<div class="col-lg-7 bg-white">
    <div class="row justify-content-center bg-light">
        <div class="col-12 p-3 mb-3 bg-white">
            <h6 class="text-secondary">LOGIN</h6>
            <hr>
            <h6>
                <%if (user != null) {%>
                <span class="mr-3"><%= user.getName()%> </span><%= user.getNumber()%> 
                <a class="text-primary positionLeft" role="button" onclick="showAdditionalText('#additionalText1')">CHANGE</a>
                <%} else {%> 
                <a class="text-primary positionLeft" role="button" data-toggle="modal" data-target="#loginModal">LOGIN</a>
                <%}%>
            </h6>
            <h6 class="text-primary positionLeft" id="additionalText1">
                <a role="button" id="logout">Logout & Login to another account</a>
            </h6>
        </div>
        <div class="col-12 p-3 mb-3 bg-white">
            <h6 class="text-secondary">DELIVERY ADDRESS</h6>
            <hr>
            <h6>
                <%if (user != null) {%> 
                <%if (user.getAddress() != null) {%>
                <%= user.getName()%>
                <span class="ml-1" style="line-height:25px;"><%= user.getAddress() + ", " + user.getDistrict() + ", " + user.getStates() + "-" + user.getPin()%></span>
                <br>
                <a class="text-primary positionLeft" role="button" onclick="showAdditionalText('#additionalText2')">CHANGE</a>
                <%} else {%>
                <a href="address.jsp" class="positionLeft">Update Address</a>
                <%}%>
                <%}%>
            </h6>
            <br>
            <h6 class="text-primary positionLeft" id="additionalText2"><a href="address.jsp">Update Address</a></h6>
        </div>
        <div class="col-12 p-3 mb-3 bg-white">
            <h6 class="text-secondary">ORDER SUMMERY</h6>
            <hr>
            <span id="placeCartData"></span>
            <span id="placeBuyData"></span>
        </div>
        <div class="col-12 p-3 mb-3 bg-white">
            <fieldset id="buy1Fieldset" <%if (user == null || user.getAddress() == null) {%>disabled<%}%>>
                <h6 class="text-secondary">PAYMENT OPTIONS</h6>
                <hr>
                <ul class="list-group mb-3">
                    <li class="list-group-item menu-item">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="payment1" value="card" data-toggle="modal" data-target="#cardModal" onclick="payment(this, '#proceedButton1')">
                            <label class="form-check-label ml-2">
                                Credit / Debit / ATM Card
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item menu-item">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="payment1" value="net" data-toggle="modal" data-target="#netbankingModal" onclick="payment(this, '#proceedButton1')">
                            <label class="form-check-label ml-2">
                                Net Banking
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item menu-item">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="payment1" value="cod" onclick="payment(this, '#proceedButton1')">
                            <label class="form-check-label ml-2">
                                Cash on Delivery
                            </label>
                        </div>
                    </li>
                </ul>
                <hr>
                <button class="btn btn-primary px-5 py-2 text-white" disabled id="proceedButton1" data-toggle="modal" data-target="#placeOrderModal" <%if (user != null) {%>onclick="orders('cart',<%= user.getId()%>)"<%}%>>Confirm Order</button>
            </fieldset>
            <fieldset id="buy2Fieldset" <%if (user == null || user.getAddress() == null) {%>disabled<%}%>>
                <h6 class="text-secondary">PAYMENT OPTIONS</h6>
                <hr>
                <ul class="list-group mb-3">
                    <li class="list-group-item menu-item">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="card" name="payment2" data-toggle="modal" data-target="#cardModal" onclick="payment(this, '#proceedButton2')">
                            <label class="form-check-label ml-2">
                                Credit / Debit / ATM Card
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item menu-item">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="net" name="payment2" data-toggle="modal" data-target="#netbankingModal" onclick="payment(this, '#proceedButton2')">
                            <label class="form-check-label ml-2">
                                Net Banking
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item menu-item">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="cod" name="payment2" onclick="payment(this, '#proceedButton2')">
                            <label class="form-check-label ml-2">
                                Cash on Delivery
                            </label>
                        </div>
                    </li>
                </ul>
                <hr>
                <button class="btn btn-primary px-5 py-2 text-white" disabled id="proceedButton2" data-toggle="modal" data-target="#placeOrderModal" <%if (user != null) {%>onclick="orders('buy',<%= user.getId()%>)"<%}%>>Confirm Order</button>
            </fieldset>
        </div>
    </div>
</div>


<script>
    const payment = (element1, element2) => {
        if ($(element1).val() === "cod")
        {
            $(element2).removeAttr("disabled");
        } else {
            $(element2).attr("disabled", "disabled");
        }
    };
    const showAdditionalText = (element) => {
        $(element).show();
    };
</script>
