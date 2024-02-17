var pop = {
	init : function(){
		pop.changeBreadLength();

		// 다음스텝으로 이동
		$('#ordPrgsNextBtn').on("click", pop.goNext);
		// 옵션변경시
		$('#returnItemView').on("click", pop.changeOption);
		//빵길이 변경시
		$('input[type=radio]').on("change", pop.changeBreadLength);

		parent.$(".popup_iframe_wrapper").css({height: 417});
	},

	// 빵길이 변경시 상단 노출 변경
	changeBreadLength : function() {
		var selectTarget = $('[name=breadType]:checked');
		var breadLength = selectTarget.length > 0 ? selectTarget.val().substring(0,2) + "cm" : "길이를 선택하세요.";

		$('#breadLength').text(breadLength);
	},

	// 옵션 변경
	changeOption : function() {
		pop.setInfo(null, null);
	},

	// 다음스텝
	goNext : function() {
		var ckBreadType = $('input:radio[name=breadType]:checked');

		if(ckBreadType.attr('soldout') == 'Y'){
			alert(ckBreadType.attr('id') + ' 품절입니다.');
		}else {
			pop.setInfo("bread_type.do", 640);
		}
	},

	// 아이템 정보 세팅
	setInfo : function(url, width) {
		var target = $("[name=breadType]:checked");
		var metaLength = $("#breadLengthMeta").val();
		var flag = (metaLength == "" || metaLength == target.val()) ? "N" : "Y";
		var selectedItemCode = target.attr('itemcode');

		if("Y" == flag) {
			if(!confirm("빵길이 변경시 추가옵션이 초기화됩니다. 변경하시겠습니까?")) {
				return false;
			}
		}

		// 벨리데이션 체크
		if (target.length < 1) {
			alert("빵 길이를 선택해주세요.");
			return;
		}

		var param = {
			breadType: target.val(),
			breadChangeYn: flag,
			itemCode: selectedItemCode,
			breadSelected: 'Y'
		}
		window.parent.data.addItemInfo(param, url, width);
	}
}

$(document).ready(function() {
	pop.init();
})