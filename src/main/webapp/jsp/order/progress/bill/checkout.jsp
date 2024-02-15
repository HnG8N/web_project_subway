<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY - 결제하기</title>
</head>
<body>
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
					<li class="step_shop">
						<strong>STEP 1</strong>
						매장선택
					</li>
					<li class="step_menu">
						<strong>STEP 2</strong>
						메뉴선택
					</li>
					<li class="step_order on">
						<strong>STEP 3</strong>
						주문하기
					</li>
					<li class="step_payment">
						<strong>STEP 4</strong>
						결제하기
					</li>
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
									<dt>논현역</dt>
									<dd>서울특별시 서초구 강남대로 535 프린스빌딩</dd>
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
										<span class="form_text">
											<input maxlength="11" name="ordHp" placeholder="전화번호를 입력하세요" type="text" value="01088487702" />
										</span>
									</dd>
								</dl>
							</div>
							<div class="input_set">
								<dl class="">
									<dt>주문시, 요청사항</dt>
									<dd>
										<span class="form_text">
											<input maxlength="50" name="ordMemoContent" placeholder="주문시 요청사항을 입력하세요" type="text" />
										</span>
									</dd>
									<!-- #220413 문구 추가건 홀딩
									<dd class="caution">※ 샌드위치 품질 유지를 위해 “빵 속파기” 서비스를 제공하지 않습니다.</dd>-->
								</dl>
							</div>
							<div class="input_set">
								
								<dl class="a_order">
									<dt>일회용품</dt>
									<dd>
										<div class="choice_wrap">
											<label class="form_checkbox dispos">
												<input name="disposableFg" type="checkbox" value="Y" />
												<span class="icon"></span>
												<p>일회용품(스푼, 포크 등)을 사용하지 않겠습니다.</p>
                                            </label>
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <!--// 픽업매장 -->

                        <!-- 할인방법 -->
                        <h2>할인 방법 선택</h2>
                        <div class="write_info_wrap" id="discount">
                            <!-- 2019-12-13 #232 쿠폰 사용 폼 추가 -->
                            <input name="voucher" type="hidden" />
                            <input id="voucherAmt" type="hidden" />
                            <input name="couponItemCode" type="hidden" />
                            <input name="couponItemIndex" type="hidden" />
                            <input id="couponAmt" name="couponAmt" type="hidden" />
                            <div class="input_set">
                                <dl>
                                    <dt>쿠폰 사용</dt>
                                    <dd>
										<div class="form_select" style="width: 670px;">
											<select name="couponCode">
												
                                                
                                                    <option value="">보유하신 쿠폰이 없습니다.</option>
                                                
                                            </select>
                                        </div>
                                        <div class="btn_input_in">
                                            <a class="in_form_btn" href="javascript:void(0);" id="couponApply"><span>쿠폰 사용</span></a>
                                        </div>
                                    </dd>
                                </dl>
                                 <!-- issues/699 설문조사 쿠폰 영역추가 -->

                                <input name="surveyCouponIdx" type="hidden" value="" />
                                <input name="availableSurveyCookie" type="hidden" value="N" />
                                <input name="surveyCookieCode" type="hidden" value="" />
                                <input name="surveyCookieItemIdx" type="hidden" value="" />
                                <input name="surveyCookieBaseItemIdx" type="hidden" value="" />
                                <input name="surveyCookieOrdIdx" type="hidden" value="8801165" />
                            </div>
							<!--// 2019-12-13 #232 쿠폰 사용 폼 추가 -->
							<div class="input_set">
								<dl>
									<dt>포인트 사용</dt>
									<dd>
										<div class="use_point">
											<span class="form_text bdr_text">
												<input id="pointAmt" name="pointAmt" placeholder="사용금액 입력" type="text" value="0" />
											</span>
											<p>
												<span>보유 포인트 :</span>
												<strong id="usablePoint" data-point="0">0</strong>
											</p>
										</div>
										<div class="btn_input_in">
											<a class="in_form_btn" href="javascript:void(0);" id="useAllPoint"><span>모두 사용</span></a>
										</div>
									</dd>
								</dl>
								<p class="counsel_copy">프로모션 상품은 타 할인 행사 및 쿠폰으로 중복 할인되지 않습니다.</p>
								<p class="counsel_copy on">포인트는 3,000P이상 소지 시 사용 가능하며, 일회용컵 보증금은 포인트로 결제할 수 없습니다</p>
							</div>
						</div>
						<!--// 할인방법 -->

						<!-- 결제수단 -->
						<h2>결제 수단 선택</h2>
						<div class="write_info_wrap">
							<!-- 2019-12-13 #232 결제수단: 써브카드 결제 영역 마크업 수정 -->
							<div class="input_set">
								<dl>
									<dt>써브카드 결제</dt>
									<dd>
										<div class="use_point use_card">
											<span class="form_text bdr_text">
												<input id="subcardAmt" name="subcardAmt" type="text" disabled="disabled" placeholder="사용가능 금액이 없습니다" />
											</span>
											<p>
												<span>보유 금액 :</span>
												<strong id="usableSubcardAmt" data-subcard="0">0</strong>
											</p>
										</div>
										<!-- 2019-12-12 써브카드 금액 모두사용 버튼 추가 -->
										
										<!--// 2019-12-12 써브카드 금액 모두사용 버튼 추가 -->
									</dd>
									<dt>현금 영수증 신청</dt>
									<dd>
										<div class="cash_receipt">
											<div class="form_radio square">
												<label>
													<input checked="" id="not" name="receiptType" type="radio" />
													<span class="shape">발급안함</span>
												</label>
												<label>
													<input id="person" name="receiptType" type="radio" value="RECEIPT_TYPE.PERSONAL" disabled="disabled" />
													<span class="shape">개인소득공제</span>
												</label>
												<label>
													<input id="cmp" name="receiptType" type="radio" value="RECEIPT_TYPE.BUSINESS" disabled="disabled" />
													<span class="shape">사업자증빙용</span>
												</label>
											</div>
											<span class="form_text">
												<input name="receiptYn" type="hidden" value="N" />
												<input disabled="disabled" maxlength="11" name="receiptNo" placeholder="번호 입력" style="display:none;" type="text" />
											</span>
										</div>
									</dd>
								</dl>
							</div>
							<!--// 2019-12-13 #232 결제수단: 써브카드 결제 영역 마크업 수정 -->
							<div class="input_set">
								<dl>
									<dt>다른 결제 수단</dt><!-- * 2019-12-13 #232 결제수단: 텍스트 수정 -->
									<dd>
										<div class="form_radio square">
											<label>
												<input checked="checked" id="creditcard" name="payment" type="radio" value="PAY_METHOD.CRDT" />
												<span class="shape">신용카드</span>
											</label>
											
											
											<label>
												<input id="etc" name="payment" type="radio" value="PAY_METHOD.PAYCOKAKAO" />
												<span class="shape">
													<i class="pay_logo"><img alt="카카오페이" src="/images/common/icon_kakaopay.png" /></i>
													<i class="pay_logo"><img alt="페이코" src="/images/common/icon_payco.png" /></i>
												</span>
											</label>
										</div>
                                        <p class="caution_txt">※ 페이코 생애 첫 결제 시, 최대 4,500원 혜택(~10/31)</p>
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
                            <!-- 1세트 -->
                            <table class="history_table">
                                <caption>주문내역 테이블</caption>
                                <colgroup>
                                    <col width="*" />
                                    <col width="90px" />
                                    <col width="130px" />
                                </colgroup>
                                <tbody>
                                <tr data-item-code="00311" data-item-index="0">
                                    <td>
                                        <div class="name" data-target="mainItem">
                                            <strong>클럽 세트</strong>
                                            <p>
                                                <!-- 빵길이 -->
                                                <th:object>15cm</th:object>

                                                <!-- 빵종류 -->
                                                <th:object>, 파마산 오레가노(토스팅)</th:object>

                                                <!-- 치즈 -->
                                                <th:object>, 슈레드치즈</th:object>

                                                <!-- 야채 -->
                                                
                                                    <th:object>, 토마토</th:object>
                                                

                                                <!-- 소스 -->
                                                
                                                    <th:object>, 스위트 어니언</th:object>
                                                
                                            </p>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="count"><strong class="qty" data-qty="1">1</strong>개
                                        </div>
                                    </td>
                                    <td>
                                        <div class="sum">
												<span>
													<strong class="price" data-price="7,700">7,700</strong>
													
													<em>원</em>
												</span>
                                            
                                                <a data-target="arrow" href="javascript:void(0);">상세 주문 내역 열고 닫기</a>
                                            
                                        </div>
                                    </td>
                                </tr>

                                <!-- 더블치즈 -->
                                

                                <!-- 더블업 -->
                                

                                <!-- 엑스트라 -->
                                <tr>
                                    <td>
                                        <div class="name">
                                            <strong>오믈렛</strong>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="count"></div>
                                    </td>
                                    <td>
                                        <div class="sum">
												<span>
													<strong>1,800</strong>
													
													<em>원</em>
												</span>
                                        </div>
                                    </td>
                                </tr>

                                <!-- 세트추가 -->
                                <tr>
                                    <td>
                                        <div class="name">
                                            <strong>세트추가</strong>
                                            <p>
                                                
                                                    <th:object>오트밀 레이즌 쿠키</th:object>
                                                    <th:object>, </th:object>
                                                
                                                
                                                    <th:object>탄산음료 16oz</th:object>
                                                    <th:object></th:object>
                                                
                                            </p>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="count"></div>
                                    </td>
                                    <td>
                                        <div class="sum">
												<span>
													<strong>0</strong>
													<em>원</em>
												</span>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <!--// 1세트 -->

                            <table class="history_table" id="chooseSurveyCookie" style="display:none;">
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
                                        <div class="count"><strong>1</strong>개</div>
                                    </td>
                                    <td>
                                        <div class="sum">
												<span>
													<strong>0</strong>
													<em>원</em>
												</span>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table> <!-- issues/699 설문조사 쿠폰 영역추가 -->

							<!-- 일회용컵 -->
							
							<!--// 일회용컵 -->

							

                        </div>
					</div>
					<!--// 주문내역 -->





					<!-- 결제금액 -->
					<div class="amount">
						<input id="totalOrdAmt" type="hidden" value="7700" />
						<input id="ordAmt" type="hidden" value="7700" />
						<input id="delvAmt" type="hidden" value="" />
						<input id="oneCupAmt" type="hidden" value="0" />
						<input name="totalPayAmt" type="hidden" value="7700" />
						
						<input id="orderType" type="hidden" value="ORD_TYPE.FAST_SUB" />
						<input id="ordSheetNo" type="hidden" value="8801165" />
						<h2>총 결제 금액</h2>
						
						<dl class="order_sum">
							<dt>총 주문 금액</dt>
							<dd>
								<strong id="orderTotal">7,700</strong>
								원
							</dd>
						</dl>
                        <dl class="detail_sum">
                            <dt>써브카드 사용</dt>
                            <dd><strong id="subcardAmtNavi">0</strong>원</dd>
                            <dt>쿠폰 사용</dt>
                            <dd><strong id="couponAmtNavi">0</strong>원</dd>
                            <dt>포인트 사용</dt>
                            <dd><strong id="pointAmtNavi">0</strong>원</dd>
                            <dt name="surveyCookieNavi" style="display:none;">설문조사 감사 쿠폰 사용</dt>
                            <dd name="surveyCookieNavi" style="display:none;"><strong>0</strong>원</dd>
                            
                        </dl>
						<dl class="payment_sum">
							<dt>잔여 결제금액 </dt>
							<dd><strong id="totalPayAmtNavi">7,700</strong><span>원</span></dd>
						</dl>
						<div class="payment_agree">
							<dl>
								<dt>
									<label class="form_checkbox">
										<input id="paymentAgree" type="checkbox" value="Y" />
										<span class="icon"></span><strong>구매조건 및 결제진행 동의</strong>
									</label>
								</dt>
								<dd>
									<ul>
										<!-- 2019-12-13 #205 결제동의 문구 클래스 추가 -->
										<li class="counsel_copy">주문할 메뉴와 가격, 매장정보를 명확히 확인하였으며 결제 진행에 동의합니다.</li>
										<li class="counsel_copy">제조시간은 매장상황에 따라 상이할 수 있습니다.</li>
										<li class="counsel_copy">주문자 정보가 서비스 제공을 위해 주문 매장에 제공되며, 홈썹 이용의 경우 라이더에게 제공됨에 동의합니다.</li>	<!-- #220726 문구 추가 -->
										<li class="counsel_copy on">주문 후 제조가 시작되면 주문을 취소할 수 없습니다.</li>
										<!--// 2019-12-13 #205 결제동의 문구 클래스 추가 -->
									</ul>
								</dd>
							</dl>
						</div>
						<div class="btn_area">
							<a class="btn bgc_point i_reg" href="javascript:void(0);" id="startOrder"><span>결제하기</span></a>
						</div>
					</div>
					<!--// 결제금액 -->
				</div>
			</div>
			<!--// 주문하기 -->
		</div>
		<!--// sub content -->
	</div>
</body>
</html>