var pop = {
	
	init : function(){
		
		// 다음스텝으로 이동
		$('#ordPrgsNextBtn').on("click", pop.goNext);
		// 옵션변경시
		$('#returnItemView').on("click", pop.changeOption);
		// 빵변경
		$('[name=bread]').on("click", pop.changeBread);
		parent.$(".popup_iframe_wrapper").css({height: 432});
	},
	
	// 빵 선택 이벤트
	changeBread : function () {
			$('#breadNavi').text($(this).data('ingredientsname'));
	},
	
	// 옵션 변경
	changeOption : function() {
		pop.setInfo(null, null);
	},

	// 다음스텝
	goNext : function() {
        if ($(this).data('pizzasubyn') == 'Y' ) {
            pop.setInfo("/order/progress/choice/set", 520);
        }else{
            pop.setInfo("/order/progress/choice/cheese", 640);
        }
    },
	
	// 아이템 정보 세팅
	setInfo : function(url, width) {
		var target = $("[name=warmingChk]:checked");
		var obj = {};		
		// 데우기
		obj["warming.ingredientsName"] = target.data("ingredientsname");
		obj["warming.ingredientsCode"] = target.data("ingredientscode");
		
		window.parent.data.addItemInfo(obj, url, width);
		
	}
}

$(document).ready(function() {
	pop.init();
})