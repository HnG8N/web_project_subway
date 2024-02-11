var map;
var view = {
	init : function() {

		// Pagination 설정
		pagination.requestData.itemCountPerPage = 5; // 한 페이지에 노출할 게시글의 수
		pagination.requestData.displayPageNoCount = 5; // 노출되는 페이지번호의 최대 갯수
		pagination.pagerId = "#ui_pager";
		pagination.onclick = function(target, pageNo) {
			shopMap.keyword = $("#keyword").val().trim();
			shopMap.page = pageNo;
			shopMap.mapList();
		};

		$("#rgn1Nm").on("change", function() {
			$("#rgn2Nm").val("");
			// $("#dong").val("");
			$("#page").val("1");
			view.submit();
		});
		$("#rgn2Nm").on("change", function() {
			// $("#dong").val("");
			$("#page").val("1");
			view.submit();
		});

		if ($("#rgn1Nm").val().trim() == "세종특별자치시") {
			$("#rgn2Nm").parent().hide();
		} else {
			$("#rgn2Nm").show();
		}

		naverMap.init();
	},

	submit : function() {
		$("#searchFrm")[0].action = "#storeList";
		$("#searchFrm")[0].submit();
	},

	param : function() {
		var paramObj = new Object();
		paramObj.page = $("#page").val();
	},

	location : function(paramObj, ts) {
		$.post("./ajaxFranchiseLocation", "POST", JSON.stringify(paramObj),
				function(data) {
					$(ts).children("option").not(":first").remove();
					if (data != null && data.length > 0) {
						data.forEach(function(f) {
							switch (ts) {
							case "#rgn2Cd":
								$(ts).append(
										'<option value="' + f.rgn2Cd + '">'
												+ f.rgn2Nm + '</option>');
								break;
							case "#dong":
								$(ts).append(
										'<option value="' + f.dong + '">'
												+ f.dong + '</option>');
								break;
							}
						});
					}
				}, function(message) {

				});
	}
}

