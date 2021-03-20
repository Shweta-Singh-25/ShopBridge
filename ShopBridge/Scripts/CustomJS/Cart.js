function onClickRemoveFromCart(currentid) {
    var ID = currentid.split("_")[1];

    $.ajax({
        type: "POST",
        url: '/Cart/RemoveFromCart/?ID=' + ID,
        datatype: "json",
        success: function (result) {

            alert("Product Removed from Cart successfully!");
            location.reload();
        },
        error: function (x, e) {
            alert(x.readyState + " " + x.status + " " + e.msg, "Error");
        }
    });
}
