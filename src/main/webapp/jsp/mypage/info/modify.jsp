<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="js/mypage/manage/modify_info.js"></script>
<title>회원정보 수정</title>
<link href="http://subway.co.kr/" rel="canonical" />
<!-- 20180221 -->
<meta content="신선하고 건강한 글로벌 NO.1 샌드위치 브랜드, 써브웨이" name="description" />
<!-- 20181212 -->
<link rel="shortcut icon" type="image/x-icon"
	href="./images/common/subway_favicon.ico?v=2023051202" />
<!-- 20180131 -->
<link rel="stylesheet" type="text/css"
	href="./css/ui.common.css?v=2023051202" />
<link rel="stylesheet" type="text/css"
	href="./css/jquery.mCustomScrollbar.min.css?v=2023051202" />

<script type="text/javascript"
	src="./js/jquery/jquery-1.12.4.min.js?v=2023051202"></script>
<script type="text/javascript"
	src="./js/jquery/jquery-ui-1.12.0.min.js?v=2023051202"></script>
<script type="text/javascript"
	src="./js/jquery/jquery.easing.1.3.min.js?v=2023051202"></script>
<script type="text/javascript"
	src="./js/jquery/jquery.bxslider.min.js?v=2023051202"></script>
<script type="text/javascript"
	src="./js/jquery/jquery.mCustomScrollbar.concat.min.js?v=2023051202"></script>
<!-- block ui -->
<script type="text/javascript"
	src="./js/jquery/jquery.blockUI.min.js?v=2023051202"></script>

<script type="text/javascript"
	src="./js/jquery/TweenMax.min.js?v=2023051202"></script>
<script type="text/javascript"
	src="./js/jquery/jquery.cookie.js?v=2023051202"></script>
<!--<script type="text/javascript" th:src="'/js/lottie.js?v=' + ${cacheParam}"></script>-->
<script type="text/javascript" src="./js/ui.common.js?v=2023051202"></script>
<script type="text/javascript" src="./js/subway.common.js?v=2023051202"></script>
<script type="text/javascript" src="./js/util/jsrender.js?v=2023051202"></script>
<script type="text/javascript"
	src="./js/jquery/jquery.tmpl.min.js?v=2023051202"></script>
<script type="text/javascript"
	src="./js/waffle/waffle.utils.js?v=2023051202"></script>

<script type="text/javascript" src="./js/auth/auth.js?v=2023051202"></script>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="./css/ui.mypage.css?v=2023051202" />

<script type="text/javascript" src="./js/auth/auth.js?v=2023051202"></script>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="./css/ui.mypage.css?v=2023051202" />
</head>
<body>
	<%@ include file="/jsp/include/header.jsp"%>
	<!-- container s -->
	<div class="bg_gray" id="container">
		<!-- sub content s -->
		<div id="content">
			이름 : ${dto.name }<br>
			아이디 : ${dto.id}<br>
			이메일 : ${dto.email }<br>
			전화번호 : ${dto.tel }<br>
			<hr>
			<form action = "updateInfo.do" method="post" onsubmit="return validation()">
			<input type="hidden" id="mypw" value="${dto.pw }"/>
			현재 비밀번호 : <input type="password" id="pw">
			<input type="button" id="check123" value="비밀번호 확인"><br>
			<div id="changePasswordForm" style="display:none;">
			    <label for="newpw">바꾸실 비밀번호: </label>
			    <input type="password" id="newpw" name="newpw" oninput="pwCheck()"><br>
			    <label for="newpwcheck">비밀번호 확인: </label>
			    <input type="password" id="newpwcheck" oninput="pwCheck()"><br>
			    <span id="result"></span>
			</div>
			주소 : <input type="text" value="${dto.address }" id="address" name="address1" readonly="readonly" style="border:0; width:400px">
			 <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="address2" placeholder="상세주소를 입력하세요" style="border:0; width:200px"><br>
			 <input type="submit" id="updateInfo" value="회원정보수정">
			 </form>
			 <form action="deleteInfo.do" method="post">
			 	<input type="submit" id="deleteInfo" value="회원탈퇴">
			 </form>
			
		</div>
		<!--// 내정보관리 > 정보변경 -->
	</div>
	<!--// sub content e -->
	<%@ include file="/jsp/include/footer.jsp"%>
</body>
</html>