var naverMap = {
		map: null,
		markers: [],
		infoWindows: [],
		HOME_PATH : window.HOME_PATH || '.',
		MARKER_SPRITE_X_OFFSET : 29,
		MARKER_SPRITE_Y_OFFSET : 50,
		MARKER_SPRITE_POSITION : {},
		init: function(initLoc) {

			naverMap.map = new naver.maps.Map(document.getElementById('uiShopMap'), {
				useStyleMap:true,
				zoom: 15,
				minZoom: 8,
				//zoomControl: true,
				//scaleControl: true,
				//mapTypeControl: true,
				zoomControlOptions: { //줌 컨트롤의 옵션
		            position: naver.maps.Position.BOTTOM_RIGHT
		        }
			});

			//naverMap.infowindow = new naver.maps.InfoWindow();

			if (initLoc == null && navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(naverMap.onSuccessGeolocation, naverMap.onErrorGeolocation);
		    }
			else {
				naverMap.map.setCenter(initLoc);
			}
		},
		push: function(shop, callback) {

			//기존 마커 삭제
			naverMap.removeMarkers();

			//지도에 표시하기
			var bounds = naverMap.map.getBounds(),
			    southWest = bounds.getSW(),
			    northEast = bounds.getNE();

			var markers = [],
		    	infoWindows = [];

			var center, index=0;
			for (var key in naverMap.MARKER_SPRITE_POSITION) {

				var position = new naver.maps.LatLng(
						naverMap.MARKER_SPRITE_POSITION[key][1],
						naverMap.MARKER_SPRITE_POSITION[key][0]);

				if(center == null || center == undefined ) {
					center = position;
				}

			    var marker = new naver.maps.Marker({
					map: naverMap.map,
					position: position,
					title: key,
					// icon: {
					// 	// url: naverMap.HOME_PATH +'/img/example/sp_pins_spot_v3.png',
					// 	url: '/images/subway/icon_pin.png',
					// 	size: new naver.maps.Size(40, 58),
					// 	origin: new naver.maps.Point(0, 0),
					// 	anchor: new naver.maps.Point(25, 26)
					// },
					zIndex: index
				});
			    
				//마커 정보창
				if(shop[index].ordTmYn == 'Y'){
						var infoWindow = new naver.maps.InfoWindow({
						content: [
							'<div class="store_map_layer" style="position: absolute; left: 0; top: 0; z-index: 10; width: 300px; height: 0%; border: 1px solid #cfcfcf; background: #fff; box-sizing: border-box;">',
							'   <h4>' + shop[index].storNm + '</h4>',
							'   <dl>',
							'		<dt>주소</dt>	',
							'   	<dd>' + shop[index].storAddr1 + ' ' + shop[index].storAddr2 +'</dd>',
							'		<dt>연락처</dt>',
							'   	<dd>' + shop[index].storTel.phoneFomatter('-') + '</dd>',
							'		<dt>영업시간</dt>',
							'   	<dd>' + shop[index].openTmString.timeFormat() + ' ~ ' + shop[index].closeTmString.timeFormat() + ' </dd>',
							'   </dl>',
							'<a href="/order/progress/selectFastSub" class="btn_order on" id="ord_fast" onclick="view.ord(this);popup_open(this,500,440); return false;" data-storcd="' + shop[index].storCd + '"><span>주문하기</span></a>',
							'<a href="javascript:void(0);" onclick="naverMap.closeMarker(' + [index] + ',' + shop[index].lat + ',' + shop[index].lon + ');" class="layer_close">팝업 레이어 닫기</a>',
							'<br/>',
							'</div>'
						].join(''),
					});
				} else{
					var infoWindow = new naver.maps.InfoWindow({
						content: [
							'<div class="store_map_layer" style="position: absolute; left: 0; top: 0; z-index: 10; width: 300px; height: 0%; border: 1px solid #cfcfcf; background: #fff; box-sizing: border-box;">',
							'   <h4>' + shop[index].storNm + '</h4>',
							'   <dl>',
							'		<dt>주소</dt>	',
							'   	<dd>' + shop[index].storAddr1 + ' ' + shop[index].storAddr2 +'</dd>',
							'		<dt>연락처</dt>',
							'   	<dd>' + shop[index].storTel.phoneFomatter('-') + '</dd>',
							'		<dt>영업시간</dt>',
							'   	<dd>' + shop[index].openTmString.timeFormat() + ' ~ ' + shop[index].closeTmString.timeFormat() + ' </dd>',
							'   </dl>',
							'<a href="javascript:void(0);" class="btn_order" onclick="view.ordNot();"><span>주문불가</span></a>',
							'<a href="javascript:void(0);" onclick="naverMap.closeMarker(' + [index] + ',' + shop[index].lat + ',' + shop[index].lon + ');" class="layer_close">팝업 레이어 닫기</a>',
							'<br/>',
							'</div>'
						].join(''),
					});
				}

				markers.push(marker);
				infoWindows.push(infoWindow);

				index++;
			};

			//naver.maps.Event.addListener(naverMap.map, 'idle', function() {
			//	naverMap.updateMarkers(naverMap.map, markers);
			//});

			if(center != null && center != undefined )
				naverMap.map.setCenter(center);

			naverMap.infoWindows = infoWindows;
			naverMap.markers = markers;

			for(var i=0;i<markers.length;i++) {
				naver.maps.Event.addListener(markers[i], 'click', naverMap.getClickHandler(i, callback));
			}
			//naverMap.infoWindows[0].open(naverMap.map, markers[0]);
		},
		
		closeMarker : function(seq,lat,lon){
			var marker = naverMap.markers[seq],
			infoWindow = naverMap.infoWindows[seq];
			
			if(window.location.pathname != '/storeSearch'){	
				if (infoWindow.getMap()) {
					infoWindow.close();
				} else {
					infoWindow.open(naverMap.map, marker);
					var mapCooder = new naver.maps.LatLng(lat,lon);
					naverMap.moveCenter(mapCooder, 0);

				}
			}
		},
		
	
		getClickHandler: function(seq, callback) {
			return function(e) {
				var marker = naverMap.markers[seq],
					infoWindow = naverMap.infoWindows[seq];
				//마커 클릭시 정보창 출력
			if(window.location.pathname != '/storeSearch'){	
				if (infoWindow.getMap()) {
					infoWindow.close();
				} else {
					infoWindow.open(naverMap.map, marker);
					
				}
			}

				callback(marker, seq);
			}
		},
		updateMarkers: function(map, markers) {
			var mapBounds = map.getBounds();
			var marker, position;

			for (var i = 0; i < markers.length; i++) {

				marker = markers[i]
				position = marker.getPosition();

				if (mapBounds.hasLatLng(position)) {
					if (marker.setMap()) return;
					marker.setMap(map);
				} else {
					if (!marker.setMap()) return;
					marker.setMap(null);
				}
			}
		},
		removeMarkers: function() {
			for (var i = 0; i < naverMap.markers.length; i++) {
				naverMap.markers[i].setMap(null);
			}
			naverMap.markers = [];
			naverMap.infoWindows = [];
		},
		onSuccessGeolocation: function(position) {
			var location = new naver.maps.LatLng(position.coords.latitude,
												 position.coords.longitude);

			naverMap.map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
			//naverMap.map.setZoom(10); // 지도의 줌 레벨을 변경합니다.
		},
		onErrorGeolocation: function() {
		    //var center = naverMap.map.getCenter();
		    //naverMap.infowindow.open(naverMap.map, center);
		}
		// 매장목록 클릭 시 네이버지도 선택 매장으로 중앙 이동 처리 _by ahn.180212
		, moveCenter: function(param, index) {
			naverMap.map.setCenter(param);
			naverMap.map.setZoom(15);
			// naverMap.infoWindows[index].open(naverMap.map, naverMap.markers[index]);
		}
}