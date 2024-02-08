<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- container s -->
	<div id="container">
	<form method="post" name="moveForm">
		<input name="changeYn" type="hidden" value="Y" />
		<input name="ordType" type="hidden" value="ORD_TYPE.FAST_SUB" />
		<input name="storCd" type="hidden" value="64444" />
		<input name="cateCd" type="hidden" value="ITEM_SALAD" />
		<input name="paveFg" type="hidden" value="Y" />
		
	</form>
	<form id="orderForm" name="orderForm">
		<input name="itemIdx" type="hidden" value="60" />
		<input id="ordType" name="ordItemsVO.ordType" type="hidden" value="" />
		<input name="paveFg" type="hidden" value="Y" />
	</form>

	<input id="subpickYnCheck" type="hidden" value="N" />

	<!-- sub content s -->
	<div class="order fast_sub" id="content">
		<!-- index -->
		<div class="menu_view">
			<div class="order_title">
				<h3>Fast-Sub</h3>
				<p>
					<th:object>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</th:object>
					
				</p>
			</div>
			<ol class="order_step">
				<li class="step_shop">
					<strong>STEP 1</strong>
					매장선택
				</li>
				<li class="step_menu on">
					<strong>STEP 2</strong>
					메뉴선택
				</li>
				<li class="step_order">
					<strong>STEP 3</strong>
					주문하기
				</li>
				<li class="step_payment">
					<strong>STEP 4</strong>
					결제하기
				</li>
			</ol>
			<div class="tab02">
				<ul>
					<li data-cate-cd="ITEM_FAVORITE">
						<a data-cate-cd="ITEM_FAVORITE" href="javascript:;" name="itemMenu">즐겨찾기 메뉴</a>
					</li>
					<li data-cate-cd="ITEM_PROMOTION">
						<a data-cate-cd="ITEM_PROMOTION" href="javascript:;" name="itemMenu">프로모션</a>
					</li>
					<!-- 아침메뉴 탭 제거 #200917
                    <li th:class="${itemGubun eq 'morning' ? 'active' : ''}" th:if="${'Y' == franchiseInfoVO.morningTimeYn}"
                         data-cate-cd="ITEM_MORNING" >
                        <a href="javascript:;" name="itemMenu" data-cate-cd="ITEM_MORNING">모닝써브</a>
                    </li>-->
					<li data-cate-cd="ITEM_SANDWICH">
						<a data-cate-cd="ITEM_SANDWICH" href="javascript:;" name="itemMenu">샌드위치</a>
					</li>
					<!-- #211019 FAST-SUB/HOME-SUB 샐러드 일시 판매 중지로 인한 주석처리, #211104 판매 재개 -->
				    <li data-cate-cd="ITEM_SALAD" class="active">
						<a data-cate-cd="ITEM_SALAD" href="javascript:void(0);" name="itemMenu">샐러드</a>
					</li>
					<li data-cate-cd="ITEM_UNIT">
						<a data-cate-cd="ITEM_UNIT" href="javascript:;" name="itemMenu">랩ㆍ기타</a>
					</li>
					<li data-cate-cd="ITEM_SIDEDRINK">
						<a data-cate-cd="ITEM_SIDEDRINK" href="javascript:;" name="itemMenu">사이드ㆍ음료</a>
					</li>
				</ul>
			</div>
			<div class="order_con">
				<div class="menu_info">
					<div class="menu_info">
						<!-- 2019-12-02 #172 제품썸네일 영역 마크업 수정 (figure 태그로 감쌈) -->
						<figure class="img">
							
							<img onError="this.src='/images/common/noneImage.jpg'" alt="치킨 데리야끼" src="/upload/item/치킨데리야키_20220413120812435.png" />
						</figure>
						<!--// 2019-12-02 #172 제품썸네일 영역 마크업 수정 (figure 태그로 감쌈) -->
						<div class="txt_info"><!-- 2019-12-02 #172 제품 정보 영역 클래스 추가 -->
							<h3>
								
									
									<th:object>샐러드</th:object>
								

								
								<strong>치킨 데리야끼</strong>
								<em>
									<span>Chicken Teriyaki</span>
									<!-- 즐겨찾기 버튼 -->
									<label class="my_bookmark">
										<input onclick="favoriteMenu.favor(this);" type="checkbox" data-itemidx="60" />
										<i class="i_star"></i>
									</label>
								</em>
							</h3>

							<p>담백한 치킨 스트립에 달콤짭쪼름한 써브웨이 특제 데리야끼 소스 토핑으로 더 풍성한 샐러드</p>
							

							<button class="btn bgc_point i_reg" id="itemConbiPopBtn" style="width:183px;" type="button" data-item-gubun="salad" data-store-cd="64444" data-combination-idx="27" data-item-code="00063" data-subpick="N">
								<span>추천 꿀 조합</span>
								
							</button>
						</div>
					</div>
					<div class="nutrition_list">
						<h4>영양성분표</h4>
						<div class="board_list_wrapper">
							<div class="content">
								<table class="nutrition_table">
									<caption>영양성분표 테이블</caption>
									<colgroup>
										<col width="16%" />
										<col width="17%" />
										<col width="17%" />
										<col width="17%" />
										<col width="*" />
										<col width="16%" />
									</colgroup>
									<thead>
									<tr>
										<th scope="col">중량(g)</th>
										<th scope="col">열량(kcal)</th>
										<th scope="col">단백질(g)</th>
										<th scope="col">포화지방(g)</th>
										<th scope="col">당류(g)</th>
										<th scope="col">나트륨(mg)</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>
											<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '302' : ordItemsVO.itemCode == '01532' ? '258' : rs.itemWeight}"></div>-->
											<div>362</div>
										</td>
										<td>
											<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '595' : ordItemsVO.itemCode == '01532' ? '445' : rs.itemCalorie}"></div>-->
											<div>152</div>
										</td>
										<td>
											<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '28.2 (51%)' : ordItemsVO.itemCode == '01532' ? '21.6 (39%)' : rs.itemProtein}"></div>-->
											<div>19.8 (36%)</div>
										</td>
										<td>
											<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '10.1 (68%)' : ordItemsVO.itemCode == '01532' ? '6.7 (45%)' : rs.itemFat}"></div>-->
											<div>0.7 (5%)</div>
										</td>
										<td>
											<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '8.8 (9%)' : ordItemsVO.itemCode == '01532' ? '9.0 (9%)' : rs.itemSugars}"></div>-->
											<div>9.7 (10%)</div>
										</td>
										<td>
											<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '1356 (68%)' : ordItemsVO.itemCode == '01532' ? '1153 (58%)' : rs.itemSalt}"></div>-->
											<div>455 (23%)</div>
										</td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="table_info">
							<!-- (2020.08.20) 카테고리별 영양성분 입력 화면 관리자 추가 건: 메뉴별 개별로 입력하도록 수정 -->
							<div class="table_desc">
								<p>※ 15cm 샌드위치의 영양 정보는 기본 야채 5종(양상추, 토마토, 오이, 피망, 양파), 15cm 위트 브레드 및 제품에 따른 미트류가 포함되어 있으며, 치즈와 소스는 제외됩니다.<br>※ 샐러드의 영양 정보는 기본 야채 5종(양상추, 토마토, 오이, 피망, 양파) 및 제품에 따른 미트류가 포함되어 있으며, 치즈와 소스는 제외됩니다.<br>※ 단, 메뉴명에 ‘치즈’가 포함되는 경우 치즈의 영양정보도 포함됩니다.<br>※ 랩, 그릴드 랩의 영양 정보는 치즈와 소스를 포함한 고정 레시피를 기준으로 합니다.<br>※ 아침메뉴의 영양 정보는 15cm 위트 브레드 및 제품에 따른 미트류, 야채, 아메리칸 치즈가 포함되어 있으며, 소스는 제외됩니다.<br>※ 영양 정보표에 표시된 제품의 영양 정보/중량은 표준 레시피를 기준으로 하나, 계절의 변화, 공급사의 변화, 원재료의 수급 상황 및 제품 제조시에 발생하는 중량의 차이 등에 따라 실제 제공되는 제품의 영양 정보/중량과 차이가 있을 수 있습니다.<br>※ 괄호 안 %는 1일 영양소 기준치에 대한 비율입니다.</p>
							</div>
							<ul class="table_btn">
								<li>
									<a class="btn bgc_black" href="/sandwichCountry" link-type="popup" onclick="popup_open(this,630,740); return false;">
										<span>원산지 정보</span>
									</a>
								</li>
								<li>
									<a class="btn bgc_black" href="/sandwichAllergy" link-type="popup" onclick="popup_open(this,900,740); return false;">
										<span>알레르기 정보</span>
									</a>
								</li>
							</ul>
						</div>
					</div>

					<ol class="menu_select">
					    <li class="step01">
					        <dl>
					            <dt>
					                <strong>STEP 01</strong>
					                필수 선택 *
					            </dt>
					            <dd>
					                <ul>
					                    <li class="on">
					                        <span><a data-combination="Y">길이 선택</a></span>
					
					                        <!--<a th:attr="data-combination=${isCombination ? 'Y' : 'N'}" th:id="${isCombination ? '' : 'breadType'}">길이 선택</a>-->
					                    </li>
					
					                    <li name="bread" class="on">
					                        <a data-combination="Y">빵 선택</a>
					                    </li>
					
					
					
					
					                    <!-- #210818 페퍼로니 피자썹: 빵,데우기만 선택 가능 -->
					
					
					                    <li name="cheese" class="on">
					                        <a data-combination="Y">치즈 선택</a>
					                    </li>
					
					
					                    <!-- #210818 썹도그: 빵,데우기, 치즈만 선택 가능 -->
					
					
					                    <li name="vegetable" class="on">
					                        <a data-combination="Y">야채 선택</a>
					                    </li>
					
					
					
					                    <li name="sauce" class="on">
					                        <a style="width: 140px;" data-combination="Y">소스/시즈닝 선택</a>
					                    </li>
					
					
					
					
					
					                </ul>
					                <!-- <span>미선택 시 추천조합으로 자동 선택됩니다.</span> -->
					                <p>
					                    <!-- 빵길이 -->
					                    <th:object>15cm</th:object>
					
					                    <!-- 빵종류 -->
					                    <th:object>, 위트</th:object>
					
					                    <!-- 토스팅 여부 -->
					                    <th:object>(토스팅)</th:object>
					
					                    <!-- 치즈 -->
					                    <th:object>, 슈레드치즈</th:object>
					
					                    <!-- 야채 -->
					
					
					                    <th:object>, 오이</th:object>
					
					
					                    <th:object>, 토마토</th:object>
					
					
					                    <th:object>, 할라피뇨</th:object>
					
					
					                    <th:object>, 양상추</th:object>
					
					
					                    <th:object>, 올리브</th:object>
					
					
					                    <th:object>, 피클</th:object>
					
					
					                    <th:object>, 양파</th:object>
					
					
					                    <th:object>, 피망</th:object>
					
					
					
					
					                    <!-- 소스 -->
					
					
					                    <th:object>, 홀스래디쉬</th:object>
					
					
					                    <th:object>, 랜치</th:object>
					
					
					
					                </p>
					            </dd>
					        </dl>
					    </li>
					
					
					    <li class="step02">
					        <dl>
					            <dt>
					                <strong>STEP 02</strong>
					                추가 선택
					            </dt>
					            <dd>
					                <div>
					                    <ul>
					                        <!-- #210818 썹도그, 페퍼로니 피자썹: 미트추가, 토핑추가 불가 -->
					                        <li>
					                            <!--<a th:id="${'Y' == ordItemsVO.promotionYn && 'N' == ordItemsVO.selectToppingYn ?'' : 'extra'}">추가 선택</a>-->
					                            <a id="extra">추가 선택</a>
					                        </li>
					                        <li>
					                            <a id="doubleUp">미트 추가</a>
					                        </li>
					                    </ul>
					                    <div>
					
					
					
					                    </div>
					                </div>
					            </dd>
					        </dl>
					    </li>
					    <li class="step03">
					
					        <dl>
					            <dt>
					                <strong>STEP 03</strong>
					                상품 선택
					            </dt>
					            <dd>
					                <div>
					                    <ul>
					
					                        <li class="on">
					                            <a href="javascript:void(0);">단품</a>
					                        </li>
					
					                        <li>
					                            <a id="set">세트</a>
					                        </li>
					
					
					                    </ul>
					                    <div>
					
					                    </div>
					                </div>
					            </dd>
					        </dl>
					
					    </li>
					
					</ol>
					
					<div class="menu_total">
						<input name="eachPrice" type="hidden" value="7900" />
						<dl class="count">
							<dt>수량</dt>
							<dd>
								<a class="minus" href="javascript:;" id="qtySub">수량 빼기</a>
								<input id="ordQty" onfocus="this.blur();" type="text" value="1" />
								<a class="plus" href="javascript:;" id="qtyAdd">수량 더하기</a>
							</dd>
						</dl>
						<dl class="total_won">
							<dt>총 주문 금액</dt>
							<dd>
								<strong id="finalAmt">7,900</strong>
								<span>원</span>
							</dd>
						</dl>
						
					</div>
					
					<div class="btn_area">
						<button class="btn bgc_white btn_side" onclick="item.checkCup(this, 'S');return false;" type="button"><span>사이드추가</span></button>
						<button class="btn bgc_white btn_cart" onclick="item.checkCup(this, 'C');return false;" type="button"><span>장바구니</span></button>
						<button class="btn i_reg btn_order bgc_point" onclick="item.checkCup(this, 'B');return false;" type="button"><span>주문하기</span></button>
							
						<button class="btn i_reg btn_order bgc_point" id="orderBtn" type="button" data-promotionYn="N" data-itemType="ITEM_SALAD" data-morningYn="N"><span>주문 시작하기</span></button>

						<!--<button type="button" id="itemConbiPopBtnSubpick" class="btn bgc_point i_reg" style="width:183px;" th:if="${'N' == ordItemsVO.selectChoiceYn && itemCombination != null && itemInfo.subpickYn == 'Y'}"
								th:attr="data-combination-idx=${itemCombination.itemCombinationIdx}, data-store-cd=${ordItemsVO.storCd},
											data-item-code=${ordItemsVO.itemCode}, data-item-gubun=${ordItemsVO.itemGubun},
											data-evnt-display-type=${baseItemVO.evntDisplayType}, data-subpick=${itemInfo.subpickYn}">
							<span>썹픽조합</span>
						</button>-->

						<div>
							
						</div>
					</div>
				</div>
			</div>
			<!--// index -->
		</div>
		<!--// sub content e -->
	</div>
	<!--// container -->
</div>
</body>
</html>