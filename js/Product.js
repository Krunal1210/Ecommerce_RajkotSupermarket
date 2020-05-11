

$(document).ready(function () {

    bindAddTocart();


    

});


function bindAddTocart() {

    $(".addQut").bind("click", function () {

        $curDiv = $(this);

        $.ajax({
            type: "POST",
            url: "../webHandler/ShoppingCartProcess.aspx?func=Addcart&item=" + $(this).attr("bookid") + "&qty=" + $(".qut .clsQty").val(),
            contentType: "application/json; charset=utf-8",
           // dataType: "json",
            success: function (msg) {

                var obj = jQuery.parseJSON(msg);

                var p1 = $curDiv.offset();
                var xi = p1.top;
                var yi = p1.left;
                $(".show_dis").removeClass("hide");
                $(".show_dis").show();
                $(".show_dis").css('left', yi - ($(".show_dis").width() / 2) + 20 + "px");
                $(".show_dis").css('top', xi + 25 + "px");


                setTimeout(function (d) {
                    $(".show_dis").addClass("hide");
                }, 3000);

                $(".show_dis .clsMsgPopup").html("You have " + obj.totalItem.toString() + " items in your basket<br /><br/ > <strong>Total cost: Rs. " + obj.totalprice.toString() + "</strong>");


                $(".yourItems").find("[type='ShopCartItems']").html(" " + obj.totalItem.toString() + " Item(s)");


                //var p1 = $curDiv.offset();
                //var xi = p1.top;
                //var yi = p1.left;
                //$(".jquery-notify-bar").removeClass("hide");
                //$(".jquery-notify-bar").show();
               

                //setTimeout(function (d) {
                //    $(".jquery-notify-bar").addClass("hide");
                //}, 3000);

            



                //$("#dvNotify .notify-bar-text-wrapper").html("Successfully Added " + obj.ItemName.toString() + " to your basket.");

             
                
            },
            error: function (xmlHttpRequest, textStatus, errorThrown) {

                if (xmlHttpRequest.readyState == 0 || xmlHttpRequest.status == 0)
                { return; } // it's not really an error
                else {
                    alert("ERROR: " + errorThrown);
                }
            }

        });


    });


}