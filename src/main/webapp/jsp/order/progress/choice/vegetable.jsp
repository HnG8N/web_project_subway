<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야채 선택</title>
</head>
<body>
<!-- container -->
<div class="order_popup" id="popup_wrap" style="display:none;">
	<input name="emptyVegetables" type="hidden" value="" />
	<input name="emptyPickles" type="hidden" value="" />

	<div class="option_display">
		<dl>
			<dt>야채 선택 (다중 선택)</dt>
			<dd id="vegeNavi">
				
				원하는 야채를 선택하여 주세요
			</dd>
		</dl>
	</div>
	<!--<p class="popup_notice_wrap">
		이상 기후로 인한 토마토 수급 불안정으로 매장 상황에 따라<br />
		샌드위치와 샐러드에 제공되는 토마토 수량이 제한될 수 있습니다.
	</p>-->
	<div class="popup_content vegetable meterial">
		<div class="lately">
			<label class="form_checkbox">
				<input id="orderVegeBtn" type="checkbox" />
				<span class="icon"></span>
				최근 야채 불러오기
			</label>
		</div>
		<div class="scroll_wrap">
			
				<h2>생야채</h2>
				<ul>
					<li>
						<label class="select_recipe" for="b1">
							<input name="vegetable" type="checkbox" data-ingredientsCode="V0009" data-ingredientsName="양상추" id="b1" value="64" />
							<span class="shape"></span>
							<div class="info">
								<img class="" alt="양상추" src="/images/menu/img_recipe_v01.png" />
								<em>양상추</em>
							</div>
						</label>
						<div class="icon_sold" th:="${'Y' == vege.soldoutYn}">
							<span>품절</span>
						</div>
					</li>
					<li>
						<label class="select_recipe" for="b2">
							<input name="vegetable" type="checkbox" data-ingredientsCode="V0010" data-ingredientsName="토마토" id="b2" value="66" />
							<span class="shape"></span>
							<div class="info">
								<img class="" alt="토마토" src="/images/menu/img_recipe_v02.png" />
								<em>토마토</em>
							</div>
						</label>
						<div class="icon_sold" th:="${'Y' == vege.soldoutYn}">
							<span>품절</span>
						</div>
					</li>
					<li>
						<label class="select_recipe" for="b3">
							<input name="vegetable" type="checkbox" data-ingredientsCode="V0011" data-ingredientsName="오이" id="b3" value="67" />
							<span class="shape"></span>
							<div class="info">
								<img class="" alt="오이" src="/images/menu/img_recipe_v03.png" />
								<em>오이</em>
							</div>
						</label>
						<div class="icon_sold" th:="${'Y' == vege.soldoutYn}">
							<span>품절</span>
						</div>
					</li>
					<li>
						<label class="select_recipe" for="b4">
							<input name="vegetable" type="checkbox" data-ingredientsCode="V0012" data-ingredientsName="피망" id="b4" value="68" />
							<span class="shape"></span>
							<div class="info">
								<img class="" alt="피망" src="/images/menu/img_recipe_v04.png" />
								<em>피망</em>
							</div>
						</label>
						<div class="icon_sold" th:="${'Y' == vege.soldoutYn}">
							<span>품절</span>
						</div>
					</li>
					<li>
						<label class="select_recipe" for="b5">
							<input name="vegetable" type="checkbox" data-ingredientsCode="V0013" data-ingredientsName="양파" id="b5" value="69" />
							<span class="shape"></span>
							<div class="info">
								<img class="" alt="양파" src="/images/menu/img_recipe_v05.png" />
								<em>양파</em>
							</div>
						</label>
						<div class="icon_sold" th:="${'Y' == vege.soldoutYn}">
							<span>품절</span>
						</div>
					</li>
				</ul>
			
			
				<h2>절임류</h2>
				<ul>
					<li>
						<label class="select_recipe">
							<input name="vegetable" type="checkbox" data-ingredientsCode="V0014" data-ingredientsName="피클" value="70" />
							<span class="shape"></span>
							<div class="info">
								<img class="" alt="피클" src="/images/menu/img_recipe_v06.png" />
								<em>피클</em>
							</div>
						</label>
						<div class="icon_sold" th:="${'Y' == vege.soldoutYn}">
							<span>품절</span>
						</div>
					</li>
					<li>
						<label class="select_recipe">
							<input name="vegetable" type="checkbox" data-ingredientsCode="V0015" data-ingredientsName="올리브" value="71" />
							<span class="shape"></span>
							<div class="info">
								<img class="" alt="올리브" src="/images/menu/img_recipe_v07.png" />
								<em>올리브</em>
							</div>
						</label>
						<div class="icon_sold" th:="${'Y' == vege.soldoutYn}">
							<span>품절</span>
						</div>
					</li>
					<li>
						<label class="select_recipe">
							<input name="vegetable" type="checkbox" data-ingredientsCode="V0016" data-ingredientsName="할라피뇨" value="72" />
							<span class="shape"></span>
							<div class="info">
								<img class="" alt="할라피뇨" src="/images/menu/img_recipe_v08.png" />
								<em>할라피뇨</em>
							</div>
						</label>
						<div class="icon_sold" th:="${'Y' == vege.soldoutYn}">
							<span>품절</span>
						</div>
					</li>
				</ul>
			
			<h2>선택 안함</h2>
			<ul>
				<li>
					<label class="select_recipe">
						<input data-ingredientsCode="V9999" data-ingredientsName="모든 야채 제외" name="vegetable" type="checkbox" value="73" />
						<span class="shape"></span>
						<div class="info">
							<img class="" src="/images/order/icon_except.png" />
							<em>모든 야채 제외</em>        <!-- #210906 문구 변경 요청 -->
						</div>
					</label>
					<div class="icon_sold">
						<span>품절</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="btn_area">
			
				<a class="btn bgc_white" href="javascript:window.parent.item.changePopup('/order/progress/choice/cheese', 630, 'prev');"><span>이전</span></a>
				<button class="btn bgc_point i_reg" id="ordPrgsNextBtn" type="button"><span>다음</span></button>
			
			
		</div>
	</div>
</div>
</body>
</html>