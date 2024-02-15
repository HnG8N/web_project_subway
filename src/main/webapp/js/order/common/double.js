var pop = {
		
	init : function(){
		// 다음스텝으로 이동
		$('#ordPrgsNextBtn').on("click", pop.goNext);
		// 옵션변경시
		$('#returnItemView').on("click", pop.changeOption);
		// 더블업 변경
		$('[name=double], [name=doubleUpYn]').on("click", pop.changeDoubleUp);

		parent.$(".popup_iframe_wrapper").css({height: ($("[name=doubleUpYn]").length > 1)? 827 : 407});
	},
	
	// 더블업 변경
	changeDoubleUp : function(e) {
		var eventTarget = $(e.target);
		
		// 더블업 안함
		if("doubleUpYn" == eventTarget.attr("name")) {
			if("N" == eventTarget.val()) {
				$("[name=double]").prop("checked", false);
			}
		} else {
			$("[name=doubleUpYn][value=Y]").prop("checked", true);
		}
		
		// 선택 더블업
		var target = $("[name=double]:checked");
		$('#doubleupNavi').text(target.length > 0 ? target.data("itemshortname") : (("N" == eventTarget.val())) ? "미트 추가 안함" : "미트 추가를 선택 해 주세요");
		$('#doubleupAmt').text(target.length > 0 ? "+" + target.data("sale") : "0");
	}, 
		
	// 옵션 변경
	changeOption : function() {
		pop.setInfo(null, null);
	},
	
	// 다음스텝
	goNext : function() {
		pop.setInfo("/order/progress/choice/set", 520);
	},
	
	// 아이템 정보 세팅
	setInfo : function(url, width) {
		var obj = {};
		var double = $("[name=double]:checked");
		
		// 더블업 선택 여부
		var selectTarget = $("[name=doubleUpYn]:checked");
		var flag = "Y" == selectTarget.val();

		// 벨리데이션
		if(flag && double.length < 1) {alert("미트 추가를 선택 해 주세요"); return false;}
		
		obj["doubleup.baseItemIdx"] = double.length > 0 ? double.data("baseitemidx") : null;
		obj["doubleup.itemShortName"] = double.length > 0 ? double.data("itemshortname") : null;
		obj["doubleup.itemCode"] = double.length > 0 ? double.data("itemcode") : null;
		obj["doubleup.sale"] = double.length > 0 ? double.data("sale") : null;
		obj["totalDoubleupAmt"] = double.length > 0 ? window.parent.subwayCommon.stringCurrencyFormatToNumber(double.data("sale")) : null;
		
		window.parent.data.addItemInfo(obj, url, width);
	}
}

$(document).ready(function() {
	pop.init();
})