var shopMap = {
	page : 1,
	keyword : "",
	infoWindow: null,

	search : function() {
		try {

			if ($("#keyword").val().trim() == "") {
				alert("지역 또는 매장명을 입력해주세요.");
				$("#keyword").focus();
				return false;
			}
			if ($("#keyword").val().trim().length < 2) {
				alert("검색어는 2자 이상 입력해주세요.");
				$("#keyword").focus();
				return false;
			}
			shopMap.keyword = $("#keyword").val().trim();
			shopMap.page = 1;

			shopMap.mapList();

		} catch (e) {

		}

		return false;
	},

	mapList : function() {

		pagination
				.requestPage({
					url : "./ajaxStoreSearch",
					param : {
						"keyword" : shopMap.keyword,
						"page" : shopMap.page
					},
					pageNo : shopMap.page,
					success : function(result) {
						var franchiseInfoList = result["searchResult"];
						$("#uiReslutCont").show(0, function() {
							var totalItemCount = (franchiseInfoList == null) ? 0 : pagination.responseData.totalItemCount;
							$("#uiResultCount").text(totalItemCount);
							$("#uiResultList").empty();
							if (franchiseInfoList != null && franchiseInfoList.length > 0) {
								$("#uiResultList").show(0, function() {
									var data = new Object();
									data.franchiseInfoList = franchiseInfoList;
									data.pageNo = totalItemCount - (pagination.requestData.itemCountPerPage * (pagination.requestData.pageNo - 1));
									$("#franchiseList").tmpl(data).appendTo("#uiResultList");

									// 지도 좌표 찍기
									var shop = [];
									var position = new Object();
									franchiseInfoList.forEach(function(f) {
										if (f.lon != null && f.lon != "" && f.lat != null && f.lat != "") {
											position[f.storNm] = [f.lon, f.lat ];
											shop.push(f);
										}
									});
									naverMap.MARKER_SPRITE_POSITION = position;
									naverMap.push(shop, shopMap.select);
								});
							} else {
								$("#uiResultList").hide();
								naverMap.removeMarkers();
							}
						});
					},
					error : function(xhr, ajaxOptions, thrownError) {
						alert("정보 조회 처리중 오류가 발생 하였습니다.\n\nERROR: "
								+ thrownError);
					}
				});
	},

	shopList : function() {
		pagination
				.requestPage({
					url : "./ajaxStoreSearch",
					param : {
						"rgn1Cd" : $("#rgn2Cd").val(""),
						"rgn2Cd" : $("#rgn1Cd").val(""),
						"dong" : "", // $("#dong").val(""),
						"page" : $("#page").val()
					},
					pageNo : $("#page").val(),
					success : function(result) {
						var franchiseInfoList = result["searchResult"];
						$("#uiReslutCont").show(0, function() {
							var len = (franchiseInfoList == null) ? 0 : franchiseInfoList.length;
							$("#pageCount").text(len);
							$("#uiResultList").empty();
							if (len > 0) {
								$("#uiResultList").show(0, function() {
									var data = new Object();
									data.franchiseInfoList = franchiseInfoList;
									data.pageNo = pagination.responseData.totalItemCount - (pagination.requestData.itemCountPerPage * (pagination.requestData.pageNo - 1));
									$("#franchiseList").tmpl(data).appendTo("#uiResultList");
								});
							} else {
								$("#uiResultList").hide();
							}
						});
					},
					error : function(xhr, ajaxOptions, thrownError) {
						alert("정보 조회 처리중 오류가 발생 하였습니다.\n\nERROR: "
								+ thrownError);
					}
				});
	},
	select : function(marker, index) {
		// console.log(index);
		var scrollPosition = $("#uiResultList").children("li")
				.eq(marker.zIndex).offset().top;
		$(".store_list_scroll").mCustomScrollbar("scrollTo",
				$("#uiResultList").children("li").eq(marker.zIndex));
	}
	// 매장목록 클릭 시 네이버지도 선택 매장으로 중앙 이동 처리 _by ahn.180212
	, setMapCenter : function(lat, lng, index, franchiseNo) {
		var mapCooder = new naver.maps.LatLng(lat, lng);
		naverMap.moveCenter(mapCooder, index);
	}

	//  매장정보 레이어 팝업
	, showStoreInfoLayer: function(franchiseNo, storeName, storeAddr1, storeAddr2, storeTel, openTm, closeTm, lat, lng, etc) {

		//  지도 이동
		var mapCooder = new naver.maps.LatLng(lat, lng);
		naverMap.moveCenter(mapCooder, 0);


		//  마커
		var marker = new naver.maps.Marker({
		    position: mapCooder,
		    map: naverMap.map,
			title: ""
		});


		//  마커위 정보창
		shopMap.infoWindow = new naver.maps.InfoWindow({
			content: [
				"<div class='store_map_layer'>",
				"	<div class='head'>",
				"		<strong>" + storeName + "</strong>",
				"		<a href='#none' class='btn_close' onclick='shopMap.infoWindow.close();'>닫기</a>",
				"	</div>",
				"	<div class='info'>",
				"		<dl>",
				"			<dt>주소</dt>",
				"			<dd id='ui_storeInfoLayer_addr'>",
				storeAddr1 + " " + storeAddr2,
				"			</dd>",
				"			<dt>연락처</dt>",
				"			<dd>" + (storeTel == '' ? '-' : storeTel.phoneFomatter('-')) + "</dd>",
				"			<dt>영업시간</dt>",
				"			<dd>"+ openTm.timeFormat() + " - " + closeTm.timeFormat() +"</dd>",
				"				" + (etc == '' ? '' : "<dd>" + etc + "</dd>"),
				"		</dl>",
				"	</div>",
				"	<div class='foot'>",
				"		<a href='/storeDetail?franchiseNo=" + franchiseNo + "' target='blank'>자세히보기</a>",
				"	</div>",
				"</div>"
			].join('')
		});
		shopMap.infoWindow.open(naverMap.map, marker);
	}
}

var paging = {
	page : function(page) {
		$("input:hidden[name=page]").val(page);
		view.submit();
	},
	prev : function(block) {
		var page = $("input:hidden[name=page]").val();
		if (page > 1) {
			paging.page(page - 1);
		} else {
			return false;
		}
	},
	next : function(block) {
		var page = Number($("input:hidden[name=page]").val()) + 1;
		if (page <= block) {
			paging.page(page);
		} else {
			return false;
		}
	}
}

$(document).ready(function() {
	view.init();

});