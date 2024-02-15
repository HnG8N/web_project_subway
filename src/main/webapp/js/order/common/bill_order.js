var bill  = {
	init: function() {
		// this.bindEvent();
		// 포인트 모두사용
		$("#useAllPoint").on("click", bill.selectAllPoint);
		// 써브카드 모두사용
		$("#useAllSubcard").on("click", bill.useAllSubcard);
		// 포인트 사용금액 변경시
		$("#pointAmt").on("change", bill.changeDisCount);
		// 써브카드 사용금액 변경시
		$("#subcardAmt").on("change", bill.changeDisCount);
		//주문하기
		$("#startOrder").on("click", bill.startOrder);
		// 써브카드 사용여부 변경시
		$("[name=receiptNo], #subcardAmt, #pointAmt").on("keyup", subwayCommon.onlyNum);
		// 현금영수증 종류 변경
		$("[name=receiptType]").on("click", bill.changeReceipt);
		// 쿠폰 변경
		$("#couponApply").on("click", bill.changeVoucher);

		$("[name=voucherList]").on("change", bill.viewVoucher);

		$("#subcardAmt").blur(function() {
			var subCardAmt = subwayCommon.stringCurrencyFormatToNumber($("#subcardAmt").val())
			if(Number.isNaN(subCardAmt)) {
				$("#subcardAmt").val(0);
			}
		});

		$("#pointAmt").blur(function() {
			var pointAmt = subwayCommon.stringCurrencyFormatToNumber($("#pointAmt").val())
			if(Number.isNaN(pointAmt)) {
				$("#pointAmt").val(0);
			}
		});

		bill.bindEvent();
	},

	// 팝업열기
	openPopup : function(target, url, width, secType) {
		target.attr('href', url);
		var id = target.attr("id");
		var h=width;
		subwayCommon.popupValidation(target, width, h);
	},

	bindEvent : function() {
		/*if ($('#payTrial').val() == '') {
			$('#payTrial').val("N");
		}*/

        // #201027 페이코 프로모션 문구 ~10/31
        var edate = new Date("2020/10/31 23:59:59");

        if (Date.now() > edate) {
            $(".caution_txt").hide();
        } else {
            $(".caution_txt").show();
        }

        // #210910 설문조사 감사 쿠폰 사용
        $("#btn_useSc").on('click', function () {
            bill.fnSurveyCookie();
        });
    },

	// 쿠폰변경
	changeVoucher : function(e) {
		e.preventDefault();

		var couponCd = $('[name=couponCode]').val();
		if("" == couponCd) {alert("사용할 쿠폰을 선택해주세요."); return false;}
		var couponAmt = $("[name=couponAmt]").val() * 1;
		if((couponAmt > 0 && confirm("기존 적용된 써브카드, 포인트 사용금액이 초기화됩니다. 쿠폰을 선택하시겠습니까?"))
				|| couponAmt == 0) {

			 $("#couponAmt").val(0);
//				 $("#subcardAmt").val(0);
//				 $("#pointAmt").val(0);
			 bill.openPopup($("#couponApply"), '/order/progress/coupon?couponCd='+couponCd+'&storCd=' + ordSheetSaleVO.ordVO.storCd,745);
		}

		bill.changeDisCount();
	},

	// 결제금액 노출 변경
	changeOrdAmt : function() {
		var totalOrdAmt = $("#totalOrdAmt").val();

		var subCardAmt = subwayCommon.stringCurrencyFormatToNumber($("#subcardAmt").val())
		if(Number.isNaN(subCardAmt)) {
			$("#subcardAmt").val(0);
		} else {
			subCardAmt = subwayCommon.stringCurrencyFormatToNumber($("#subcardAmt").val())
		}

		var pointAmt = subwayCommon.stringCurrencyFormatToNumber($("#pointAmt").val())
		if(Number.isNaN(pointAmt)) {
			$("#pointAmt").val(0);
		} else {
			pointAmt = subwayCommon.stringCurrencyFormatToNumber($("#pointAmt").val())
		}

		//var voucherAmt = 				subwayCommon.stringCurrencyFormatToNumber($('#voucherAmt').val());
		var couponAmt = 				subwayCommon.stringCurrencyFormatToNumber($("#couponAmt").val());
		var realAmt = 						totalOrdAmt - couponAmt - subCardAmt - pointAmt;
		var icon = 								"";

		// 써브카드 사용금액 세팅
		icon = subCardAmt > 0 ? "- " : "";
		$('#subcardAmtNavi').html(icon + subwayCommon.numberToCurrencyFormat(subCardAmt));

		// 포인트 사용금액 세팅
		icon = pointAmt > 0 ? "- " : "";
		$('#pointAmtNavi').html(icon + subwayCommon.numberToCurrencyFormat(pointAmt));

		// 바우처 사용금액 세팅
		//icon = voucherAmt > 0 ? "- " : "";
		//$('#voucherAmtNavi').html(icon + subwayCommon.numberToCurrencyFormat(voucherAmt));

		icon = couponAmt > 0 ? "- " : "";
		couponAmt = parseInt(couponAmt)
		$('#couponAmtNavi').html(icon + subwayCommon.numberToCurrencyFormat(couponAmt));

		// 포인트 및 써브카드 사용금액 변경시 사용란, totalAmt 변경
		$('#totalPayAmtNavi').html(subwayCommon.numberToCurrencyFormat(realAmt));
	},

	// 할인수단 벨리데이션 체크
	checkAmtVal : function() {
		var subCardTarget 		= $("#subcardAmt");
		var pointTarget				= $('#pointAmt');
		var totalOrdAmt 			= $("#totalOrdAmt").val();
		var ordAmt 							= $("#ordAmt").val();
		var subCardAmt 				= subwayCommon.stringCurrencyFormatToNumber(subCardTarget.val());
		var pointAmt 					= subwayCommon.stringCurrencyFormatToNumber(pointTarget.val());
		//var voucherAmt 				=	subwayCommon.stringCurrencyFormatToNumber($('#voucherAmt').val());
		var couponAmt 				= subwayCommon.stringCurrencyFormatToNumber($('#couponAmt').val());
		var ableSubcardAmt 	        = $('#usableSubcardAmt').data("subcard");
		var ablePointAmt 		    = $('#usablePoint').data("point");
		var oneCupAmt               = subwayCommon.stringCurrencyFormatToNumber($("#oneCupAmt").val());
		var realAmt 						= totalOrdAmt - couponAmt - subCardAmt - pointAmt;
		var flag 								= true;
		var msg 									= "";




		// 금액 벨리데이션 체크
		if(flag && typeof subCardAmt != "number") {
			flag = false;
			msg = "써브카드 사용금액을 정확하게 입력해주세요.";
			subCardTarget.val("");
		}

		if(flag && typeof pointAmt != "number") {
			flag = false;
			msg = "포인트 사용금액을 정확하게 입력해주세요.";
			pointTarget.val("");
		}

		// 써브카드 소지금액 이상으로 사용불가
		if(flag && subCardAmt > 0 && ableSubcardAmt < subCardAmt) {
			flag = false;
			msg = "써브카드는 소지금액 이상으로 사용 불가합니다.";
			subCardTarget.val("");
		}

		if(pointAmt > 0) {
			// 포인트 3000점 이상 소지시 사용가능
			if(flag && ablePointAmt < 3000) {
				flag = false;
				msg = "포인트는 3000점 이상 소지시 사용가능합니다.";
				pointTarget.val("");
			}

			// 포인트 주문금액 이상 사용(배달비는 포인트 결제 불가)
			// 사용가능한 총 포인트
            var ablePoint = ordAmt - couponAmt - oneCupAmt;
            //var ablePoint = (delvAmt > subCardAmt ? ordAmt : totalOrdAmt - subCardAmt) - couponAmt;
			if(flag && ablePoint < pointAmt) {
				flag = false;
				msg = "포인트는 쿠폰, 써브카드 결제금액, 일회용컵 보증금, 배달비를 제외한 금액만 사용가능합니다.";
				pointTarget.val("");
			}

			// 소지포인트 이상 사용불가
			if(flag && ablePointAmt < pointAmt) {
				flag = false;
				msg = "포인트는 소지금액 이상으로 사용 불가합니다.";
				pointTarget.val("");
			}

			// 포인트는 100점 단위로 사용가능 -> 10점 단위로 변경 #201009
			if (flag && pointAmt % 10 > 0) {
				flag = false;
				msg = "포인트는 10포인트 단위로 사용 가능합니다.";
				// 100원 -> 10원 미만 절삭
				pointTarget.val(subwayCommon.numberToCurrencyFormat(pointAmt - (pointAmt % 10)));
			}
		}

		// 총 금액 체크
		if (flag && realAmt < 0) {
			flag = false;
			msg = ((subCardAmt > 0 && pointAmt > 0) ? "써브카드와 포인트" : subCardAmt > 0 ? "써브카드" : "포인트")
				+ "는 총 결제금액 이상으로 사용불가합니다.";
			subCardTarget.val("");
			pointTarget.val("");
		}

		if (!flag) {
			alert(msg);
		} else {
			if(subCardAmt > 0)
				subCardTarget.val(subwayCommon.numberToCurrencyFormat(subCardAmt));

			if(pointAmt > 0)
				pointTarget.val(subwayCommon.numberToCurrencyFormat(pointAmt));
		}

		return flag;
	},

	// 결제수단 벨리데이션 체크
	checkPayMethVal : function() {
		var subCardTarget 		= $("#subcardAmt");
		var pointTarget				= $('#pointAmt');
		var totalOrdAmt 			= $("#totalOrdAmt").val();
		var subCardAmt 				= subwayCommon.stringCurrencyFormatToNumber(subCardTarget.val());
		var pointAmt 					= subwayCommon.stringCurrencyFormatToNumber(pointTarget.val());
		var couponAmt				= subwayCommon.stringCurrencyFormatToNumber($('#couponAmt').val());
		var realAmt						= totalOrdAmt - couponAmt - subCardAmt - pointAmt;
		var flag								= true;
		var msg									= "";

		// 결제수단
		var payMeth			= $("[name=payment]:checked");

		// 결제수단 미선택시 : 0원결제일경우 체크 안함
		if(flag && realAmt > 0 && payMeth.length < 1) {
			flag = false;
			msg = "결제수단을 선택해주세요.";
			subwayCommon.scrollMove($("[name=payment]").parents(".write_info_wrap"));
		}

		// 약관 미동의시
		if ($('#paymentAgree:checked').val() != 'Y') {
			flag = false;
			msg = '구매 조건 및 결제진행 동의를 선택해주세요.';
			subwayCommon.scrollMove($("#paymentAgree"));
		}


		// 패스트 써브일경우 전화번호 양식 체크
		var cpNoTarget = $("[name=ordHp]");
		if(flag && cpNoTarget.length > 0) {
			var hpPattern = /^[0-9]{10,11}$/g;
			if(!hpPattern.test(cpNoTarget.val())) {
				flag = false;
				msg = "전화번호는 10, 11자리의 숫자만 입력 가능합니다.";
				subwayCommon.scrollMove($("[name=ordHp]"));
			}
		}


		// 현금영수증 여부
		var receiptTarget	= $("[name=receiptType]:eq(0)");

		// 현금영수증 신청시
		if(flag && !(receiptTarget.is(":checked"))){
			var receiptType			= $("[name=receiptType]:checked");

			// 현금영수증 번호 미입력시
			var receiptNo = $("[name=receiptNo]").val();
			if(flag && receiptNo.length < 1) {
				flag = false;
				msg = "현금영수증 발급 번호를 입력해주세요.";
				subwayCommon.scrollMove($("[name=receiptNo]"));
			}

			if(flag && !(subwayCommon.checkNum($("[name=receiptNo]")))) {
				msg = "현금영수증 번호는 숫자만 입력 가능합니다.";
				subwayCommon.scrollMove($("[name=receiptNo]"));
			}

			if(flag && receiptNo.length > 11) {
				flag = false;
				msg = "현금영수증 번호는 최대 11자리 입력 가능합니다.";
				subwayCommon.scrollMove($("[name=receiptNo]"));
			}
		}

		if(!flag) {
			alert(msg);
			return flag;
		}

		return flag;
	},

	// 현금영수증 종류 변경
	changeReceipt : function() {
		var receiptTarget = $("[name=receiptNo]");
		var toggle = $(this).parent().index() == 0;

		receiptTarget.val("");
		receiptTarget.parent().toggleClass("bdr_text", !toggle);
		receiptTarget.prop("disabled", toggle);
		receiptTarget.toggle(!toggle);
		// 현금영수증 신청여부 세팅
		$("[name=receiptYn]").val(toggle ? "N" : "Y");

		// 개인소득공제 번호 추가 #200924
		if ($("[name=receiptType]:checked").val() == 'RECEIPT_TYPE.PERSONAL') {
			receiptTarget.val(ordSheetSaleVO.receiptNo);
		} else {
			receiptTarget.val("");
		}
	},

	// 할인 금액 변동시 이벤트
	changeDisCount : function() {

		// 금액 벨리데이션
		bill.checkAmtVal();

		// 변동금액 세팅
		bill.changeOrdAmt();
	},

	// 써브카드 모두사용
	useAllSubcard : function() {
		var eventTarget = $(this);
		var subcardTarget = $("#subcardAmt");
		var totalOrdAmt = $("#totalOrdAmt").val();
		var usableSubcardAmt = $("#usableSubcardAmt").data("subcard");
		var usePoint = subwayCommon.stringCurrencyFormatToNumber($('#pointAmt').val());
		//var voucherAmt 				= subwayCommon.stringCurrencyFormatToNumber($('#voucherAmt').val());
		var couponAmt				= subwayCommon.stringCurrencyFormatToNumber($('#couponAmt').val());
		totalOrdAmt 						= totalOrdAmt - couponAmt - usePoint;
//		var useAmt 							= (totalOrdAmt > usableSubcardAmt ? usableSubcardAmt : totalOrdAmt) - usePoint-couponAmt;
		var useAmt 							= (totalOrdAmt > usableSubcardAmt ? usableSubcardAmt : totalOrdAmt);

        subcardTarget.val(subwayCommon.numberToCurrencyFormat(useAmt));

		// 금액변동 이벤트
		bill.changeDisCount();
	},

	// 포인트 모두사용시
	selectAllPoint : function() {
		var totalOrdAmt 		= $("#totalOrdAmt").val();
		var ordAmt				= $("#ordAmt").val();
        var oneCupAmt           = $("#oneCupAmt").val();
		var delvAmt				= totalOrdAmt - ordAmt;
		var subCardAmt 			= subwayCommon.stringCurrencyFormatToNumber($("#subcardAmt").val());
		//var voucherAmt 				= subwayCommon.stringCurrencyFormatToNumber($('#voucherAmt').val());
		var couponAmt			= subwayCommon.stringCurrencyFormatToNumber($('#couponAmt').val());
		var ablePointAmt 	    = $('#usablePoint').data("point");
		var pointTarget 		= $('#pointAmt');
		// 사용가능한 총 포인트
		var realAmt = ordAmt - couponAmt - oneCupAmt;


		// 포인트 사용금액 세팅
		// 100점 단위 -> 10점 단위로 변경 #201009
		var usePoint = ablePointAmt > realAmt ? realAmt : ablePointAmt;
		pointTarget.val(subwayCommon.numberToCurrencyFormat(usePoint - (usePoint % 10)));

		// 서브카드 리셋
        $("#subcardAmt").val("");
		// 금액변동 이벤트
		bill.changeDisCount();
	},

	startOrder : function() {
	    /*if ($('#payTrial').val() != null && $('#payTrial').val() == 'Y') {
	        alert("이미 결제가 진행중입니다.");
	        return false;
        } else {
            $('#payTrial').val("Y");
        }*/

        // 결제수단 벨리데이션
        if (!bill.checkPayMethVal()) {
            // $('#payTrial').val("N");
            return false;
        }

        // 금액 벨리데이션
        if (!bill.checkAmtVal()) {
            // $('#payTrial').val("N");
            return false;
        }

        // 설문조사 감사 쿠폰 밸리데이션
        if (!bill.surveyCookieValidation()) {
            return false;
        }

        var ordAmt = $("#ordAmt").val();
        var minOrdAmt = parseInt($("#minOrderAmount").val());
        var ordType = $("#orderType").val();
        // 최소주문 금액 체크
        if (ordType == 'ORD_TYPE.HOME_SUB') {
            if (typeof minOrdAmt != 'undefined'
                && minOrdAmt > 0
                && minOrdAmt > ordAmt
            ) {
                alert($('#deliveryStore').text() + ' 의 최소주문금액은 '+subwayCommon.numberToCurrencyFormat(subwayCommon.stringCurrencyFormatToNumber(minOrdAmt)) + '원 입니다.\n\n(배달비는 주문금액에 포함되지 않습니다.)')
                // $('#payTrial').val("N");
                return false;
            }
        }

        // (2020.09.02) 웨지상품 주문할 수 있는 시간인지 마지막 체크
        $.post("/order/progress/checkOrderableWedgeItem", "POST", JSON.stringify(ordSheetSaleVO), function(result) {
            if (!result) {
                // $('#payTrial').val("N");
                alert("주문할 수 없는 상품이 포함되어 있습니다.");

            } else {
                // (2020.09.14) 샌드위치/찹샐러드/랩 제품 포함, 진행중인 주문 건 있는지 확인
                var data = {
                    'ordSheetSaleVO': JSON.stringify(ordSheetSaleVO),
                    'storCd': franchiseStoreCd
                };
                $.post("/order/progress/checkCountOrderIng", "POST", JSON.stringify(data), function (result) {
                    if (!result) {
                        // $('#payTrial').val("N");
                        alert("현재 진행 중인 주문 건이 픽업/배달 완료 된 후 주문이 가능합니다.");

                    } else {
                        if(confirm("주문 후 제조가 시작되면 취소가 불가능 합니다. 주문하시겠습니까?")) {
							subwayCommon.isValidOrderFranchise(function () {
                                // 설문조사 감사 쿠폰 쿠키정보 세팅
                                var chooseSCookie = $('[name=surveyCookieCode]').val();
                                if (chooseSCookie != null && chooseSCookie != '') {

									if (!bill.fnChDuplicateSurveyCookie(chooseSCookie)) {
										var surveyCookie = {
											'baseItemIdx': $('[name=surveyCookieBaseItemIdx]').val(),
											'itemIdx': $('[name=surveyCookieItemIdx]').val(),
											'itemCode': chooseSCookie,
											'storCd': franchiseStoreCd,
											'ordIdx': $('[name=surveyCookieOrdIdx]').val(),
											'surveyPrizeYn': 'Y'
										}

										ordSheetSaleVO.ordItemList.push(surveyCookie);
										ordSheetSaleVO.surveyCouponIdx = $('[name=surveyCouponIdx]').val();
									}
								}

                                // pg 시작
                                pay.sale.executePay(ordSheetSaleVO);
                            });
                        }/* else {
							$('#payTrial').val("N");
						}*/
                    }
                }, null);
            }
        }, null);
    },

    fnSurveyCookie: function () {
        var selectedCookieCode = $('#surveyCookieList option:selected').val();
        var selectedCookieName = $('#surveyCookieList option:selected').text();

        var selectedCookieItemIdx = $('#surveyCookieList option:selected').data('itemidx');
        var selectedCookieBaseItemIdx = $('#surveyCookieList option:selected').data('baseitemidx');

        if (selectedCookieCode != null && selectedCookieCode != '') {
            if (selectedCookieCode == '00000') {
                bill.fnResetCookieInfo();
            } else {
                $('[name=surveyCookieCode]').val(selectedCookieCode);
                $('[name=surveyCookieItemIdx]').val(selectedCookieItemIdx);
                $('[name=surveyCookieBaseItemIdx]').val(selectedCookieBaseItemIdx);

                var cookieArea = $('#chooseSurveyCookie');
                cookieArea.find('div.name strong').text("설문감사-" + selectedCookieName);
                cookieArea.show();
                $('[name=surveyCookieNavi]').show();
            }

            bill.fnFocusChooseCookie($(".ord_items"));
        }
    },

    surveyCookieValidation: function () {
        if (!$('#surveyArea').is(':visible')) {
            return true;
        }

        var isValid = false;

        var availableSurveyCookie = $('[name=availableSurveyCookie]').val();
        var surveyCookieCode = $('[name=surveyCookieCode]').val();
        var selectedCookieCode = $('#surveyCookieList option:selected').val();

        if (surveyCookieCode == null || surveyCookieCode == '') {
            // 쿠키 종류는 선택했으나 '쿠폰 사용'을 누르지 않은 경우
            if (selectedCookieCode != null && selectedCookieCode != '') {
                if (selectedCookieCode != '00000') {
                    alert("설문조사 감사 쿠폰을 사용하려면 쿠폰 사용 버튼을 클릭해 주세요.");
                    bill.fnFocusChooseCookie($("#discount"));
                } else {
                    isValid = true;
                }
            } else {
                // 쿠키 선택 가능하지만, 사용자가 선택하지 않은 경우
                if (availableSurveyCookie == 'Y') {
                    if (confirm("지금 사용 가능한 무료 쿠키 쿠폰이 있습니다.\n사용하시겠습니까?")) {
                        bill.fnFocusChooseCookie($("#discount"));
                    } else {
                        isValid = true;
                    }
                }
            }
        } else {
            if (selectedCookieCode == '00000') {
                bill.fnResetCookieInfo();
                isValid = true;
            } else if (selectedCookieCode == '') {
                if (!confirm("무료 쿠키가 선택되지 않았습니다. 쿠키 선택 없이 주문하시겠습니까?")) {
                    bill.fnFocusChooseCookie($("#discount"));
                } else {
                    bill.fnResetCookieInfo();
                    isValid = true;
                }
            } else if (selectedCookieCode != surveyCookieCode) {
                alert("설문조사 감사 쿠폰을 사용하려면 쿠폰 사용 버튼을 클릭해 주세요.");
                bill.fnFocusChooseCookie($("#discount"));
            } else {
                isValid = true;
            }
        }

        return isValid;
    },

    fnResetCookieInfo: function () {
		$('[name=surveyCookieCode]').val('');
		$('[name=surveyCookieItemIdx]').val('');
		$('[name=surveyCookieBaseItemIdx]').val('');

		$('#chooseSurveyCookie').hide();
		$('[name=surveyCookieNavi]').hide();
	},

	fnFocusChooseCookie: function (target) {
		$('html, body').animate({scrollTop: target.offset().top}, 400);
	},

	fnChDuplicateSurveyCookie: function (chooseSCookie) {
		var surveyRewardItem = '';
		var ordItemList = ordSheetSaleVO.ordItemList;

		$.each(ordItemList, function (idx, item) {
			if (item.surveyPrizeYn != null && item.surveyPrizeYn == 'Y') {
				surveyRewardItem = item.itemCode;
			}
		});

		if (surveyRewardItem != '') {
			if (surveyRewardItem == chooseSCookie) {
				return true;
			} else {
				$.each(ordItemList, function (idx, item) {
					if (item.itemCode == surveyRewardItem) {
						ordItemList.splice(idx, 1);
						return false;
					}
				})
			}
		} else {
			return false;
		}

	}
}


var view = {
	callbackPay: function (code, msg) {
		if (code == '0000') {
			$.get("/member/init-member-info", "GET", function (data) {
				location.href = '/mypage/order';
			}, null);
		}
	}
}

$(document).ready(function() {
	bill.init();
});