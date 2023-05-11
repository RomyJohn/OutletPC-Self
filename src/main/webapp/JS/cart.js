const successCart = (msg) => {
    Snackbar.show({
        text: '<i class="fas fa-check-circle mr-2 text-success"></i> ' + msg,
        showAction: false,
        pos: 'bottom-center'
    });
};

const errorCart = (msg) => {
    Snackbar.show({
        text: '<i class="fas fa-exclamation-triangle mr-2 text-danger"></i> ' + msg,
        showAction: false,
        pos: 'bottom-center'
    });
};

const currencyFormat = (count) => {
    return (count).toLocaleString('en-IN', {maximumFractionDigits: 2, style: 'currency', currency: 'INR'}).replace(/\.00/g, '');
};

const productContainer = (element, storageKey) => {
    let displayData = ``;
    element.map((item) => {
        displayData += `
                <div class="card">
                    <div class="row">
                        <div class="col-sm-6 text-center">
                            <a href="productDescription.jsp?id=${item.productId}">
                                <img src="Images/Products/${item.productImage}" class="img-fluid" alt="No Image">
                            </a>
                        </div>
                        <div class="col-sm-6">
                            <div class="card-body">
                                <a href="productDescription.jsp?id=${item.productId}" class="text-dark">
                                    <h6>${item.productName}</h6>
                                    <h5 class="text-danger pt-1">
                                        ${currencyFormat(item.productDiscount * item.productQuantity)} 
                                        <span class="ml-1 text-dark" style="font-size:0.95rem;"><del>${currencyFormat(item.productPrice * item.productQuantity)}</del></span>   
                                    </h5>
                                </a>
                                <h6 class="py-2">Qty  
                                    <a class="btn btn-sm rounded-0 ml-3" style="width:1.8rem;background:#EAEDED;border:1px solid lightgray;" onclick="decreaseQuantity('${storageKey}',${item.productId})">-</a> 
                                    <a class="btn btn-white rounded-0 btn-sm" style="width:2rem;cursor:auto;border:1px solid lightgray;">${item.productQuantity}</a>  
                                    <a class="btn btn-sm rounded-0" style="width:1.8rem;background:#EAEDED;border:1px solid lightgray;" onclick="increaseQuantity('${storageKey}',${item.productId})">+</a>
                                </h6>
                                <h6>
                                    <a role="button" class="text-primary" onclick="remove('${storageKey}',${item.productId})">REMOVE</a>
                                </h6>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>    `;
    });
    return displayData;
};

const addToCart = (id, name, discount, price, image) => {
    let cart = localStorage.getItem("cart");
    if (cart === null)
    {
        let products = [];
        let productData = {productId: id, productName: name, productDiscount: discount, productPrice: price, productImage: image, productQuantity: 1};
        products.push(productData);
        localStorage.setItem("cart", JSON.stringify(products));
        successCart("Successfully Added");
    } else {
        let products = JSON.parse(cart);
        let oldProduct = products.find((item) => item.productId === id);
        if (oldProduct)
        {
            if (oldProduct.productQuantity < 5)
            {
                oldProduct.productQuantity = oldProduct.productQuantity + 1;
                products.map((item) => {
                    if (item.productId === oldProduct.productId)
                    {
                        item.productQuantity = oldProduct.productQuantity;
                    }
                });
                localStorage.setItem("cart", JSON.stringify(products));
                successCart("Successfully Added");
            } else {
                errorCart("You can purchase 5 units only");
            }
        } else {
            let productData = {productId: id, productName: name, productDiscount: discount, productPrice: price, productImage: image, productQuantity: 1};
            products.push(productData);
            localStorage.setItem("cart", JSON.stringify(products));
            successCart("Successfully Added");
        }
    }
    updateData();
};

const buyProduct = (id, name, discount, price, image) => {
    let products = [];
    let productData = {productId: id, productName: name, productDiscount: discount, productPrice: price, productImage: image, productQuantity: 1};
    products.push(productData);
    localStorage.setItem("buy", JSON.stringify(products));
    window.location = "buy2.jsp";
};

