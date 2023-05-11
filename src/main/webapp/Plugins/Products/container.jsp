<link rel="stylesheet" href="CSS/snackbar.min.css"/>
<link rel="stylesheet" href="CSS/products.css"/>

<div class="container-fluid text-center bg-white pb-2 pt-3" id="productHeader">
    <h6><%= title%> ( Showing <span id="count"></span> )</h6>
</div>

<div class="container-fluid">
    <button class="btn text-dark" id="scrollerButton">
        <i class="fas fa-chevron-circle-up" style="font-size:1.5rem;"></i>
    </button>
</div>

<div class="container-fluid mt-3">
    <div class="row justify-content-around">
        <div class="col-md-3 px-0 mb-4">
            <ul class="list-group rounded-0 bg-white pb-4">
                <li class="list-group-item menu-item pt-4 pb-0">
                    <h5>Filters</h5>  
                    <h6 style="display:none;" class="text-right" id="clearFilter">
                        <a class="text-primary" role="button">Clear All</a>
                    </h6>
                </li>
                <hr>
                <li class="list-group-item menu-item py-0">
                    <form id="form3">
                        <h6 class="pb-1">PRICE</h6>
                        <div class="input-group input-group-sm mb-3">
                            <div class="input-group-prepend">
                                <select class="form-control form-control-sm mb-2" style="width:90px" id="minPrice" onchange="filter()">
                                    <option value="0">Min</option>
                                    <option value="10000">&#8377;10,000</option>
                                    <option value="20000">&#8377;20,000</option>
                                    <option value="30000">&#8377;30,000</option>
                                    <option value="40000">&#8377;40,000</option>
                                    <option value="50000">&#8377;50,000</option>
                                </select>
                            </div>
                            <span class="px-3 pt-1">to</span>
                            <div class="input-group-append">
                                <select class="form-control form-control-sm" style="width:90px" id="maxPrice" onchange="filter()">
                                    <option value="60000">&#8377;60,000</option>
                                    <option value="70000">&#8377;70,000</option>
                                    <option value="80000">&#8377;80,000</option>
                                    <option value="90000">&#8377;90,000</option>
                                    <option value="100000">&#8377;100,000</option>
                                    <option value="1000000" selected>Max</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </li>
                <hr>
                <li class="list-group-item menu-item py-0">
                    <form id="form4">
                        <h6 class="pb-1">BRAND</h6>
                        <%for (String list : brands) {%>
                        <div class="form-check">
                            <input class="form-check-input brand" type="checkbox" value="<%= list%>" onchange="filter()">
                            <label class="form-check-label">
                                <%= list%>
                            </label>
                        </div>
                        <%}%>
                    </form>
                </li>
                <hr>
                <li class="list-group-item menu-item py-0">
                    <form id="form5">
                        <h6 class="pb-1">SORT</h6>
                        <div class="form-check">
                            <input class="form-check-input sort" onchange="filter()" type="radio" name="sort" value="relevance" checked>
                            <label class="form-check-label">
                                Relevance
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input sort" onchange="filter()" type="radio" name="sort" value="low">
                            <label class="form-check-label">
                                Price: Low To High
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input sort" onchange="filter()" type="radio" name="sort" value="high">
                            <label class="form-check-label">
                                Price: High To Low
                            </label>
                        </div>
                    </form>
                </li>
                <hr>
                <li class="list-group-item menu-item py-0">
                    <form id="form6">
                        <h6 class="pb-1">AVAILABILITY</h6>
                        <div class="form-check">
                            <input class="form-check-input stock" onchange="filter()" value="checked" type="checkbox" checked>
                            <label class="form-check-label">
                                Include Out of Stock
                            </label>
                        </div>
                    </form>
                </li>
            </ul>
        </div>
        <div class="col-md-8 pt-5 pb-3 bg-white">
            <div id="productContainer">
            </div>
        </div>
    </div>
</div>

<script>
    const getFilters = (element) => {
        let filterArr = [];
        $(element).each(function () {
            if ($(this).prop("checked"))
            {
                filterArr.push($(this).val());
            }
        });
        return filterArr;
    };

    $(document).ready(function () {
        "use strict";

        filter();

        $("#minPrice, #maxPrice, .brand, .sort, .stock").on("change", function () {
            $("#clearFilter").show();
        });
        $("#clearFilter").on("click", function () {
            $("#form3, #form4, #form5, #form6").trigger("reset");
            $(this).hide();
            filter();
        });
        $("#scrollerButton").on("click", function () {
            $("html, body").animate({scrollTop: 0}, "slow");
        });
        $(window).on("scroll load resize", function () {
            if ((window.pageYOffset) > 1000)
            {
                $("#scrollerButton").css("opacity", "1").blur();
            } else {
                $("#scrollerButton").css("opacity", "0").blur();
            }
        });
    });
</script>

<script src="JS/snackbar.min.js"></script>
