<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>SUBWAY - 팝업(빵길이 선택)</title>
    <meta charset="utf-8" />
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />

    <link href="http://subway.co.kr/" rel="canonical" /><!-- 20180221 -->
    <meta content="신선하고 건강한 글로벌 NO.1 샌드위치 브랜드, 써브웨이" name="description" />
    <link rel="shortcut icon" type="image/x-icon" href="./images/common/subway_favicon.ico?v=2023021301" />
        <link rel="stylesheet" type="text/css" href="./css/jquery.mCustomScrollbar.min.css?v=2023021301" />
        <link rel="stylesheet" type="text/css" href="./css/ui.common.css?v=2023021301" />
        <link rel="stylesheet" type="text/css" href="./css/ui.popup.css?v=2023021301" />
        <link rel="stylesheet" type="text/css" href="./css/ui.order.css?v=2023021301" />
        <link rel="stylesheet" type="text/css" href="./css/ui.order.css?v=2023021301" />
        <script crossorigin="anonymous" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" src="https://code.jquery.com/jquery-1.12.4.min.js" type="text/javascript"></script>
        <script crossorigin="anonymous" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="./js/jquery/jquery.easing.1.3.min.js?v=2023021301"></script>
        <script type="text/javascript" src="./js/jquery/jquery.bxslider.min.js?v=2023021301"></script>
        <script type="text/javascript" src="./js/jquery/jquery.mCustomScrollbar.concat.min.js?v=2023021301"></script>
        <script type="text/javascript" src="./js/jquery/TweenMax.min.js?v=2023021301"></script>
        <script type="text/javascript" src="./js/ui.common.js?v=2023021301"></script>
	<meta charset="utf-8" />
	<script type="text/javascript" src="./js/order/common/bread_length.js?v=2023021301"></script>
	<link rel="stylesheet" type="text/css" href="./css/ui.order.css?v=2023021301" />
    </head>
</head>
<body>
<!-- container -->
<div class="order_popup" id="popup_wrap">
		<div class="option_display">
			<dl>
				<dt>빵 길이 선택</dt>
				<dd id="breadLength">15cm</dd>
			</dl>
		</div>
		<div class="popup_content bread_leng">
			<input id="breadLengthMeta" readonly="" type="hidden" value="" />
			<ul>
				
					<li>
						<label class="form_circle" for="15SUB">
							<input name="breadType" type="radio" soldout="N" itemcode="01656" checked="checked" id="15SUB" value="15SUB" />
							<span class="icon"></span>
							<em>15cm</em>
							
						</label>
					</li>
				
				
					<li>
						<label class="form_circle" for="30SUB">
							<input name="breadType" type="radio" soldout="N" itemcode="01657" id="30SUB" value="30SUB" />
							<span class="icon"></span>
							<em>30cm</em>
							
						</label>
					</li>
				
			</ul>
			<div class="btn_area">
				
					<a class="btn bgc_white" href="javascript:window.parent.item.changePopup(null, null);"><span>이전</span></a>
					<button class="btn bgc_point i_reg" id="ordPrgsNextBtn" type="button"><span>다음</span></button>
				
				
			</div>
		</div>
	</div>
</body>
</html>