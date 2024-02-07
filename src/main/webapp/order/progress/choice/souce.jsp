<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소스 선택</title>
</head>
<body>
<!-- container -->
<div class="order_popup" id="popup_wrap" style="display:none;">
		<input name="emptySauce" type="hidden" value="" />

		<div class="option_display">
			<dl>
				<dt>소스/시즈닝 선택</dt>
				<dd id="sauceNavi">
					
					소스/시즈닝을 선택 해 주세요
				</dd>
			</dl>
		</div>
		<div class="popup_content sauce meterial">
			<div class="scroll_wrap">
				<ul>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0011" data-ingredientsName="랜치" value="23" />
							<span class="shape"></span>
							<div class="info">
								<img alt="랜치" src="/images/menu/img_recipe_s01_2.png" />
								<strong>크리미한</strong>
								<em>랜치</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0007" data-ingredientsName="스위트 어니언" value="19" />
							<span class="shape"></span>
							<div class="info">
								<img alt="스위트 어니언" src="/images/menu/img_recipe_s07.png" />
								<strong>달콤한</strong>
								<em>스위트 어니언</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0012" data-ingredientsName="마요네즈" value="24" />
							<span class="shape"></span>
							<div class="info">
								<img alt="마요네즈" src="/images/menu/img_recipe_s02.png" />
								<strong>고소한</strong>
								<em>마요네즈</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0009" data-ingredientsName="스위트 칠리" value="21" />
							<span class="shape"></span>
							<div class="info">
								<img alt="스위트 칠리" src="/images/menu/img_recipe_s12.png" />
								<strong>매콤달콤한</strong>
								<em>스위트 칠리</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0010" data-ingredientsName="스모크 바비큐" value="22" />
							<span class="shape"></span>
							<div class="info">
								<img alt="스모크 바비큐" src="/images/menu/img_recipe_s17.png" />
								<strong>스모크 향</strong>
								<em>스모크 바비큐</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0013" data-ingredientsName="핫 칠리" value="25" />
							<span class="shape"></span>
							<div class="info">
								<img alt="핫 칠리" src="/images/menu/img_recipe_s18.png" />
								<strong>화끈하게 매운</strong>
								<em>핫 칠리</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0008" data-ingredientsName="허니 머스타드" value="20" />
							<span class="shape"></span>
							<div class="info">
								<img alt="허니 머스타드" src="/images/menu/img_recipe_s03.png" />
								<strong>새콤달콤한</strong>
								<em>허니 머스타드</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0014" data-ingredientsName="사우스웨스트 치폴레" value="26" />
							<span class="shape"></span>
							<div class="info">
								<img alt="사우스웨스트 치폴레" src="/images/menu/img_recipe_s09.png" />
								<strong>이국적으로 매콤한</strong>
								<em class="small">사우스웨스트 치폴레</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0015" data-ingredientsName="홀스래디쉬" value="27" />
							<span class="shape"></span>
							<div class="info">
								<img alt="홀스래디쉬" src="/images/menu/img_recipe_s04.png" />
								<strong>알싸한</strong>
								<em>홀스래디쉬</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0003" data-ingredientsName="머스타드" value="15" />
							<span class="shape"></span>
							<div class="info">
								<img alt="머스타드" src="/images/menu/img_recipe_s11.png" />
								<strong>알싸한</strong>
								<em>머스타드</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0016" data-ingredientsName="올리브 오일" value="28" />
							<span class="shape"></span>
							<div class="info">
								<img alt="올리브 오일" src="/images/menu/img_recipe_s06.png" />
								<strong>이태리 엑스트라버진</strong>
								<em>올리브 오일</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0006" data-ingredientsName="레드 와인 식초" value="18" />
							<span class="shape"></span>
							<div class="info">
								<img alt="레드 와인 식초" src="/images/menu/img_recipe_s05.png" />
								<strong>과일향</strong>
								<em>레드 와인 식초</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0017" data-ingredientsName="소금" value="29" />
							<span class="shape"></span>
							<div class="info">
								<img alt="소금" src="/images/menu/img_recipe_s13.png" />
								<strong></strong>
								<em>소금</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S0018" data-ingredientsName="후추" value="30" />
							<span class="shape"></span>
							<div class="info">
								<img alt="후추" src="/images/menu/img_recipe_s14.png" />
								<strong></strong>
								<em>후추</em>
							</div>
						</label>				
						
					</li>
					<li>
						<label class="select_recipe">
							<input name="sauce" type="checkbox" data-ingredientsCode="S9999" data-ingredientsName="선택안함" value="14" />
							<span class="shape"></span>
							<div class="info">
								<img alt="선택안함" src="/images/order/icon_except.png" />
								<strong></strong>
								<em>선택안함</em>
							</div>
						</label>				
						
					</li>
				</ul>
			</div>
			<div class="btn_area">
				
					
					<a class="btn bgc_white" href="javascript:window.parent.item.changePopup('/order/progress/choice/vegetable', 630, 'prev');"><span>이전</span></a>
					<button class="btn bgc_point i_reg" id="ordPrgsNextBtn" type="button"><span>다음</span></button>
				
				
			</div>
		</div>
	</div>
</body>
</html>