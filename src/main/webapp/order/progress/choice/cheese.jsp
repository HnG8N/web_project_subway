<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치즈 선택</title>
</head>
<body>
<!-- container -->
<div class="order_popup" id="popup_wrap">
		<input name="morningYn" type="hidden" value="N" />
		<input name="flatPizzaYn" type="hidden" value="N" />
		<input name="subDogYn" type="hidden" value="N" />
		<input name="emptyCheese" type="hidden" value="" />

		<div class="option_display">
			<dl>
				<dt>치즈 선택</dt>
				<dd id="cheeseNavi">치즈를 선택하세요.</dd>
				
				<dd class="sum" id="plusCharge" style="display:none;">
					+ <span id="doubleCheeseName"></span>
					<span>1400</span>
				원</dd>
			</dl>
		</div>

		<div class="popup_content cheese meterial">
			<div class="scroll_wrap">
				<ul>
					<!-- #211028 울트라 치즈3종 치즈제외 불가-->
					<li>
						
							<label class="select_recipe" for="c1">
								<input name="cheese" type="radio" data-ingredientsCode="C0001" data-ingredientsName="아메리칸치즈" id="c1" value="7" />
								<span class="shape"></span>
								<div class="info">
									<img class="" alt="아메리칸치즈" src="/images/menu/img_recipe_c01.png" />
									<em>아메리칸치즈</em>
								</div>
							</label>
							
						

					</li>
					<li>
						
							<label class="select_recipe" for="c2">
								<input name="cheese" type="radio" data-ingredientsCode="C0002" data-ingredientsName="슈레드치즈" id="c2" value="8" />
								<span class="shape"></span>
								<div class="info">
									<img class="" alt="슈레드치즈" src="/images/menu/img_recipe_c02.png" />
									<em>슈레드치즈</em>
								</div>
							</label>
							
						

					</li>
					<li>
						
							<label class="select_recipe" for="c3">
								<input name="cheese" type="radio" data-ingredientsCode="C0004" data-ingredientsName="모차렐라치즈" id="c3" value="10" />
								<span class="shape"></span>
								<div class="info">
									<img class="" alt="모차렐라치즈" src="/images/menu/img_recipe_c03.png" />
									<em>모차렐라치즈</em>
								</div>
							</label>
							
						

					</li>
					<li>
						
							<label class="select_recipe" for="c4">
								<input name="cheese" type="radio" data-ingredientsCode="C9999" data-ingredientsName="치즈 제외" id="c4" value="9" />
								<span class="shape"></span>
								<div class="info">
									<img class="" alt="치즈 제외" src="/images/order/icon_except.png" />
									<em>치즈 제외</em>
								</div>
							</label>
							
						

					</li>
					<li>
						

					</li>
					
					
					
					
					
				</ul>

				
					<input name="cheesePrice" type="hidden" value="1400" />
					<h2>치즈 추가</h2>
					<ul>
						<li>
							
								<label class="select_recipe" for="dc1">
									<input name="doubleCheese" type="checkbox" data-ingredientsCode="C0001" data-ingredientsName="아메리칸치즈" id="dc1" value="7" />
									<span class="shape"></span>
									<div class="info">
										<img alt="아메리칸치즈" src="/images/menu/img_recipe_c01.png" />
										<em>아메리칸치즈</em>
										<span><em>+1400</em>원</span>
									</div>
								</label>
								
							
						</li>
						<li>
							
								<label class="select_recipe" for="dc2">
									<input name="doubleCheese" type="checkbox" data-ingredientsCode="C0002" data-ingredientsName="슈레드치즈" id="dc2" value="8" />
									<span class="shape"></span>
									<div class="info">
										<img alt="슈레드치즈" src="/images/menu/img_recipe_c02.png" />
										<em>슈레드치즈</em>
										<span><em>+1400</em>원</span>
									</div>
								</label>
								
							
						</li>
						<li>
							
								<label class="select_recipe" for="dc3">
									<input name="doubleCheese" type="checkbox" data-ingredientsCode="C0004" data-ingredientsName="모차렐라치즈" id="dc3" value="10" />
									<span class="shape"></span>
									<div class="info">
										<img alt="모차렐라치즈" src="/images/menu/img_recipe_c03.png" />
										<em>모차렐라치즈</em>
										<span><em>+1400</em>원</span>
									</div>
								</label>
								
							
						</li>
						
						<li>
							
						</li>
					</ul>
				
			</div>
			<div class="btn_area">
				
					
					<a class="btn bgc_white" href="javascript:window.parent.item.changePopup('/order/progress/choice/warm', 630, 'prev');"><span>이전</span></a>
					<button class="btn bgc_point i_reg" id="ordPrgsNextBtn" type="button"><span>다음</span></button>
				
				
			</div>
		</div>
	</div>
</body>
</html>