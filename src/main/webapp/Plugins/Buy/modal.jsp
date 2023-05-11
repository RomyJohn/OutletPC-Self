<div class="modal fade" id="cardModal" tabindex="-1" aria-labelledby="cardModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <a role="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </a>
                <div class="container p-5">
                    <h5>Credit / Debit / ATM Card</h5>
                    <form class="py-4" id="form1">
                        <div class="input-group">
                            <input type="text" class="form-control" minlength="16" maxlength="16" required pattern="[0-9]{16}" title="Invalid Card Number" placeholder="Enter Card Number">
                        </div>
                        <div class="row my-3">
                            <div class="col">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <select class="custom-select" required>
                                            <option value="">MM</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div>
                                    <select class="custom-select" required>
                                        <option value="">YY</option>
                                        <option value="2020">2020</option>
                                        <option value="2020">2021</option>
                                        <option value="2020">2022</option>
                                        <option value="2020">2023</option>
                                        <option value="2020">2024</option>
                                        <option value="2020">2025</option>
                                        <option value="2020">2026</option>
                                        <option value="2020">2027</option>
                                        <option value="2020">2028</option>
                                        <option value="2020">2029</option>
                                        <option value="2020">2030</option>
                                        <option value="2020">2031</option>
                                        <option value="2020">2032</option>
                                        <option value="2020">2033</option>
                                        <option value="2020">2034</option>
                                        <option value="2020">2035</option>
                                        <option value="2020">2036</option>
                                        <option value="2020">2037</option>
                                        <option value="2020">2038</option>
                                        <option value="2020">2039</option>
                                        <option value="2020">2040</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <input type="text" class="form-control"  minlength="3" maxlength="3" required pattern="[0-9]{3}" title="Invalid CVV" placeholder="CVV">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block py-2" id="cardPay">Pay <span></span></button>
                    </form>
                    <p style="font-size:0.9rem;">Be assured your card details are 100% safe with us. Our systems are PCI DSS security certified.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="netbankingModal" tabindex="-1" aria-labelledby="cardModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <a role="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </a>
                <div class="container p-5">
                    <h5>Net Banking</h5>
                    <form class="py-4" id="form2">
                        <div class="form-group">
                            <h6><label>Banks</label></h6>
                            <select class="custom-select" required>
                                <option value="">--- Select Bank ---</option>
                                <option value="Allahabad Bank">Allahabad Bank</option>
                                <option value="Axis Bank">Axis Bank</option>
                                <option value="Bank of Baroda">Bank of Baroda</option>
                                <option value="Bank of India">Bank of India</option>
                                <option value="Canara Bank">Canara Bank</option>
                                <option value="Central Bank of India">Central Bank of India</option>
                                <option value="ICICI Bank">ICICI Bank</option>
                                <option value="IDBI Bank">IDBI Bank</option>
                                <option value="Indian Bank">Indian Bank</option>
                                <option value="Kotak Bank">Kotak Bank</option>
                                <option value="Punjab National Bank">Punjab National Bank</option>
                                <option value="State Bank of India">State Bank of India</option>
                                <option value="Syndicate Bank">Syndicate Bank</option>
                                <option value="Yes Bank Ltd">Yes Bank Ltd</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block py-2" id="netPay">Pay <span></span></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="placeOrderModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="placeOrderModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <a role="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </a>
                <div class="container p-5">
                    <h5>Hi <%if (user != null) {%><%= user.getName()%><%}%>,</h5>
                    <h5 class="pt-4 pb-1">Order successfully placed.</h5>
                    <%
                        SimpleDateFormat dateFormat = new SimpleDateFormat("E, dd MMM yyyy");
                        Calendar calendar = Calendar.getInstance();
                        calendar.add(Calendar.DATE, 5);
                    %>
                    <p>Your order will be delivered by <%= dateFormat.format(calendar.getTime())%>.<br>
                        We are pleased to confirm your order.</p>
                    <p>Thank you for shopping with OutletPC!</p>
                    <br>
                    <a href="index.jsp" role="button" class="btn btn-primary">Continue Shopping</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    let orderPlaced = (storage) => {
        location.reload();
        localStorage.removeItem(storage);
    };
</script>
