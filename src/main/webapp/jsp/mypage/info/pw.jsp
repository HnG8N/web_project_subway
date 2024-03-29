<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="js/mypage/manage/modify_pw.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="http://subway.co.kr/" rel="canonical" /><!-- 20180221 -->
    <meta content="신선하고 건강한 글로벌 NO.1 샌드위치 브랜드, 써브웨이" name="description" />
    <link rel="shortcut icon" type="image/x-icon" href="./images/common/subway_favicon.ico?v=2023021301" />
    <link rel="stylesheet" type="text/css" href="./css/jquery.mCustomScrollbar.min.css?v=2023021301" />
    <link rel="stylesheet" type="text/css" href="./css/ui.common.css?v=2023021301" />
    <link rel="stylesheet" type="text/css" href="./css/ui.popup.css?v=2023021301" />
    <link rel="stylesheet" type="text/css" href="./css/ui.order.css?v=2023021301" />
    
    <script crossorigin="anonymous" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" src="https://code.jquery.com/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script crossorigin="anonymous" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" type="text/javascript"></script>

	<link rel="stylesheet" type="text/css" href="./css/ui.mypage.css?v=2023021301" />
	<script>
		/*<![CDATA[*/
		jQuery(document).ready(function () {
			parent.$(".popup_iframe_wrapper").css({height: 795});
		});
		/*]]>*/
	</script>
</head>
<body id="change_pw">
	<!-- container -->
	<div id="popup_wrap_wh">
		<!-- 비밀번호 변경 팝업-->
		<div class="chage_pw">
			<h1 class="title">비밀번호 변경</h1>
            <div class="popup_content">
                <p class="txt">개인정보 보호를 위해 주기적으로 변경해 주세요.<br />타인에게 비밀번호가 노출되지 않도록 주의해 주세요.</p>
                <section class="form_box">
                    <div class="write_info_wrap">
                        <div class="input_set">
                            <dl class=""><!-- 입력값 정상일때:class="true_v"추가 -->
                                <dt>현재 비밀번호<span class="ess"></span></dt>
                                <dd>
                                    <span class="form_text">
                                    	<input id="id" type="hidden" value="<%=session.getAttribute("userId") %>" />
                                        <input id="pw" name="pw" placeholder="현재 비밀번호" type="password" />
                                    </span>
                                    <span class="pw_check miss" id="wrong-msg-pw"></span>
                                    <!--issues/397#note_26607 문구노출-->
                                </dd>
                            </dl>
                        </div>
                        <div class="input_set input_pw_div">
                            <dl>
                                <dt>새 비밀번호<span class="ess"></span></dt>
                                <dd>
                                    <span class="form_text">
                                        <input class="input_pw" id="newPw" name="newPw" placeholder="비밀번호 변경" type="password" />
                                    </span>
                                    <span class="pw_check miss" id="wrong-msg-newPw"></span>
                                    <!--issues/397#note_26607 문구노출-->
                                    <i class="icon_true_v"></i><!-- 입력값 정상 확인 아이콘 -->
                                </dd>
                            </dl>
                        </div>
                        <div class="input_set input_pw_div">
                            <dl>
                                <dt>새 비밀번호 확인<span class="ess"></span></dt>
                                <dd>
                                    <span class="form_text">
                                         <input class="input_pw" id="subPw" name="subPw" placeholder="비밀번호 변경" type="password" />
                                    </span>
                                    <!--issues/397#note_26607 문구노출-->
                                    <i class="icon_true_v"></i><!-- 입력값 정상 확인 아이콘 -->
                                </dd>
                            </dl>
                            <!--<span class="pw_check miss" id="worng-msg-pw"></span>-->
                        </div>
                    </div>
                </section>
                <div class="btn_area">
                    <a class="btn bgc_white btn_close" style="width:130px;"><span>취소</span></a>
                    <button class="btn bgc_point i_reg" id="pwInfo" style="width:136px;"><span>변경하기</span></button>
                </div>
			</div>
		</div>
		<!--// 비밀번호 변경 팝업 -->
	</div>
</body>
</html>
