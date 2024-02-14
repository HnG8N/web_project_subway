<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fast-Sub Step2</title>
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
	<script type="text/javascript" src="./js/order/common/item-list.js?v=2023051202"></script>
	<script>
		var imagePath = null
	</script>
	
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
	<!-- container s -->
	<div id="container">
		<input id="menuType" name="menuType" type="hidden" value="" /> 
		<input id="itemIdx" name="itemIdx" type="hidden" value="" /> 
		<input id="groupCd" name="groupCd" type="hidden" value="" /> 
		<input id="storCd" name="storCd" type="hidden" value="64444" /> 
		<input id="ordType" name="ordType" type="hidden" value="ORD_TYPE.FAST_SUB" />
		<input id="paveFg" name="paveFg" type="hidden" value="Y" />
		<!-- sub content s -->
		<div id="content" class="order  fast_sub">
			<!-- fast_sub / home_sub -->
			<!-- index -->
			<div class="menu_list">
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
						<li><a href="javascript:;" name="itemMenu"
							data-category-code="ITEM_FAVORITE">즐겨찾는 메뉴</a></li>
						<li><a href="javascript:;" name="itemMenu"
							data-category-code="ITEM_PROMOTION">프로모션</a></li>
						<!-- 아침메뉴 탭 제거 #200917
							<li th:class="${itemSearchVO.cateCd eq 'ITEM_MORNING' ? 'active' : ''}" th:if="${'Y' == franchiseInfoVO.morningTimeYn}">
								<a href="javascript:;" name="itemMenu" th:attr="data-category-code=${'ITEM_MORNING'}" >아침메뉴</a>
							</li>-->
						<li class="active"><a href="sandwich_view.do" name="itemMenu"
							data-category-code="ITEM_SANDWICH">샌드위치</a></li>
						<!-- #211019 FAST-SUB/HOME-SUB 샐러드 일시 판매 중지로 인한 주석처리, #211104 판매 재개 -->
						<li><a href="salad_view.do" name="itemMenu"
							data-category-code="ITEM_SALAD">샐러드</a></li>
						<li><a href="wrap_view.do" name="itemMenu"
							data-category-code="ITEM_UNIT" data-grilled-sale-yn="N">랩ㆍ기타</a>
						</li>
						<li><a href="javascript:;" name="itemMenu"
							data-category-code="ITEM_SIDEDRINK">사이드ㆍ음료</a></li>
					</ul>
				</div>
				<!-- 컨텐츠 리스트 -->
				<div class="order_con" id="itemListMst">
					<ul class="list">
						<c:forEach items="${MenuList}" var="dto" varStatus="status">
							<li>
								<a href="menuView.do?mncode=${dto.mncode}" name="itemDetailBtn" data-item-idx="${dto.mncode}" data-category-code="ITEM_SANDWICH" data-group-cd="104" data-menu-type="ITEM_SANDWICH">
									<img src="./upload/menu/${dto.mnimg}" alt="${dto.mnname}" onerror="this.src='./images/common/noneImage.jpg'">
										<p>
												<strong>${dto.mnname}</strong>
												<span class="eng_name ">${dto.mnengname}</span>
												<span class="kcal ">${dto.mnprice}</span>
										</p>
										<div class="label">
											
										</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!--// index -->
		</div>
		<!--// sub content e -->
		<!-- 메뉴리스트 -->
		<script id="normal-itemList-tmpl" type="text/x-jsrender">
				{{if ~root.cateCd == 'ITEM_FAVORITE'}}
					<p class="menu_favorites">즐겨찾기 메뉴는 최대 3개까지 등록 가능합니다.</p>	<!-- issues/501 -->
				{{/if}}
				<ul class="list">
					{{for results}}
						{{if groupCd != null}}
							<li {{:~root.cateCd == 'ITEM_FAVORITE' && 'N' == usableItemFg ? 'onclick="item.noticeNotUsable();"' : ''}}>
								{{if 'ITEM_SPECIAL' == itemDiv1}}
									{{if 'Y' != soldoutYn}}
										<a href="javascript:item.nextPromotionProgress('{{:'ITEM_MORNING' == ~root.cateCd || 'ITEM_SIDEDRINK' == ~root.cateCd ? baseItemCode : itemCode}}','{{:groupCd}}','{{:itemDiv1}}', '{{:baseItemIdx}}','{{:itemName}}', '{{:imgFileUrl}}', '{{:evntDisplayType}}');"
										 name="itemDetailBtn" data-item-idx="{{:itemIdx}}" data-category-code="{{:~root.cateCd}}"
										 data-group-cd="{{:groupCd}}" data-menu-type="{{:displayCategoryCodeMain}}">
										<img src="{{:itemFileName != null ? itemFileName : itemBaseImage}}?{{:imgCache}}" alt="{{:itemName}}" onError="this.src='/images/common/noneImage.jpg'">
									{{else}}
										<a href="javascript:void(0);"
										 name="itemDetailBtn" data-item-idx="{{:itemIdx}}" data-category-code="{{:~root.cateCd}}"
										 data-group-cd="{{:groupCd}}" data-menu-type="{{:displayCategoryCodeMain}}">
										<img src="{{:itemFileName != null ? itemFileName : itemBaseImage}}?{{:imgCache}}" alt="{{:itemName}}" onError="this.src='/images/common/noneImage.jpg'">
									{{/if}}

								{{else 'ITEM_SIDEDRINK' == displayCategoryCodeMain}}
									<a href="javascript:item.nextProgress('{{:baseItemCode}}','{{:groupCd}}','{{:displayCategoryCodeMain}}', '{{:baseItemIdx}}', '{{:~root.cateCd}}');"
									 name="itemDetailBtn" data-item-idx="{{:itemIdx}}" data-category-code="{{:~root.cateCd}}"
									 data-group-cd="{{:groupCd}}" data-menu-type="{{:displayCategoryCodeMain}}">
									<img src="{{:itemBaseImage}}?{{:imgCache}}" alt="{{:itemShortName}}" onError="this.src='/images/common/noneImage.jpg'">

								{{else ~root.cateCd != 'ITEM_FAVORITE'}}
									<a href="javascript:item.nextProgress('{{:itemIdx}}','{{:groupCd}}','{{:itemDiv1}}', '{{:baseItemIdx}}', '{{:~root.cateCd}}');"
									 name="itemDetailBtn" data-item-idx="{{:itemIdx}}" data-category-code="{{:~root.cateCd}}"
									 data-group-cd="{{:groupCd}}" data-menu-type="{{:displayCategoryCodeMain}}">
									<img src="{{:itemFileName != null && itemFileName != '' ? itemFileName : itemBaseImage}}?{{:imgCache}}" alt="{{:itemName}}" onError="this.src='/images/common/noneImage.jpg'">

								{{else}}
									<a href="javascript:item.delFavoriteItem('{{:itemIdx}}', '{{:favoriteItemIdx}}');"
									class="btn_del" onclick="event.cancelBubble=true"><span class="blind">삭제</span></a>	<!-- [D]즐겨찾기 삭제버튼 추가 -->
										{{if ~root.cateCd == 'ITEM_FAVORITE' && 'N' == usableItemFg}}
											<a href="#none" name="itemDetailBtn" data-item-idx="{{:itemIdx}}" data-category-code="{{:~root.cateCd}}"
											 data-group-cd="{{:groupCd}}" data-menu-type="{{:displayCategoryCodeMain}}" onError="this.src='/images/common/noneImage.jpg'">
										{{else}}
											<a href="javascript:item.nextProgress('{{:itemIdx}}','{{:groupCd}}','{{:displayCategoryCodeMain}}', '{{:baseItemIdx}}', '{{:cateCd}}');"
											 name="itemDetailBtn" data-item-idx="{{:itemIdx}}" data-category-code="{{:~root.cateCd}}"
											 data-group-cd="{{:groupCd}}" data-menu-type="{{:displayCategoryCodeMain}}" onError="this.src='/images/common/noneImage.jpg'">
										{{/if}}
									<img src="{{:itemBaseImage}}?{{:imgCache}}" alt="{{:itemName}}" {{:~root.cateCd == 'ITEM_FAVORITE' && 'N' == usableItemFg ? 'class="close"' : ''}}>
								{{/if}}
									{{if ('ITEM_MORNING' == ~root.cateCd || 'ITEM_SPECIAL' != itemDiv1) || ('ITEM_SPECIAL' == itemDiv1 && (evntDisplayType != null && evntDisplayType == 'N'))}}
										<p>
											{{if 'ITEM_SIDEDRINK' == displayCategoryCodeMain}}
												<strong>{{:itemShortName}}</strong>
											{{else}}
												<strong {{:~root.cateCd == 'ITEM_FAVORITE' && 'N' == usableItemFg ? 'class="close"' : ''}}>{{:itemName}}{{if 'ITEM_SPECIAL' == itemDiv1 && evntDisplayType == null}} 세트{{/if}}</strong>
											{{/if}}
											{{if itemEngName != null && itemEngName != ''}}
												<span class="eng_name {{:~root.cateCd == 'ITEM_FAVORITE' && 'N' == usableItemFg ? 'close' : ''}}">{{:itemEngName}}</span>
											{{/if}}
											{{if 'ITEM_SIDEDRINK.DRINK' != displayCategoryCodeSub}}
												<span class="kcal {{:~root.cateCd == 'ITEM_FAVORITE' && 'N' == usableItemFg ? 'close' : ''}}">
													{{if itemCalorie.indexOf('/') > 0 || itemCalorie > 0}}
														<em>{{:itemCalorie}}</em>kcal
													{{/if}}
												</span>
											{{/if}}
										</p>
										<div class="label" {{:itemDiv1 == 'ITEM_SPECIAL' && (evntDisplayType != null && evntDisplayType == 'P') ? 'style="width:106px;"' : ''}}>
											{{if itemDiv1 == 'ITEM_SPECIAL' && (evntDisplayType != null && evntDisplayType == 'P')}}
												{{if evntType == 'EVNT_TYPE.HEAD_EVENT'}}
													<span class="common" style="background-color:#ffc300;">전국 매장 공통</span>
												{{/if}}
												{{if evntType == 'EVNT_TYPE.BRANCH_EVENT'}}
													<span class="local" style="background-color:#ff8300;">지사 매장 공통</span>
												{{/if}}
												{{if evntType == 'EVNT_TYPE.STORE_EVENT'}}
													<span class="store" style="background-color:#009223;">매장 전용</span>
												{{/if}}
											{{/if}}
											{{for labelArr}}
												<span class="{{:labelClassName}}" style="background-color: {{:labelColor}}">{{:labelName}}</span>
											{{/for}}
										</div>
									{{else}}
										<p>
											<strong>{{:itemName}}</strong>
										</p>
										<p class="price">
											<!--<del>{{:sale}}</del>-->
											<strong>{{:pric}}</strong>
										</p>
										<div class="date">
											<span>{{:evntSt}}</span>
											<span>{{:evntEt}}</span>
										</div>
										<div class="label">
											{{if evntType == 'EVNT_TYPE.HEAD_EVENT'}}
												<span class="common">전국 매장 공통</span>
											{{/if}}
											{{if evntType == 'EVNT_TYPE.BRANCH_EVENT'}}
												<span class="local">지사 매장 공통</span>
											{{/if}}
											{{if evntType == 'EVNT_TYPE.STORE_EVENT'}}
												<span class="store">매장 전용</span>
											{{/if}}
										</div>
										{{if 'Y' == soldoutYn}}
											<div class="label not_order"><!-- 주문불가class="not_order" -->
												<span>주문불가</span>
											</div>
										{{/if }}
									{{/if}}
								</a>
							</li>
						{{/if}}
					{{/for}}
				</ul>
			</script>
		<!-- 리스트 없을때 -->
		<script id="emptyList-tmpl" type="text/x-jsrender">
				<div class="data_none">
					<p>{{:menuGubun}}(이/가) 없습니다.</p>
				</div>
			</script>
	</div>
	<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>