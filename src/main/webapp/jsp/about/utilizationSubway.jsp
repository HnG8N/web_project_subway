<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>써브웨이 이용방법</title>
    <link href="http://subway.co.kr/" rel="canonical" /><!-- 20180221 -->
    <meta content="신선하고 건강한 글로벌 NO.1 샌드위치 브랜드, 써브웨이" name="description" /><!-- 20181212 -->
    <link rel="shortcut icon" type="image/x-icon" href="./images/common/subway_favicon.ico?v=2023051202" />
        <!-- 20180131 -->
        <link rel="stylesheet" type="text/css" href="./css/ui.common.css?v=2023051202" />
        <link rel="stylesheet" type="text/css" href="./css/jquery.mCustomScrollbar.min.css?v=2023051202" />
		<link rel="stylesheet" type="text/css" href="./css/ui.utilization.css?v=2023051202" />
		<!-- 써브웨이 css -->
		<link rel="stylesheet" href="./css/aos.css?v=2023051202" />
        
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

		<script src="./js/jquery/aos.js?v=2023051202"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				subwayUtilization();//써브웨이 이용방법
			})
		</script>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
 <!-- container s -->
	<div id="container">
		<div class="sub_header">
			<div class="content">
				<a class="logo" href="/">HOME</a>
				<!-- sub location -->
				<div class="sub_loc">
					<ul>
						<li class="active"><a href="utilizationSubway.do">써브웨이 이용방법</a></li>
						<li><a href="freshInfo.do">신선한 재료 소개</a></li>
					</ul>
				</div>
				<!--// sub location -->
				<a class="top" href="#none">TOP</a>
			</div>
		</div>
	</div>
	<!--// sub location -->

	<!-- sub content s -->
	<div id="content">
		<h2 class="subTitle">써브웨이 이용방법</h2>

		<!-- 써브웨이 이용방법 -->
		<div class="utilization_subway_wrapper">
			<div class="tab">
				<ul>
					<li class="active"><a href="#store_order">매장에서 주문하기</a></li>
					<li><a href="#order_tip">주문 TIP</a></li>
				</ul>
			</div>

			<!-- 매장에서 주문하기 s -->
			<div class="utilization_subway_content" id="store_order"
				style="display: block;">
				<div class="slider_wrapper">
					<div class="step_content">
						<ol>
							<li class="active"><div class="step">
									STEP<strong>1</strong>
								</div></li>
							<li><div class="step">
									STEP<strong>2</strong>
								</div></li>
							<li><div class="step">
									STEP<strong>3</strong>
								</div></li>
							<li><div class="step">
									STEP<strong>4</strong>
								</div></li>
							<li><div class="step">
									STEP<strong>5</strong>
								</div></li>
						</ol>
					</div>
					<div class="img_content">
						<ol>
							<!-- 20180202 -->
							<li class="active"><div class="img">
									<img alt="메뉴 선택"
										src="./images/utilization/img_store_order01.png" />
								</div></li>
							<li><div class="img">
									<img alt="빵 선택 "
										src="./images/utilization/img_store_order02.png" />
								</div></li>
							<li><div class="img">
									<img alt="토핑 추가"
										src="./images/utilization/img_store_order03.png" />
								</div></li>
							<li><div class="img">
									<img alt="야채&소스 선택"
										src="./images/utilization/img_store_order04.png" />
								</div></li>
							<li><div class="img">
									<img alt="세트 선택"
										src="./images/utilization/img_store_order05.png" />
								</div></li>
							<!--// 20180202 -->
						</ol>
					</div>
					<div class="info_content">
						<p class="step_num">STEP 1</p>
						<ol>
							<li class="active" style="margin-top: 0; opacity: 1"><strong>메뉴
									선택</strong>
								<p class="txt1">
									메뉴를 고르세요.<br />샌드위치(15cm 또는 30cm)와<br />샐러드 중 선택 가능합니다.
								</p>
								<div class="btns_wrapper">
									<a class="btn bgc_bw size1" href="sandwich.do"
										style="width: 142px;" target="_blank"> <span>샌드위치
											메뉴</span><i class="i_mag">&nbsp;</i>
									</a>
									<!-- 18.02.01 텍스트 및 아이콘 수정 -->
									<a class="btn bgc_bw size1" href="salad.do"
										style="width: 142px;" target="_blank"> <span>샐러드 메뉴</span><i
										class="i_mag">&nbsp;</i>
									</a>
									<!-- 18.02.01 텍스트 및 아이콘 수정 -->
								</div></li>
							<li><strong>빵 선택 <span>(샐러드 선택 시 제외)</span></strong>
								<p class="txt1">
									매장에서 직접 구운 6가지 종류 중<br />고객님이 원하는 빵으로<br />추가비용 없이 선택 가능합니다.
								</p>
								<div class="btns_wrapper">
									<a class="btn bgc_bw size1" href="freshInfo.do?tab=bread"
										style="width: 105px;" target="_blank"><span>빵 종류</span><i
										class="i_mag">&nbsp;</i></a>
									<!-- 18.02.01 텍스트 및 아이콘 수정 -->
								</div></li>
							<li><strong>추가토핑 선택</strong>
								<p class="txt1">나만의 메뉴를 더욱 풍성하게 즐기세요.</p>
								<div class="btns_wrapper">
									<a class="btn bgc_bw size1"
										href="sandwich.do?tab=ITEM_SANDWICH.TOPPING"
										style="width: 142px;" target="_blank"><span>추가토핑 메뉴</span><i
										class="i_mag">&nbsp;</i></a>
									<!-- 18.02.01 아이콘 수정 -->
								</div></li>
							<li><strong>야채&amp;소스 선택</strong>
								<p class="txt1">
									나만의 스타일을 완성하는 단계!<br />원하지 않는 야채는 빼고 좋아하는 야채는 더하세요. <br />오늘의
									기분에 맞는 소스를 선택해주세요.
								</p>
								<div class="btns_wrapper">
									<a class="btn bgc_bw size1" href="freshInfo.do?tab=vegetable"
										style="width: 122px;" target="_blank"><span>야채 종류</span><i
										class="i_mag">&nbsp;</i></a>
									<!-- 18.02.01 아이콘 수정 -->
									<a class="btn bgc_bw size1" href="freshInfo.do?tab=sauce"
										style="width: 122px;" target="_blank"><span>소스 종류</span><i
										class="i_mag">&nbsp;</i></a>
									<!-- 18.02.01 아이콘 수정 -->
								</div></li>
							<li><strong>세트 선택</strong>
								<p class="txt1">
									세트로 구매하시면 할인혜택을 <br />받으실 수 있습니다. 세트로 <br />더욱 든든하고 알차게 즐기세요.
								</p>
								<div class="btns_wrapper">
									<a class="btn bgc_bw size1" href="sidedrink.do"
										style="width: 133px;" target="_blank"> <span>스마일 썹</span><i
										class="i_mag">&nbsp;</i>
									</a>
									<!-- 18.02.01 아이콘 수정 -->
								</div></li>
						</ol>
					</div>

					<div class="arr_controls">
						<a class="prev arr" href="#none">prev</a> <a class="next arr"
							href="#none">next</a>
					</div>
				</div>
			</div>
			<!--// 매장에서 주문하기 e -->

			<!-- 주문 TIP s -->
			<div class="utilization_subway_content" id="order_tip"
				style="display: none;">
				<div class="order_tip_wrapper">
					<!-- 스테이크&치즈 -->
					<div class="section01">
						<div class="visual">
							<div class="content">
								<p class="txt_q">
									<em>완벽한 한끼</em>를 원하신다면?
								</p>
								<strong>스테이크 & 치즈</strong>
								<p>
									고급스러운 스테이크와 고소하고 진한 치즈의 콜라보<br /> 신선한 야채와 함께 푸짐하고 완벽한 한끼가
									완성됩니다!<br /> 다양한 토핑을 추가해 나만의 한끼 메뉴를 즐겨보세요.
								</p>

								<div class="sandwich">
									<img alt="스테이크 & 치즈" data-aos="fade-left"
										src="./images/utilization/img_sandwich01.png" />
								</div>
							</div>
						</div>
						<div class="tip_intro">
							<div class="content">
								<strong>더 맛있게 즐기는 <span>TIP</span></strong>
								<ul>
									<li>
										<div class="img">
											<img alt="CHEESE" src="./images/utilization/img_cheese.jpg" />
										</div> <em>CHEESE</em>
										<p>
											더블치즈로 치즈와 쇠고기의<br />완벽한 조화!
										</p>
									</li>
									<li>
										<div class="img">
											<img alt="SAUCE" src="./images/utilization/img_sauce01.jpg" />
										</div> <em>SAUCE</em>
										<p>
											달콤하게 즐기고 싶다면 스윗어니언+마요네즈!<br />스테이크의 맛을 즐기고 싶다면 후추만 톡톡!
										</p>
									</li>
									<li class="bul02">
										<!-- 20180213 -->
										<div class="img">
											<img alt="VEGETABLE"
												src="./images/utilization/img_vegetable.jpg" />
										</div> <em>VEGETABLE</em>
										<p>
											토마토, 오이를 빼면<br />고기의 풍미를 즐길 수 있습니다.
										</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!--// 스테이크&치즈 -->
					<!-- 로스트치킨 -->
					<div class="section02">
						<div class="visual">
							<div class="content">
								<p class="txt_q">
									<em>다이어트</em>중이라면?
								</p>
								<strong>로스트치킨</strong>
								<p>
									퍽퍽한 닭가슴살은 이제 그만!<br /> 로스트 치킨 샐러드는 가볍고 든든하게 즐길 수 있습니다.<br />
									샌드위치와 샐러드로 맛있고 든든하게 즐기세요.
								</p>

								<div class="sandwich">
									<img alt="로스트치킨" data-aos="fade-left"
										src="./images/utilization/img_sandwich02.png" />
								</div>
							</div>
						</div>
						<div class="tip_intro">
							<div class="content">
								<strong>더 맛있게 즐기는 <span>TIP</span></strong>
								<ul>
									<li>
										<div class="img">
											<img alt="SALAD" src="./images/utilization/img_salad.jpg" />
										</div> <em>SALAD</em>
										<p>
											로스트치킨은 샐러드로 드셔도 좋습니다.<br />관리의 시작은 써브웨이로부터!
										</p>
									</li>
									<li>
										<div class="img">
											<img alt="SAUCE" src="./images/utilization/img_sauce02.jpg" />
										</div> <em>SAUCE</em>
										<p>랜치로 고소하게 즐겨보세요!</p>
									</li>
									<li class="bul02">
										<div class="img">
											<img alt="TOPPING"
												src="./images/utilization/img_topping.jpg" />
										</div> <em>TOPPING</em>
										<p>
											올리브, 피클, 할라피뇨를 빼고 드시면,<br /> 담백하고 부드러운 로스트 치킨을<br /> 제대로 즐길
											수 있습니다.
										</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!--// 로스트치킨 -->
					<!-- 써브웨이 클럽 -->
					<div class="section03">
						<div class="visual">
							<div class="content">
								<p class="txt_q">
									<em>건강</em>을 생각한다면?
								</p>
								<strong>써브웨이 클럽</strong>
								<p>
									고기의 단백질과 야채의 비타민으로 영양UP!<br /> 절임류 야채를 제외해서 더 담백하게, 올리브오일을 넣어
									부담은 DOWN!<br /> 써브웨이 클럽으로 건강한 하루를 보내세요.
								</p>

								<div class="sandwich">
									<img alt="써브웨이 클럽" data-aos="fade-left"
										src="./images/utilization/img_sandwich03.png" />
								</div>
							</div>
						</div>
						<div class="tip_intro">
							<div class="content">
								<strong>더 맛있게 즐기는 <span>TIP</span></strong>
								<ul>
									<li>
										<div class="img">
											<img alt="SAUCE" src="./images/utilization/img_sauce03.jpg" />
										</div> <em>SAUCE</em>
										<p>
											올리브오일과 후추를 살짝 뿌리면,<br />짜지않고 담백한 행복한 맛을 느낄 수 있습니다.
										</p>
									</li>
									<li class="bul02">
										<div class="img">
											<img alt="CHEESE" src="./images/utilization/img_cheese.jpg" />
										</div> <em>CHEESE</em>
										<p>
											치즈를 빼고 터키, 베이컨,<br /> 햄의 완벽한 조화를 느껴보세요!
										</p>
									</li>
									<li class="bul02">
										<div class="img">
											<img alt="TOPPING"
												src="./images/utilization/img_topping.jpg" />
										</div> <em>TOPPING</em>
										<p>
											올리브, 피클, 할라피뇨를 빼고 드시면<br />야채들의 싱싱한 맛을 하나하나 느끼실 수<br />있습니다.
										</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!--// 써브웨이 클럽 -->
				</div>
			</div>
			<!--// 주문 TIP e -->
		</div>
		<!--// 써브웨이 이용방법 -->
	</div>
	<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>