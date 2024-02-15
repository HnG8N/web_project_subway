var pop = {

	init : function(){
		// 다음 스텝
		$('#ordPrgsNextBtn').on("click", pop.goNext);
		// 옵션 변경시 완료버튼
		$('#returnItemView').on("click", pop.changeOption);
		// 옵션 추가선택
		$("[name=topping]").on("click", pop.addTopping);

		parent.$(".popup_iframe_wrapper").css({height: 670});

		// #210903 기존 선택한 옵션 가격 미표시 현상 수정
		pop.bindToppingAmount();
	},

	// 토핑추가 이벤트
	addTopping : function() {
		var selectedOpt = $(this);
		if (selectedOpt.data('fixedoptionyn') == 'Y') {
			selectedOpt.prop("checked", true);
			alert(selectedOpt.data("itemshortname") + "은(는) 고정입니다.");
			return;
		}

		var selectTarget = $("[name=topping]:checked");
		var amt = 0;
		var itemArr = [];
		var itemCodeArr = [];

		selectTarget.each(function () {
			var item = $(this);
			amt += window.parent.subwayCommon.stringCurrencyFormatToNumber(item.data("sale"));
			itemArr.push(item.data("itemshortname"));
			itemCodeArr.push(item.data("itemcode"));
		});

		// #201102 터키15(EDA) 프로모션 상품은 베이컨&아보카도 동시 주문 불가능!
		// #201105 샌드위치, 샐러드 일반 터키 상품도 동일 적용
		if (ordType == 'ORD_TYPE.FAST_SUB') {
			if (itemCode == '00521' || itemCode == '00008') {	// 터키15
				if (itemCodeArr.contains('00103') && itemCodeArr.contains('00104')) {
					alert("선택하신 메뉴는 베이컨과 아보카도를 동시에 선택 하실 수 없습니다.");

					selectTarget.each(function () {
						if ($(this).data("itemcode") == '00103' || $(this).data("itemcode") == '00104') {
							$(this).prop("checked", false);
							amt -= window.parent.subwayCommon.stringCurrencyFormatToNumber($(this).data("sale"));
							itemArr.splice(itemArr.indexOf($(this).data("itemshortname")), 1);
						}
					});
				}
			} else if (itemCode == '00031') {	// 터키30
				if (itemCodeArr.contains('00132') && itemCodeArr.contains('00133')) {
					alert("선택하신 메뉴는 베이컨과 아보카도를 동시에 선택 하실 수 없습니다.");

					selectTarget.each(function () {
						if ($(this).data("itemcode") == '00132' || $(this).data("itemcode") == '00133') {
							$(this).prop("checked", false);
							amt -= window.parent.subwayCommon.stringCurrencyFormatToNumber($(this).data("sale"));
							itemArr.splice(itemArr.indexOf($(this).data("itemshortname")), 1);
						}
					});
				}
			} else if (itemCode == '00058') {	// 샐러드
				if (itemCodeArr.contains('00104') && itemCodeArr.contains('00887')) {	// 샐러드
					alert("선택하신 메뉴는 베이컨비츠와 아보카도를 동시에 선택 하실 수 없습니다.");

					selectTarget.each(function () {
						if ($(this).data("itemcode") == '00104' || $(this).data("itemcode") == '00887') {
							$(this).prop("checked", false);
							amt -= window.parent.subwayCommon.stringCurrencyFormatToNumber($(this).data("sale"));
							itemArr.splice(itemArr.indexOf($(this).data("itemshortname")), 1);
						}
					});
				}
			}
		} else if (ordType == 'ORD_TYPE.HOME_SUB') {
			if (itemCode == '00587') {		// D터키15
				if (itemCodeArr.contains('00702') && itemCodeArr.contains('00703')) {
					alert("선택하신 메뉴는 베이컨과 아보카도를 동시에 선택 하실 수 없습니다.");

					selectTarget.each(function () {
						if ($(this).data("itemcode") == '00702' || $(this).data("itemcode") == '00703') {
							$(this).prop("checked", false);
							amt -= window.parent.subwayCommon.stringCurrencyFormatToNumber($(this).data("sale"));
							itemArr.splice(itemArr.indexOf($(this).data("itemshortname")), 1);
						}
					});
				}
			} else if (itemCode == '00607') {	// D터키30
				if (itemCodeArr.contains('00709') && itemCodeArr.contains('00710')) {
					alert("선택하신 메뉴는 베이컨과 아보카도를 동시에 선택 하실 수 없습니다.");

					selectTarget.each(function () {
						if ($(this).data("itemcode") == '00709' || $(this).data("itemcode") == '00710') {
							$(this).prop("checked", false);
							amt -= window.parent.subwayCommon.stringCurrencyFormatToNumber($(this).data("sale"));
							itemArr.splice(itemArr.indexOf($(this).data("itemshortname")), 1);
						}
					});
				}
			} else if (itemCode == '00627') {	// 샐러드
				if (itemCodeArr.contains('00703') && itemCodeArr.contains('01086')) {	// 샐러드
					alert("선택하신 메뉴는 베이컨비츠와 아보카도를 동시에 선택 하실 수 없습니다.");

					selectTarget.each(function () {
						if ($(this).data("itemcode") == '00703' || $(this).data("itemcode") == '01086') {
							$(this).prop("checked", false);
							amt -= window.parent.subwayCommon.stringCurrencyFormatToNumber($(this).data("sale"));
							itemArr.splice(itemArr.indexOf($(this).data("itemshortname")), 1);
						}
					});
				}
			}
		}

		// 선택 토핑
		$('#toppingNavi').text(itemArr.length > 0 ? itemArr.join(",") : "원하는 추가 선택 제품을 선택하여 주세요");
		// 추가금액
		$('#toppingAmtNavi').text(window.parent.subwayCommon.numberToCurrencyFormat(amt));
	},

	// 옵션 변경
	changeOption : function() {
		pop.setInfo(null, null);
	},

	// 다음스텝
	goNext : function() {
		var gubun = ("Y" == $(this).data("morningyn") || "Y" == $(this).data("ultracheeseyn")) ? "set" : "double";
		pop.setInfo("/order/progress/choice/"+gubun, 520);
	},

	// 아이템 정보 세팅
	setInfo : function(url, width) {
		var obj = {};
		var toppings = $("[name=topping]");
		var arrayName = "toppingList";
		var fieldName = ["baseItemIdx", "itemShortName", "itemCode", "sale"];

		// list 매핑
		var totalAmt = 0;
		toppings.each(function(i, item) {
			var each = $(item);

			fieldName.forEach(function (name, j) {
				obj[arrayName + "[" + i + "]." + name] = (each.is(":checked")) ? each.data(name.toLowerCase()) : null;

				// 옵션 총금액 세팅
				if ("sale" == name && (each.is(":checked"))) {
					totalAmt += window.parent.subwayCommon.stringCurrencyFormatToNumber(each.data(name.toLowerCase()));
				}
			});
		});
		obj["totalToppingAmt"] = totalAmt;

		window.parent.data.addItemInfo(obj, url, width);
	},

	bindToppingAmount: function () {
		if (toppingList != null && toppingList.length > 0) {
			var amt = 0;

			$.each(toppingList, function () {
				var item = $(this).get(0);
				amt += Number(item.sale);
			});
			$('#toppingAmtNavi').text(window.parent.subwayCommon.numberToCurrencyFormat(amt));
		} else {
			$('#toppingNavi').text("원하는 추가 선택 제품을 선택하여 주세요");
		}

	}
}

// contains 메소드 추가
Array.prototype.contains = function(element) {
	for (var i=0; i<this.length; i++) {
		if (this[i] == element) {
			return true;
		}
	}
	return false;
}

$(document).ready(function() {
	pop.init();
})