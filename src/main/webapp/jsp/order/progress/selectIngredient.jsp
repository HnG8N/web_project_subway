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
						<input name="bread" type="radio"  value="${breadDto.icode}"> ${breadDto.iname}
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
					<c:forEach items="${cheeseDto}" var="cheeseDto" varStatus="status">
						<input name="cheese" type="radio" value="${cheeseDto.icode}"> ${cheeseDto.iname}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td> 야채 선택 </td>
			</tr>
			<tr>
				<td>
					<c:forEach items="${vegitableDto}" var="vegitableDto" varStatus="status">
						<input name="vegetable" type="checkbox" value="${vegitableDto.icode}"> ${vegitableDto.iname}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td> 소스 선택 </td>
			</tr>
			<tr>
				<td>
					<c:forEach items="${sauceDto}" var="souceDto" varStatus="status">
						<input name="sauce" type="radio" value="${sauceDto.icode}"> ${sauceDto.iname}
					</c:forEach>
				</td>
			</tr>
			
		</table>
	</form>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>