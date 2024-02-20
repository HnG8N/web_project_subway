<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옵션 선택</title>
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
		<link rel="stylesheet" type="text/css" href="./css/ui.order.css?v=2023051202" />
		
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
	<!-- container s -->
	<div id="container">
		<!-- sub content s -->
		<div class="order fast_sub" id="content">
			<!-- index -->
			<div class="menu_view">
				<div class="order_title">
					<h3>Fast-Sub</h3>
					<p>
						<th:object>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</th:object>

					</p>
				</div>
				<ol class="order_step">
					<li class="step_shop"><strong>STEP 1</strong> 매장선택</li>
					<li class="step_menu on"><strong>STEP 2</strong> 메뉴선택</li>
					<li class="step_order"><strong>STEP 3</strong> 주문하기</li>
					<li class="step_payment"><strong>STEP 4</strong> 결제하기</li>
				</ol>
				<div class="tab02">
					<ul>
						<li data-cate-cd="ITEM_FAVORITE"><a
							data-cate-cd="ITEM_FAVORITE" href="javascript:;" name="itemMenu">즐겨찾기
								메뉴</a></li>
						<li data-cate-cd="ITEM_PROMOTION"><a
							data-cate-cd="ITEM_PROMOTION" href="javascript:;" name="itemMenu">프로모션</a></li>
						<li data-cate-cd="ITEM_SANDWICH" class="active"><a
							data-cate-cd="ITEM_SANDWICH" href="javascript:;" name="itemMenu">샌드위치</a></li>
						<!-- #211019 FAST-SUB/HOME-SUB 샐러드 일시 판매 중지로 인한 주석처리, #211104 판매 재개 -->
						<li data-cate-cd="ITEM_SALAD"><a data-cate-cd="ITEM_SALAD"
							href="javascript:void(0);" name="itemMenu">샐러드</a></li>
						<li data-cate-cd="ITEM_UNIT"><a data-cate-cd="ITEM_UNIT"
							href="javascript:;" name="itemMenu">랩ㆍ기타</a></li>
						<li data-cate-cd="ITEM_SIDEDRINK"><a
							data-cate-cd="ITEM_SIDEDRINK" href="javascript:;" name="itemMenu">사이드ㆍ음료</a>
						</li>
					</ul>
				</div>
				<div class="order_con">
				<form action="cart.do" method="post">
					<table>
						<tr>
							<td>빵 길이 선택</td>
						</tr>
						<tr>
							<td><input name="breadLength" type="radio" checked="checked"
								value="15"> 15cm <input name="breadLength" type="radio"
								value="30"> 30cm</td>
						</tr>
						<tr>
							<td>빵 선택</td>
						</tr>
						<tr>
							<td><c:forEach items="${breadDtos}" var="breadDto"
									varStatus="status">
									<input name="bread" type="radio" value="${breadDto.icode}"> ${breadDto.iname}
					</c:forEach></td>
						</tr>
						<tr>
							<td>토스팅 선택</td>
						</tr>
						<tr>
							<td><input name="warm" type="radio" checked="checked"
								value="hit"> 토스트 <input name="warm" type="radio"
								value="nothit"> 토스트 안함</td>
						</tr>
						<tr>
							<td>치즈 선택</td>
						</tr>
						<tr>
							<td><c:forEach items="${cheeseDtos}" var="cheeseDto"
									varStatus="status">
									<input name="cheese" type="radio" value="${cheeseDto.icode}"> ${cheeseDto.iname}
					</c:forEach></td>
						</tr>
						<tr>
							<td>야채 선택</td>
						</tr>
						<tr>
							<td><c:forEach items="${vegitableDtos}" var="vegitableDto"
									varStatus="status">
									<input name="vegetable${status.count}" type="checkbox"
										value="${vegitableDto.icode}"> ${vegitableDto.iname}
					</c:forEach></td>
						</tr>
						<tr>
							<td>소스 선택</td>
						</tr>
						<tr>
							<td><c:forEach items="${sauceDtos}" var="sauceDto"
									varStatus="status">
									<input name="sauce" type="radio" value="${sauceDto.icode}"> ${sauceDto.iname}
					</c:forEach></td>
						</tr>
						<tr>
							<td><input type="submit" value="장바구니담기"></td>
						</tr>

					</table>
				</form>
				</div>
			</div>
		</div>
		<!--// sub content e -->
	</div>
	<!--// container -->
	<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>