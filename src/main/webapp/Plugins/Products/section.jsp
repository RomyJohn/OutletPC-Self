<div class="card">
    <div class="row">
        <div class="col-sm-6 text-center">
            <a href="productDescription.jsp?id=<%= list.getId()%>">
                <img src="Images/Products/<%= list.getImage()%>" class="img-fluid" alt="No Image">
            </a>
        </div>
        <div class="col-sm-6">
            <div class="card-body">
                <a href="productDescription.jsp?id=<%= list.getId()%>">
                    <p style="font-size:1.1rem;"><%= list.getTitle()%></p>
                </a>
                <h6 style="font-size:0.9rem;"> 
                    <%if (list.getStock().equals("in")) {%>
                    <span class="badge badge-success p-2 rounded-pill" style="font-weight:normal;">In Stock</span>
                    <%} else {%>
                    <span class="badge badge-danger p-2 rounded-pill" style="font-weight:normal;">Out Of Stock</span>
                    <%}%> 
                </h6>
                <h5 class="text-danger py-2">
                    &#8377;<%= currencyFormat.format(list.getDiscount())%> 
                    <span class="mx-1 text-dark"><del>&#8377;<%= currencyFormat.format(list.getPrice())%></del></span>
                    <%if (((list.getPrice() - list.getDiscount()) * 100 / list.getPrice()) > 10) {%>
                    <span class="text-success"><%= (list.getPrice() - list.getDiscount()) * 100 / list.getPrice()%>% off</span>
                    <%}%>
                </h5>
                <button class="btn btn-info mb-2 rounded-0" style="box-shadow:none;" <%if (list.getStock().equals("out")) {%>disabled<%}%> onclick="addToCart(<%= list.getId()%>, '<%= list.getTitle()%>', <%= list.getDiscount()%>, <%= list.getPrice()%>, '<%= list.getImage()%>')">
                    <i class="fas fa-shopping-cart"></i> Add to Cart
                </button>
                <p class="text-secondary" style="font-size:0.9rem;">Free delivery by Outlepc</p>
            </div>
        </div>
    </div>
</div>
<hr>
