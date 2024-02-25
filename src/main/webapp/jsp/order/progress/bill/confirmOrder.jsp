<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<%@ include file="/jsp/include/header.jsp"%>
	<!-- container s -->
	<div id="container">
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
					<li class="step_order"><strong>STEP 3</strong> 주문하기</li>
					<li class="step_payment on"><strong>STEP 4</strong> 결제하기</li>
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
									<dt>주문시, 요청사항</dt>
									<dd>
										<span class="form_text"> <input maxlength="50"
											name="ordMemoContent" placeholder="주문시 요청사항을 입력하세요"
											type="text" />
										</span>
									</dd>
									<!-- #220413 문구 추가건 홀딩
									<dd class="caution">※ 샌드위치 품질 유지를 위해 “빵 속파기” 서비스를 제공하지 않습니다.</dd>-->
								</dl>
							</div>
						</div>
						<!--// 픽업매장 -->
					</section>

					<!-- 주문내역 -->
					<div class="board_list_wrapper ord_items">
						<h2>주문내역</h2>
						<div class="content">
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
									<tr data-item-code="${dto.omncode}" data-item-index="0">
										<td>
											<div class="name" data-target="mainItem">
												<strong>클럽 세트</strong>
												<p>
													<!-- 빵길이 -->
													<th:object>${dto.olegnth}cm</th:object>

													<!-- 빵종류 -->
													<th:object>, ${dto.obread}(${dto.otoast})</th:object>

													<!-- 치즈 -->
													<th:object>, ${dto.ocheese}</th:object>

													<!-- 야채 -->

													<th:object>, ${dto.ovegetables}</th:object>


													<!-- 소스 -->

													<th:object>, ${dto.osauce}</th:object>

												</p>
											</div>
										</td>
										<td>
											<div class="count">
												<strong class="qty" data-qty="${dto.oqty}">${dto.oqty}</strong>개
											</div>
										</td>
										<td>
											<div class="sum">
												<span> <strong class="price" data-price="${dto.oprice}">${dto.oprice}</strong>

													<em>원</em>
												</span> <a data-target="arrow" href="javascript:void(0);">상세 주문
													내역 열고 닫기</a>

											</div>
										</td>
									</tr>
									
								</tbody>
							</table>
							<!--// 1세트 -->
							</c:forEach>

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
							<!-- issues/699 설문조사 쿠폰 영역추가 -->

							<!-- 일회용컵 -->

							<!--// 일회용컵 -->



						</div>
					</div>
					<!--// 주문내역 -->





					<!-- 결제금액 -->
					<div class="amount">
						<input id="totalOrdAmt" type="hidden" value="7700" /> <input
							id="ordAmt" type="hidden" value="7700" /> <input id="delvAmt"
							type="hidden" value="" /> <input id="oneCupAmt" type="hidden"
							value="0" /> <input name="totalPayAmt" type="hidden"
							value="7700" /> <input id="orderType" type="hidden"
							value="ORD_TYPE.FAST_SUB" /> <input id="ordSheetNo"
							type="hidden" value="8801165" />
						<h2>총 결제 금액</h2>

						<dl class="order_sum">
							<dt>총 주문 금액</dt>
							<dd>
								<strong id="orderTotal">7,700</strong> 원
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
								<strong id="totalPayAmtNavi">7,700</strong><span>원</span>
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
								id="startOrder"><span>확인</span></a>
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