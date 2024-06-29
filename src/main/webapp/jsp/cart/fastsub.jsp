<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<script type="text/javascript" src="./js/order/common/cartNew.js"></script>
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
					<li class="swiper-slide active"><a href="store.do">FAST-SUB</a></li>
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
							data-url="store.do" data-stor="64444"> 변경
						</a>
					</dd>
				</dl>
				<div class="txt_last_14day">장바구니에 담은 상품만 확인 가능합니다.</div>
				<div class="all_select">
					<label class="form_checkbox"> <input data-target="all"
						type="checkbox" /> <span class="icon"></span> 전체선택
					</label> <a class="btn bgc_white" href="javascript:void(0);"
						id="cartItemDelete"><span>선택삭제</span></a>
				</div>
			</div>
			
			<c:forEach items="${listCartMenu}" var="dto" varStatus="status">
			<ul class="cart_list">
				<li class="wh_box" data-target="row" data-cartIdx="${dto.cseq}"
					data-side="N">
					<div class="order_info">
						<div class="menu_info">
							<label class="form_checkbox"> 
							<input autocomplete="false"	data-target="each" type="checkbox" /> <span class="icon"></span>
								<th:object>${dto.mnname}</th:object>
							</label>
							<p>

								<!-- 빵길이 -->
								<th:object>${dto.clength}cm</th:object>

								<!-- 빵종류 -->
								<th:object>, ${dto.cbread}( ${dto.ctoast})</th:object>

								<!-- 치즈 -->

								<th:object>, ${dto.ccheese}</th:object>


								<!-- 야채 -->

								<th:object>, ${dto.cvegetables}</th:object>

								<!-- 소스 -->


								<th:object>,  ${dto.csauce}</th:object>

							</p>
							<br>
							<dd>
								<strong> 
									<em>
										<fmt:formatNumber value="${dto.mnprice}" groupingUsed="true" />
									</em> 
									<span>원</span>
								</strong>
							</dd>
						</div>
						<img onError="this.src='./images/common/noneImage.jpg'" alt="${dto.mnname}"
							src="./upload/menu/${dto.mnimg}" />
					</div> <!-- 일회용컵선택 -->
					<div class="total">
						<dl class="count">
							<dt>수량</dt>
							<dd>
								<input name="eachPrice" type="hidden" value="${dto.mnprice}" /> 
								<input name="cupItemCd" type="hidden" value="" /> 
								<a class="minus" href="javascript:void(0);">수량 빼기</a> 
								<input name="qty" type="text" value="${dto.cqty}" /> 
								<a class="plus" href="javascript:void(0);">수량 더하기</a>
							</dd>
						</dl>

						<dl class="total_sum">
							<dt>총 주문금액</dt>
							<dd>
								<strong class="eachTotalPrice">
									<fmt:formatNumber value="${dto.cprice * dto.cqty}" groupingUsed="true" />
								</strong> <span>원</span>
							</dd>
						</dl>
					</div>


				</li>
			</ul>
			</c:forEach>

			<div class="final_payment wh_box">
				<dl>
					<dt>최종 결제 금액</dt>
					<dd>
						<strong id="totalPrice">
						<fmt:formatNumber value="${dto.cprice * dto.cqty}" groupingUsed="true" />
						</strong> <span>원</span>
					</dd>
				</dl>
				<div class="btn_area">
					<form method="post" name="orderForm">
						<input name="ordType" type="hidden" value="ORD_TYPE.FAST_SUB" />
						<input name="storCd" type="hidden" value="64444" /> 
						<input name="paveFg" type="hidden" value="Y" />

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