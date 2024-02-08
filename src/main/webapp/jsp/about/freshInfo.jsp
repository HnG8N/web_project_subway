<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신선한 재료 소개</title>
    <link href="http://subway.co.kr/" rel="canonical" /><!-- 20180221 -->
    <meta content="신선하고 건강한 글로벌 NO.1 샌드위치 브랜드, 써브웨이" name="description" /><!-- 20181212 -->
    <link rel="shortcut icon" type="image/x-icon" href="/images/common/subway_favicon.ico?v=2023051202" />
        <!-- 20180131 -->
        <link rel="stylesheet" type="text/css" href="/css/ui.common.css?v=2023051202" />
        <link rel="stylesheet" type="text/css" href="/css/jquery.mCustomScrollbar.min.css?v=2023051202" />
		<!-- 메뉴소개 css -->
		<link rel="stylesheet" type="text/css" href="/css/ui.menu.css?v=2023051202" />

        <script type="text/javascript" src="/js/jquery/jquery-1.12.4.min.js?v=2023051202"></script>
        <script type="text/javascript" src="/js/jquery/jquery-ui-1.12.0.min.js?v=2023051202"></script>
        <script type="text/javascript" src="/js/jquery/jquery.easing.1.3.min.js?v=2023051202"></script>
        <script type="text/javascript" src="/js/jquery/jquery.bxslider.min.js?v=2023051202"></script>
        <script type="text/javascript" src="/js/jquery/jquery.mCustomScrollbar.concat.min.js?v=2023051202"></script>
        <!-- block ui -->
        <script type="text/javascript" src="/js/jquery/jquery.blockUI.min.js?v=2023051202"></script>

        <script type="text/javascript" src="/js/jquery/TweenMax.min.js?v=2023051202"></script>
        <script type="text/javascript" src="/js/jquery/jquery.cookie.js?v=2023051202"></script>
        <!--<script type="text/javascript" th:src="'/js/lottie.js?v=' + ${cacheParam}"></script>-->
        <script type="text/javascript" src="/js/ui.common.js?v=2023051202"></script>
        <script type="text/javascript" src="/js/subway.common.js?v=2023051202"></script>
        <script type="text/javascript" src="/js/util/jsrender.js?v=2023051202"></script>
        <script type="text/javascript" src="/js/jquery/jquery.tmpl.min.js?v=2023051202"></script>
        <script type="text/javascript" src="/js/waffle/waffle.utils.js?v=2023051202"></script>

	<script type="text/javascript">
        tab = null;
	</script>
	<script>
		$(document).ready(function(){

			$(window).load(function(){
				pdVisual_fresh()//메뉴소개 : 신선한재료소개 visual
				pdTab_Sort()//메뉴소개 : 메뉴 정렬

                if(tab){
					 $('.pd_tab li a').each(function(){
						 if($(this).attr('href') == tab){
							 $(this).trigger('click');
						 }
					 });
				}
			});
		});
	</script>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
            <!-- container s -->
            <div id="container">

			<div class="sub_header type01"><!-- 메뉴소개일경우 type01클래스 추가 -->
				<div class="content">
	<a class="logo" href="/">HOME</a>
	<!-- sub location -->
	<div class="sub_loc">
		<!-- 메뉴소개 -->
		
		<!-- 이용방법 -->
		<ul>
			<li><a href="/utilizationSubway">써브웨이 이용방법</a></li>
			<li><a href="utilizationGroupMenu">단체메뉴 이용방법</a></li>
			<li class="active"><a href="/freshInfo">신선한 재료 소개</a></li>
			<li><a href="/appFastMenu">APP 이용방법</a></li> <!-- 180129 hidden 처리 -->
		</ul>
	</div>
	<!--// sub location -->
	<a class="top" href="#none">TOP</a>
