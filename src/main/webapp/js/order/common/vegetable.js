var pop = {
		
	init : function() {
		// 선택할 수 있는 재료가 없으면, 바로 다음 스텝으로 이동.
		if ($('[name=emptyVegetables]').val() == 'Y' && $('[name=emptyPickles]').val() == 'Y') {
			pop.goNext();
		} else {
			$('#popup_wrap').show();
		}

		// 다음스텝으로 이동
		$('#ordPrgsNextBtn').on("click", pop.goNext);
		// 옵션변경시
		$('#returnItemView').on("click", pop.changeOption);
		// 야채변경
		$('[name=vegetable]').on("click", pop.changeVegetable);
		// 	최근야채 불러오기
		$("#orderVegeBtn").on("click", pop.loadOrderVegetable);
		// 네비게이션 표시
		pop.getNavi($("[name=vegetable]:checked"));

		parent.$(".popup_iframe_wrapper").css({height: 723});
	},
	
	// 네비게이션
	getNavi : function(target) {
		var itemArr = [];
		
		target.each(function() {
			var item = $(this);
			itemArr.push(item.data("ingredientsname"));
		});

		// 선택 토핑
		$('#vegeNavi').text(itemArr.length > 0 ? itemArr.join(",") : "원하는 야채를 선택하여 주세요.");
	},
	
	// 야채변경
	changeVegetable : function(e) {
		
		// 야채 선택안함시 전체 선택해제
		var eventTarget = $(e.target);
		if(eventTarget.data("ingredientscode") == "V9999") {
			var toggle = eventTarget.is(":checked");
			$("[name=vegetable]").prop("checked", false);
			eventTarget.prop("checked", toggle);
		} else {
			$("[name=vegetable][data-ingredientscode=V9999]").prop("checked", false);
		}
		
		pop.getNavi($("[name=vegetable]:checked"));
	}, 
		
	// 옵션 변경
	changeOption : function() {
		pop.setInfo(null, null);
	},
	
	// 다음스텝
	goNext : function() {
		pop.setInfo("/order/progress/choice/sauce", 640);
	},
	
	// 최근야채 불러오기
	loadOrderVegetable : function() {
		if($(this).is(":checked")) {
			window.parent.$.post("/order/progress/getOrderVegetable", "POST", null, function() {
				location.reload();
			}, function(){
				$("#orderVegeBtn").prop('checked', false);
			});
		}
	},
	
	// 아이템 정보 세팅
	setInfo : function(url, width) {
		var obj = {};
		var toppings = $("[name=vegetable]");
		var arrayName = "vegetableList";
		var fieldName = ["ingredientsName", "ingredientsCode"];

		var isEmptyVegetables = $('[name=emptyVegetables]').val() == 'Y';
		var isEmptyPickles = $('[name=emptyPickles]').val() == 'Y';

		// 야채 선택안함 여부
		var flag = $("[name=vegetable][data-ingredientscode=V9999]").is(":checked");

		if (!isEmptyVegetables || !isEmptyPickles) {
			if ($("[name=vegetable]:checked").length < 1) {
				alert("원하는 야채를 선택하여 주세요.");
				return false;
			}

			// list 매핑
			toppings.each(function (i, item) {
				var each = $(item);
				fieldName.forEach(function (name, j) {
					if (flag) {
						obj[arrayName + "[" + i + "]." + name] = (each.data("ingredientscode") == "V9999") ? each.data(name.toLowerCase()) : null;
					} else {
						obj[arrayName + "[" + i + "]." + name] = (each.is(":checked")) ? each.data(name.toLowerCase()) : null;
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