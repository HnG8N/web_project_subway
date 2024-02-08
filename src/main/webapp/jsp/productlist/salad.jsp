<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
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
		<script src="./js/menu/menuList.js" type="text/javascript"></script>
		<script type="text/javascript">
	            tab = null;
	        </script>
		<script>
	            $(document).ready(function(){
	                var msg = null;
	
	                if(msg != null){
	                    alert(msg);
	                    window.location.href = "/";
	                }
	
	                var menu = 'salad';
	                var category = ['sandwich','salad','sides_drink','fresh','catering','wrap','morning'];
	                var categoryCss = '';
	                if(menu == 'sidedrink'){
	                    menu = 'sides_drink';
	                }else if(menu == 'unit'){
	                    menu = 'wrap';
	                }
	                for(var i=0;i<category.length;i++){
	                    if(menu == category[i]){
	                        categoryCss = 'visual ' + menu;
	                        break;
	                    }else{
	                        categoryCss = 'visual wrap';
	                    }
	                }
	
	                $('#cssCategory').addClass(categoryCss);
	
	                //tab 파라미터에 대한 함수
	                $(window).load(function(){
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
<!-- 추가적인 스타일 및 스크립트 파일들을 여기에 추가 -->
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
	<!-- container s -->
	<div id="container">

		<div class="sub_header type01">
			<!-- 메뉴소개일경우 type01클래스 추가 -->
			<div class="content">
				<a class="logo" href="/">HOME</a>
				<!-- sub location -->
				<div class="sub_loc">
					<!-- 메뉴소개 -->
					<ul>
						<li><a href="sandwich.do">샌드위치</a></li>
						<li><a href="unit.do">랩ㆍ기타</a></li>
						<li class="active"><a href="salad.do">샐러드</a></li>
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
			<div class="menu_list_wrapper">
				<!-- 상품 visual 스마일썹,랩 클래스명 css명과 동일하게 수정 -->
				<div id="cssCategory">


					<h2>Salad</h2>





					<p>
						양은 더 많이! 칼로리는 더 적게! <br />신선한 야채와 다양한 소스로 가볍게 샐러드를 즐겨보세요!
					</p>



					<div class="img01"></div>
					<div class="img02"></div>
					<div class="img03"></div>
				</div>
				<!--// 상품 visual -->

				<!-- 상품별 정렬 tab -->
				<div class="pd_tab">
					<!-- 샌드위치 -->
					<ul>
						<li class="active"><a class="eng" href="all">All</a></li>
						<li><a href="ITEM_SALAD.CLASSIC">클래식</a></li>
						<li><a href="ITEM_SALAD.FLASH">프레쉬&amp;라이트</a></li>
						<li><a href="ITEM_SALAD.PREMIUM">프리미엄</a></li>
						<li><a href="ITEM_SALAD.NEW">신제품</a></li>
						<li><a href="ITEM_SALAD.TOPPING">추가 선택</a></li>
					</ul>
				</div>
				<!--// 상품별 정렬 tab -->
				<!--// 상품목록 s -->
				<div class="pd_list_wrapper">
					<ul>
						<c:forEach items="${MenuList}" var="dto" varStatus="status">
							<li data-menusubsort="${status.count}"
								data-menumainsort="${status.count}"
								class="ITEM_SANDWICH.PREMIUM">
								<div class="img">
									<img onError="this.src='./images/common/noneImage.jpg'"
										src="./upload/menu/${dto.mnimg}" alt="${dto.mnname}" /></div>
								<strong class="tit">${dto.mnname}</strong> <span class="eng">${dto.mnengname}</span>
								<span class="cal">${dto.mnprice}</span>
								<div class="summary">
									<p>${dto.mninfo}</p>
								</div> <a href="#" onclick="menuDetail(this); return false;"
								data-category="sandwich" data-menuitemidx="${dto.mncode}"
								class="btn_view"></a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!--// 상품목록 e -->
			</div>
			<!--// 메뉴소개 e -->
		</div>
		<!--// sub content e -->
	</div>
	<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>