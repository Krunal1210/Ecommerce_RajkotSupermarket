 
function bindCheckbox() {
    $(".check_all").bind("change", function () {
        if ($(this).is(':checked')) {
            $(".chkCld").attr("checked", "checked");
            setCheckboxVal();
        }
        else {
            $(".chkCld").removeAttr("checked");
            $("[id$='ListView1_hdnChk']").val('');
        }
    });

    $(".chkCld").bind("change", function () {
        setCheckboxVal();
    });
}

function setCheckboxVal() {
    $("#ctl00_ContentPlaceHolder1_ListView1_hdnChk").val('');

    if ($(".chkCld:checked").length > 0) {
        $(".chkCld:checked").each(function () {
            $("[id$='ListView1_hdnChk']").val($("[id$='ListView1_hdnChk']").val() + "," + $(this).attr("id"));
        });
    }

    if ($(".chkCld:checked").length == $(".chkCld").length) {
        $(".check_all").attr("checked", "checked");
    }
    else {
        $(".check_all").removeAttr("checked");
    }

}

