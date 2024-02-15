var pop = {
	
	init : function(){
		
		// 다음스텝으로 이동
		$('#ordPrgsNextBtn').on("click", pop.goNext);
		// 옵션변경시
		$('#returnItemView').on("click", pop.changeOption);
		// 빵변경
		$('[name=bread]').on("click", pop.changeBread);

		parent.$(".popup_iframe_wrapper").css({height: 794});
	},
	
	// 빵 선택 이벤트
	changeBread : function () {
			$('#breadNavi').text($(this).data('ingredientsname'));
	},
	
	// 옵션 변경
	changeOption : function() {
		//pop.setInfo(null, null);
		pop.setInfo("/order/progress/choice/warm", 640);
	},
	
	// 다음스텝
	goNext : function() {
		pop.setInfo("/order/progress/choice/warm", 640);
	},
	
	// 아이템 정보 세팅
	setInfo : function(url, width) {
		var target = $("[name=bread]:checked");
		var warmingTarget = $("[name=warmingChk]").is(":checked") ? $("[value=H0001]") : $("[value=H0002]");
		var obj = {};
		
		if(target.length < 1) {alert("빵을 선택 해 주세요."); return false;}
		
		// 빵
		obj["bread.ingredientsName"] = target.data("ingredientsname");
		obj["bread.ingredientsCode"] = target.data("ingredientscode");
		
		// 데우기
		obj["warming.ingredientsName"] = warmingTarget.data("ingredientsname");
		obj["warming.ingredientsCode"] = warmingTarget.data("ingredientscode");
		
		window.parent.data.addItemInfo(obj, url, width);
	}
}

$(document).ready(function() {
	pop.init();
})