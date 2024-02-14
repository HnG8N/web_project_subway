var item  = {
	init: function() {
		// 사이드 선택영역 생성 TODO
		this.getSideSelect();

		var cateCd = $('.active [name=itemMenu]').data('categoryCode');
		var storCd = $('#storCd').val();
        var grilledSaleYn = cateCd == "ITEM_UNIT" ? $('.active [name=itemMenu]').data('grilledSaleYn') : '';

		// 최초 사이드메뉴 진입시
		if("ITEM_SIDEDRINK" == cateCd) {
			this.searchSide(cateCd, storCd);
		} else {
            this.getList(1, cateCd, storCd, null, '#itemListMst', grilledSaleYn);
		}

		this.bindEvent();
	},

	// 사이드 선택 영역 돔
	sideSelect : null,

	// 사이드 선택영역 돔 생성
	getSideSelect : function() {
		var div = document.createElement("div");
		var option = document.createElement("option");

		var mother = null;
		var object = null;

		mother = document.createElement("select");
		mother.setAttribute("id", "sideSelect");

		var arr = [
				{"name" : "쿠키"					, "code" : "COOKIE"}
			, {"name" : "칩"						, "code" : "CHIP"}
			, {"name" : "웨지/수프"			, "code" : "SOUP"}
			//, {"name" : "나초"			, "code" : "NACHOS"}
			, {"name" : "음료"					, "code" : "DRINK"}
		];

		arr.forEach(function(item) {
			object = option.cloneNode();
			object.setAttribute("value", item.code);
			object.appendChild(document.createTextNode(item.name));
			mother.appendChild(object);
		});

		object = mother;
		mother = div.cloneNode();
		mother.setAttribute("class", "form_select side_select");
		mother.appendChild(object);

		item.sideSelect = mother;
	},

    getList: function (page, cateCd, storCd, sideType, appendTarget, grilledSaleYn) {
		var param = {
            'cateCd': cateCd
            , 'storCd': storCd
            , 'sideType': sideType
            , 'ordType': $("[name=ordType]").val()
            , 'grilledSaleYn': grilledSaleYn
		};

		$.post("/order/progress/item/list", "POST", JSON.stringify(param), function(data) {
			var isPromotion = "ITEM_PROMOTION" == cateCd;
			var isSide = "ITEM_SIDE" == cateCd;
			$(appendTarget).empty();

			// 리스트 있음
			if(data.results.length > 0) {
				$.each(data.results, function(i, item) {
					var labelArr = [];
					var labelNameArr = [];

					// div flag를 위한 반복
					$.each(data.labelList, function(j, label) {
						if(label.itemIdx != item.itemIdx) {return true;}
						label.labelName = label.cdNm;
						label.labelClassName = label.cdAdd3Val != '' && label.cdAdd3Val != null ? label.cdAdd1Val.toLowerCase() : '';
						label.labelColor = label.cdAdd3Val;
						labelNameArr.push(label.labelClassName);
						labelArr.push(label);
					});

					// 프로모션 가격 설정
					if(isPromotion) {
						item.pric = $.numberFormat(item.pric);
						item.sale = $.numberFormat(item.sale);
					}
					item.labelArr = labelArr;
					item.labelNames = labelNameArr.join(" ");
					item.imgFileUrl = item.itemFileName != null && item.itemFileName != '' ? item.itemFileName : item.itemBaseImage;
					item.imgCache = new Date().getTime();
					item.imgFileUrl = item.imgFileUrl + '?'+item.imgCache
				});

					data.cateCd = cateCd;
					data.imagePath = imagePath;

				var template = $.templates($('#normal-itemList-tmpl').html());
				var htmlOutPut = template.render(data);
				$(appendTarget).html(htmlOutPut);

			// 리스트 없음
			} else {
				var template = $.templates($('#emptyList-tmpl').html());
				var menuGubun = $("li.active [name=itemMenu]").text();
				var htmlOutPut = template.render({"menuGubun" : menuGubun});
				$(appendTarget).html(htmlOutPut);
			}
		}),function(data) {
			alert("통신에러");
		}
	},

	// 사이드 검색
	searchSide : function(cateCd, storCd) {
		// 사이드 검색 객체 추가
		$('#itemListMst').empty();
		$('#itemListMst').append(item.sideSelect);
		var div = document.createElement("div");
		div.setAttribute("id", "sideList");
		$('#itemListMst').append(div);

		// 사이드 초기 검색
		var sideType = $("#sideSelect").val();
		item.getList(1,cateCd, storCd, sideType, '#sideList');
	},

	bindEvent: function() {
		// 상품메뉴 클릭 이벤트
		$('[name=itemMenu]').on('click', function(e) {
			e.preventDefault();

			var cateCd = $(this).data('categoryCode');
			var storCd = $('#storCd').val();
            var grilledSaleYn = cateCd == "ITEM_UNIT" ? $(this).data('grilledSaleYn') : '';

			$("[name=itemMenu]").parent().removeClass("active");
			$(this).parent().addClass("active");
			$("#content").toggleClass("side", "ITEM_SIDEDRINK" == cateCd);
			$("#content").toggleClass("promotion", "ITEM_PROMOTION" == cateCd);

            if ("ITEM_SIDEDRINK" != cateCd) {
                item.getList(1, cateCd, storCd, null, '#itemListMst', grilledSaleYn);
			} else {
				item.searchSide(cateCd, storCd);
			}
		});

		// 사이드 카테고리 변경시
		$(document).on("change", "#sideSelect", function() {
			var cateCd = $('.active [name=itemMenu]').data('categoryCode');
			var storCd = $('#storCd').val();
			var sideType = $("#sideSelect").val();
			item.getList(1,cateCd, storCd, sideType, '#sideList');
		});
	},

	// 일반 제품 다음 스탭
	nextProgress: function (itemIdx, groupCd, menuType, baseItemIdx, cateType) {
		var urlType = cateType.split("_").pop().toLowerCase();
		var obj = {};

		// 프로모션 대상 제품인지 확인
		$.post("/order/progress/checkPromotion", "GET", {"baseItemIdx" : baseItemIdx, "orderType" : $("#ordType").val()
			, "storCd" : $('#storCd').val()}, function(res) {
			var key = groupCd + "_" + menuType;

			if(res.result > 0 && menuType != 'ITEM_SIDEDRINK') {
				if(confirm("선택하신 메뉴는 현재 프로모션이 진행중입니다.\n프로모션 특별 할인가로 주문하시겠습니까?")) {
					$("[data-category-code='ITEM_PROMOTION']").click();
					return false;
				}
			}

			// data mapping
			obj["itemIdx"] 		= itemIdx;
			obj["groupCd"] 		= groupCd;
			obj["menuType"] 	= menuType;
			obj["baseItemIdx"]  = baseItemIdx;
			data.addItemInfo(obj, "/order/progress/"+ urlType +"/view.do");
		});
	},

	// 프로모션 제품 다음 스탭
	nextPromotionProgress: function (itemCode, groupCd, itemDiv1, baseItemIdx, itemName, imgFileUrl, evntDisplayType) {
		// on된 탭의 categoryCode get
		var menuType = $('.active > [name=itemMenu]').data('categoryCode');
		var urlType = (evntDisplayType != null && evntDisplayType == 'N') ? 'promotion' : menuType.split("_").pop().toLowerCase();
		var obj = {};

		// data mapping
		obj["itemCode"] 	= itemCode;
		obj["groupCd"] 		= groupCd;
		obj["menuType"] 	= itemDiv1;
		obj["baseItemIdx"]  = baseItemIdx;
		obj["lsmItemImg"]	= imgFileUrl;
		obj["lsmItemName"]	= itemName;

        data.addItemInfo(obj, "/order/progress/" + urlType + "/view.do");
    },

    // #210409 즐겨찾기 삭제 기능 추가
    delFavoriteItem: function (itemIdx, favoriteItemIdx) {
		if (confirm('즐겨 찾는 메뉴에서 삭제하시겠습니까?')) {
            var param = {
                itemIdx: itemIdx,
                favoriteItemIdx: favoriteItemIdx
            };
            $.post('/mypage/menu/del', "POST", JSON.stringify(param), function (data) {
                if (data.result) {
                    alert("즐겨 찾는 메뉴에서 삭제되었습니다.");
                    item.getList(1, 'ITEM_FAVORITE', $('#storCd').val(), null, '#itemListMst');
                } else {
                    alert("즐겨 찾는 메뉴 삭제 실패하였습니다.");
                }
            }), function (data) {
                alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
            }
        }
    },
    noticeNotUsable: function () {
		alert("판매되지 않는 상품 입니다.");
    }

}

//데이터 저장
var data = {
	addItemInfo : function(data, url) {
		$.ajax({
	        type: "POST",
	        url: "/order/progress/addItemInfo",
	        data: data,
	        async: false,
	        success: function () {
	        	location.href = url;
	        },
	        error: function (xhr, ajaxOptions, thrownError) {
	        	subwayCommon.errorAjaxProcess(xhr);
	        }
	    });
	}
}

$(document).ready(function() {
	item.init();
});
$(window).load(function () {
    if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (navigator.userAgent.indexOf("msie") != -1)) {
        $('.order .menu_list .list li a img.close').attr('style', 'opacity: 0.3;');
    }
});