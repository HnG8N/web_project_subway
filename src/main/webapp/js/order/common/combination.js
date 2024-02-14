var combination  = {

	event: function() {

		parent.$(".popup_iframe_wrapper").css({height: 740}).addClass('no_wrapper');

		// 꿀조합 적용
		$("#applyItemCombination").on("click", function() {
			var target = $(this);
			var ordForm = $(top.document).find("[name=orderForm]");
			ordForm.find("[name=itemCombinationIdx]").remove();
			ordForm.find("[name=breadType]").remove();
			ordForm.append('<input type="hidden" name="itemCombinationIdx" value="'+ target.data("combination-idx") +'">');

			var evntDisplayType = target.data("evnt-display-type");
			ordForm.append('<input type="hidden" name="evntDisplayType" value="' + (evntDisplayType == undefined ? '' : evntDisplayType) + '">');

			if($("[name=bread]:checked").length > 0) {
				ordForm.append('<input type="hidden" name="breadType" value="'+ $("[name=bread]:checked").val() +'">');
				ordForm.append('<input type="hidden" name="itemCode" value="'+ $('[name=bread]:checked').data('item-code') +'">');
			}

			$.ajax({
		        type: "POST",
		        url: "/order/progress/combination/validation",
		        data: ordForm.serialize(),
		        async: false,
		        success: function (result) {
		        	if(result) {
		    			ordForm.attr('action', '/order/progress/combination/apply');
		    			ordForm.attr('method', 'POST')
		    			ordForm.submit();
		        	}
		        },
		        error: function (xhr, ajaxOptions, thrownError) {
					ordForm.find("[name=itemCombinationIdx]").remove();
					ordForm.find("[name=breadType]").remove();

		        	subwayCommon.errorAjaxProcess(xhr);;
		        }
		    });
		});

		//꿀조합 삭제
		$("#removeItemCombination").on("click", function() {
            if(confirm("적용한 꿀조합을 삭제하시겠습니까?")) {
                var ordForm = $(top.document).find("[name=orderForm]");
                ordForm.attr('action', '/order/progress/combination/remove');
                ordForm.attr('method', 'POST')
                ordForm.submit();
            }
		});

		$("#removeItemCombinationSubpick").on("click", function() {
            if(confirm("적용한 썹픽조합을 삭제하시겠습니까?")) {
                var ordForm = $(top.document).find("[name=orderForm]");
                ordForm.attr('action', '/order/progress/combination/remove');
                ordForm.attr('method', 'POST')
                ordForm.submit();
            }
        });

		// 확인 버튼 클릭
		$("#confirmItemCombination").on("click", function() {
			$(top.document).find('.btn_close').trigger('click');
		});
	}
}


$(document).ready(function() {

	combination.event();

});