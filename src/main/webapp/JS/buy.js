"use strict";

$("#form1").on("submit", function (event) {
    event.preventDefault();
    errorCart("Invalid card information. Try again");
});

$("#form2").on("submit", function (event) {
    event.preventDefault();
    errorCart("Bank server unavailable");
});

$("#logout").on("click", function (event) {
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

const orders = (storage, userId) => {
    let products = JSON.parse(localStorage.getItem(storage));
    let productId = [];
    let productPrice = [];
    let productQty = [];
    let productName = [];
    let productImage = [];

    products.map((items) => {
        productId.push(items.productId);
        productPrice.push(items.productDiscount);
        productQty.push(items.productQuantity);
        productName.push(items.productName);
        productImage.push(items.productImage);
    });

    $.ajax({
        url: "/orders",
        type: "post",
        traditional: true,
        data: {productId: productId, userId: userId, productPrice: productPrice, productQty: productQty, productName: productName, productImage: productImage}
    });
};
