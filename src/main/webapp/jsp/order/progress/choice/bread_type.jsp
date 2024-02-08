<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵 종류 선택</title>
</head>
<body>
<!-- container -->
<div class="order_popup" id="popup_wrap">
		<div class="option_display">
			<dl>
				<dt>빵 선택</dt>
				<dd id="breadNavi">빵을 선택하세요.</dd>
			</dl>
		</div>
		<!--<p class="popup_notice_wrap">
			일부 원재료 수급 불안정으로 한시적으로 위트, 허니오트 및 플랫브래드만 제공됩니다.<br />
			(화이트, 하티, 파마산 오레가노 일시 제공 중단 / 일부 매장 제외)<br /><br />

			양해 부탁드리며, 빠른 시간 내 정상 제공될 수 있도록 최선을 다하겠습니다.
		</p>-->
		<div class="popup_content bread meterial">
			<ul>
				<li>
					<label class="select_recipe soldout" for="b1">
						<input name="bread" type="radio" data-ingredientsCode="B0001" data-ingredientsName="화이트" id="b1" value="1" />
						<span class="shape"></span>
						<div class="info">
							<img alt="화이트" src="/images/menu/img_recipe_b05.png" />
							<em>화이트</em>
						</div>
					</label>
					<div class="icon_sold">
						<span>품절</span>
					</div>
				</li>
				<li>
					<label class="select_recipe" for="b2">
						<input name="bread" type="radio" data-ingredientsCode="B0002" data-ingredientsName="파마산 오레가노" id="b2" value="2" />
						<span class="shape"></span>
						<div class="info">
							<img alt="파마산 오레가노" src="/images/menu/img_recipe_b04.png" />
							<em>파마산 오레가노</em>
						</div>
					</label>
					
				</li>
				<li>
					<label class="select_recipe" for="b3">
						<input name="bread" type="radio" data-ingredientsCode="B0003" data-ingredientsName="위트" id="b3" value="3" />
						<span class="shape"></span>
						<div class="info">
							<img alt="위트" src="/images/menu/img_recipe_b03.png" />
							<em>위트</em>
						</div>
					</label>
					
				</li>
				<li>
					<label class="select_recipe" for="b4">
						<input name="bread" type="radio" data-ingredientsCode="B0004" data-ingredientsName="허니오트" id="b4" value="4" />
						<span class="shape"></span>
						<div class="info">
							<img alt="허니오트" src="/images/menu/img_recipe_b01.png" />
							<em>허니오트</em>
						</div>
					</label>
					
				</li>
				<li>
					<label class="select_recipe soldout" for="b5">
						<input name="bread" type="radio" data-ingredientsCode="B0005" data-ingredientsName="하티" id="b5" value="5" />
						<span class="shape"></span>
						<div class="info">
							<img alt="하티" src="/images/menu/img_recipe_b02.png" />
							<em>하티</em>
						</div>
					</label>
					<div class="icon_sold">
						<span>품절</span>
					</div>
				</li>
				<li>
					<label class="select_recipe" for="b6">
						<input name="bread" type="radio" data-ingredientsCode="B0006" data-ingredientsName="플랫브레드" id="b6" value="6" />
						<span class="shape"></span>
						<div class="info">
							<img alt="플랫브레드" src="/images/menu/img_recipe_b06.png" />
							<em>플랫브레드</em>
						</div>
					</label>
					
				</li>
			</ul>
			<div class="btn_area">
				
						
					<a class="btn bgc_white" href="javascript:window.parent.item.changePopup('/order/progress/bread/length/choice', 520, 'prev');"><span>이전</span></a>
					<button class="btn bgc_point i_reg" id="ordPrgsNextBtn" type="button"><span>다음</span></button>
				
				
			</div>
		</div>
	</div>
</body>
</html>