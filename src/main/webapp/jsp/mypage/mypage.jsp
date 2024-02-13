<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	
	<script type="text/javascript" src="./js/mypage/mypage.js?v=2023051202"></script>
	<link rel="stylesheet" type="text/css" href="./css/ui.mypage.css?v=2023051202" />
	<script>
		$(document).ready(function() {
			myIndexEvent();
			multiple_line();
		});
	</script>
	<script>
		$(function() {
			$(".evt_bnr_wrap .slide_wrapper").bxSlider({
				infiniteLoop : true,
			});
		});
	
		function add_storeFn() {
			if ($('#franchise_count').val() > 2) {
				alert('자주 찾는 매장은 최대 3개까지 등록 가능 합니다.');
				return false;
			}
			location.href = "/mypage/store/bookmark/find/nearStore";
		}
	
		function multiple_line() {
			$(".multiple_line").each(function() {
				var length = 29; //표시할 글자수 정하기
	
				if ($(this).text().length >= length) {
					$('.multiple_line').addClass('ver_ellipsis');
					$(this).text($(this).text().substr(0, length) + '...') //지정할 글자수 이후 표시할 텍스트
				}
			});
		}
	</script>
	
</head>
<body>
	<%@ include file="/jsp/include/header.jsp"%>
	<!-- container s -->
	<div id="container">
		<!-- E-GIFT 선물 -->
		<input id="egiftOrdNo" name="egiftOrdNo" type="hidden" value="" />

		<!-- sub content s -->
		<div id="content">
			<!-- My SUB Index -->
			<div class="mysub_index">
				<h2 class="subTitle_02 font_sw">MY SUB</h2>
				<section class="member_active">
					<!-- 회원정보 -->
					<section class="my_info">
						<div class="info member">
							<div class="name_gender">
								<i class="character female"></i>
								<p class="name">
									<strong><em class="multiple_line">김수진</em>님</strong>
								</p>
							</div>
							<a class="btn go_view" href="infoModify.do"> <span>회원
									정보 변경</span></a>
						</div>
						<div class="info point">
							<dl>
								<dt>멤버십 포인트</dt>
								<dd>
									<strong><em>0</em>P</strong>
								</dd>
							</dl>
							<a class="btn go_view" href="#"><span>포인트
									관리</span></a>
						</div>
						<div class="info subcard">
							<dl>
								<dt>써브카드</dt>
								<dd>
									<strong><em>0</em>원</strong>
								</dd>
							</dl>
							<a class="btn go_view" href="#"><span>카드
									관리</span></a>
						</div>
					</section>
					<section class="my_info">
						<div class="info order">
							<dl>
								<dt>주문내역</dt>
								<dd>
									<strong>0</strong>개
								</dd>
							</dl>
							<a class="btn go_view" href="orderList.do"><span>주문
									내역 관리</span></a>
						</div>
						<div class="info gift">
							<dl>
								<dt>e-Gift 카드</dt>
								<dd>
									<strong>0</strong>개
								</dd>
							</dl>
							<a class="btn go_view" href="#"><span>e-Gift
									관리</span></a>
						</div>
						<div class="info coupon">
							<dl>
								<dt>쿠폰</dt>
								<dd>
									<!--<strong th:text="${member.couponCount}"></strong>개-->
									<strong>0</strong>개
								</dd>
							</dl>
							<a class="btn go_view" href="/mypage/coupon"><span>쿠폰
									관리</span></a>
						</div>
					</section>
				</section>
				<!--// 회원활동 -->

			</div>
			<!--// My SUB Index -->
		</div>
		<!--// sub content e -->
	</div>
	<%@ include file="/jsp/include/footer.jsp"%>
</body>
</html>