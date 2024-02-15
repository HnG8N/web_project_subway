var pop = {

	init : function(){
		// 선택할 수 있는 재료가 없으면, 바로 다음 스텝으로 이동.
		if ($('[name=emptyCheese]').val() == 'Y') {
			pop.goNext();
		} else {
			$('body').show();
		}

		// 다음스텝으로 이동
		$('#ordPrgsNextBtn').on("click", pop.goNext);
		// 옵션변경시
		$('#returnItemView').on("click", pop.changeOption);
		// 치즈변경 이벤트
		$("[name=cheese]").on("change", pop.changeCheese);

		$("[name=doubleCheese]").on("change", function(e){
			e.preventDefault();

			if($("[name=doubleCheese]:checked").length>1){
				alert('치즈 추가는 1개만 가능합니다.');
				$(this).prop("checked", false);
				return false;
			}

			pop.changeCheese();
		});

		parent.$(".popup_iframe_wrapper").css({height: 670});
	},

	// 치즈 선택 이벤트
	changeCheese : function () {
		var target = $(this);

		// 치즈제외가 눌려있을때 더블치즈 선택 불가
		if("C9999" == $("[name=cheese]:checked").data("ingredientscode")) {
			$("[name=doubleCheese]").prop("checked", false);
		}

		// 치즈제외 눌렀을떄
		if("C9999" == target.data("ingredientscode")) {
			var flag = target.is(":checked");
			$("[name=cheese],[name=doubleCheese]").prop("checked", false);
			target.prop("checked", flag);
		}

		// 더블치즈 관련 display
		var doubleTarget = $("[name=doubleCheese]:checked");
		var toggle = doubleTarget.length > 0
		$("#doubleCheeseName").text(doubleTarget.data("ingredientsname"));
		$("#plusCharge").toggle(toggle);

		// 네비 변경
		$('#cheeseNavi').text($("[name=cheese]:checked").data('ingredientsname'));
	},

	// 옵션 변경
	changeOption : function() {
		pop.setInfo(null, null);
	},

	// 다음스텝
	goNext : function() {
		var gubun = "vegetable";
		var width = 670;

		if ("Y" == $('[name=morningYn]').val()) {
            gubun = "sauce";
        } else if ("Y" == $('[name=flatPizzaYn]').val() || 'Y' == $('[name=subDogYn]').val()) {		// 20.09.23 플랫피자 & 21.09.06 썹도그 출시
            gubun = "set";
            width = 520;
        }

		pop.setInfo("/order/progress/choice/"+gubun, width);
	},

	// 아이템 정보 세팅
	setInfo : function(url, width) {
		var target = $("[name=cheese]:checked");
		var obj = {};

		var isFlatPizza = $("[name=flatPizzaYn]").val() == 'Y';
		var isEmptyIngredients = $('[name=emptyCheese]').val() == 'Y';

		if (!isFlatPizza && !isEmptyIngredients && target.length < 1) {
			alert("치즈를 선택 해 주세요.");
			return false;
		}

		// 치즈
		if (!isEmptyIngredients) {
			if (isFlatPizza) {
				obj["cheese.ingredientsName"] = $("input[name=ingredientsName]").val();
				obj["cheese.ingredientsCode"] = $("input[name=ingredientsCode]").val();
			} else {
				obj["cheese.ingredientsName"] = target.data("ingredientsname");
				obj["cheese.ingredientsCode"] = target.data("ingredientscode");
			}

			// 치즈 더블업
			var flag = "C9999" != target.data("ingredientscode");
			var doubleTarget = $("[name=doubleCheese]:checked");
			obj["doubleCheese.ingredientsName"] = (flag && doubleTarget.length > 0) ? doubleTarget.data("ingredientsname") : null;
			obj["doubleCheese.ingredientsCode"] = (flag && doubleTarget.length > 0) ? doubleTarget.data("ingredientscode") : null;
			obj["doubleCheeseAmt"] = (flag && doubleTarget.length > 0) ? window.parent.subwayCommon.stringCurrencyFormatToNumber($("[name=cheesePrice]").val()) : 0;
		}

		window.parent.data.addItemInfo(obj, url, width);
	}
}

$(document).ready(function() {
	pop.init();
})