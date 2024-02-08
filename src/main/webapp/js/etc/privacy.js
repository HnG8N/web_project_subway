var privacy ={

    //개인정보처리방침 조회
    view :function (param) {
        var data = {"privacyIdx" : param};
        $.ajax({
            type: "POST",
            url: "/privacyInfo",
            data: data,
            cache: false,
            success: function (result) {
                $("#policyContent").html(result);
            }
        });
    }
}

$(document).ready(function () {
    $('#category').on('change',function () {
        if($(this).val() != ''){
            privacy.view($(this).val());
        }
    });
});