/* --------------------------------------------------------
*  Title	   : FAST_SUB 주문하기 팝업띄워서 정보 가져오기 (AJAX)
*  Date        : 2024.02.16 (Fri) ver1.0 : 생성
*  Author      : sujin
*  -------------------------------------------------------- */
var item  = {

	init: function() {
		// 초기화 시 필요한 기능.	
		this.bindEvent();
	},
	// 팝업열기
	openPopup : function(target, url, width, secType) {
		target.attr('href', url);
		var id = target.attr("id");
		var h;
//		$.post("/isLoginCheck", "POST",null, function(result) {
			if(result) 	{
				switch (id) {
					case "orderBtn" :
					case "breadType" :
						h = 398;
						break;
					case "bread" :
						h = 718;
						break;
					case "cheese" :
					case "sauce" :
					case "extra" :
						h = 650;
						break;
					case "vegetable" :
						h = 686;
						break;
					case "doubleUp" :
						h = 808;
						break;
					case "set" :
						h = 858;
						break;
					case "cookie" :
						h = 690;
						break;
				}
				subwayCommon.popupValidation(target, width, h);
			}
//		});
	},

	// 팝업 변경
	changePopup : function(url, width, action) {
		if (null == url) {
			$(".popup_iframe_wrapper .btn_close").click();
		} else {
			var emptyIngredientList = ordItemsVO.emptyIngredientList;
			if (emptyIngredientList != null && emptyIngredientList.length > 0) {
				$.each(emptyIngredientList, function(idx, emptyIngredient) {
					if (url.indexOf(emptyIngredient) >= 0) {
						var baseIngredientList = ordItemsVO.baseIngredientList;

						var targetIngredient;
						var ingredientIdx = baseIngredientList.indexOf(emptyIngredient);
						if (ingredientIdx > 0) {
							targetIngredient = baseIngredientList[(action == null || action == 'prev') ? ingredientIdx-1 : ingredientIdx+1];
						} else if (ingredientIdx <= 0) {
							$(".popup_iframe_wrapper .btn_close").click();
						}

						url = targetIngredient + '.do';
					}
				});
			}

			$("#ifrm").parent().css({width:width+"px",  marginLeft:"-"+width/2+"px"});
			$("#ifrm").prop("src", url);
		}
	}
}
$(document).ready(function() {
	item.init();
});