</div>
			</div>

			<!-- sub content s -->
			<div id="content">
                <!-- 메뉴소개 s -->
				<div class="menu_list_wrapper">
					<!-- 상품 visual -->
					<div class="visual fresh">
						<h2>Fresh Ingredients</h2>
						<p>
							매장에서 직접 굽는 빵, 엄격하게 세척하는 야채의 신선함,<br />
							써브웨이만의 다양한 소스를 맛보세요.
						</p>
						<div class="img01"></div>
						<div class="img02"></div>
						<div class="img03"></div>
					</div>
					<!--// 상품 visual -->

					<!-- 상품별 정렬 tab -->
					<div class="pd_tab">
						<ul>
							<li class="active"><a class="eng" href="all">All</a></li>
							<li><a href="bread">빵</a></li>
							<li><a href="vegetable">야채</a></li>
							<li><a href="cheese">치즈</a></li><!--20180205 -->
							<li><a href="sauce">소스</a></li>
						</ul>
					</div>
					<!--// 상품별 정렬 tab -->
					<!-- 상품목록 -->
					<div class="pd_list_wrapper">
						<ul>
  							<li class="bread">
								<div class="img"><img alt="허니오트" src="../images/menu/img_recipe_b01.jpg" /></div>
								<strong class="tit">허니오트</strong>
								<span class="eng">Honey Oat</span>
								<span class="cal">235 kcal</span>
								<div class="summary">
									<p>
										고소한 위트빵에 오트밀 가루를 묻혀<br /> 고소함과 식감이 두배로
									</p>
									<p class="fs13">(허니오트의 칼로리는 15cm 기준입니다.)</p>
								</div>
							</li>
                            <li class="bread">
								<div class="img"><img alt="하티" src="../images/menu/img_recipe_b02.jpg" /></div>
								<strong class="tit">하티</strong>
								<span class="eng">Hearty Italian</span>
								<span class="cal">210 kcal</span>
								<div class="summary">
									<p>
										부드러운 화이트빵에 옥수수가루를 묻혀<br /> 겉은 바삭하고 고소하며 속은 부드럽게
									</p>
									<p class="fs13">(하티의 칼로리는 15cm 기준입니다.)</p>
								</div>
							</li>
                            <li class="bread">
								<div class="img"><img alt="위트" src="../images/menu/img_recipe_b03.jpg" /></div>
								<strong class="tit">위트</strong>
								<span class="eng">Wheat</span>
								<span class="cal">192 kcal</span>
								<div class="summary">
									<p>
										여러 가지 곡물로 만들어 건강하고 고소한 맛의 곡물빵
									</p>
									<p class="fs13">(위트의 칼로리는 15cm 기준입니다.)</p>
								</div>
							</li>
                            <li class="bread">
								<div class="img"><img alt="파마산 오레가노" src="../images/menu/img_recipe_b04.jpg" /></div>
								<strong class="tit">파마산 오레가노</strong>
								<span class="eng">Parmesan Oregano</span>
								<span class="cal">213 kcal</span>
								<div class="summary">
									<p>
										부드러운 화이트빵에<br /> 파마산 오레가노 시즈닝을 묻혀 허브향 가득
									</p>
									<p class="fs13">(파마산 오레가노의 칼로리는 15cm 기준입니다.)</p>
								</div>
							</li>
                            <li class="bread">
								<div class="img"><img alt="화이트" src="../images/menu/img_recipe_b05.jpg" /></div>
								<strong class="tit">화이트</strong>
								<span class="eng">White</span>
								<span class="cal">202 kcal</span>
								<div class="summary">
									<p>
										가장 클래식한 빵으로 부드러운 식감이 매력 포인트
									</p>
									<p class="fs13">(화이트의 칼로리는 15cm 기준입니다.)</p>
								</div>
							</li>
                            <li class="bread">
								<div class="img"><img alt="플랫브레드" src="../images/menu/img_recipe_b06.jpg" /></div>
								<strong class="tit">플랫브레드</strong>
								<span class="eng">Flat Bread</span>
								<span class="cal">467 kcal</span>
								<div class="summary">
									<p>
										이름처럼 납작 모양에 피자도우처럼 쫀득한 맛이 일품
									</p>
									<p class="fs13">(플랫브레드의 칼로리는 30cm 기준입니다.)</p>
								</div>
							</li>
							<li class="vegetable">
								<div class="img"><img alt="양상추" src="../images/menu/img_recipe_v01.jpg" /></div>
								<strong class="tit">양상추</strong>
								<span class="eng">Lettuce</span>
								<span class="cal">2.9 kcal</span>
							</li>
                            <li class="vegetable">
								<div class="img"><img alt="토마토" src="../images/menu/img_recipe_v02.jpg" /></div>
								<strong class="tit">토마토</strong>
								<span class="eng">Tomatoes</span>
								<span class="cal">7.7 kcal</span>
							</li>
                            <li class="vegetable">
								<div class="img"><img alt="오이" src="../images/menu/img_recipe_v03.jpg" /></div>
								<strong class="tit">오이</strong>
								<span class="eng">Cucumbers</span>
								<span class="cal">1.5 kcal</span>
							</li>
                            <li class="vegetable">
								<div class="img"><img alt="피망" src="../images/menu/img_recipe_v04.jpg" /></div>
								<strong class="tit">피망</strong>
								<span class="eng">Peppers</span>
								<span class="cal">1.4 kcal</span>
							</li>
                            <li class="vegetable">
								<div class="img"><img alt="양파" src="../images/menu/img_recipe_v05.jpg" /></div>
								<strong class="tit">양파</strong>
								<span class="eng">Red Onions</span>
								<span class="cal">2.8 kcal</span>
							</li>
                            <li class="vegetable">
								<div class="img"><img alt="피클" src="../images/menu/img_recipe_v06.jpg" /></div>
								<strong class="tit">피클</strong>
								<span class="eng">Pickles</span>
								<span class="cal">0.4 kcal</span>
							</li>
                            <li class="vegetable">
								<div class="img"><img alt="올리브" src="../images/menu/img_recipe_v07.jpg" /></div>
								<strong class="tit">올리브</strong>
								<span class="eng">Olives</span>
								<span class="cal">3.9 kcal</span>
							</li>
                            <li class="vegetable">
								<div class="img"><img alt="할라피뇨" src="../images/menu/img_recipe_v08.jpg" /></div>
								<strong class="tit">할라피뇨</strong>
								<span class="eng">Jalapenos</span>
								<span class="cal">0.6 kcal</span>
							</li>
							<!-- 20180205 -->
                            <li class="vegetable">
								<div class="img"><img alt="아보카도" src="../images/menu/img_recipe_v09.jpg" /></div>
								<strong class="tit">아보카도</strong>
								<span class="eng">Avocado</span>
								<span class="cal">56.5 kcal</span>
							</li>
							<li class="cheese">
								<div class="img"><img alt="아메리칸 치즈" src="../images/menu/img_recipe_c01.jpg" /></div>
								<strong class="tit">아메리칸 치즈</strong>
								<span class="eng">American Cheese</span>
								<span class="cal">35.3 kcal</span>
							</li>
							<li class="cheese">
								<div class="img"><img alt="슈레드 치즈" src="../images/menu/img_recipe_c02.jpg" /></div>
								<strong class="tit">슈레드 치즈</strong>
								<span class="eng">Shredded Cheese</span>
								<span class="cal">53.6 kcal</span>
							</li>
							<li class="cheese">
								<div class="img"><img alt="모차렐라 치즈" src="../images/menu/img_recipe_c03.jpg" /></div>
								<strong class="tit">모차렐라 치즈</strong>
								<span class="eng">Mozzarella Cheese</span>
								<span class="cal">43.8 kcal</span>
							</li>
							<!--// 20180205 -->
							<!--
							<li class="sauce">

								<div class="label">
									<span class="new">NEW</span>
								</div>
								<div class="img"><img src="../images/menu/img_recipe_s19.jpg" alt="리치시저"></div>
								<strong class="tit">리치시저</strong>
								<span class="eng">RICH CAESAR</span>
								<span class="cal">100 kcal</span>
								<div class="summary">
									<p>
										고소한 파마산 치즈와 상큼한<br> 레몬의 풍부한 맛 <br><br>기간한정 소스 (~10.31)
									</p>
								</div>
							</li>
							-->
							<!--
							<li class="sauce">
								<div class="label">
									<span class="new">NEW</span>
								</div>
								<div class="img"><img src="../images/menu/img_recipe_s20.jpg" alt="와사비 소이"></div>
								<strong class="tit">와사비 소이</strong>
								<span class="eng">Wasabi Soy</span>
								<span class="cal">27 kcal</span>
								<div class="summary">
									<p>
										와사비와 소이의 환상적인 궁합
									</p>
								</div>
							</li>
							-->
							<!--
							<li class="sauce">
								<div class="label">
									<span class="limited_g">Limited</span>
								</div>
								<div class="img"><img src="../images/menu/img_recipe_s22.jpg" alt="유자 폰즈"></div>
								<strong class="tit">유자 폰즈</strong>
								<span class="eng">Yuja Ponzu</span>
								<span class="cal">10 kcal</span>
								<div class="summary">
									<p>
										유자 향기 가득한 폰즈 소스로<br>
										상큼 업!
									</p>
								</div>
							</li>
							-->
							<!--
							<li class="sauce">
								<div class="label">
									<span class="limited_g">Limited</span>
								</div>
								<div class="img"><img src="../images/menu/img_recipe_s21.jpg" alt="와사비 마요"></div>
								<strong class="tit">와사비 마요</strong>
								<span class="eng">Wasabi Mayo</span>
								<span class="cal">95 kcal</span>
								<div class="summary">
									<p>
										고소한 마요네즈에<br>
										알싸한 와사비가 퐁당!
									</p>
								</div>
							</li>
							-->
							<!--<li class="sauce">
								<div class="img"><img src="../images/menu/img_recipe_s24.jpg" alt="트러플 마요"></div>
								<strong class="tit">New 트러플 마요(시즌한정)</strong>
								<span class="eng">New Truffle Mayo (seaonally)</span>
								<span class="cal">79 kcal</span>
								<div class="summary">
									<p>
										트러플의 풍미를 가득 담아<br>써브웨이 샌드위치와 최상의<br>조화를 이루는 시즌한정<br>트러플 마요 소스
									</p>
								</div>
							</li>-->
							<li class="sauce">
								<div class="img"><img alt="랜치드레싱" src="../images/menu/img_recipe_s01.jpg" /></div>
								<strong class="tit">랜치</strong>
								<span class="eng">Ranch</span>
								<span class="cal">116 kcal</span>
								<div class="summary">
									<p>
										고소한 마요네즈와 레몬즙의 만남!<br /> 고소함이 두배!
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="스윗 어니언" src="../images/menu/img_recipe_s07.jpg" /></div>
								<strong class="tit">스위트 어니언</strong>
								<span class="eng">Sweet Onion</span>
								<span class="cal">40.1 kcal</span>
								<div class="summary">
									<p>
										써브웨이만의 특제 레시피로 만든 달콤한 양파소스
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="마요네즈" src="../images/menu/img_recipe_s02.jpg" /></div>
								<strong class="tit">마요네즈</strong>
								<span class="eng">Mayonnaise</span>
								<span class="cal">158 kcal</span>
								<div class="summary">
									<p>
										말이 필요없는 고소함의 대명사, 마요네즈 소스
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="스윗 칠리" src="../images/menu/img_recipe_s12.jpg" /></div>
								<strong class="tit">스위트 칠리</strong>
								<span class="eng">Sweet Chilli</span>
								<span class="cal">40 kcal</span>
								<div class="summary">
									<p>
										매콤한 칠리에 더해진 기분 좋은 달콤함!
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="스모크 바비큐 소스" src="../images/menu/img_recipe_s17.jpg" /></div>
								<strong class="tit">스모크 바비큐</strong>
								<span class="eng">Smoke BBQ</span>
								<span class="cal">32.8 kcal</span>
								<div class="summary">
									<p>
										스모크 향과 달콤한 바비큐의 완벽한 조화
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="핫 칠리" src="../images/menu/img_recipe_s18.jpg" /></div>
								<strong class="tit">핫 칠리</strong>
								<span class="eng">Hot Chilli</span>
								<span class="cal">41.8 kcal</span>
								<div class="summary">
									<p>
										진짜 매운맛을 보고 싶다면?<br />써브웨이의 핫 칠리!
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="허니 머스터드" src="../images/menu/img_recipe_s03.jpg" /></div>
								<strong class="tit">허니 머스터드</strong>
								<span class="eng">Honey Mustard</span>
								<span class="cal">38.4 kcal</span>
								<div class="summary">
									<p>
										겨자씨가 아낌없이 들어간 달콤한 머스터드 소스
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="NEW 사우스웨스트 치폴레" src="../images/menu/img_recipe_s09.jpg" /></div>
								<strong class="tit">사우스웨스트 치폴레</strong>
								<span class="eng">Southwest Chipotle</span>
								<span class="cal">96.5 kcal</span>
								<div class="summary">
									<p>
										핫 칠리와 고소한 마요네즈가 만난 이국적인<br />매콤한 맛
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="홀스래디쉬" src="../images/menu/img_recipe_s04.jpg" /></div>
								<strong class="tit">홀스래디쉬</strong>
								<span class="eng">Horseradish</span>
								<span class="cal">106 kcal</span>
								<div class="summary">
									<p>
										고소한 마요네즈와 고추냉이의 이색적인 만남!<br /> 매니아층을 사로잡은 매력No.1 소스
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="머스타드" src="../images/menu/img_recipe_s11.jpg" /></div>
								<strong class="tit">머스타드</strong>
								<span class="eng">Yellow Mustard</span>
								<span class="cal">15.3 kcal</span>
								<div class="summary">
									<p>
										겨자씨로 만든 오리지날 머스터드 소스
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="올리브 오일" src="../images/menu/img_recipe_s06.jpg" /></div>
								<strong class="tit">엑스트라 버진 올리브 오일</strong>
								<span class="eng">Extra Virgin Olive Oil</span>
								<span class="cal">124 kcal</span>
								<div class="summary">
									<p>
										담백하고 깔끔하게 즐기고 싶다면<br /> 주저하지 말고 올리브오일
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="레드와인식초" src="../images/menu/img_recipe_s05.jpg" /></div>
								<strong class="tit">레드 와인 식초</strong>
								<span class="eng">Red Wine Vinaigrette</span>
								<span class="cal">0.7 kcal</span>
								<div class="summary">
									<p>
										레드와인을 발효시켜 풍미가 가득한 식초
									</p>
								</div>
							</li>
							<li class="sauce">
								<div class="img"><img alt="소금" src="../images/menu/img_recipe_s13.jpg" /></div>
								<strong class="tit">소금</strong>
								<span class="eng">Salt</span>
							</li>
							<li class="sauce">
								<div class="img"><img alt="후추" src="../images/menu/img_recipe_s14.jpg" /></div>
								<strong class="tit">후추</strong>
								<span class="eng">Black Pepper</span>
							</li>

							<!--li class="sauce">
								<div class="img"><img src="/upload/menu/sauce_italian_dressing.png" alt="이탈리안 드레싱"></div>
								<strong class="tit">이탈리안 드레싱</strong>
								<span class="eng">Italian Dressing</span>
								<span class="cal">49 kcal</span>
								<div class="summary">
									<p>
										샐러드와 잘 어울리며 입맛을 돋워주는 상큼함
									</p>
								</div>
							</li-->
						</ul>

						<!-- 영양성분표 -->
						<div class="btns_fresh_list_wrapper">
							<a class="btn_list_pop btn bgc_point i_arr" href="/freshNutritionFacts" link-type="popup" onclick="popup_open(this,900,740); return false;" style="width:180px;">
								<span>영양 성분표 보기</span>
							</a>
						</div>
						<!--// 영양성분표 -->

					</div>
					<!--// 상품목록 -->
				</div>
                <!--// 메뉴소개 e -->
			</div>
			<!--// sub content e -->
		</div>
		<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>