<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY</title>
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
	
	<link rel="stylesheet" type="text/css" href="./css/ui.order.css?v=2023051202" />
	<script type="text/javascript" src="./js/order/common/item_view.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/order/common/selectMenu.js"></script>
	<script type="text/javascript" src="./js/favorite/favoriteMenu.js?v=2023051202"></script>
	<script>
		/*<![CDATA[*/
		var ordItemsVO = {'addedSelectIngredientList':null,'availableSetYn':null,'baseIngredientList':null,'baseItemAmt':null,'baseItemIdx':8412,'bread':null,'breadAmt':6800,'breadType':null,'cartIdx':null,'cartStoreMatch':false,'category':null,'cheese':null,'chooseIngredientList':null,'cpnAmt':null,'cupIncldYn':null,'cupItemCd':null,'doubleCheese':null,'doubleCheeseAmt':null,'doubleCheeseFg':null,'doubleCheeseMeta':null,'doubleCheeseOpt':null,'doubleUpFg':null,'doubleup':null,'doubleupInfo':null,'emptyIngredientList':null,'evntDisplayType':null,'flatPizzaYn':null,'groupCd':'81','hasMappingItemYn':null,'historyVegeYn':'N','hotFg':null,'immutableYn':'N','itemCode':'01900','itemCombinationIdx':null,'itemExtraDesc':'','itemGubun':'sandwich','itemIdx':232,'itemName':'\uC2A4\uD30C\uC774\uC2DC \uC26C\uB9BC\uD504','itemShortName':null,'itemType':'ITEM_SANDWICH','lsmItemImg':null,'lsmItemName':null,'menuType':'ITEM_SANDWICH','modDt':null,'modKey':null,'morningYn':'N','ordAddoptFg':null,'ordAmt':7900,'ordDetailIdx':null,'ordIdx':null,'ordType':'ORD_TYPE.FAST_SUB','paveFg':'Y','promotionSelect':null,'promotionViewYn':'N','promotionYn':'N','qty':null,'receiverAddr':null,'receiverAddrDtl':null,'receiverHp':null,'receiverZipcd':null,'regDt':null,'regKey':null,'sauceList':null,'selectChoiceYn':'N','selectToppingYn':null,'setFg':null,'setOptionInfoList':[],'setOptionList':null,'setOptionType':null,'sideYn':'N','storCd':'64444','subDogYn':null,'surveyPrizeYn':null,'toppingInfoList':null,'toppingList':null,'totalDoubleupAmt':0,'totalSetOptionAmt':0,'totalSideAmt':null,'totalToppingAmt':0,'ultraCheeseYn':null,'useFg':null,'vegetableList':null,'warming':null}
		/*]]>*/
	</script>
