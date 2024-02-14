var item  = {

	init: function() {
		if ($("#billBtn").length > 0 && $(".step01").length > 0) {
			$("html, body").animate({scrollTop: $(".step01").offset().top - 10}, 1000, "easeOutExpo");
		}

		// 꿀조합에 주문할 수 없는 재료가 있으면, 선택할 수 있도록 함.
		if (ordItemsVO.addedSelectIngredientList!= null && ordItemsVO.addedSelectIngredientList != '') {
			$.each(ordItemsVO.addedSelectIngredientList, function(idx, addedSelectIngredient) {
				if (addedSelectIngredient == 'bread') {
					$('.step01 ul>li[name=bread]').find('a').attr('id', 'bread');
					$('.step01 ul>li[name=bread]').find('a').attr('data-combination', 'N');
				} else if (addedSelectIngredient == 'cheese') {
					$('.step01 ul>li[name=cheese]').find('a').attr('id', 'cheese');
					$('.step01 ul>li[name=cheese]').find('a').attr('data-combination', 'N');
				} else if (addedSelectIngredient == 'vegetable') {
					$('.step01 ul>li[name=vegetable]').find('a').attr('id', 'vegetable');
					$('.step01 ul>li[name=vegetable]').find('a').attr('data-combination', 'N');
				} else if (addedSelectIngredient == 'sauce') {
					$('.step01 ul>li[name=sauce]').find('a').attr('id', 'sauce');
					$('.step01 ul>li[name=sauce]').find('a').attr('data-combination', 'N');
				}
			});
		}

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

						url = '/order/progress/choice/' + targetIngredient;
					}
				});
			}

			$("#ifrm").parent().css({width:width+"px",  marginLeft:"-"+width/2+"px"});
			$("#ifrm").prop("src", url);
		}
	},

	bindEvent: function() {

		// 상품메뉴 클릭 이벤트
		$('[name=itemMenu]').on('click', function(e) {
			var moveForm = $("[name=moveForm]");
			$("[name=cateCd]").val($(this).data("cate-cd"));
			data.addStorInfo(moveForm.serialize(), "/order/progress/step2");
		});

		// 꿀조합 적용시 조합 변경 불가 멘트
		$("[data-combination=Y]").on("click", function() {
		    var subpickYnCheck = $('#subpickYnCheck').val();
            if(subpickYnCheck == 'Y'){
                alert("썹픽 제품은 필수 선택 변경이 불가합니다.");
            }else{
                alert("꿀조합은 필수 선택 변경이 불가합니다.");
            }
		});

		// 꿀조합 팝업
		$('#itemConbiPopBtn, #itemConbiPopBtnSubpick').on('click', function(e) {
			e.preventDefault();

			var target = $(this);
			//alert(target.data("subpick"));
			var url = '/order/progress/combination/pop?itemCombinationIdx=' + target.data("combination-idx")
					+ "&storeCd=" + target.data("store-cd") + "&itemCode=" + target.data("item-code") + "&itemGubun=" + target.data("item-gubun") + "&subpickYn=" + target.data("subpick");

			var evntDisplayType = target.data("evnt-display-type");
			url = url + "&evntDisplayType=" + (evntDisplayType == undefined ? '' : evntDisplayType);

			item.openPopup(target, url, 510);
		});

		// 원산지 정보 팝업(2021-02-09 메뉴관리와 동일처리 issues/492)
		/*$('#originInfoBtn').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "/order/progress/origin/pop", 630);
		});*/

		// 알러지정보 팝업(2021-02-09 메뉴관리와 동일처리 issues/492)
        /*$('#allergyInfoBtn').on('click', function(e) {
            e.preventDefault();
            item.openPopup($(this), "/order/progress/allergy/pop", 900);
        });*/

		// 빵길이 선택
		$('#breadType').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "/order/progress/bread/length/choice", 520);
		});

		// 빵 선택
		$('#bread').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "/order/progress/choice/bread", 630);
		});

		// 치즈 선택
		$('#cheese').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "/order/progress/choice/cheese", 630);
		});

		// 야채 선택
		$('#vegetable').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "/order/progress/choice/vegetable", 630);
		});

		// 소스 선택
		$('#sauce').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "/order/progress/choice/sauce", 630);
		});

		// 엑스트라토핑 선택
		$('#extra').on('click', function(e) {
		    var subpickYnCheck = $('#subpickYnCheck').val();
            if(subpickYnCheck == 'Y'){
                alert("썹픽 제품은 추가 선택이 불가합니다.");
            }else{
                e.preventDefault();
                item.openPopup($(this), "/order/progress/choice/extra", 630);
            }
		});

		// 더블업 선택
		$('#doubleUp').on('click', function(e) {
		    var subpickYnCheck = $('#subpickYnCheck').val();
            if(subpickYnCheck == 'Y'){
                alert("썹픽 제품은 미트 추가가 불가합니다.");
            }else{
                e.preventDefault();
                item.openPopup($(this), "/order/progress/choice/double", 520);
            }
		});

		// 단품, 세트 선택
		$('#set').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "/order/progress/choice/set", 520);
		});

		// 쿠키 선택 -- 프로모션 전용
		$('#cookie').on('click', function(e) {
			e.preventDefault();
			item.openPopup($(this), "/order/progress/choice/cookie", 520, null, 690);
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
						url = "/order/progress/choice/bread"
					} else {
						switch (itemType) {
							case "ITEM_SANDWICH":
								url = "Y" == promotionYn ? "/order/progress/choice/bread" : "/order/progress/bread/length/choice";
								width = "Y" == promotionYn ?width : 520;
								break;
							case "ITEM_SALAD":
								url = "/order/progress/choice/cheese";
								break;
							case "ITEM_UNIT":
								if ("Y" == flatPizzaYn) {
									if (confirm("모차렐라 치즈가 기본으로 제공 됩니다. 치즈를 추가하시겠습니까?")) {
										url = "/order/progress/choice/cheese";
									} else {
										url = "/order/progress/choice/set";
										width = 520;
									}
								}
								break;
						}
					}

					item.openPopup($(this), url, width);
				}
			}, null);
		});

		// 장바구니 담기
		/*$("#cartBtn").on("click", function() {

		});*/

		// 사이드 추가 이벤트
		/*$("#addSide").on("click", function() {
			if(confirm("장바구니로 이동되며 옵션 변경이 불가합니다.\n\n진행 하시겠습니까?")) {
				item.addCart(true);
			}
		});*/

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

	setOneCup: function(selectCup) {
	    if(selectCup == "N") {// 개인컵 선택
	        ordItemsVO.cupItemCd = "0000";
	    }
	    if(ordGubun == "B") {
	        item.goOrder("Y", ordItemsVO.cupItemCd);
	    } else {
	        item.addCart(ordGubun == "S");
	    }

	},

	checkCup : function(obj, gubun) {
	    ordGubun = gubun;
        // 바로 주문 체크
        if(ordGubun == "B" && "Y"  == ordItemsVO.hasMappingItemYn && ordItemsVO.promotionSelect == null) {
            alert("선택 구성 사항을 선택해주세요.");
            return;
        }
        // 사이드 추가 인경우 일회용컵 체크
	    if(gubun == "S" && ordItemsVO.ordType == "ORD_TYPE.FAST_SUB" && ordItemsVO.paveFg == "Y" && ordItemsVO.cupIncldYn == "Y") {
	        if(!confirm("일회용컵 사용 여부 선택 후, 장바구니로 이동되며 옵션 변경이 불가합니다. 진행하시겠습니까?")) {
	            return;
	        }

	    } else if(gubun == "S") {
	        if(!confirm("장바구니로 이동되며 옵션 변경이 불가합니다.\n\n진행 하시겠습니까?")) {
	            return;
            }
	    }

        var selectCupYn = "N";
	    if(ordItemsVO.ordType == "ORD_TYPE.FAST_SUB" && ordItemsVO.paveFg == "Y" && ordItemsVO.cupIncldYn == "Y") {
	        selectCupYn = "Y";
	        popup_open_url("/order/progress/disposableCup?qty="+$('#ordQty').val(),570,545);
	        return;
	    }
        ordItemsVO.cupIncldYn = "N";
        ordItemsVO.cupItemCd = "";

        if(ordGubun == "B") {
            item.goOrder(selectCupYn, "");
        } else {
            item.addCart(ordGubun == "S");
        }

	},

	goOrder: function(selectCupYn, cupItemCd) {
	    var ordForm = $('[name=orderForm]');
        ordForm.append('<input type="hidden" name="qty" value="' + $('#ordQty').val() + '">');
        ordForm.append('<input type="hidden" name="selectCupYn" value="'+selectCupYn+'">');
        if("Y" == selectCupYn) {
            ordForm.append('<input type="hidden" name="selectCupCd" value="'+cupItemCd+'">');
        }
        ordForm.attr('action', '/order/progress/bill/order');
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

		var getType = ordItemsVO.ordType.replace("ORD", "CART");

		// 장바구니 지점코드 체크
		$.get("/cart/checkCartStoreCode", {cartType : getType, storCode : ordItemsVO.storCd, paveFg: ordItemsVO.paveFg}, function(result) {
			var flag = result;
            var cartStoreMatch = true;

			if(!flag) {
				flag = confirm("장바구니에는 같은 매장의 메뉴만 담을수 있습니다.\n\n현재 메뉴을 담을 경우 이전 장바구니 메뉴는 삭제됩니다.\n\n장바구니에 담으시겠습니까?");
                cartStoreMatch = false;		// #210420 장바구니 다른 매장 상품 존재할 경우, 기존 장바구니 상품 삭제 오류 수정 (#569)
			}

            if (flag) {
                // (2020.09.02) 웨지상품 카트에 담을 수 있는 시간인지 체크
                $.post("/cart/checkAddCartWedgeItem", "POST", JSON.stringify(ordItemsVO), function (result) {
                    if (!result) {
                        alert("주문할 수 없는 상품이 포함되어 있습니다. 다시 선택해주세요.");
                    } else {
                        // 점포코드가 같거나 장바구니 초기화에 승락하였을경우 & 웨지상품 주문할 수 있는 시간일 경우 담는다
                        if (flag) {
                            ordItemsVO.qty = $('#ordQty').val();
                            ordItemsVO.cartStoreMatch = cartStoreMatch;
                            $.post("/cart/add", "POST", JSON.stringify(ordItemsVO), function (data) {

                                if (data) {
                                    if (isSide) {
                                        alert("장바구니에 담겼습니다. 사이드 메뉴로 이동합니다.");
                                        location.href = "/order/progress/step2?cateCd=ITEM_SIDEDRINK";
                                    } else if (confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")) {
                                        getType = getType.split(".").pop().replace("_", "").toLowerCase();
                                        location.href = "/cart/" + getType;
                                    } else {
                                        location.reload();
                                    }
                                }
                            }, null);
                        }
                    }
                }, null);
            }

		}, null);
	}
}

var ordGubun;

//데이터 저장
var data = {
	addStorInfo : function(data, url) {
		$.ajax({
	        type: "POST",
	        url: "/order/progress/addStorInfo",
	        data: data,
	        async: false,
	        success: function () {
	        	location.href = url;
	        },
	        error: function (xhr, ajaxOptions, thrownError) {
	        	subwayCommon.errorAjaxProcess(xhr);
	        }
	    });
	},

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

	// (2020.09.15) fast-sub:5개, home-sub:10개 제한
	getMaximumQty : function() {
		if (ordItemsVO.ordType == 'ORD_TYPE.HOME_SUB') {
			return 10;
		} else {
			return 5;
		}
	}
}

$(document).ready(function() {
	item.init();
});

$(window).load(function () {
	// #201231 신규 LSM 행사 제품 안내 얼럿 (에그마요 베이컨, 에그마요 페퍼로니)
	if ($(".menu_select").length == 0) {       // 제품 상세페에지 첫 진입시에만 노출
        if (ordItemsVO.itemExtraDesc != null && ordItemsVO.itemExtraDesc != '') {
            alert(ordItemsVO.itemExtraDesc);
        }
	}
});