var pop = {
	init : function(){
		pop.toggleSet();
		pop.getSetListAjax($('#setOptionSelectBox').val(), true);

		// 다음 스텝
		$('#ordPrgsNextBtn').on("click", pop.goNext);
		// 옵션 변경시 완료버튼
		$('#returnItemView').on("click", pop.changeOption);
		// 세트 종류 변경
		$("#setOptionSelectBox").on("change", pop.changeSetOption);
		// 세트상품 변경
		$(document).on("click", "[name=set], [name=drink]", pop.changeSetItem);
		// 세트여부 변경
		$("[name=setup]").on("click", pop.toggleSet);

		parent.$(".popup_iframe_wrapper").css({height: 877});

		// 유효한 세트 상품이 있을 경우에만 세트 선택 가능 #201009
		$('#set').on("click", function() {
			if (availableSetYn != null && availableSetYn == "N") {
				alert("현재 이 상품은 세트로 구매할 수 없습니다.");
				return false;
			}
			return;
		});
	},

	// 세트여부 변경시에따라 보기변경
	toggleSet : function() {
		var toggle = "one" == $("[name=setup]:checked").val();
		if(toggle) {
			$(".scroll_wrap input[type=radio]").prop("checked", !toggle);
			$('#setOptionNavi').text("구성품을 선택해주세요.");
			$('#setOptionAmt').text(0);
		}
	},

	// 세트 구성상품 수정 진입시 초기 선택사항 세팅
	setBeforeSetOption : function() {

		var setTarget = $("[name=beforeSet]");
		setTarget.each(function() {
			var value = $(this).val();
			$("input[data-itemCode="+value+"]").prop("checked", true);
		});
	},

	// 세트 종류 변경이벤트
	changeSetOption : function(e) {
		var setType = $(e.target).val();
		var selectTarget = $('#setOptionSelectBox').find("option:selected");
		var targetText = selectTarget.text();

		var setName = $('#setName');
		var menuName = $('#menuName');

		setName.text(targetText + ' 선택');
		menuName.text(targetText.split(" ").shift());
		$('#setOptionNavi').text("구성품을 선택해주세요.");
		$("[name=set]:checked, [name=drink]:checked").prop("checked", false);
		// 금액, 구성품 바인딩
		pop.changeSetItem();

		// 세트 구성품 리스트 바인딩
		pop.getSetListAjax(setType, false);
	},

	// 선택된 세트구성 노출
	changeSetItem : function() {
		$("[name=setup][value=set]").prop("checked", true);
		var nameArr = [];
		var totalPrice = 0;

		$('#setOptionNavi').text(nameArr.length > 0 ? nameArr.join(", ") : "구성품을 선택해주세요.");

		if(typeof $("[name=set]:checked").val() != 'undefined' && typeof $("[name=drink]:checked").val() != 'undefined' ) {

			nameArr.push($("[name=set]:checked").data("itemshortname"));
			nameArr.push($("[name=drink]:checked").data("itemshortname"));

			var data = {
					subItemCode1 : $("[name=set]:checked").data('itemcode'),
					subItemCode2 : $("[name=drink]:checked").data('itemcode')
			}
			pop.changeSetPrice(data,nameArr)

		}
	},

	changeSetPrice : function(obj,nameArr) {
		window.parent.$.post("/order/progress/setItemPrice", "POST", JSON.stringify(obj), function(data) {
			$('#setOptionNavi').text(data.price > 0 ? nameArr.join(", ") : "구성품을 선택해주세요.");

			if(data.price == null) {
				data.price = 0;
				$("[name=set]").prop("checked", false);
				$("[name=drink]").prop("checked", false);
				alert('구성 가능한 세트상품이 아닙니다.');
			}
			$('#setOptionAmt').text(window.parent.subwayCommon.numberToCurrencyFormat(data.price));

		});
	},

	// 옵션 변경
	changeOption : function() {
		pop.setInfo(null, null);
	},

	// 다음스텝
	goNext : function() {
		var ItemGubun = $(this).data("itemgubun");
		pop.setInfo(null, null);
	},

	// 아이템 정보 세팅
	setInfo : function(url, width) {
		var obj = {};
		var setItem = $("[name=set]:checked, [name=drink]:checked");
		var arrayName = "setOptionList";
		var fieldName = ["baseItemIdx", "itemShortName", "itemCode", "sale"];

		// 세트여부
		var flag = "set" == $("[name=setup]:checked").val();

		if(flag && $("[name=availableSetYn]").val() == 'N') {
			alert("현재 이 상품은 세트로 구매할 수 없습니다.");
			return false;
		}

		if(flag) {
			// 세트일경우 음료와 구성상품을 골라야함
			if($("[name=set]:checked").length < 1) {alert("구성품을 선택해주세요."); return false;}
			if($("[name=drink]:checked").length < 1) {alert("음료를 선택해주세요."); return false;}
		}

		// list 매핑
		var totalAmt = 0;
		for (var i = 0; i < 2; i++) {
			var each = setItem.eq(i);
			var index = flag ? "set" == each.attr("name") ? 0 : 1 : i;

			fieldName.forEach(function(name, j) {
				obj[arrayName + "[" + index +"]."+name] 	= flag ? each.data(name.toLowerCase()) : null;

				// 옵션 총금액 세팅
				if("sale" == name && flag) {totalAmt += window.parent.subwayCommon.stringCurrencyFormatToNumber(each.data(name.toLowerCase()));}
			});
		}
		obj["totalSetOptionAmt"] = totalAmt;
		obj["setOptionType"] = $('#setOptionSelectBox').val();
		if(flag) {
            obj['cupIncldYn'] = $("[name=drink]:checked").data("cupincldyn");
            obj['cupItemCd'] = $("[name=drink]:checked").data("cupitemcd");
        } else {
            obj['cupIncldYn'] = "N";
            obj['cupItemCd'] = "";
        }
		window.parent.data.addItemInfo(obj, url, width);
	},

	// 세트상품을 가져온다.
	getSetListAjax : function (setType, selectBefore) {
		var param = {
				itemDiv1 : 'ITEM_ETC'
			  , itemDiv2 : setType
		};

		window.parent.$.post("/order/progress/choice/set/list", "POST", JSON.stringify(param), function(data) {
			// 헬퍼 등록
			window.parent.$.views.helpers({
				  format : function(num) {
					  return window.parent.subwayCommon.numberToCurrencyFormat(num * 1);
				  }
			});

			// 세트 상품리스트
			var template = window.parent.$.templates($('#setList-tmpl').html());
			$('#setListMst').html(template.render({"list" : data.setList, "setGubun" : 1, "name" : "set"}));
			$('#drinkListMst').html(template.render({"list" : data.drinkList, "setGubun" : 2, "name" : "drink"}));

			// 세트상품 유효하지 않을 경우 세트 구매 막음 #201009
			$('[name=availableSetYn]').val(data.availableSetYn);
			if (data.availableSetYn == 'N') {
				$("#one").prop("checked", true);
			}

			if(selectBefore) {pop.setBeforeSetOption();}
		}, null);
	}
}

$(document).ready(function() {
	pop.init();
})