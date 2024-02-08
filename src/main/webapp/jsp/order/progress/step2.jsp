<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fast-Sub Step2</title>
</head>
<body>
<c:import url="header.jsp" />
<!-- sub content s -->
<div id="content" class="order  fast_sub"> <!-- fast_sub / home_sub -->
	<!-- index -->
	<div class="menu_list">
		<div class="order_title">
			<h3>Fast-Sub</h3>
			<p>
				<th:object>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</th:object>
				
			</p>
		</div>
		<ol class="order_step">
			<li class="step_shop">
				<strong>STEP 1</strong>
				매장선택
			</li>
			<li class="step_menu on">
				<strong>STEP 2</strong>
				메뉴선택
			</li>
			<li class="step_order">
				<strong>STEP 3</strong>
				주문하기
			</li>
			<li class="step_payment">
				<strong>STEP 4</strong>
				결제하기
			</li>
		</ol>
		<div class="tab02">
			<ul>
				<li>
					<a href="javascript:;" name="itemMenu" data-category-code="ITEM_FAVORITE">즐겨찾는 메뉴</a>
				</li>
				<li>
					<a href="javascript:;" name="itemMenu" data-category-code="ITEM_PROMOTION">프로모션</a>
				</li>
				<!-- 아침메뉴 탭 제거 #200917
				<li th:class="${itemSearchVO.cateCd eq 'ITEM_MORNING' ? 'active' : ''}" th:if="${'Y' == franchiseInfoVO.morningTimeYn}">
					<a href="javascript:;" name="itemMenu" th:attr="data-category-code=${'ITEM_MORNING'}" >아침메뉴</a>
				</li>-->
				<li class="active">
					<a href="javascript:;" name="itemMenu" data-category-code="ITEM_SANDWICH">샌드위치</a>
				</li>
				<!-- #211019 FAST-SUB/HOME-SUB 샐러드 일시 판매 중지로 인한 주석처리, #211104 판매 재개 -->
			    <li>
					<a href="javascript:void(0);" name="itemMenu" data-category-code="ITEM_SALAD">샐러드</a>
				</li>
				<li>
                             <a href="javascript:;" name="itemMenu" data-category-code="ITEM_UNIT" data-grilled-sale-yn="N">랩ㆍ기타</a>
				</li>
				<li>
					<a href="javascript:;" name="itemMenu" data-category-code="ITEM_SIDEDRINK">사이드ㆍ음료</a>
				</li>
			</ul>
		</div>
		<!-- 컨텐츠 리스트 -->
		<div class="order_con" id="itemListMst"></div>
	</div>
	<!--// index -->
</div>
<!--// sub content e -->
<c:import url="footer.jsp" />
</body>
</html>