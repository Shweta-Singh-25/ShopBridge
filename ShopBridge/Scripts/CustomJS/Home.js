
function onClickAddCart(currentid) {
    var ID = currentid.split("_")[1];
    var unitsAdded = $("#qty_" + ID).val();
    
    $.ajax({
        type: "POST",
        url: '/Home/AddToCart/?ID=' + ID + '&unitsAdded=' + unitsAdded,
        datatype: "json",
        success: function (result) {
            
            alert("Added to Cart successfully!");
            location.reload();
        },
        error: function (x, e) {
            alert(x.readyState + " " + x.status + " " + e.msg, "Error");
        }
    });
}


$('.btn-number').click(function (e) {
    e.preventDefault();
    var ID = this.id.split("_")[1];
    fieldName = $(this).attr('data-field');
    type = $(this).attr('data-type');
    var input = $("#" + fieldName + "_" + ID);
    var currentVal = parseInt(input.val());
    if (!isNaN(currentVal)) {
        if (type == 'minus' && this.id == 'btnMinus_' + ID) {

            if (currentVal > input.attr('min')) {
                input.val(currentVal - 1).change();
            }
            if (parseInt(input.val()) == input.attr('min')) {
                $(this).attr('disabled', true);
            }

        } else if (type == 'plus' && this.id == 'btnPlus_' + ID) {

            if (currentVal < input.attr('max')) {
                input.val(currentVal + 1).change();
            }
            if (parseInt(input.val()) == input.attr('max')) {
                $(this).attr('disabled', true);
            }

        }
    } else {
        input.val(0);
    }
});
$('.input-number').focusin(function () {
    $(this).data('oldValue', $(this).val());
});
$('.input-number').change(function () {
    var ID = this.id.split("_")[1];
    minValue = parseInt($(this).attr('min'));
    maxValue = parseInt($(this).attr('max'));
    valueCurrent = parseInt($(this).val());

    name = $(this).attr('name');
    if (valueCurrent >= minValue) {
        $("#btnMinus_"+ID).removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    if (valueCurrent <= maxValue) {
        $("#btnPlus_"+ID).removeAttr('disabled')
    } else {
        alert('Sorry, the maximum value was reached');
        $(this).val($(this).data('oldValue'));
    }


});
$(".input-number").keydown(function (e) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
        // Allow: Ctrl+A
        (e.keyCode == 65 && e.ctrlKey === true) ||
        // Allow: home, end, left, right
        (e.keyCode >= 35 && e.keyCode <= 39)) {
        // let it happen, don't do anything
        return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
});