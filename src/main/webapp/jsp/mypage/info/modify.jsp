<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
    
    <script type="text/javascript" src="./js/auth/auth.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/mypage/manage/modify_info.js?v=2023051202"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/ui.mypage.css?v=2023051202" />
	
	<script type="text/javascript" src="./js/auth/auth.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/mypage/manage/modify_info.js?v=2023051202"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/ui.mypage.css?v=2023051202" />
</head>
<body>
	<%@ include file="/jsp/include/header.jsp"%>
	<!-- container s -->
	<div class="bg_gray" id="container">
		<!-- sub content s -->
		<div id="content">
			<!-- 내정보관리 > 정보변경 -->
			<div class="manage_wrapper">
				<h2 class="subTitle_02">정보변경</h2>

				<div class="manage_cont_box">
					<section class="form_box">
						<div class="write_info_wrap">
							<!-- 2019-11-15 비밀번호변경 버튼 추가 -->
							<a class="btn bgc_gray_02 h_35 squre go_pw"
								href="javascript:void(0);" id="pop"
								onclick="view.changePw(); return false;" style="width: 132px;">
								<span>비밀번호 변경</span>
							</a>
							<!--// 2019-11-15 비밀번호변경 버튼 추가 -->
							<div class="write_info_wrap">
								<h2>회원 정보</h2>
								<!-- 2019-11-15 타이틀 추가 -->

								<!-- 2019-11-15 회원정보 마크업 수정 -->
								<!-- issues/482#note_25785 수정 -->
								<div class="input_set style01">
									<dl class="info_dl">
										<dt>이메일 아이디</dt>
										<dd>${dto.email}</dd>
									</dl>
								</div>
								<div class="input_set style01">
									<dl class="info_dl">
										<dt>이름</dt>
										<dd id="mbrNm">${dto.name}</dd>
									</dl>
									<dl class="info_dl">
										<dt>주소</dt>
										<dd id="mbrNm">${dto.address}</dd>
									</dl>
									<dl class="info_dl">
										<dt>생년월일</dt>
										<dd id="mbrBirth">${dto.birth}</dd>
									</dl>
									<dl class="info_dl">
										<dt>휴대전화</dt>
										<dd>
											<div class="phone_num_wrap">
												<span class="form_text"> <input id="cpNo" name="cpNo"
													readonly="" type="tel" value="${dto.tel}" />
												</span>
												<div class="btn_input_in">
													<button class="in_form_btn cpNoChange" id="checkAuthBtn"
														type="button">
														<span>정보변경</span>
													</button>
												</div>
											</div>
										</dd>
									</dl>
								</div>
								<p class="p_notice">· 이름이나 생년월일, 성별, 핸드폰 번호 등의 정보가 변경되었다면
									본인확인을 통해 정보를 수정할 수 있습니다.</p>
								<!--// issues/482#note_25785 수정 -->

							</div>
						</div>
					</section>
					<input id="modifyChk" type="hidden" />
					<div class="btn_area">
						<a class="btn bgc_white" href="javascript:void(0);"
							id="withdrawal" style="width: 126px;"><span>회원탈퇴</span></a> <a
							class="btn bgc_point " href="javascript:void(0);" id="modInfo"
							style="width: 197px;"><span>회원정보 변경</span></a>
					</div>
				</div>
			</div>
			<!--// 내정보관리 > 정보변경 -->
		</div>
		<!--// sub content e -->
	</div>
	<%@ include file="/jsp/include/footer.jsp"%>
</body>
</html>