<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
  	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="js/signup/signup.js"></script>
    <title>회원가입</title>
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
  	<%@ include file="/jsp/include/header.jsp"%>
  	<!-- container s -->
            <div class="bg_type01" id="container">
		<!-- sub content -->
		<div id="content">
			<!-- 멤버십가입 -->
			<div class="joining_wrapper">
				<h2 class="subTitle_02">회원가입</h2>

				<!-- join step -->
				<div class="join_step">
					<ul>
						<li class="step01"><span class="blind">약관동의</span></li> <!-- 현재 step에 class="curr" 추가 -->
						<li class="step02"><span class="blind">본인인증</span></li>
						<li class="step03 curr"><span class="blind">정보입력</span></li>
						<li class="step04"><span class="blind">가입완료</span></li>
					</ul>
				</div>
				<!--// join step -->

				<h3 class="step_tit"><span>Step3.</span> 정보입력</h3>
				<!-- step_cont_box -->
				<div class="step_cont_box">
					<!-- step03_cont -->
					<form action="signup.do" method="post" onsubmit="return validation()">
					<div class="step03_cont">
						<section class="form_box">
							<input id="mbrYn" name="mbrYn" type="hidden" />
							<input id="mbrLgnId" name="mbrLgnId" type="hidden" />

							<h2>기본 정보 (필수 입력)</h2>
							<div class="write_info_wrap">
								<div class="input_set">
									<dl>
										<dt>아이디(이메일)<span class="ess"></span></dt>
										<dd>
											<span class="form_text" style="width:155px">
												<input class="required-value" id="mbrLgnId1" name="mbrLgnId1" placeholder="이메일 아이디 입력" type="text" />
											</span>
											@
											<span class="form_text" style="width:155px">
												<input class="required-value" id="mbrLgnId2" name="mbrLgnId2" placeholder="이메일 도메인 입력" type="text" />
											</span>
											<span class="form_select" style="width:155px">
												<select id="mbrLgnId3" name="mbrLgnId3">
													<option value="">직접 입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="gmail.com">gmail.com</option>
													<option value="icloud.com">icloud.com</option>
													<option value="nate.com">nate.com</option>
												</select>
											</span>
											<div class="btn_input_in">
												<input class="required-val" id="duplicationYn-mbrLgnId" type="hidden" value="N" />
												<a class="in_form_btn" href="javascript:void(0);" id="pop" onclick="view.checkId('N');return false;"><span>중복확인</span></a>
											</div>
											<span class="pw_check miss" id="worng-msg-email" style="display:none;">이메일 주소를 입력해주세요.</span>
										</dd>
									</dl>
								</div>
								<!-- (2020.08.11) 회원 가입 시 이메일 두번 입력하도록 변경-->
								<div class="input_set">
									<dl>
										<dt>아이디(이메일) 확인<span class="ess"></span></dt>
										<dd>
											<span class="form_text" style="width:155px">
												<input class="required-value" id="subMbrLgnId1" name="subMbrLgnId1" placeholder="이메일 아이디 입력" type="text" />
											</span>
											@
											<span class="form_text" style="width:155px">
												<input class="required-value" id="subMbrLgnId2" name="subMbrLgnId2" placeholder="이메일 도메인 입력" type="text" />
											</span>
											<span class="form_select" style="width:155px">
												<select id="subMbrLgnId3" name="subMbrLgnId3">
													<option value="">직접 입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="gmail.com">gmail.com</option>
													<option value="icloud.com">icloud.com</option>
													<option value="nate.com">nate.com</option>
												</select>
											</span>
											<!--<div class="btn_input_in">
												<input type="hidden" value="N" id="duplicationYn-mbrLgnId" class="required-val">
												<a href="javascript:void(0);" id ="pop" class="in_form_btn" onclick="view.checkId('N');return false;"><span>중복확인</span></a>
											</div>-->
											<span class="pw_check miss" id="worng-msg-email-sub" style="display:none;">이메일 주소를 입력해주세요.</span>
										</dd>
									</dl>
								</div>
								<div class="input_set input_pw_div">
									<dl>
										<dt>비밀번호<span class="ess"></span></dt>
										<dd>
											<span class="form_text" style="width:235px">
												<input class="required-value input_pw" id="pw" name="pw" placeholder="비밀번호 입력" type="password" /><!-- 2019-11-11 placeholder 수정 -->
											</span>
											<span class="pw_check miss worng-msg-pw" id="pwdMsg1"></span>
										</dd>
									</dl>
								</div>
								<div class="input_set input_pw_div">
									<dl>
										<dt>비밀번호 확인<span class="ess"></span></dt>
										<dd>
											<span class="form_text" style="width:235px"><!-- 2019-11-11 inline style 수정 -->
												<input class="required-value input_pw" id="subPw" name="subPw" placeholder="비밀번호 입력" type="password" /><!-- 2019-11-11 placeholder 수정 -->
											</span>
											<span class="pw_check miss worng-msg-pw" id="pwdMsg2"></span><!-- 2019-11-11 비밀번호 규칙 문구 수정 -->
										</dd>
									</dl>
								</div>
							</div>
							<!--<h2>추가 정보 (선택 입력)</h2>-->	<!-- #211209 주소입력 영역 삭제 요청 -->
							<div class="write_info_wrap" style="display:none;">
								<!-- 입력1세트 -->
								<div class="input_set">
									<dl>
										<dt>우편번호</dt>
										<dd>
											<!-- 주소 폼일시 post_num 클래스 추가 -->
											<span class="form_text post_num" style="width:650px">
												<input id="zipCd" name="zipCd" placeholder="00000" readonly="" type="text" />
											</span>
											<div class="btn_input_in">
												<button class="in_form_btn" type="button">
													<span id="addressSearchBtn">우편번호검색</span>
												</button>
											</div>
										</dd>
										<dt>주소</dt>
										<dd>
											<span class="form_text">
												<input id="baseAddr" name="baseAddr" placeholder="주소 입력" readonly="" type="text" />
											</span>
										</dd>
										<dt>상세주소</dt>
										<dd>
											<span class="form_text">
												<input id="dtlAddr" name="dtlAddr" placeholder="상세주소 입력" type="text" />
											</span>
										</dd>
									</dl>
								</div>
								<!--// 입력1세트 -->
							</div>
						</section>
					</div>
					<!--// step03_cont -->
					<div class="btn_area">
						<a class="btn bgc_point i_reg" href="javascript:void(0);" id="submitBtn" style="width:170px;"><span>회원가입 완료</span></a>
					</div>
				</form>
				</div>
				<!--// step_cont_box -->
			</div>
			<!--// 멤버십가입 -->
		</div>
		<!--// sub content -->
	</div>
  	
  	
  	
	<!-- container s -->
	<div id="container">
  	<h1>회원가입</h1>
  	
  	
  	아이디 : <input type="text" id="id" name="id">
  			<button type="button" id="checkid">아이디 중복 검사</button><br>
  			<div id="result"></div>
  	
  	비밀번호 : <input type="password" id="pw" oninput="pwCheck()" name="pw"><br>
  	비밀번호 확인 : <input type="password" id="pwcheck" oninput="pwCheck()" name="pwcheck"><br>
  			<div id="result4"></div>
  	
  	
 	이름 : <input type="text" id="name" name="name"><br>
  	
    주소 : <input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly">
    	  <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
    	  <input type="text" id="address" name="address" placeholder="주소"readonly="readonly"><br>
    	  <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" >
    	  <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" readonly="readonly"><br>
    
    생년월일 : <select name="year" id="yearSelect" name="year">
        		<c:forEach var="i" begin="1924" end="2024">
            		<option><c:out value="${i}" /></option>
        	 	</c:forEach>
    		 </select>년
    
    		<select name="month" id="monthSelect" name="month" onchange="updateDays()">
		        <c:forEach var="i" begin="1" end="12">
		            <option><c:out value="${i}" /></option>
		        </c:forEach>
		    </select>월

		    <select name="day" id="daySelect" name="day">
		        <c:forEach var="i" begin="1" end="31">
		            <option><c:out value="${i}" /></option>
		        </c:forEach>
		    </select>일<br>
	
	전화번호 : <select name="start">
				<option>010</option>
				<option>011</option>
			</select>
			-
    		<input type="text" id="mid" name="mid" maxlength="4">
    		-
    		<input type="text" id="end" name="end" maxlength="4"><br>
   	이메일 : <input type="text" id="email1" name="email1"> @ <select id="email2" name="email2">
   												<option>naver.com</option>
   												<option>gmail.com</option>
   											</select>
   			<button type="button" id="sendemail">인증번호 발송</button><br>
   	<div id="result2"></div>
   			
    인증번호 : <input type="text" id="emailcode" maxlength="4">
    <button type="button" id="codecheck" >인증확인</button><br>
    <div id="result3"></div>
    
    <input type="submit" value="회원가입">
    
    </div>
	<%@ include file="/jsp/include/footer.jsp"%>
  </body>
</html>