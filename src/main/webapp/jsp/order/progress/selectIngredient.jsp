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
	
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
	<form action="cart.do" method="post">
		<table>
			<tr>
				<td> 빵 길이 선택 </td>
			</tr>
			<tr>
				<td>
					<input name="breadLength" type="radio" checked="checked" value="15"> 15cm
					<input name="breadLength" type="radio" value="30"> 30cm
				</td>
			</tr>
			<tr>
				<td> 빵 선택 </td>
			</tr>
			<tr>
				<td>
					<c:forEach items="${breadDto}" var="breadDto" varStatus="status">
					<input name="bread" type="radio"  value="${breadDto.icode}"> 화이트
					<input name="bread" type="radio"  value="b2"> 파마산 오레가노
					<input name="bread" type="radio"  value="b3"> 위트
					<input name="bread" type="radio"  value="b4"> 허니오트
					<input name="bread" type="radio"  value="b5"> 하티
					<input name="bread" type="radio"  value="b6"> 플랫 브래드
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td> 토스팅 선택 </td>
			</tr>
			<tr>
				<td>
					<input name="warm" type="radio" checked="checked" value="hit"> 토스트
					<input name="warm" type="radio" value="nothit"> 토스트 안함
				</td>
			</tr>
			<tr>
				<td> 치즈 선택 </td>
			</tr>
			<tr>
				<td>
					<input name="cheese" type="radio" checked="checked" value="c1"> 아메리칸치즈
					<input name="cheese" type="radio" value="c2"> 슈레드치즈
					<input name="cheese" type="radio" value="c3"> 모차렐라치즈
					<input name="cheese" type="radio" value="c4"> 치즈제외
				</td>
			</tr>
			<tr>
				<td> 야채 선택 </td>
			</tr>
			<tr>
				<td>
					<h2>생야채</h2>
					<input name="vegetable1" type="checkbox" value="v1"> 양상추
					<input name="vegetable2" type="checkbox" value="v2"> 토마토
					<input name="vegetable3" type="checkbox" value="v3"> 오이
					<input name="vegetable4" type="checkbox" value="v4"> 피망
					<input name="vegetable5" type="checkbox" value="v5"> 양파
				</td>
			</tr>
			<tr>
				<td>
					<h2>절임류</h2>
					<input name="vegetable6" type="checkbox" value="v6"> 피클
					<input name="vegetable7" type="checkbox" value="v7"> 올리브
					<input name="vegetable8" type="checkbox" value="v8"> 할라피뇨
				</td>
			</tr>
			<tr>
				<td> 소스 선택 </td>
			</tr>
			<tr>
				<td>
					<input name="sauce" type="radio" checked="checked" value="c1"> 크리미한 렌치
					<input name="sauce" type="radio" value="c2"> 달콤한 스위트 어니언
					<input name="sauce" type="radio" value="c3"> 고소한 마요네즈
					<input name="sauce" type="radio" value="c4"> 매콤달콤한 스위트칠리
					<input name="sauce" type="radio" value="c4"> 스모크 향 스모크 바베큐
					<input name="sauce" type="radio" value="c4"> 화끈하게 매운 핫 칠리
					<input name="sauce" type="radio" value="c4"> 새콤 달콤한 허니 머스타드
					<input name="sauce" type="radio" value="c4"> 이국적으로 매콤한 사우스웨스트 치폴레
					<input name="sauce" type="radio" value="c4"> 알싸한 홀스래디쉬
					<input name="sauce" type="radio" value="c4"> 알싸한 머스타드
					<input name="sauce" type="radio" value="c4"> 이태리 엑스트라버진 올리브 오일
					<input name="sauce" type="radio" value="c4"> 과일향 레드 와인 식초
					<input name="sauce" type="radio" value="c4"> 소금
					<input name="sauce" type="radio" value="c4"> 후추
					<input name="sauce" type="radio" value="c4"> 선택안함.
				</td>
			</tr>
			
		</table>
	</form>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>