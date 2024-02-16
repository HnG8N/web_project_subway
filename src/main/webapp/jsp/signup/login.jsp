<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="js/signup/login.js"></script>
	<title>로그인</title>
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
    
    <link rel="stylesheet" type="text/css" href="./css/ui.member.css?v=2023051202" />
	<script type="text/javascript" src="./js/auth/auth.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/member/signin.js?v=2023051202"></script>
	<script>
		  $(document).ready(function() {
				writeOn(); //input focus
				agress_scrollbar();	
		  });
	</script>
</head>
<body>
<%@ include file="/jsp/include/header.jsp"%>
	            <!-- container s -->
            <div class="bg_type01" id="container">
			<input id="returnUrl" name="returnUrl" type="hidden" value="/" />
			<input id="dormantCloseYn" name="dormantCloseYn" type="hidden" value="N" />

			<!-- sub content s -->
			<div id="content">
				<!-- 로그인 -->
					<form action="login.do" method="post" name="loginForm">
				<div class="signin_wrapper">
					<div class="signin_tit">
						<h2>LOGIN</h2>
						<p>써브웨이 회원으로 로그인하시면 제공하는<br />다양한 서비스를 이용할 수 있습니다.</p>
					</div>
					<div class="signin_input">
						<div class="form_box">
							<div class="write_info_wrap">
								<div class="input_set">
									<dl>
										<dt>아이디</dt>
										<dd>
											<span class="form_text">
												<input class="required-value" id="id" name="id" placeholder="아이디 입력" type="text" value="" />
											</span>
										</dd>
										<dt>비밀번호</dt>
										<dd>
											<span class="form_text">
												<input class="required-value" id="pw" name="pw" placeholder="비밀번호 입력" type="password" />
											</span>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="signin_btn">
						<a class="btn bgc_point on" href="javascript:void(0);" id="login" style="width:370px;"><span>로그인</span></a>
					</div>
					<div class="signin_link">
						<ul>
							<li><a href="findId_view.do" id="findIdBtn">아이디 찾기</a></li>
							<li><a href="findPw_view.do" id="findPwBtn">비밀번호 찾기</a></li>
							<li><a href="signup_view.do">회원가입</a></li>
						</ul>
					</div>
				</div>	
				</form>
				<!--// 로그인 -->
			</div>
			<!--// sub content e -->
		</div>
	<%@ include file="/jsp/include/footer.jsp"%>
</body>
</html>