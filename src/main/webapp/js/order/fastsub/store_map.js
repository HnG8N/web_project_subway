var map;
var view  = {

	init : function() {
		// Pagination 설정
		pagination.requestData.itemCountPerPage = 100; // 한 페이지에 노출할 게시글의 수
		pagination.requestData.displayPageNoCount = 1; // 노출되는 페이지번호의 최대 갯수
		pagination.pagerId = "#ui_pager";
		pagination.onclick = function(target, pageNo) {
			shopMap.keyword = $("#keyword").val().trim();
			shopMap.page = pageNo;
			shopMap.shopList();
		};

        // naverMap.init();
        view.bindEvent();

        // 위치정보 동의여부에 따른 위치서비스 분기처리.
        var loc = $('#loc').val();
        if (loc == 'Y') {
            view.location();
        } else {
            naverMap.init();
        }
    },

	bindEvent : function() {
		$('#keyword').keydown(function(key){
			if (key.keyCode == 13) {
				$('#search').click();
			}
        });

		// 검색 이벤트
		$('#search').on('click', function(){
			try {

				if($("#keyword").val().trim() == "") {
					alert("지역 또는 매장명을 입력해주세요.");
					$("#keyword").focus();
					return false;
				}

				if($("#keyword").val().trim().length < 2) {
					alert("검색어는 2자 이상 입력해주세요.");
					$("#keyword").focus();
					return false;
				}

				shopMap.keyword = $("#keyword").val().trim();
				shopMap.page = 1;
				shopMap.shopList();
			} catch(e) {

			}

			return false;
		});
    },

    // 위치정보 가져오기
    location: function () {

        if (navigator.geolocation) {
            naverMap.init();
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        } else {
            alert('브라우저가 위치를 지원하지 않습니다.');
        }

        function showPosition(position) {
            shopMap.lat = position.coords.latitude;
            shopMap.lon = position.coords.longitude;
            shopMap.mapList();
        }

        function showError(error) {
            switch (error.code) {
                case error.PERMISSION_DENIED:
                    alert('브라우저가 위치를 지원하지 않습니다.');
                    break;
            }
        }
    },

	keywordClear: function() {
		$("#keyword").val("");
		$("#keywordClear").hide();
	},

    // 주문 2단계로 넘어가기
	ord : function(frm) {
		var storCd = $(frm).data('storcd');
		var orderForm = $(document).find("[name=orderForm]");
		orderForm.find("[name=storCd]").val(storCd);
		//view.addStorInfo(orderForm.serialize(), "/order/progress/step2");
		//orderForm.attr("action", "/order/progress/step2");

    },

    setPaveFg : function(paveFg) {
        // 주문 2단계로 넘어가기
        var orderForm = $(document).find("[name=orderForm]");
        orderForm.find("[name=paveFg]").val(paveFg);
        view.addStorInfo(orderForm.serialize(), "/order/progress/step2");
    },

	//데이터 저장
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
	ordNot : function(){
		//alert('현재 온라인 주문 가능한 시간이 아닙니다. Fast-Sub 주문은 영업 마감 30분 전까지 가능합니다.');
		alert('지금은 매장 사정으로 인해 온라인 주문이 불가합니다.');
		return false;
	}


}

