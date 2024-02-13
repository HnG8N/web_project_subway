<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<meta charset="utf-8" />
    <link href="http://subway.co.kr/" rel="canonical" /><!-- 20180221 -->
    <meta content="신선하고 건강한 글로벌 NO.1 샌드위치 브랜드, 써브웨이" name="description" /><!-- 20181212 -->
    <link rel="shortcut icon" type="image/x-icon" href="./images/common/subway_favicon.ico?v=2023051202" />
    <!-- 20180131 -->
    <link rel="stylesheet" type="text/css" href="./css/ui.common.css?v=2023051202" />
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
      
	<link rel="stylesheet" type="text/css" href="./css/ui.cart.css?v=2023051202" />
	<script type="text/javascript" src="./js/order/common/cart.js?v=2023051202"></script>
	<script>
	/*<![CDATA[*/
	var cartGubun = 'fast';
	/*]]>*/
	</script>
</head>
<body>
	<%@ include file="/jsp/include/header.jsp"%>
	<!-- container s -->
	<div id="container">
		<!-- sub content s -->
		<div class="cart fast_sub" id="content">
			<!-- index -->
			<h2 class="subTitle_02">장바구니</h2>
			<div class="tab02">
				<ul>
					<li class="swiper-slide active"><a href="/cart/fastsub">FAST-SUB</a></li>
					<li class="swiper-slide "><a href="/cart/homesub">HOME-SUB</a></li>
				</ul>
			</div>
			<!-- 장바구니 목록 있을때 -->

			<div class="cart_header wh_box">
				<dl>
					<dt>
						<span>픽업매장</span>
					</dt>
					<dd>
						<strong>강남우성점 (서울특별시 강남구 강남대로66길 6)</strong> <a
							href="javascript:void(0);" id="changeStore"
							data-url="/order/view/fast/near/store" data-stor="64444"> 변경
						</a>
					</dd>
				</dl>
				<div class="txt_last_14day">최근 14일 이내 담은 상품만 확인 가능합니다.</div>
				<div class="all_select">
					<label class="form_checkbox"> <input data-target="all"
						type="checkbox" /> <span class="icon"></span> 전체선택
					</label> <a class="btn bgc_white" href="javascript:void(0);"
						id="cartItemDelete"><span>선택삭제</span></a>
				</div>
			</div>
			<ul class="cart_list">
				<li class="wh_box" data-target="row" data-cartIdx="8010794"
					data-side="N">

					<div class="order_info">
						<div class="menu_info">
							<label class="form_checkbox"> <input autocomplete="false"
								data-target="each" type="checkbox" /> <span class="icon"></span>
								<th:object>비엘티</th:object>
							</label>
							<p>

								<!-- 빵길이 -->
								<th:object>15cm</th:object>

								<!-- 빵종류 -->
								<th:object>, 플랫브레드(토스팅)</th:object>

								<!-- 치즈 -->

								<th:object>, 아메리칸치즈</th:object>


								<!-- 야채 -->


								<th:object>, 양상추</th:object>


								<th:object>, 토마토</th:object>


								<th:object>, 오이</th:object>


								<th:object>, 피망</th:object>


								<th:object>, 양파</th:object>




								<!-- 소스 -->


								<th:object>, 마요네즈</th:object>


								<th:object>, 사우스웨스트 치폴레</th:object>




							</p>
							<strong> <em>6,600</em> <span>원</span>
							</strong>
						</div>
						<img onError="this.src='/images/common/noneImage.jpg'" alt="비엘티"
							src="" />
					</div> <!-- 일회용컵선택 -->

					<div class="total">
						<dl class="count">
							<dt>수량</dt>
							<dd>
								<input name="eachPrice" type="hidden" value="6600" /> <input
									name="cupItemCd" type="hidden" value="" /> <a class="minus"
									href="javascript:void(0);">수량 빼기</a> <input name="qty"
									type="text" value="1" /> <a class="plus"
									href="javascript:void(0);">수량 더하기</a>
							</dd>
						</dl>

						<dl class="total_sum">
							<dt>총 주문금액</dt>
							<dd>
								<strong class="eachTotalPrice">6,600</strong> <span>원</span>
							</dd>
						</dl>
					</div>


				</li>
			</ul>

			<div class="detail_info wh_box" id="cupDiv" style="display: none;">
				<strong class="title">일회용컵 보증금</strong>
				<dl class="detail_list">
					<dt class="oneCup">
						<em>추가</em> <span id="oneCup">일회용컵 2개</span>
					</dt>
					<dd class="oneCup">
						<strong id="oneCupAmt">600</strong> <span>원</span>
					</dd>
					<dt class="reuseCup">
						<em>추가</em> <span id="reuseCup">개인컵 1개</span>
					</dt>
					<dd class="reuseCup">
						<strong>0</strong> <span>원</span>
					</dd>
				</dl>
			</div>


			<div class="final_payment wh_box">
				<dl>
					<dt>최종 결제 금액</dt>
					<dd>
						<strong id="totalPrice">0</strong> <span>원</span>
					</dd>
				</dl>
				<div class="btn_area">
					<form method="post" name="orderForm">
						<input name="ordType" type="hidden" value="ORD_TYPE.FAST_SUB" />
						<input name="storCd" type="hidden" value="64444" /> <input
							name="paveFg" type="hidden" value="Y" />

					</form>
					<a class="btn bgc_white" href="javascript:void(0);" id="addMenu"><span>메뉴추가하기</span></a>
					<a class="btn bgc_point i_reg" href="javascript:void(0);"
						id="setOrder" data-cart-type="CART_TYPE.FAST_SUB"><span>주문하기</span></a>
				</div>
			</div>


			<!-- 장바구니 목록 없을때 -->


			<!--// index -->
		</div>
		<!--// sub content e -->
	</div>
	<%@ include file="/jsp/include/footer.jsp"%>
</body>
</html>