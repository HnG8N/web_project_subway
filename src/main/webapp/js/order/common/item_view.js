var item  = {
	init: function() {
		this.bindEvent();
	},

	// 팝업열기
	openPopup : function(target, url, width, secType) {
		target.attr('href', url);
		var id = target.attr("id");
		var h;
		$.post("/isLoginCheck", "POST",null, function(result) {
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
		});
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
	},

	bindEvent: function() {

		// 꿀조합 팝업
		$('#itemConbiPopBtn').on('click', function(e) {
			e.preventDefault();

			var target = $(this);
			var url = 'combination.do' 
			alert("1.target : " + target);
			alert("2.url : " + url);

			item.openPopup(target, url, 510);
		});

		// 빵길이 선택
		$('#breadType').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "bread_length.do", 520);
		});

		// 빵 선택
		$('#bread').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "bread_type.do", 630);
		});

		// 치즈 선택
		$('#cheese').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "cheese.do", 630);
		});

		// 야채 선택
		$('#vegetable').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "vegetable.do", 630);
		});

		// 소스 선택
		$('#sauce').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "sauce.do", 630);
		});

		// 수량변경 이벤트
		$("#qtySub,#qtyAdd").on("click", function() {
			var qtyTarget = $("#ordQty");
			var qty = parseInt(qtyTarget.val());
			var changeAttr = "qtySub" == $(this).attr("id") ? -1 : 1;
			var changeQty = qty + changeAttr;
			var limitQty = data.getMaximumQty();

			if(changeQty <= 0) {
				alert("최소 주문 수량입니다.");
				return;
			}

			if("N" == ordItemsVO.sideYn && changeQty > limitQty) {
				alert("최대 주문수량은 " + limitQty + "개 입니다.\n\n" + limitQty+ "개 이상은 단체주문을 이용하시기 바랍니다.");
				return;
			}

			var eachPrice = $("[name=eachPrice]").val();

			// 수량 및 금액 변경
			qtyTarget.val(changeQty);
			$("#finalAmt").text(subwayCommon.numberToCurrencyFormat(eachPrice * changeQty));
		});

		// 선택하기 버튼
		$('#orderBtn').on('click', function () {
			var url = "";
			var width = 630;
			var itemType = $(this).data("itemtype");
			var morningYn = $(this).data("morningyn");
			var promotionYn = $(this).data("promotionyn");
			var flatPizzaYn = $(this).data("flatpizzayn");

			// (2020.09.14) 샌드위치/찹샐러드/랩 제품 포함, 진행중인 주문 건 있는지 확인
			var data = {'ordItemsVO': JSON.stringify(ordItemsVO)};
			$.post("/order/progress/checkCountOrderIng", "POST", JSON.stringify(data), function(result) {
				if (!result) {
					alert("현재 진행 중인 주문 건이 픽업/배달 완료 된 후 주문이 가능합니다.");
				} else {
					if("Y" == morningYn) {
						url = "bread_type.do"
					} else {
						switch (itemType) {
							case "ITEM_SANDWICH":
								url = "Y" == promotionYn ? "bread_type.do" : "bread_length.do";
								width = "Y" == promotionYn ?width : 520;
								break;
							case "ITEM_SALAD":
								url = "cheese.do";
								break;
							case "ITEM_UNIT":
								if ("Y" == flatPizzaYn) {
									if (confirm("모차렐라 치즈가 기본으로 제공 됩니다. 치즈를 추가하시겠습니까?")) {
										url = "cheese.do";
									} 
								}
								break;
						}
					}

					item.openPopup($(this), url, width);
				}
			}, null);
		});


		$("#orderContinueBtn").on("click", function  () {
			$(".step01 ul>li").each (function  () {
				var $this = $(this);
				if(!$this.hasClass("on")) {
					$this.find("a").trigger("click");
					return false;
				}
			});
		});
	},

	goOrder: function(selectCupYn, cupItemCd) {
	    var ordForm = $('[name=orderForm]');
        ordForm.append('<input type="hidden" name="qty" value="' + $('#ordQty').val() + '">');
        ordForm.attr('action', 'checkout.do');
        ordForm.attr('method', 'POST')
        ordForm.submit();
	},

	// 장바구니 담기기능
	addCart : function(isSide) {
		// 프로모션 선택1 벨리데이션
		if("Y"  == ordItemsVO.hasMappingItemYn && ordItemsVO.promotionSelect == null) {
			alert("선택구성사항을 선택해주세요.");
			return false;
		}

        if (isSide) {
            alert("장바구니에 담겼습니다. 사이드 메뉴로 이동합니다.");
        } else if (confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")) {
            getType = getType.split(".").pop().replace("_", "").toLowerCase();
            location.href = "cart.do";
        } else {
            location.reload();
        }

	}
}

var ordGubun;

//데이터 저장
var data = {
	addItemInfo : function(data, url, width) {
		$.ajax({
	        type: "POST",
	        url: "/order/progress/addItemInfo",
	        data: data,
	        async: false,
	        success: function (data) {
	        	ordItemsVO.chooseIngredientList = data.chooseIngredientList;
				ordItemsVO.emptyIngredientList = data.emptyIngredientList;
				ordItemsVO.baseIngredientList = data.baseIngredientList;

	        	if(url == null) {
	        		location.reload();
	        	} else {
	        		$(".popup_iframe_wrapper").css({width:width+"px",  marginLeft:"-"+width/2+"px"});
	        		$("#ifrm").prop("src", url);
	        	}
	        },
	        error: function (xhr, ajaxOptions, thrownError) {
	        	subwayCommon.errorAjaxProcess(xhr);
	        }
	    });
	},

}

$(document).ready(function() {
	item.init();
});