</head>
<body>
	<%@ include file="/jsp/include/header.jsp"%>
	<!-- container s -->
	<div id="container">
		<form method="post" name="viewForm">
			<input name="omid" type="hidden" value="${sessionScope.userId}" /> 
			<input name="omncode" type="hidden" value="${dto.mncode}" /> 
			<input name="breadLength" type="hidden" value="" /> 
			<input name="breadType" type="hidden" value="" /> 
			<input name="breadWarm" type="hidden" value="" /> 
			<input name="cheese" type="hidden" value="" /> 
			<input name="vegetable" type="hidden" value="" />
			<input name="souce" type="hidden" value="" />
			<input name="totPrice" type="hidden" value="" />
		</form>

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
					<li class="step_shop"><strong>STEP 1</strong> 매장선택</li>
					<li class="step_menu on"><strong>STEP 2</strong> 메뉴선택</li>
					<li class="step_order"><strong>STEP 3</strong> 주문하기</li>
					<li class="step_payment"><strong>STEP 4</strong> 결제하기</li>
				</ol>
				<div class="tab02">
					<ul>
						<li data-cate-cd="ITEM_FAVORITE"><a	data-cate-cd="ITEM_FAVORITE" href="javascript:;" name="itemMenu">즐겨찾기	메뉴</a></li>
						<li data-cate-cd="ITEM_PROMOTION"><a data-cate-cd="ITEM_PROMOTION" href="javascript:;" name="itemMenu">프로모션</a></li>
						<li data-cate-cd="ITEM_SANDWICH" class="active"><a	data-cate-cd="ITEM_SANDWICH" href="javascript:;" name="itemMenu">샌드위치</a></li>
						<!-- #211019 FAST-SUB/HOME-SUB 샐러드 일시 판매 중지로 인한 주석처리, #211104 판매 재개 -->
						<li data-cate-cd="ITEM_SALAD"><a	data-cate-cd="ITEM_SALAD" href="javascript:void(0);" name="itemMenu">샐러드</a></li>
						<li data-cate-cd="ITEM_UNIT"><a data-cate-cd="ITEM_UNIT" href="javascript:;" name="itemMenu">랩ㆍ기타</a></li>
						<li data-cate-cd="ITEM_SIDEDRINK"><a data-cate-cd="ITEM_SIDEDRINK" href="javascript:;" name="itemMenu">사이드ㆍ음료</a>	</li>
					</ul>
				</div>
				<div class="order_con">
					<div class="menu_info">
						<div class="menu_info">
							<!-- 2019-12-02 #172 제품썸네일 영역 마크업 수정 (figure 태그로 감쌈) -->
							<figure class="img">

								<img onError="this.src='./images/common/noneImage.jpg'"
									alt="${dto.mnname}"
									src="./upload/menu/${dto.mnimg}" />
							</figure>
							<!--// 2019-12-02 #172 제품썸네일 영역 마크업 수정 (figure 태그로 감쌈) -->
							<div class="txt_info">
								<!-- 2019-12-02 #172 제품 정보 영역 클래스 추가 -->
								<h3>


									<th:object>${dto.mnctg}</th:object>



									<strong>${dto.mnname}</strong> 
									<em> 
										<span>${dto.mnengname}</span> <!-- 즐겨찾기 버튼 -->
										<label class="my_bookmark"> 
											<input onclick="favoriteMenu.favor(this);" type="checkbox" data-itemidx="234" /> 
											<i class="i_star"></i>
										</label>
									</em>
								</h3>


								<p>
									${dto.mninfo}<br />
								</p>

								<button class="btn bgc_point i_reg" id="itemConbiPopBtn"
									style="width: 183px;" type="button" data-item-gubun="${dto.mnctg}"
									data-store-cd="64444" data-combination-idx="78"
									data-item-code="01902" data-subpick="N">
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
													<div>${dto.mngram} </div>
												</td>
												<td>
													<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '595' : ordItemsVO.itemCode == '01532' ? '445' : rs.itemCalorie}"></div>-->
													<div>${dto.mnkcal} </div>
												</td>
												<td>
													<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '28.2 (51%)' : ordItemsVO.itemCode == '01532' ? '21.6 (39%)' : rs.itemProtein}"></div>-->
													<div>${dto.mnprotein} </div>
												</td>
												<td>
													<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '10.1 (68%)' : ordItemsVO.itemCode == '01532' ? '6.7 (45%)' : rs.itemFat}"></div>-->
													<div>${dto.mnfat} </div>
												</td>
												<td>
													<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '8.8 (9%)' : ordItemsVO.itemCode == '01532' ? '9.0 (9%)' : rs.itemSugars}"></div>-->
													<div>${dto.mnsugar} </div>
												</td>
												<td>
													<!--<div th:text="${ordItemsVO.itemCode == '01531' ? '1356 (68%)' : ordItemsVO.itemCode == '01532' ? '1153 (58%)' : rs.itemSalt}"></div>-->
													<div>${dto.mnnatrum} </div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="table_info">
								<!-- (2020.08.20) 카테고리별 영양성분 입력 화면 관리자 추가 건: 메뉴별 개별로 입력하도록 수정 -->
								<div class="table_desc">
									<p>
										※ 15cm 샌드위치의 영양 정보는 기본 야채 5종(양상추, 토마토, 오이, 피망, 양파), 15cm 위트
										브레드 및 제품에 따른 미트류가 포함되어 있으며, 치즈와 소스는 제외됩니다.<br>※ 샐러드의 영양
										정보는 기본 야채 5종(양상추, 토마토, 오이, 피망, 양파) 및 제품에 따른 미트류가 포함되어 있으며, 치즈와
										소스는 제외됩니다.<br>※ 단, 메뉴명에 ‘치즈’가 포함되는 경우 치즈의 영양정보도 포함됩니다.<br>※
										랩, 그릴드 랩의 영양 정보는 치즈와 소스를 포함한 고정 레시피를 기준으로 합니다.<br>※ 아침메뉴의
										영양 정보는 15cm 위트 브레드 및 제품에 따른 미트류, 야채, 아메리칸 치즈가 포함되어 있으며, 소스는
										제외됩니다.<br>※ 영양 정보표에 표시된 제품의 영양 정보/중량은 표준 레시피를 기준으로 하나,
										계절의 변화, 공급사의 변화, 원재료의 수급 상황 및 제품 제조시에 발생하는 중량의 차이 등에 따라 실제
										제공되는 제품의 영양 정보/중량과 차이가 있을 수 있습니다.<br>※ 괄호 안 %는 1일 영양소
										기준치에 대한 비율입니다.<br>※ 매장에 따라 제공 방식(찹 샐러드/스파이럴 샐러드)이 상이할 수
										있습니다.
									</p>
								</div>
								<ul class="table_btn">
									<li><a class="btn bgc_black" href="origin.do" link-type="popup" onclick="popup_open(this,630,750); return false;"> 
										<span>원산지 정보</span>
									</a></li>
									<li><a class="btn bgc_black" href="allergy.do" link-type="popup" onclick="popup_open(this,900,750); return false;"> 
										<span>알레르기 정보</span>
									</a></li>
								</ul>
							</div>
						</div>
						
						<div class="btn_area">

							<button class="btn i_reg btn_order bgc_point" id="orderBtn"
								type="button" data-promotionYn="N" data-itemType="ITEM_SANDWICH"
								data-morningYn="N">
								<span>주문 시작하기</span>
							</button>

						</div>
					</div>
				</div>
				<!--// index -->
			</div>
			<!--// sub content e -->
		</div>
		<!--// container -->
		<%@ include file="/jsp/include/footer.jsp"%>
	</div>
</body>
</html>