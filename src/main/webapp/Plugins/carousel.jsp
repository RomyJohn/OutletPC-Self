<div class="item">
    <div class="card text-center">
        <div class="row justify-content-center">
            <a href="productDescription.jsp?id=<%= list.getId()%>">
                <img src="Images/Products/<%= list.getImage()%>" alt="No Image">
            </a>
        </div>
        <div class="card-body">
            <a href="productDescription.jsp?id=<%= list.getId()%>">
                <h6><%= list.getTitle().substring(0, 15).concat("...")%></h6>
                <p class="text-success mb-1" style="font-size:0.9rem;">
                    <%if (((list.getPrice() - list.getDiscount()) * 100 / list.getPrice()) > 10) {%>
                    Upto <span class="text-success"><%= (list.getPrice() - list.getDiscount()) * 100 / list.getPrice()%>% off</span>
                    <%}%>
                </p>
                <p>
                    &#8377;<%= currencyFormat.format(list.getDiscount())%>
                    <span class="text-secondary" style="font-size:0.9rem;"><del>&#8377;<%= currencyFormat.format(list.getPrice())%></del></span>
                </p> 
            </a>
        </div>
    </div>
</div>
