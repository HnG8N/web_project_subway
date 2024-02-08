<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵 길이 선택</title>
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
			<input id="breadLengthMeta" readonly="" type="hidden" value="15SUB" />
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