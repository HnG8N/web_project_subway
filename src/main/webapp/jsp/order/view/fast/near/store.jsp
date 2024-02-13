<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
    <link href="http://subway.co.kr/" rel="canonical" /><!-- 20180221 -->
    <meta content="신선하고 건강한 글로벌 NO.1 샌드위치 브랜드, 써브웨이" name="description" /><!-- 20181212 -->
    <link rel="shortcut icon" type="image/x-icon" href="./images/common/subway_favicon.ico?v=2023051202" />
    
	<link rel="stylesheet" type="text/css" href="./css/ui.common.css?v=2023051202" />
	<link rel="stylesheet" type="text/css" href="./css/ui.main.css?v=2023051202" />
	<link rel="stylesheet" type="text/css" href="./css/ui.menu.css?v=2023051202" />
	<link rel="stylesheet" type="text/css" href="./css/ui.order.css?v=2023051202" />
	<link rel="stylesheet" type="text/css" href="./css/jquery.mCustomScrollbar.min.css?v=2023051202" />

    <script type="text/javascript" src="./js/jquery/jquery-1.12.4.min.js?v=2023051202"></script>
    <script type="text/javascript" src="./js/jquery/jquery-ui-1.12.0.min.js?v=2023051202"></script>
    <script type="text/javascript" src="./js/jquery/jquery.easing.1.3.min.js?v=2023051202"></script>
    <script type="text/javascript" src="./js/jquery/jquery.bxslider.min.js?v=2023051202"></script>
    <script type="text/javascript" src="./js/jquery/jquery.mCustomScrollbar.concat.min.js?v=2023051202"></script>
    <!-- block ui -->
    <script type="text/javascript" src="./js/jquery/jquery.blockUI.min.js?v=2023051202"></script>

    <script type="text/javascript" src="./js/jquery/TweenMax.min.js?v=2023051202"></script>
    <script type="text/javascript" src="./js/jquery/jquery.cookie.js?v=2023051202"></script>
    <!--<script type="text/javascript" th:src="'/js/lottie.js?v=' + ${cacheParam}"></script>-->
    <script type="text/javascript" src="./js/ui.common.js?v=2023051202"></script>
    <script type="text/javascript" src="./js/subway.common.js?v=2023051202"></script>
    <script type="text/javascript" src="./js/util/jsrender.js?v=2023051202"></script>
    <script type="text/javascript" src="./js/jquery/jquery.tmpl.min.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/waffle/waffle.utils.js?v=2023051202"></script>
	
	<link rel="stylesheet" type="text/css" href="./css/ui.order.css?v=2023051202" />
	
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bva5oks3qe&amp;submodules=geocoder"></script>
	<script type="text/javascript" src="./js/subway.map.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/subway.pagination.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/favorite/favoriteStore.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/order/fastsub/store_map.js?v=2023051202"></script>

<!-- 추가적인 스타일 및 스크립트 파일들을 여기에 추가 -->
</head>
<body>
	<%@ include file="/jsp/include/header.jsp"%>
	<!-- container s -->
	<div id="container">
		<input id="page" name="page" type="hidden" value="1" /> <input
			id="loc" type="hidden" value="Y" />
		<!-- sub content s -->
		<div class="order fast_sub" id="content">
			<!-- index -->
			<div class="store_map">
				<div class="order_title">
					<h3>Fast-Sub</h3>
					<p>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</p>
				</div>
				<ol class="order_step">
					<li class="step_shop on"><strong>STEP 1</strong> 매장선택</li>
					<li class="step_menu"><strong>STEP 2</strong> 메뉴선택</li>
					<li class="step_order"><strong>STEP 3</strong> 주문하기</li>
					<li class="step_payment"><strong>STEP 4</strong> 결제하기</li>
				</ol>
				<form method="post" name="orderForm">
					<input name="cartStorCd" type="hidden" value="" /> <input
						name="storCd" type="hidden" /> <input name="ordType"
						type="hidden" value="ORD_TYPE.FAST_SUB" /> <input name="changeYn"
						type="hidden" value="N" /> <input name="paveFg" type="hidden"
						value="" />
				</form>
				<div class="tab02">
					<ul>
						<li class="active"><a href="store.do">매장찾기</a></li>
						<li><a href="#">자주 찾는 매장</a></li>
					</ul>
				</div>
				<div class="order_con order_map">
					<!-- map api area w1170 h819 -->
					<div class="map_api">
						<div id="uiShopMap" style="height: 820px;"></div>
					</div>
					<!--// map api area -->
					<div class="store_search">
						<h3>매장찾기</h3>
						<fieldset>
							<legend>매장 검색</legend>
							<div class="form_search">
								<input autocomplete="off" id="keyword" maxlength="30"
									placeholder="지역 또는 매장명 입력" type="text" /> <a
									class="btn_search" href="javascript:void(0);" id="search"></a>
							</div>
							<p id="search_result">
								<strong>''</strong>검색 결과 <em>0</em>건
							</p>
						</fieldset>
						<div class="store_list">
							<ul id="uiResultList"></ul>
							<!-- board 페이지 -->
							<div class="pagination" id="ui_pager"></div>
							<!--// board 페이지 -->
						</div>
						<!-- 검색 결과 없을 때
							<div class="data_none">
								<p>검색 결과가 없습니다.</p>
							</div>
							-->
					</div>
				</div>
			</div>

			<script id="franchiseList" type="text/x-jQuery-tmpl">
						<li>
							<dl>
								<dt>
									<strong>{{:storNm}} </strong>
									<label class="my_bookmark">
										{{if favorYn == 'Y'}}
											<input type="checkbox" data-frno="{{:franchiseNo}}" data-storcd ="{{:storCd}}" data-idx="{{:franchiseIdx}}" onclick="favor.favorite(this)" checked >
										{{else}}
											<input type="checkbox" data-frno="{{:franchiseNo}}" data-storcd ="{{:storCd}}" data-idx="{{:franchiseIdx}}" onclick="favor.favorite(this)">
										{{/if}}
											<i class="i_star"></i>
									</label>

									{{if ordTmYn == 'Y'}}
										<em class="on" onclick ="naverMap.closeMarker({{:index}},{{:lat}},{{:lon}})" style="cursor:pointer;">주문하기</em>
									{{else}}
										<em  onclick ="naverMap.closeMarker({{:index}},{{:lat}},{{:lon}})" style="cursor:pointer;">주문불가</em>
									{{/if}}
								</dt>
								{{if oneCupYn == 'Y'}}
								<dd class="notice">
									<p>* 일회용컵 보증금제 참여 매장</p>
								</dd>
								{{/if}}
								{{if pickupTime != null && pickupTime != ''}}
								<dd class="delivery time">
									<p>예상 소요시간</p>
									<span>{{:pickupTime}}분</span>
								</dd>
								{{/if}}

								<dd>
									<p>{{:storAddr1}} {{:storAddr2}} </p>
									<p>{{:storTel.phoneFomatter('-')}}</p>
										<span>{{:distance}}</span>
								</dd>
							</dl>
						</li>
				</script>
		</div>
		<!--// sub content e -->
	</div>
	<!-- container e -->
	<%@ include file="/jsp/include/footer.jsp"%>
</body>
</html>