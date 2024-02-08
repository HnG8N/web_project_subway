<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
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
	<script>
		var view = {
			noticeView : function(frm) {
				var idx = $(frm).attr("data-idx");
				var query = "page=1&subject="
				location.href = "/newsView?noticeIdx=" + idx + "&query="
						+ encodeURIComponent(query);
			}
		}
		$(document).ready(function() {
			mainScript();
		});
		/* 2018.01.30 공지사항 슬라이드 배너 스크립트 추가 */
		$(function() {
			$(".bxslider").bxSlider();
		});
	</script>
<!-- 추가적인 스타일 및 스크립트 파일들을 여기에 추가 -->
</head>
<body>
	<header>
		<!-- 헤더 내용 추가 -->
		<div id="header">
			<div class="content">
				<h1 class="logo">
					<a href="/">SUBWAY</a>
				</h1>
				<!-- gnb -->
				<nav id="gnb">
					<ul>
						<li><a class="dp1" href="#none">메뉴소개</a>
							<div class="dp2">
								<ul>
									<li><a href="sandwich.do">샌드위치</a></li>
									<li><a href="unit.do">랩ㆍ기타</a></li>
									<li><a href="salad.do">샐러드</a></li>
								</ul>
							</div></li>
						<li><a href="#none" class="dp1">이용방법</a>
							<div class="dp2">
								<ul>
									<li><a href="utilizationSubway.do">써브웨이 이용방법</a></li>
									<li><a href="freshInfo.do">신선한 재료 소개</a></li>
								</ul>
							</div></li>
						<li><a href="#none" class="dp1">새소식</a>
							<div class="dp2">
								<ul>
									<li><a href="newsList">공지사항</a></li>
									<li><a href="board">이용후기</a></li>
								</ul>
							</div></li>
						<li><a href="#none" class="dp1">써브웨이</a>
							<div class="dp2">
								<ul>
									<li><a href="storeSearch.do">매장찾기</a></li>
								</ul>
							</div></li>
						<li><a class="dp1" href="javascript:void(0);">온라인 주문</a>
							<div class="dp2">
								<ul>
									<li><a href="store.do">FAST-SUB</a></li>
								</ul>
							</div></li>
					</ul>
				</nav>
				<!--// gnb -->

				<!-- util menu -->
				<div class="util_menu">
					<ul>


						<li class="after_sign"><a href="/logout">로그아웃</a></li>
						<li class="after_sign"><a href="/mypage">MY-SUB</a></li>
						<li class="icon_menu cart on">
							<!-- 장바구니담았을때 class="on"추가 --> <a href="/cart/fastsub"> <span
								class="blind">장바구니</span> <strong>1</strong>
						</a>
						</li>

						<li class="icon_menu global_subway"><a
							href="http://www.subway.com/en-us/exploreourworld"
							target="_blank" title="Global Subway"><span class="blind">Global
									Subway</span></a></li>
					</ul>
				</div>
				<!--// util menu -->
			</div>
		</div>
		<!--// inc header e -->

	</header>