var shopMap = {
    keyword: "",
    page: 1,
    // 검색 리스트 ajax
    shopList: function () {
        pagination
            .requestPage({
                url: "/order/view/group/search/group/store",
                param: {
                    "lat": '',
                    "lon": '',
                    "keyword": shopMap.keyword,
                    "ordType": 'ORD_TYPE.FAST_SUB',
                    "page": shopMap.page
                },
                pageNo: shopMap.page,
                // 검색 ajax
                success: function (result) {

                    var franchiseInfoList = result["searchResult"];

                    //랜더 비우기
                    $("#mCSB_1_container").empty();

                    if (franchiseInfoList != null && franchiseInfoList.length > 0) {

                        $('.data_none').hide();
                        var data = new Object();
                        var htmlOutput = ''

                        data.franchiseInfoList = franchiseInfoList;
                        $('#search_result strong').html("'" + shopMap.keyword + "' ");
                        $('#search_result em').html(result.count);

                        //랜더 그리기
                        $.each(franchiseInfoList, function (i, v) {

                            data = franchiseInfoList[i];
                            data.index = [i];
                            var template = $.templates($("#franchiseList").html());
                            htmlOutput += template.render(data);
                        });

                        $("#mCSB_1_container").html(htmlOutput);

                        //지도 좌표 찍기
                        var shop = [];
                        var position = new Object();

                        franchiseInfoList.forEach(function (f) {
                            if (f.lon != null && f.lon != "" && f.lat != null && f.lat != "") {
                                position[f.storNm] = [f.lon, f.lat];
                                shop.push(f);
                            }
                        });

                        shop = franchiseInfoList;
                        // 지도 중심을 첫번째 나오는 매장으로 설정
                        var location = new naver.maps.LatLng(shop[0].lat, shop[0].lon);
                        naverMap.init(location);

                        naverMap.MARKER_SPRITE_POSITION = position;
                        naverMap.push(shop, shopMap.select);
                        $('.map_area').focus();
                    } else {
                        naverMap.removeMarkers();
                        $('#search_result strong').html("'" + shopMap.keyword + "'");
                        $('#search_result em').html(result.count);
                        $("#mCSB_1_container").html('');
                        $('.data_none').show();
                        $('.map_area').focus();
                    }
                }
            });
    },

    select: function (marker, index) {
    },

    mapList: function () {
        var param = {
            "lat": shopMap.lat,
            "lon": shopMap.lon,
            "ordType": 'ORD_TYPE.FAST_SUB'
        };
        $.post("/mypage/franchise/form/near/store", "POST", JSON.stringify(param), function (result) {

            var franchiseInfoList = result["searchResult"];

            //랜더 비우기
            $("#mCSB_1_container").empty();

            if (franchiseInfoList != null && franchiseInfoList.length > 0) {
                $('.data_none').hide();

                var data = new Object();
                var htmlOutput = '';

                data.franchiseInfoList = franchiseInfoList;
                $('#search_result strong').hide();
                $('#search_result em').html(franchiseInfoList.length);

                //랜더 그리기
                $.each(franchiseInfoList, function (i, v) {

                    data = franchiseInfoList[i];
                    data.index = [i];
                    var template = $.templates($("#franchiseList").html());
                    htmlOutput += template.render(data);
                });

                $("#mCSB_1_container").html(htmlOutput);

                //지도 좌표 찍기
                var shop = [];
                var position = new Object();

                franchiseInfoList.forEach(function (f) {
                    if (f.lon != null && f.lon != "" && f.lat != null && f.lat != "") {
                        position[f.storNm] = [f.lon, f.lat];
                        shop.push(f);
                    }
                });

                shop = franchiseInfoList;
                // 지도 중심을 첫번째 나오는 매장으로 설정
                var location = new naver.maps.LatLng(shop[0].lat, shop[0].lon);
                naverMap.init(location);

                naverMap.MARKER_SPRITE_POSITION = position;
                naverMap.push(shop, shopMap.select);
                $('.map_area').focus();
            } else {
                naverMap.removeMarkers();

                $('#search_result strong').html("'" + shopMap.keyword + "'");
                $('#search_result em').html(result.count);
                $("#mCSB_1_container").html('');
                $('.data_none').show();
                $('.map_area').focus();
            }
        }), function (data) {
            alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
        }
    },
}

var paging = {
    page: function (page) {
        $("input:hidden[name=page]").val(page);
        view.submit();
    },
    prev: function (block) {
        var page = $("input:hidden[name=page]").val();
        if (page > 1) {
            paging.page(page - 1);
        } else {
            return false;
        }
    },
    next: function (block) {
        var page = Number($("input:hidden[name=page]").val()) + 1;
        if (page <= block) {
            paging.page(page);
        } else {
            return false;
        }
    }
}

$(function() {
	view.init();
});