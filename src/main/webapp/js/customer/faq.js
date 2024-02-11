var view = {

    //FAQ 검색
    search: function () {
        $("input[name=page]").val("1");
        $("#searchForm")[0].submit();
    },

    view: function () {
        var query = $("#searchForm").serialize();
        location.href = "/faq?&query=" + encodeURIComponent(query);
    }
}

$(document).ready(function () {
    //  Category 목록
    {
        var uri = "/faq?category=0&pageNo=1#ui_faq_items";
        var html = "<ul>";
        if (currentCategory == 0)
            html += "<li class='active'><a href='" + uri + "'>All</a></li>";
        else
            html += "<li><a href='" + uri + "'>All</a></li>";

        $.each(faqCategory, function (idx, data) {

            if (data.code == 1107 || data.useFg != "Y")
                return true;	//  continue

            var uri = "/faq?category=" + data.code + "&pageNo=1#ui_faq_items";
            if (data.code == currentCategory)
                html += "<li class='active'><a href='" + uri + "'>" + data.codeNm + "</a></li>";
            else
                html += "<li><a href='" + uri + "'>" + data.codeNm + "</a></li>";
        });
        html += "</ul>";
        $("#ui_category").html(html);
    }


    //  FAQ 목록
    {
        var html = "";
        if (faqList.length == 0)
            html += "";

        $.each(faqList, function (idx, data) {
            html += "<li>";
            html += "	<div class='fre'><div class='q'>Q</div><strong>" + data.subject + "</strong></div>";
            html += "	<div class='ask'>";
            html += "		<div class='a'>A</div>";
            html += "		<div class='ask_text'>";
            html += data.content;
            html += "		</div>";
            html += "	</div>";
            html += "</li>";
        });
        $("#ui_faq_items").html(html);
    }


    //  Pager
    {
        var curPageNo = pagination.requestData.pageNo;

        var prevUri = "/faq?category=" + currentCategory + "&subject=" + $("input:text[name=subject]").val() + "&pageNo=" + (curPageNo - 1) + "#ui_faq_items";
        var html = "<a href='" + prevUri + "' class='arr prev'></a>";
        for (var i = pagination.responseData.displayStartPageNo; i <= pagination.responseData.displayEndPageNo; ++i) {

            var uri = "/faq?category=" + currentCategory + "&subject=" + $("input:text[name=subject]").val() + "&pageNo=" + i + "#ui_faq_items";
            if (i == curPageNo)
                html += "<a href='" + uri + "' class='active'>" + i + "</a>";
            else
                html += "<a href='" + uri + "'>" + i + "</a>";
        }
        var nextUri = "/faq?category=" + currentCategory + "&subject=" + $("input:text[name=subject]").val() + "&pageNo=" + (curPageNo + 1) + "#ui_faq_items";
        html += "<a href='" + nextUri + "' class='arr next'></a>";

        $("#ui_pager").html(html);

        if (pagination.responseData.totalItemCount == 0) {
            $('#ui_pager').hide();
        } else {
            $('#ui_pager').show();
        }

        //FAQ total count
        $("#totalCnt").text(pagination.responseData.totalItemCount);
    }

    faq();	// 퍼블리싱 코드
});
