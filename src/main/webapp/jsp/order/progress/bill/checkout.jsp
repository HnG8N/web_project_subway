<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY - 결제하기</title>
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
	<script type="text/javascript" src="./js/pay/pay.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/pay/pay.sale.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/order/common/bill_order.js?v=2023051202"></script>
	<script>
		/*<![CDATA[*/
		var ordSheetSaleVO = {'baseItemList':[{'baseItemIdx':6588,'baseItemSetIdx':null,'chgCost':null,'chgSale':null,'cmsEvntEtDisplayYn':null,'cost':'7,300','couponIdx':null,'cupIncldYn':'N','cupItemCd':'','delvYn':'N','evntDisplayType':null,'evntEt':'','evntSt':'','evntType':'EVNT_TYPE.NO_EVENT','evntTypeNm':null,'fixedOptionYn':null,'groupCd':'12','itemCode':'00012','itemDiv1':'ITEM_SANDWICH','itemDiv1Kor':null,'itemDiv2':'15SUB','itemDiv2Kor':null,'itemDiv3':'FLASH','itemDiv3Kor':null,'itemExtraDesc':null,'itemFileName':'','itemIdx':23,'itemName':'\uB85C\uC2A4\uD2B8 \uCE58\uD0A8 15','itemQty':null,'itemShortName':'\uB85C\uC2A4\uD2B8 \uCE58\uD0A8','itemStatus':'','itemStatusNm':null,'itemType':'ITEM_TYPE.TYPE_3','itemTypeNm':null,'newPric':null,'pointYn':null,'pric':null,'promotionSalePrice':null,'promotionSetItemYn':null,'qty':null,'regDt':'2019-03-04T11:10:14.000+09:00','regKey':'ADMIN','sale':'7300','saleEdTm':null,'salePrice':null,'saleStTm':null,'setItems':null,'setItemsCode':null,'setMainItem':null,'setPriceValue':null,'setYn':'N','soldoutYn':'N','storPrice':null,'subItemCode':null,'subItemCode1':null,'subItemCode2':null,'unitYn':'Y','useFg':'Y'},{'baseItemIdx':6581,'baseItemSetIdx':null,'chgCost':null,'chgSale':null,'cmsEvntEtDisplayYn':null,'cost':'6,600','couponIdx':null,'cupIncldYn':'N','cupItemCd':'','delvYn':'N','evntDisplayType':null,'evntEt':'','evntSt':'','evntType':'EVNT_TYPE.NO_EVENT','evntTypeNm':null,'fixedOptionYn':null,'groupCd':'5','itemCode':'00005','itemDiv1':'ITEM_SANDWICH','itemDiv1Kor':null,'itemDiv2':'15SUB','itemDiv2Kor':null,'itemDiv3':'CLASSIC','itemDiv3Kor':null,'itemExtraDesc':null,'itemFileName':'','itemIdx':19,'itemName':'\uBE44\uC5D8\uD2F015','itemQty':null,'itemShortName':'\uBE44\uC5D8\uD2F0','itemStatus':'','itemStatusNm':null,'itemType':'ITEM_TYPE.TYPE_3','itemTypeNm':null,'newPric':null,'pointYn':null,'pric':null,'promotionSalePrice':null,'promotionSetItemYn':null,'qty':null,'regDt':'2019-03-04T11:10:14.000+09:00','regKey':'ADMIN','sale':'6600','saleEdTm':null,'salePrice':null,'saleStTm':null,'setItems':null,'setItemsCode':null,'setMainItem':null,'setPriceValue':null,'setYn':'N','soldoutYn':'N','storPrice':null,'subItemCode':null,'subItemCode1':null,'subItemCode2':null,'unitYn':'Y','useFg':'Y'}],'buyerEmail':null,'buyerNm':null,'buyerPh':null,'cardComp':null,'cartIdxArr':null,'couponAmt':null,'couponCode':null,'couponInfo':null,'couponItemCode':null,'couponItemIndex':null,'couponList':null,'delvAmt':null,'disposableFg':null,'escrYn':null,'giftValueRedeemed':null,'groupCd':null,'isCartInitYn':'Y','itemType':null,'mainItemNm':null,'memberIdx':4769263,'menuType':null,'oneCupAmt':0,'oneCupCnt':0,'ordAddMemoContent':null,'ordAmt':28500,'ordEnv':null,'ordHp':null,'ordItemList':[{'addedSelectIngredientList':null,'availableSetYn':null,'baseIngredientList':null,'baseItemAmt':7300,'baseItemIdx':6588,'bread':{'ingredientsCode':'B0003','ingredientsIdx':3,'ingredientsName':'\uC704\uD2B8','ingredientsType':'INGREDIENTS_TYPE.TYPE1','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},'breadAmt':null,'breadType':'15SUB','cartIdx':8091265,'cartStoreMatch':false,'category':'ITEM_TYPE.TYPE_3','cheese':{'ingredientsCode':'C0002','ingredientsIdx':8,'ingredientsName':'\uC288\uB808\uB4DC\uCE58\uC988','ingredientsType':'INGREDIENTS_TYPE.TYPE2','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},'chooseIngredientList':null,'cpnAmt':null,'cupIncldYn':null,'cupItemCd':null,'doubleCheese':null,'doubleCheeseAmt':0,'doubleCheeseFg':null,'doubleCheeseMeta':null,'doubleCheeseOpt':null,'doubleUpFg':null,'doubleup':null,'doubleupInfo':null,'emptyIngredientList':null,'evntDisplayType':null,'flatPizzaYn':'N','groupCd':'12','hasMappingItemYn':null,'historyVegeYn':'N','hotFg':null,'immutableYn':null,'itemCode':'00012','itemCombinationIdx':null,'itemExtraDesc':null,'itemGubun':null,'itemIdx':23,'itemName':'\uB85C\uC2A4\uD2B8 \uCE58\uD0A8 15','itemShortName':'\uB85C\uC2A4\uD2B8 \uCE58\uD0A8','itemType':'ITEM_SANDWICH','lsmItemImg':null,'lsmItemName':null,'menuType':'ITEM_SANDWICH','modDt':null,'modKey':null,'morningYn':'N','ordAddoptFg':null,'ordAmt':7300,'ordDetailIdx':null,'ordIdx':8985530,'ordType':'ORD_TYPE.FAST_SUB','paveFg':null,'promotionSelect':null,'promotionViewYn':'N','promotionYn':'N','qty':3,'receiverAddr':null,'receiverAddrDtl':null,'receiverHp':null,'receiverZipcd':null,'regDt':null,'regKey':null,'sauceList':[{'ingredientsCode':'S0010','ingredientsIdx':22,'ingredientsName':'\uC2A4\uBAA8\uD06C \uBC14\uBE44\uD050','ingredientsType':'INGREDIENTS_TYPE.TYPE5','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},{'ingredientsCode':'S0012','ingredientsIdx':24,'ingredientsName':'\uB9C8\uC694\uB124\uC988','ingredientsType':'INGREDIENTS_TYPE.TYPE5','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},{'ingredientsCode':'S0013','ingredientsIdx':25,'ingredientsName':'\uD56B \uCE60\uB9AC','ingredientsType':'INGREDIENTS_TYPE.TYPE5','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null}],'selectChoiceYn':null,'selectToppingYn':null,'setFg':null,'setOptionInfoList':[],'setOptionList':null,'setOptionType':null,'sideYn':'N','storCd':'64444','subDogYn':null,'surveyPrizeYn':null,'toppingInfoList':null,'toppingList':null,'totalDoubleupAmt':0,'totalSetOptionAmt':0,'totalSideAmt':null,'totalToppingAmt':0,'ultraCheeseYn':null,'useFg':null,'vegetableList':[{'ingredientsCode':'V0011','ingredientsIdx':67,'ingredientsName':'\uC624\uC774','ingredientsType':'INGREDIENTS_TYPE.TYPE4','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},{'ingredientsCode':'V0013','ingredientsIdx':69,'ingredientsName':'\uC591\uD30C','ingredientsType':'INGREDIENTS_TYPE.TYPE4','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null}],'warming':{'ingredientsCode':'H0001','ingredientsIdx':11,'ingredientsName':'\uD1A0\uC2A4\uD305','ingredientsType':'INGREDIENTS_TYPE.TYPE3','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null}},{'addedSelectIngredientList':null,'availableSetYn':null,'baseIngredientList':null,'baseItemAmt':6600,'baseItemIdx':6581,'bread':{'ingredientsCode':'B0006','ingredientsIdx':6,'ingredientsName':'\uD50C\uB7AB\uBE0C\uB808\uB4DC','ingredientsType':'INGREDIENTS_TYPE.TYPE1','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},'breadAmt':null,'breadType':'15SUB','cartIdx':8059686,'cartStoreMatch':false,'category':'ITEM_TYPE.TYPE_3','cheese':{'ingredientsCode':'C0001','ingredientsIdx':7,'ingredientsName':'\uC544\uBA54\uB9AC\uCE78\uCE58\uC988','ingredientsType':'INGREDIENTS_TYPE.TYPE2','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},'chooseIngredientList':null,'cpnAmt':null,'cupIncldYn':null,'cupItemCd':null,'doubleCheese':null,'doubleCheeseAmt':0,'doubleCheeseFg':null,'doubleCheeseMeta':null,'doubleCheeseOpt':null,'doubleUpFg':null,'doubleup':null,'doubleupInfo':null,'emptyIngredientList':null,'evntDisplayType':null,'flatPizzaYn':'N','groupCd':'5','hasMappingItemYn':null,'historyVegeYn':'N','hotFg':null,'immutableYn':null,'itemCode':'00005','itemCombinationIdx':29,'itemExtraDesc':null,'itemGubun':null,'itemIdx':19,'itemName':'\uBE44\uC5D8\uD2F015','itemShortName':'\uBE44\uC5D8\uD2F0','itemType':'ITEM_SANDWICH','lsmItemImg':null,'lsmItemName':null,'menuType':'ITEM_SANDWICH','modDt':null,'modKey':null,'morningYn':'N','ordAddoptFg':null,'ordAmt':6600,'ordDetailIdx':null,'ordIdx':8985530,'ordType':'ORD_TYPE.FAST_SUB','paveFg':null,'promotionSelect':null,'promotionViewYn':'N','promotionYn':'N','qty':1,'receiverAddr':null,'receiverAddrDtl':null,'receiverHp':null,'receiverZipcd':null,'regDt':null,'regKey':null,'sauceList':[{'ingredientsCode':'S0012','ingredientsIdx':24,'ingredientsName':'\uB9C8\uC694\uB124\uC988','ingredientsType':'INGREDIENTS_TYPE.TYPE5','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},{'ingredientsCode':'S0014','ingredientsIdx':26,'ingredientsName':'\uC0AC\uC6B0\uC2A4\uC6E8\uC2A4\uD2B8 \uCE58\uD3F4\uB808','ingredientsType':'INGREDIENTS_TYPE.TYPE5','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null}],'selectChoiceYn':null,'selectToppingYn':null,'setFg':null,'setOptionInfoList':[],'setOptionList':null,'setOptionType':null,'sideYn':'N','storCd':'64444','subDogYn':null,'surveyPrizeYn':null,'toppingInfoList':null,'toppingList':null,'totalDoubleupAmt':0,'totalSetOptionAmt':0,'totalSideAmt':null,'totalToppingAmt':0,'ultraCheeseYn':null,'useFg':null,'vegetableList':[{'ingredientsCode':'V0009','ingredientsIdx':64,'ingredientsName':'\uC591\uC0C1\uCD94','ingredientsType':'INGREDIENTS_TYPE.TYPE4','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},{'ingredientsCode':'V0010','ingredientsIdx':66,'ingredientsName':'\uD1A0\uB9C8\uD1A0','ingredientsType':'INGREDIENTS_TYPE.TYPE4','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},{'ingredientsCode':'V0011','ingredientsIdx':67,'ingredientsName':'\uC624\uC774','ingredientsType':'INGREDIENTS_TYPE.TYPE4','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},{'ingredientsCode':'V0012','ingredientsIdx':68,'ingredientsName':'\uD53C\uB9DD','ingredientsType':'INGREDIENTS_TYPE.TYPE4','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null},{'ingredientsCode':'V0013','ingredientsIdx':69,'ingredientsName':'\uC591\uD30C','ingredientsType':'INGREDIENTS_TYPE.TYPE4','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null}],'warming':{'ingredientsCode':'H0001','ingredientsIdx':11,'ingredientsName':'\uD1A0\uC2A4\uD305','ingredientsType':'INGREDIENTS_TYPE.TYPE3','ordDetailIdx':null,'ordItemsIgdIdx':null,'regDt':null,'regKey':null,'useFg':null}}],'ordItemsVO':null,'ordMemoContent':null,'ordSheetIdx':8985530,'ordVO':{'acceptTime':null,'buyerIp':null,'completeTime':null,'deliveryStartTime':null,'deliveryTime':null,'disposableFg':null,'itemCount':0,'itemShortName':null,'memberGrade':1,'memberIdx':4769263,'modDt':null,'modKey':null,'ordAddMemoContent':null,'ordClaimCode':null,'ordClaimCont':null,'ordDt':null,'ordIdx':8985530,'ordLocation':null,'ordMemoContent':null,'ordNo':'ORD20240224113743644442','ordStatus':null,'ordStatusDt':null,'ordType':'ORD_TYPE.FAST_SUB','paveFg':'Y','payDivision':'PAY_DIVISION.SALE','posFg':null,'receiptNo':null,'receiptType':null,'receiverAddr':null,'receiverAddrDtl':null,'receiverHp':null,'receiverZipcd':null,'regDt':null,'regKey':null,'storCd':'64444','useFg':null},'orderLocation':null,'orderShopId':'64444','paveFg':null,'payFirstPayIdx':null,'payMethod':null,'payVO':null,'picupShopId':'64444','pointAmt':null,'realPayValue':null,'receiptNo':null,'receiptType':null,'receiptYn':null,'reuseCupCnt':0,'rewardValueRedeemed':null,'saleRealTotalValue':null,'saleTotalValue':null,'subCardApiVo':{'balanceVO':null,'cardNumber':'3106460051833294604','cardStatus':'ACTIVE','errorCode':null,'errorMessage':null,'giftDollars':0.0,'invalidEmail':false,'joinDate':'2024-02-01T13:45:45','registrationComplete':true,'rewardDollars':0.0,'rfmSegment':'\uBCA0\uC774\uBE44'},'subcardAmt':null,'subcardHistoryVO':null,'surveyCookieList':[],'surveyCouponIdx':null,'taxValue':null,'taxYn':null,'totalOrdAmt':28500,'totalPayAmt':null,'tranApiVO':null,'transactionCode':null,'transactionId':'01088487702644446444420240224113744004','voucherAmt':null,'voucherNo':null};
		var franchiseStoreCd = '64444';
		/*]]>*/
	</script>
</head>
<body>
	<%@ include file="/jsp/include/header.jsp"%>
	<!-- container s -->
	<div id="container">
		<script>
			$(document).ready(function() {
				writeOn(); //input focus
			});
		</script>
		<!-- sub content -->
		<div class="order fast_sub" id="content">
			<!-- 주문하기 -->
			<div class="bill_order">
				<div class="order_title">
					<h3>Fast-Sub</h3>
					<p>
						<th:object>온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</th:object>

					</p>
				</div>
				<ol class="order_step">
					<li class="step_shop"><strong>STEP 1</strong> 매장선택</li>
					<li class="step_menu"><strong>STEP 2</strong> 메뉴선택</li>
					<li class="step_order on"><strong>STEP 3</strong> 주문하기</li>
					<li class="step_payment"><strong>STEP 4</strong> 결제하기</li>
				</ol>
				<div class="order_con">
					<!-- 결제폼 -->
					<section class="form_box">
						<!-- 픽업매장 -->
						<h2>픽업매장</h2>

						<div class="write_info_wrap stroe_order">
							<div class="input_set">
								<!-- 패스트써브 -->
								<dl class="info_dl">
									<dt>강남우성</dt>
									<dd>서울특별시 강남구 강남대로66길 6 </dd>
								</dl>
								<!-- 홈써브 -->

							</div>
							<div class="input_set">
								<input name="paveFg" type="hidden" value="Y" />
								<dl class="info_dl">
									<dt>방문포장/매장식사</dt>
									<dd>방문포장</dd>
								</dl>
							</div>

							<div class="input_set">
								<dl class="">
									<dt>전화번호</dt>
									<dd>
										<span class="form_text"> <input maxlength="11"
											name="ordHp" placeholder="전화번호를 입력하세요" type="text"
											value="${memberTelno}" />
										</span>
									</dd>
								</dl>
							</div>
							<div class="input_set">
								<dl class="">
									<dt>주문 번호 </dt>
									<dd>
										<span class="form_text"> 
										<input maxlength="50" id="ordNo" name="ordNo" type="text" value="${ordNo}" />
										</span>
									</dd>
									<!-- #220413 문구 추가건 홀딩
									<dd class="caution">※ 샌드위치 품질 유지를 위해 “빵 속파기” 서비스를 제공하지 않습니다.</dd>-->
								</dl>
							</div>
						</div>
						<!--// 픽업매장 -->


						<!-- 결제수단 -->
						<h2>결제 수단 선택</h2>
						<div class="write_info_wrap">
							<!-- 2019-12-13 #232 결제수단: 써브카드 결제 영역 마크업 수정 -->
							<div class="input_set">
								<dl>
									<dt>써브카드 결제</dt>
									<dd>
										<div class="use_point use_card">
											<span class="form_text bdr_text"> <input
												id="subcardAmt" name="subcardAmt" type="text"
												disabled="disabled" placeholder="사용가능 금액이 없습니다" />
											</span>
											<p>
												<span>보유 금액 :</span> <strong id="usableSubcardAmt"
													data-subcard="0">0</strong>
											</p>
										</div>
										<!-- 2019-12-12 써브카드 금액 모두사용 버튼 추가 -->

										<!--// 2019-12-12 써브카드 금액 모두사용 버튼 추가 -->
									</dd>
									<dt>현금 영수증 신청</dt>
									<dd>
										<div class="cash_receipt">
											<div class="form_radio square">
												<label> <input checked="" id="not"
													name="receiptType" type="radio" /> <span class="shape">발급안함</span>
												</label> <label> <input id="person" name="receiptType"
													type="radio" value="RECEIPT_TYPE.PERSONAL"
													disabled="disabled" /> <span class="shape">개인소득공제</span>
												</label> <label> <input id="cmp" name="receiptType"
													type="radio" value="RECEIPT_TYPE.BUSINESS"
													disabled="disabled" /> <span class="shape">사업자증빙용</span>
												</label>
											</div>
											<span class="form_text"> <input name="receiptYn"
												type="hidden" value="N" /> <input disabled="disabled"
												maxlength="11" name="receiptNo" placeholder="번호 입력"
												style="display: none;" type="text" />
											</span>
										</div>
									</dd>
								</dl>
							</div>
							<!--// 2019-12-13 #232 결제수단: 써브카드 결제 영역 마크업 수정 -->
							<div class="input_set">
								<dl>
									<dt>다른 결제 수단</dt>
									<!-- * 2019-12-13 #232 결제수단: 텍스트 수정 -->
									<dd>
										<div class="form_radio square">
											<label> <input checked="checked" id="creditcard"
												name="payment" type="radio" value="PAY_METHOD.CRDT" /> <span
												class="shape">신용카드</span>
											</label> <label> <input id="etc" name="payment" type="radio"
												value="PAY_METHOD.PAYCOKAKAO" /> <span class="shape">
													<i class="pay_logo"><img alt="카카오페이"
														src="./images/common/icon_kakaopay.png" /></i> <i
													class="pay_logo"><img alt="페이코"
														src="./images/common/icon_payco.png" /></i>
											</span>
											</label>
										</div>
										<p class="caution_txt">※ 페이코 생애 첫 결제 시, 최대 4,500원
											혜택(~10/31)</p>
									</dd>
								</dl>
							</div>
						</div>
						<!--// 결제수단 -->
					</section>
					<!--// 결제폼 -->

					<!-- 주문내역 -->
					<div class="board_list_wrapper ord_items">
						<h2>주문내역</h2>
						<div class="content">
						<c:set var = "totprice" value="0"/>
						<c:forEach items="${orderInfo}" var="dto" varStatus="status">
							<!-- 1세트 -->
							<table class="history_table">
								<caption>주문내역 테이블</caption>
								<colgroup>
									<col width="*" />
									<col width="90px" />
									<col width="130px" />
								</colgroup>
								<tbody>
									<tr data-item-code="${dto.cmncode}" data-item-index="${dto.cseq}">
										<td>
											<div class="name" data-target="mainItem">
												<strong>${dto.mnname}</strong>
												<p>
													<!-- 빵길이 -->
													<th:object>${dto.clength}cm</th:object>

													<!-- 빵종류 -->
													<th:object>, ${dto.cbread}(${dto.ctoast})</th:object>

													<!-- 치즈 -->
													<th:object>, ${dto.ccheese}</th:object>

													<!-- 야채 -->

													<th:object>, ${dto.cvegetables}</th:object>


													<!-- 소스 -->

													<th:object>, ${dto.csauce}</th:object>

												</p>
											</div>
										</td>
										<td>
											<div class="count">
												<strong class="qty" data-qty="${dto.cqty}">${dto.cqty}</strong>개
											</div>
										</td>
										<td>
											<div class="sum">
												<span> 
													<strong class="price" data-price="${dto.cprice}">
														<fmt:formatNumber value="${dto.cprice}" groupingUsed="true" />
													</strong>
													<c:set var = "totprice" value="${totprice + dto.cprice}"/>
													<em>원</em>
												</span>
											</div>
										</td>
									</tr>
									
								</tbody>
							</table>
							<!--// 1세트 -->
							</c:forEach>
							<!--  사용하지 않음. 주문 상세 내역. s -->
							<table class="history_table" id="chooseSurveyCookie"
								style="display: none;">
								<caption>주문내역 테이블</caption>
								<colgroup>
									<col width="*" />
									<col width="90px" />
									<col width="130px" />
								</colgroup>
								<tbody>
									<tr>
										<td>
											<div class="name">
												<strong></strong>
											</div>
										</td>
										<td>
											<div class="count">
												<strong>1</strong>개
											</div>
										</td>
										<td>
											<div class="sum">
												<span> <strong>0</strong> <em>원</em>
												</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<!--  사용하지 않음. 주문 상세 내역. e -->
							<!-- issues/699 설문조사 쿠폰 영역추가 -->

							<!-- 일회용컵 -->

							<!--// 일회용컵 -->



						</div>
					</div>
					<!--// 주문내역 -->

					<!-- 결제금액 -->
					<div class="amount">
						<input id="totalOrdAmt" type="hidden" value="${totprice}" /> 
						<input 	id="ordAmt" type="hidden" value="${totprice}" /> 
						<input id="delvAmt"	type="hidden" value="" /> 
						<input id="oneCupAmt" type="hidden"	value="0" /> 
						<input name="totalPayAmt" type="hidden"	value="${totprice}" /> 
						<input id="orderType" type="hidden"	value="ORD_TYPE.FAST_SUB" /> 
						<input id="ordSheetNo" type="hidden" value="8801165" />
						<h2>총 결제 금액</h2>

						<dl class="order_sum">
							<dt>총 주문 금액</dt>
							<dd>
								<strong id="orderTotal">
									<fmt:formatNumber value="${totprice}" groupingUsed="true" />
								</strong> 원
							</dd>
						</dl>
						<dl class="detail_sum">
							<dt>써브카드 사용</dt>
							<dd>
								<strong id="subcardAmtNavi">0</strong>원
							</dd>
							<dt>쿠폰 사용</dt>
							<dd>
								<strong id="couponAmtNavi">0</strong>원
							</dd>
							<dt>포인트 사용</dt>
							<dd>
								<strong id="pointAmtNavi">0</strong>원
							</dd>
							<dt name="surveyCookieNavi" style="display: none;">설문조사 감사
								쿠폰 사용</dt>
							<dd name="surveyCookieNavi" style="display: none;">
								<strong>0</strong>원
							</dd>

						</dl>
						<dl class="payment_sum">
							<dt>잔여 결제금액</dt>
							<dd>
								<strong id="totalPayAmtNavi">
									<fmt:formatNumber value="${totprice}" groupingUsed="true" />
								</strong><span>원</span>
							</dd>
						</dl>
						<div class="payment_agree">
							<dl>
								<dt>
									<label class="form_checkbox"> <input id="paymentAgree"
										type="checkbox" value="Y" /> <span class="icon"></span><strong>구매조건
											및 결제진행 동의</strong>
									</label>
								</dt>
								<dd>
									<ul>
										<!-- 2019-12-13 #205 결제동의 문구 클래스 추가 -->
										<li class="counsel_copy">주문할 메뉴와 가격, 매장정보를 명확히 확인하였으며 결제
											진행에 동의합니다.</li>
										<li class="counsel_copy">제조시간은 매장상황에 따라 상이할 수 있습니다.</li>
										<li class="counsel_copy">주문자 정보가 서비스 제공을 위해 주문 매장에 제공되며,
											홈썹 이용의 경우 라이더에게 제공됨에 동의합니다.</li>
										<!-- #220726 문구 추가 -->
										<li class="counsel_copy on">주문 후 제조가 시작되면 주문을 취소할 수 없습니다.</li>
										<!--// 2019-12-13 #205 결제동의 문구 클래스 추가 -->
									</ul>
								</dd>
							</dl>
						</div>
						<div class="btn_area">
							<a class="btn bgc_point i_reg" href="javascript:void(0);"
								id="startOrder"><span>결제하기</span></a>
						</div>
					</div>
					<!--// 결제금액 -->
				</div>
			</div>
			<!--// 주문하기 -->
		</div>
		<!--// sub content -->
	</div>
	<%@ include file="/jsp/include/footer.jsp"%>
</body>
</html>