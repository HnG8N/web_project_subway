<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵/미트 토스팅 선택</title>
</head>
<body>
<!-- container -->
<div class="order_popup" id="popup_wrap">
		<div class="option_display">
			<dl>
				<dt>빵/미트 토스팅 선택</dt>
				<dd id="breadLength">
					<span>허니오트</span>
					<span>(15cm)</span>
					
				</dd>
			</dl>
		</div>
		<div class="popup_content bread_leng">
			<input id="breadLengthMeta" readonly="" type="hidden" value="15SUB" />
			<ul>
				<li>
					<label class="form_circle">
						<input name="warmingChk" type="radio" data-ingredientsCode="H0001" data-ingredientsName="토스팅" checked="checked" value="H0001" />
						<span class="icon"></span>
						<em>토스팅</em>
					</label>				
				</li>
				<li>
					<label class="form_circle">
						<input name="warmingChk" type="radio" data-ingredientsCode="H0002" data-ingredientsName="토스팅 안 함" value="H0002" />
						<span class="icon"></span>
						<em>토스팅 안 함</em>
					</label>				
				</li>
			</ul>
			<div class="btn_area">
				
					
					<a class="btn bgc_white" href="javascript:window.parent.item.changePopup('/order/progress/choice/bread', 630, 'prev');"><span>이전</span></a>
					<button class="btn bgc_point i_reg" id="ordPrgsNextBtn" type="button" data-pizzaSubYn="N">
						<span>다음</span></button>
				
				
			</div>
		</div>
	</div>
</body>
</html>