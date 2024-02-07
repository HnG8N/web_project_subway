<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../../header.jsp" %>
			<!-- container s -->
            <div id="container">
			<input id="page" name="page" type="hidden" value="1" />
            <input id="loc" type="hidden" value="Y" />
			<!-- sub content s -->
			<div class="order fast_sub" id="content">
				<!-- index -->
				<div class="store_map">
					<div class="order_title">
						<h3>Fast-Sub</h3>
						<p>
							온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.
						</p>
					</div>
					<ol class="order_step">
						<li class="step_shop on">
							<strong>STEP 1</strong>
							매장선택
						</li>
						<li class="step_menu">
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
					<form method="post" name="orderForm">
						<input name="cartStorCd" type="hidden" value="" />
						<input name="storCd" type="hidden" />
						<input name="ordType" type="hidden" value="ORD_TYPE.FAST_SUB" />
						<input name="changeYn" type="hidden" value="N" />
						<input name="paveFg" type="hidden" value="" />
					</form>
					<div class="tab02">
						<ul>
							<li class="active"><a href="/order/view/fast/near/store">매장찾기</a></li>
							<li><a href="/order/view/fast/often/store">자주 찾는 매장</a></li>
						</ul>
					</div>
					<div class="order_con order_map">
						<!-- map api area w1170 h819 -->
						<div class="map_api">
							<div id="uiShopMap" style="height:820px;"></div>
						</div>
						<!--// map api area -->
						<div class="store_search">
							<h3>매장찾기</h3>
							<fieldset>
								<legend>매장 검색</legend>
								<div class="form_search">
									<input autocomplete="off" id="keyword" maxlength="30" placeholder="지역 또는 매장명 입력" type="text" />
									<a class="btn_search" href="javascript:void(0);" id="search"></a>
								</div>
								<p id="search_result"><strong>''</strong>검색 결과 <em>0</em>건</p>
							</fieldset>
							<div class="store_list">
								<ul id="uiResultList"></ul>
							<!-- board 페이지 -->
							<div class="pagination" id="ui_pager"></div>
							<!--// board 페이지 -->
							</div>
							<!-- 검색 결과 없을 때
							<div class="data_none">
								<p>검색 결과가 없습니다.</p>
							</div>
							-->
						</div>
					</div>
				</div>

				<script id="franchiseList" type="text/x-jQuery-tmpl">
						<li>
							<dl>
								<dt>
									<strong>{{:storNm}} </strong>
									<label class="my_bookmark">
										{{if favorYn == 'Y'}}
											<input type="checkbox" data-frno="{{:franchiseNo}}" data-storcd ="{{:storCd}}" data-idx="{{:franchiseIdx}}" onclick="favor.favorite(this)" checked >
										{{else}}
											<input type="checkbox" data-frno="{{:franchiseNo}}" data-storcd ="{{:storCd}}" data-idx="{{:franchiseIdx}}" onclick="favor.favorite(this)">
										{{/if}}
											<i class="i_star"></i>
									</label>

									{{if ordTmYn == 'Y'}}
										<em class="on" onclick ="naverMap.closeMarker({{:index}},{{:lat}},{{:lon}})" style="cursor:pointer;">주문하기</em>
									{{else}}
										<em  onclick ="naverMap.closeMarker({{:index}},{{:lat}},{{:lon}})" style="cursor:pointer;">주문불가</em>
									{{/if}}
								</dt>
								{{if oneCupYn == 'Y'}}
								<dd class="notice">
									<p>* 일회용컵 보증금제 참여 매장</p>
								</dd>
								{{/if}}
								{{if pickupTime != null && pickupTime != ''}}
								<dd class="delivery time">
									<p>예상 소요시간</p>
									<span>{{:pickupTime}}분</span>
								</dd>
								{{/if}}

								<dd>
									<p>{{:storAddr1}} {{:storAddr2}} </p>
									<p>{{:storTel.phoneFomatter('-')}}</p>
										<span>{{:distance}}</span>
								</dd>
							</dl>
						</li>
				</script>
			</div>
			<!--// sub content e -->
		</div>
		<!-- container e -->
<%@ include file="./../../../../footer.jsp" %>