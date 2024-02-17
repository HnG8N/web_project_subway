var pop = {
	
	init : function(){
		// 선택할 수 있는 재료가 없으면, 바로 다음 스텝으로 이동.
		if ($('[name=emptySauce]').val() == 'Y') {
			pop.goNext();
		} else {
			$('#popup_wrap').show();
		}

		// 다음스텝으로 이동
		$('#ordPrgsNextBtn').on("click", pop.goNext);
		// 옵션변경시
		$('#returnItemView').on("click", pop.changeOption);
		// 소스변경
		$('[name=sauce]').on("click", pop.changeSauce);

		parent.$(".popup_iframe_wrapper").css({height: 670});
	},
	
	// 소스 변경
	changeSauce : function(e) {
		
		// 소스 선택안함시 전체 선택해제
		var eventTarget = $(e.target);
		if(eventTarget.data("ingredientscode") == "S9999") {
			var toggle = eventTarget.is(":checked");
			$("[name=sauce]").prop("checked", false);
			eventTarget.prop("checked", toggle);
		} else {
			$("[data-ingredientscode=S9999]").prop("checked", false);
		}
		
		var selectTarget = $("[name=sauce]:checked");
		var itemArr = [];
		
		// 소스 선택갯수 벨리데이션
		if(selectTarget.length > 3) {
			alert("소스/시즈닝은 3개까지 선택가능합니다.");
			eventTarget.prop("checked", false);
			return;
		}
		
		selectTarget.each(function() {
			var item = $(this);
			itemArr.push(item.data("ingredientsname"));
		});

		// 선택 토핑
		$('#sauceNavi').text(itemArr.length > 0 ? itemArr.join(",") : "소스/시즈닝을 선택하여 주세요.");
	}, 
		
	// 옵션 변경
	changeOption : function() {
		pop.setInfo(null, null);
	},
	
	// 다음스텝
	goNext : function() {
		pop.setInfo("/order/progress/choice/extra", 640);
	},
	
	// 아이템 정보 세팅
	setInfo : function(url, width) {
		var obj = {};
		var toppings = $("[name=sauce]");
		var arrayName = "sauceList";
		var fieldName = ["ingredientsName", "ingredientsCode"];

		var isEmptySauce = $('[name=emptySauce]').val() == 'Y';

		// 소스 선택안함 여부
		var flag = $("[name=vegetable][data-ingredientscode=S9999]").is(":checked");

		// 벨리데이션
		if (!isEmptySauce) {
			var selectLength = $("[name=sauce]:checked").length;
			if(selectLength < 1) {alert("소스/시즈닝을 선택하여 주세요."); return false;}
			if(selectLength > 3) {alert("소스/시즈닝은 3개까지 선택가능합니다.."); return false;}

			// list 매핑
			toppings.each(function(i, item) {
				var each = $(item);
				fieldName.forEach(function(name, j) {
					if(flag) {
						obj[arrayName + "[" + i +"]."+name] 	= (each.data("ingredientscode") == "S9999") ? each.data(name.toLowerCase()) : null;
					} else {
						obj[arrayName + "[" + i +"]."+name] 	= (each.is(":checked")) ? each.data(name.toLowerCase()) : null;
					}
				});
			});
		}

		window.parent.data.addItemInfo(obj, url, width);
	}
}

$(document).ready(function() {
	pop.init();
})