const updateData = () => {
    let cart = JSON.parse(localStorage.getItem("cart"));
    let buy = JSON.parse(localStorage.getItem("buy"));

    if (cart === null || cart.length === 0)
    {
        $(".cartLength, .cartLength1, .cartCount").html("0");
        $(".productTotal1, .gst1, .cartTotal1, .totalSaving1, .pay1 span").html("&#8377; 0");
        $("#placeCartData").empty();
        $("#buy1Fieldset").attr("disabled", true);
        $("#hasProduct").hide();
        $("#hasNoProduct").show();
    } else {
        let cartLength = 0;
        let totalPrice = 0;
        let cartSaving = 0;
        cart.map((item) => {
            cartLength += item.productQuantity;
            totalPrice += item.productDiscount * item.productQuantity;
            cartSaving += item.productPrice * item.productQuantity - item.productDiscount * item.productQuantity;
        });

        $(".cartCount").html(cartLength);
        $("#placeCartData").html(productContainer(cart, "cart"));
        if (cartLength > 1)
        {
            $(".cartLength").html(cartLength + " items");
        } else {
            $(".cartLength").html(cartLength + " item");
        }
        $(".productTotal1").html(currencyFormat(totalPrice));
        $(".gst1").html(currencyFormat(totalPrice * 5 / 100));
        $(".cartTotal1, .pay1 span").html(currencyFormat(totalPrice + totalPrice * 5 / 100));
        $(".totalSaving1").html(currencyFormat(cartSaving));
        $("#hasNoProduct").hide();
        $("#hasProduct").show();
    }

    if (buy === null || buy.length === 0)
    {
        $(".cartLength2").html("0");
        $(".productTotal2, .gst2, .cartTotal2, .totalSaving2, .pay2 span").html("&#8377; 0");
        $("#placeBuyData").empty();
        $("#buy2Fieldset").attr("disabled", true);
    } else {
        let cartLength = 0;
        let totalPrice = 0;
        let cartSaving = 0;
        buy.map((item) => {
            cartLength += item.productQuantity;
            totalPrice += item.productDiscount * item.productQuantity;
            cartSaving += item.productPrice * item.productQuantity - item.productDiscount * item.productQuantity;
        });
        $("#placeBuyData").html(productContainer(buy, "buy"));
        if (cartLength > 1)
        {
            $(".cartLength2").html(cartLength + " items");
        } else {
            $(".cartLength2").html(cartLength + " item");
        }
        $(".productTotal2").html(currencyFormat(totalPrice));
        $(".gst2").html(currencyFormat(totalPrice * 5 / 100));
        $(".cartTotal2, .pay2 span").html(currencyFormat(totalPrice + totalPrice * 5 / 100));
        $(".totalSaving2").html(currencyFormat(cartSaving));
    }
};

const remove = (storageKey, id) => {
    let productData = JSON.parse(localStorage.getItem(storageKey));
    let updatedProductData = productData.filter((item) => item.productId !== id);
    localStorage.setItem(storageKey, JSON.stringify(updatedProductData));
    successCart("Successfully Removed");
    updateData();
};

const decreaseQuantity = (storageKey, id) => {
    let productData = JSON.parse(localStorage.getItem(storageKey));
    let oldProduct = productData.find((item) => item.productId === id);
    if (oldProduct.productQuantity > 1)
    {
        oldProduct.productQuantity = oldProduct.productQuantity - 1;
    }
    productData.map((item) => {
        if (item.productId === oldProduct.productId)
        {
            item.productQuantity = oldProduct.productQuantity;
        }
    });
    localStorage.setItem(storageKey, JSON.stringify(productData));
    updateData();
};

const increaseQuantity = (storageKey, id) => {
    let productData = JSON.parse(localStorage.getItem(storageKey));
    let oldProduct = productData.find((item) => item.productId === id);
    if (oldProduct.productQuantity < 5)
    {
        oldProduct.productQuantity = oldProduct.productQuantity + 1;
    }
    productData.map((item) => {
        if (item.productId === oldProduct.productId)
        {
            item.productQuantity = oldProduct.productQuantity;
        }
    });
    localStorage.setItem(storageKey, JSON.stringify(productData));
    updateData();
};

$(document).ready(function () {
    "use strict";

    updateData();
});
