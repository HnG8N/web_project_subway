<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY - 이탈리안 비엠티</title>
    <meta charset="utf-8" />
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />

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


	<link href="./css/ui.menu.css" rel="stylesheet" type="text/css" />
	<!-- 메뉴소개 css -->
	<script>
            $(document).ready(function(){
                //210802 관리자 미리보기 시 msg 값이 있다면 창닫기
                var msg = null;
                if(msg != null){
                    alert(msg);
                    window.close();
                }
               //영양성분 문구 -> 마크업으로 인한 스크립트
               var itemNutritionDesc = '\u203B 15cm \uC0CC\uB4DC\uC704\uCE58\uC758 \uC601\uC591 \uC815\uBCF4\uB294 \uAE30\uBCF8 \uC57C\uCC44 5\uC885(\uC591\uC0C1\uCD94, \uD1A0\uB9C8\uD1A0, \uC624\uC774, \uD53C\uB9DD, \uC591\uD30C), 15cm \uC704\uD2B8 \uBE0C\uB808\uB4DC \uBC0F \uC81C\uD488\uC5D0 \uB530\uB978 \uBBF8\uD2B8\uB958\uAC00 \uD3EC\uD568\uB418\uC5B4 \uC788\uC73C\uBA70, \uCE58\uC988\uC640 \uC18C\uC2A4\uB294 \uC81C\uC678\uB429\uB2C8\uB2E4.\r\n\u203B \uC0D0\uB7EC\uB4DC\uC758 \uC601\uC591 \uC815\uBCF4\uB294 \uAE30\uBCF8 \uC57C\uCC44 5\uC885(\uC591\uC0C1\uCD94, \uD1A0\uB9C8\uD1A0, \uC624\uC774, \uD53C\uB9DD, \uC591\uD30C) \uBC0F \uC81C\uD488\uC5D0 \uB530\uB978 \uBBF8\uD2B8\uB958\uAC00 \uD3EC\uD568\uB418\uC5B4 \uC788\uC73C\uBA70, \uCE58\uC988\uC640 \uC18C\uC2A4\uB294 \uC81C\uC678\uB429\uB2C8\uB2E4.\r\n\u203B \uB2E8, \uBA54\uB274\uBA85\uC5D0 \u2018\uCE58\uC988\u2019\uAC00 \uD3EC\uD568\uB418\uB294 \uACBD\uC6B0 \uCE58\uC988\uC758 \uC601\uC591\uC815\uBCF4\uB3C4 \uD3EC\uD568\uB429\uB2C8\uB2E4.\r\n\u203B \uB7A9, \uADF8\uB9B4\uB4DC \uB7A9\uC758 \uC601\uC591 \uC815\uBCF4\uB294 \uCE58\uC988\uC640 \uC18C\uC2A4\uB97C \uD3EC\uD568\uD55C \uACE0\uC815 \uB808\uC2DC\uD53C\uB97C \uAE30\uC900\uC73C\uB85C \uD569\uB2C8\uB2E4.\r\n\u203B \uC544\uCE68\uBA54\uB274\uC758 \uC601\uC591 \uC815\uBCF4\uB294 15cm \uC704\uD2B8 \uBE0C\uB808\uB4DC \uBC0F \uC81C\uD488\uC5D0 \uB530\uB978 \uBBF8\uD2B8\uB958, \uC57C\uCC44, \uC544\uBA54\uB9AC\uCE78 \uCE58\uC988\uAC00 \uD3EC\uD568\uB418\uC5B4 \uC788\uC73C\uBA70, \uC18C\uC2A4\uB294 \uC81C\uC678\uB429\uB2C8\uB2E4.\r\n\u203B \uC601\uC591 \uC815\uBCF4\uD45C\uC5D0 \uD45C\uC2DC\uB41C \uC81C\uD488\uC758 \uC601\uC591 \uC815\uBCF4/\uC911\uB7C9\uC740 \uD45C\uC900 \uB808\uC2DC\uD53C\uB97C \uAE30\uC900\uC73C\uB85C \uD558\uB098, \uACC4\uC808\uC758 \uBCC0\uD654, \uACF5\uAE09\uC0AC\uC758 \uBCC0\uD654, \uC6D0\uC7AC\uB8CC\uC758 \uC218\uAE09 \uC0C1\uD669 \uBC0F \uC81C\uD488 \uC81C\uC870\uC2DC\uC5D0 \uBC1C\uC0DD\uD558\uB294 \uC911\uB7C9\uC758 \uCC28\uC774 \uB4F1\uC5D0 \uB530\uB77C \uC2E4\uC81C \uC81C\uACF5\uB418\uB294 \uC81C\uD488\uC758 \uC601\uC591 \uC815\uBCF4/\uC911\uB7C9\uACFC \uCC28\uC774\uAC00 \uC788\uC744 \uC218 \uC788\uC2B5\uB2C8\uB2E4.\r\n\u203B \uAD04\uD638 \uC548 %\uB294 1\uC77C \uC601\uC591\uC18C \uAE30\uC900\uCE58\uC5D0 \uB300\uD55C \uBE44\uC728\uC785\uB2C8\uB2E4.'.split('\r\n');
               for(var i=0;i<itemNutritionDesc.length;i++){
                   $('.notice').append('<li>' + itemNutritionDesc[i] + '</li>');
               }
                //추천소스 및 하단문구 스크립트
                $('.menu_info').append('<div class=\"recipe\">\n\t\t\t\t\t\t\t<ul>\n\t\t\t\t\t\t\t\t<li>\n\t\t\t\t\t\t\t\t\t<div class=\"img\">\n\t\t\t\t\t\t\t\t\t\t<img src=\"/upload/menu/recipe_pepperoni.jpg\" alt=\"\uD398\uD37C\uB85C\uB2C8\">\n\t\t\t\t\t\t\t\t\t<\/div>\n\t\t\t\t\t\t\t\t\t<p>\uD398\uD37C\uB85C\uB2C8 3\uC7A5<\/p>\n\t\t\t\t\t\t\t\t<\/li>\n\t\t\t\t\t\t\t\t<li>\n\t\t\t\t\t\t\t\t\t<div class=\"img\">\n\t\t\t\t\t\t\t\t\t\t<img src=\"/upload/menu/recipe_salami.jpg\" alt=\"\uC0B4\uB77C\uBBF8\">\n\t\t\t\t\t\t\t\t\t<\/div>\n\t\t\t\t\t\t\t\t\t<p>\uC0B4\uB77C\uBBF8 3\uC7A5<\/p>\n\t\t\t\t\t\t\t\t<\/li>\n                                <li>\n\t\t\t\t\t\t\t\t\t<div class=\"img\">\n\t\t\t\t\t\t\t\t\t\t<img src=\"/upload/menu/recipe_ham.jpg\" alt=\"\uD584\">\n\t\t\t\t\t\t\t\t\t<\/div>\n\t\t\t\t\t\t\t\t\t<p>\uD584 2\uC7A5<\/p>\n\t\t\t\t\t\t\t\t<\/li>\n\t\t\t\t\t\t\t\t<li>\n\t\t\t\t\t\t\t\t\t<div class=\"img\">\n\t\t\t\t\t\t\t\t\t\t<img src=\"/upload/menu/recipe_cheese.jpg\" alt=\"\uCE58\uC988\">\n\t\t\t\t\t\t\t\t\t<\/div>\n\t\t\t\t\t\t\t\t\t<p>\uCE58\uC988 2\uC7A5<\/p>\n\t\t\t\t\t\t\t\t<\/li>\n                                <li>\n\t\t\t\t\t\t\t\t\t<div class=\"rec\">\uCD94\uCC9C<\/div>\n\t\t\t\t\t\t\t\t\t<div class=\"img\">\n\t\t\t\t\t\t\t\t\t\t<img src=\"/upload/menu/sauce_sweet_onion.png\" alt=\"\uC2A4\uC704\uD2B8 \uC5B4\uB2C8\uC5B8\">\n\t\t\t\t\t\t\t\t\t<\/div>\n\t\t\t\t\t\t\t\t\t<p>\uC2A4\uC704\uD2B8 \uC5B4\uB2C8\uC5B8<\/p>\n\t\t\t\t\t\t\t\t<\/li>\n                                <li>\n\t\t\t\t\t\t\t\t\t<div class=\"rec\">\uCD94\uCC9C<\/div>\n\t\t\t\t\t\t\t\t\t<div class=\"img\">\n\t\t\t\t\t\t\t\t\t\t<img src=\"/upload/menu/sauce_ranch.png\" alt=\"\uB79C\uCE58\">\n\t\t\t\t\t\t\t\t\t<\/div>\n\t\t\t\t\t\t\t\t\t<p>\uB79C\uCE58<\/p>\n\t\t\t\t\t\t\t\t<\/li>\n\t\t\t\t\t\t\t<\/ul>\n\t\t\t\t\t\t<\/div>\n  <p class=\"not\">* \uB9E4\uC7A5\uC5D0 \uB530\uB77C \uCD94\uCC9C\uC18C\uC2A4\uB294 \uC0C1\uC774\uD560 \uC218 \uC788\uC2B5\uB2C8\uB2E4.<br>\n\n* \uC368\uBE0C\uC6E8\uC774\uAC00 \uC81C\uACF5\uD558\uB294 \uC2E0\uC120\uD55C \uC57C\uCC44\uAC00 \uC815\uB7C9\uC73C\uB85C \uC81C\uACF5\uB429\uB2C8\uB2E4.<\/p>\n<p class=\"common_caution\">* \uC81C\uD488 \uC0AC\uC9C4\uC740 \uC774\uBBF8\uC9C0\uCEF7\uC785\uB2C8\uB2E4. <br>\n<\/p>');

                //subwayCommon.shareToKakao("ui_kakao_btn", "블랙 포레스트햄 & 에그, 치즈", "/images/menu/sandwich_bf01.jpg", location.href);
                $("#ui_kakao_btn").hide();
                menuNavOver();//메뉴소개 이전,다음이미지 hover

                //카테고리 클릭 시 첫번째 제품 상세페이지 이동
                $(".category").children('a').click(function (index) {
                    var path = 'sandwich';
                    var data = $(this).attr("id");

                    var param = {"path" : path, "category" : data};
                    $.ajax({
                        type: "POST",
                        url: "/getCategoryMenu",
                        data: param,
                        cache: false,
                        success: function (result) {
                            if(result != "") {
                                location.href = path + "View.do?menuItemIdx=" + result;
                            }else{
                                alert('해당 제품이 없습니다.');
                            }
                        }
                    });
                });
            })
        </script>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
	<!-- container s -->
	<div id="container">
		<div class="sub_header">
			<div class="content">
				<a class="logo" href="home.do">HOME</a>
				<!-- sub location -->
				<div class="sub_loc">
					<!-- 메뉴소개 -->
					<ul>
						<li class="active"><a href="sandwich.do">샌드위치</a></li>
						<li><a href="unit.do">랩ㆍ기타</a></li>
						<li><a href="salad.do">샐러드</a></li>
					</ul>
					<!-- 이용방법 -->

				</div>
				<!--// sub location -->
				<a class="top" href="#none">TOP</a>
			</div>
		</div>
		<!-- sub content s -->
		<div id="content">
			<!-- 메뉴소개 s -->
			<div class="menu_view_wrapper">
				<!-- 메뉴 header -->
				<div class="hd">
					<!-- 20180208 -->
					<div class="category">
						<a href="#" class="active" id="ITEM_SANDWICH.CLASSIC">클래식</a> <a
							href="#" id="ITEM_SANDWICH.FLASH">프레쉬&amp;라이트</a> <a href="#"
							id="ITEM_SANDWICH.PREMIUM">프리미엄</a> <a href="#"
							id="ITEM_SANDWICH.NEW">신제품</a> <a href="#"
							id="ITEM_SANDWICH.TOPPING">추가 선택</a>
						<button type="button">open</button>
					</div>

					<!--// 20180208 -->
					<h2 class="name">${dto.mnname}</h2>
					<p class="eng">${dto.mnengname}</p>
					<p class="cal">${dto.mnkcal} Kcal</p>

				</div>
				<!--// 메뉴 header -->
				<!-- 메뉴 content -->
				<div class="menu_content">
					<!-- 메뉴정보 -->
					<div class="menu_info">
						<div class="menu_img">
							<img onError="this.src='./images/common/noneImage.jpg'"
								src="./upload/menu/${dto.mnimg}"
								alt="${dto.mnname}" />
						</div>
						<!-- 이전/다음 버튼 -->
						<a class="arr prev" href="sandwichView.do?menuItemIdx=1291"><span>에그마요</span></a>
						<a class="arr next" href="sandwichView.do?menuItemIdx=1289"><span>비엘티</span></a>
						<!--// 이전/다음 버튼 -->

						<p class="summary">
							${dto.mninfo}<br />
						</p>

						<!-- 레시피 -->
						<!--<div class="recipe">
                            </div>-->
						<!--// 레시피 -->
						<!--  <p class="not"></p>
                            <p class="common_caution" th:if="${item.cautionStr ne null}" th:utext="${#strings.replace(item.cautionStr, T(org.apache.commons.lang3.StringUtils).LF, '&lt;br /&gt;')}"></p> 공통문구-->
					</div>
					<!--// 메뉴정보 -->

					<!-- 영양성분표 -->
					<div class="component_chart">
						<div class="content">
							<h3>영양성분표</h3>
							<div class="board_list_wrapper">
								<table>
									<thead>
										<TR>
											<th scope="col">중량(g)</th>
											<th scope="col">열량(kcal)</th>
											<th scope="col">단백질(g)</th>
											<th scope="col">포화지방(g)</th>
											<th scope="col">당류(g)</th>
											<th scope="col">나트륨(mg)</th>

										</TR>
									</thead>
									<tbody>
										<TR>
											<td>${dto.mngram}</td>
											<td>${dto.mnkcal}</td>
											<td>${dto.mnprotein}</td>
											<td>${dto.mnfat}</td>
											<td>${dto.mnsugar}</td>
											<td>${dto.mnnatrum}</td>
										</TR>
									</tbody>
								</table>
							</div>
							<ul class="notice"></ul>
							<div class="btns_wrapper">
								<a class="btn bgc_black size1" href="origin.do"
									link-type="popup"
									onclick="popup_open(this,630,740); return false;"
									style="width: 110px;"><span>원산지 정보</span></a> <a
									class="btn bgc_black size1" href="allergy.do"
									link-type="popup"
									onclick="popup_open_alleryge(this,900,740); return false;"
									style="width: 125px;"><span>알레르기 정보</span></a>
							</div>
						</div>
					</div>
					<!--// 영양성분표 -->
					<!-- 세가지 원칙 -->
					<div class="fresh3_wrapper">
						<!-- 세가지 원칙 -->
						<div>
							<div class="hd">
								<p>써브웨이만이 가지고 있는 세가지 원칙</p>
								<h3>
									<span>SUBWAY</span> 3 FRESH
								</h3>
							</div>
							<div class="content">
								<ol>
									<li>
										<div class="img">
											<img alt="매장에서 직접 구워낸 신선한 빵"
												src="./images/menu/img_fresh3_01.jpg" />
										</div>
										<div class="info">
											<span class="num">1</span> <strong>매장에서 직접 구워낸<br />신선한
												빵
											</strong>
											<p>
												매일 아침 각 매장에서 발효하고 직접 구워서<br />퀄러티 높은 신선한 빵을 제공합니다.
											</p>
										</div>
									</li>
									<li>
										<div class="img">
											<img alt="매일 배송되는 신선한 야채 제공"
												src="./images/menu/img_fresh3_02.jpg" />
										</div>
										<div class="info">
											<span class="num">2</span> <strong>매일 배송되는<br />신선한
												야채 제공
											</strong>
											<p>
												매장에서 직접 손질한 야채를<br />당일판매 원칙으로 제공하고 있습니다.
											</p>
										</div>
									</li>
									<li>
										<div class="img">
											<img alt="주문과 동시에 바로 만드는 신선함"
												src="./images/menu/img_fresh3_03.jpg" />
										</div>
										<div class="info">
											<span class="num">3</span> <strong>주문과 동시에<br />바로
												만드는 신선함
											</strong>
											<p>
												주문과 동시에 만들어지는 시스템으로<br />직접 눈으로 신선함을 확인하실 수 있습니다.
											</p>
										</div>
									</li>
								</ol>
							</div>
						</div>
						<!--// 세가지 원칙 -->
					</div>
					<!--// 세가지 원칙 -->

					<!-- 이전메뉴 -->
					<div class="menu_nav prev">
						<div class="img">
							<img onError="this.src='./images/common/noneImage.jpg'"
								src="./upload/menu/Egg-Mayo_20211231094817112.png" />
						</div>
					</div>
					<!--// 이전메뉴 -->
					<!-- 다음메뉴 -->
					<div class="menu_nav next">
						<div class="img">
							<img onError="this.src='./images/common/noneImage.jpg'"
								src="./upload/menu/B.L.T_20211231094744175.png" />
						</div>
					</div>
					<!--// 다음메뉴 -->

					<!-- 목록보기 -->
					<div class="btns_list_wrapper">
						<div class="btn_list">
							<a href="sandwic.doh">목록보기</a>
						</div>
					</div>
					<!--// 목록보기 -->
				</div>
				<!--// 메뉴 content -->
			</div>
			<!--// 메뉴소개 e -->
		</div>
		<!--// sub content e -->
	</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>