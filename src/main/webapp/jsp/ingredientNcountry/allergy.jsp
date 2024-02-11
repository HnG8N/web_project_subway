<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알레르기 정보</title>
	<link href="" rel="shortcut icon" type="image/x-icon" />
	<link href="./css/ui.common.css" rel="stylesheet" type="text/css" />
	<link href="./css/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css" />
	<link href="./css/ui.popup.css" rel="stylesheet" type="text/css" /><!-- 팝업 css -->
	
	<script src="./js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="./js/jquery/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
	<script src="./js/jquery/TweenMax.min.js" type="text/javascript"></script>
</head>
<body>
<div class="new_style" id="popup_wrap">
		<h1 class="title">알레르기 유발성분</h1>
		<div class="popup_content">

			<div class="allergy_wrapper">
				<div class="scrollwrapper">
					<div class="summary">
						해당 자료는 Subway® 공식업체로부터 제공받는 식품 자료를 근거로 작성되었습니다.<br />
						해당 자료는 최신 정보로 업데이트 되고 있으나 상황에 따라 매장에서 제공되는 재료가 바뀔 수 있습니다.<br />
						식품에 대한 알러지가 있으신 분은 식품 섭취 전 매장에 식품에 대한 정보를 문의하세요.

						<div class="icon_type">
							<span class="a01"></span> = 포함
							<span class="a02"></span> = 포함할 수 있음
						</div>
					</div>

					<div class="notice">
						<ul>
							<li>· 이 정보는 Subway® 승인 식품 제조업체에서 제공한 제품 정보를 기반으로 작성되었습니다.</li>
							<li>· 이 정보를 최신 상태로 유지하기 위해 모든 노력을 기울이고 있지만 이 목록이 업데이트되기 전에 성분 변경 및 대체가 발생할 수 있습니다.</li>
							<li>· 이 목록은 재료가 다양하기 때문에 일부 지역 또는 특별 행사 품목을 포함하지 않습니다.</li>
							<li>· 우리는 우리가 준비한 음식에서 알레르기 성분을 식별하기 위해 많은 노력을 합니다. 그러나, 제품에 표시된 알레르기 성분만 있다고 보장할 수 없습니다.</li>
							<li>· 매장에서 가공, 보관 또는 준비하는 과정에서 알레르기 성분이 메뉴로 옮겨질 위험이 항상 있습니다.</li>
							<li>· 개별 식품 품목은 식품 준비 중에 서로 접촉할 수 있으며 이 차트에 반영되지 않습니다.</li>
							<li>· 식품 알레르기가 있는 경우 매장 직원에게 문의해 주십시오.</li>
							<li>· 각 제품의 레시피는 영양 성분표의 주의 문구를 참조해주세요.</li>
						</ul>
					</div>
					<!-- 식품 tab -->
					<div class="food_tab">
						<ul>
							<li class="active"><a href="food01">샌드위치</a></li>
							<li><a href="food02">랩</a></li>
							<li><a href="food03">샐러드</a></li>
							<li><a href="food04">아침메뉴</a></li>
							<li><a href="food05">스마일 썹</a></li>
							<li><a href="food06">빵</a></li>
							<li><a href="food07">미트류</a></li>
							<li><a href="food08">소스 & 드레싱</a></li>
							<li><a href="food09">치즈</a></li>
							<li><a href="food10">야채</a></li>
						</ul>
					</div>
					<!--// 식품 tab -->
					<!-- 식품 table -->
					<div class="food_table">
						<table>
							<caption>알레르기 유발성분 테이블</caption>
							<colgroup>
								<col style="width: 105px;" />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
								<col />
							</colgroup>
							<thead class="theader">
							<tr>
								<th class="" scope="col"></th>
								<th scope="col">밀</th>
								<th scope="col">계란</th>
								<th scope="col">우유</th>
								<th scope="col">대두</th>
								<th scope="col">메밀</th>
								<th scope="col">토마토</th>
								<th scope="col">복숭아</th>
								<th scope="col">쇠고기</th>
								<th scope="col">돼지<br />고기</th>
								<th scope="col">닭고기</th>
								<th scope="col">새우</th>
								<th scope="col">고등어</th>
								<th scope="col">게</th>
								<th scope="col">오징어</th>
								<th scope="col">조개류</th>
								<th scope="col">땅콩</th>
								<th scope="col">호두</th>
								<th scope="col">아황산</th>
								<th scope="col">잣</th>
							</tr>
							</thead>
							<!-- 샌드위치 -->
							<tbody data-menu="food01" style="display:table-row-group;">
							<tr>
								<th scope="row">B.L.T. </th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">치킨 데리야끼</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">에그마요</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a02"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">햄</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">이탈리안 비엠티</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">K-바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">미트볼</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">풀드 포크 바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">로스트 치킨</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">로티세리<br />바비큐 치킨</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">쉬림프</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스파이시 이탈리안</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스테이크 & 치즈 (아메리칸 치즈 포함)</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">써브웨이 클럽</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">베지</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">참치</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">터키</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">터키 베이컨<br />아보카도</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<!-- Limited Time -->
							<tr>
								<th scope="row">스파이시 쉬림프</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스파이시 쉬림프<br />아보카도</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">머쉬룸</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">치킨 슬라이스</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">치킨 베이컨<br />아보카도</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스파이시 바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">에그마요 베이컨</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a02"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">에그마요 페퍼로니</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a02"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<!--// Limited Time -->
							</tbody>
							<!--// 샌드위치 -->
							<!-- 랩/그릴드 랩 -->
							<tbody data-menu="food02">
							<tr>
								<th scope="row">치킨 베이컨 미니 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">쉬림프 에그마요 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스테이크 & 치즈 아보카도 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">치킨 베이컨 미니 그릴드 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">쉬림프 에그 그릴드 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스테이크 & 치즈 아보카도 그릴드 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</tbody>
							<!--// 랩/그릴드 랩 -->
							<!-- 샐러드 -->
							<tbody data-menu="food03">
							<tr>
								<th scope="row">B.L.T.</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">치킨 데리야끼</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">에그마요</th>
								<td><span class="a02"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a02"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">햄</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">이탈리안 비엠티</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">K-바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">풀드 포크 바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">로스트 치킨</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">로티세리<br />바비큐 치킨</th>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">쉬림프</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스파이시 이탈리안</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스테이크 & 치즈 (아메리칸 치즈 포함)</th>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">써브웨이 클럽</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">베지</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">참치</th>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">터키</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">터키 베이컨<br />아보카도</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스파이시 쉬림프</th>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스파이시 쉬림프<br />아보카도</th>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">머쉬룸</th>
								<td><span class="a02"></span></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">치킨 슬라이스</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">치킨 베이컨<br />아보카도</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스파이시 바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</tbody>
							<!--// 샐러드 -->
							<!-- 아침메뉴 -->
							<tbody data-menu="food04">
							<tr>
								<th scope="row">베이컨,<br />에그 & 치즈</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">햄,<br />에그 & 치즈</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스테이크,<br />에그 & 치즈</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">웨스턴,<br />에그 & 치즈</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">베이컨,<br />에그 & 치즈 그릴드 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">햄,<br />에그 & 치즈 그릴드 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스테이크,<br />에그 & 치즈 그릴드 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">웨스턴,<br />에그 & 치즈 그릴드 랩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</tbody>
							<!--// 아침메뉴 -->
							<!-- 스마일썹 -->
							<tbody data-menu="food05">
							<tr>
								<th scope="row">베이크 포테이토 <br />수프</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">브로콜리 체다 수프</th>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">머쉬룸 수프</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">해시 브라운</th>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">웨지 포테이토</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">Cheesy 웨지<br />포테이토</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">Bacon Cheesy 웨지<br />포테이토</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">초코칩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">더블 초코칩</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">오트밀 레이즌</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">라즈베리 치즈케익</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">화이트 초코<br />마카다미아</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
							</tr>
							</tbody>
							<!--// 스마일썹 -->
							<!-- 빵 -->
							<tbody data-menu="food06">
							<tr>
								<th scope="row">플랫 브레드</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">허니오트</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">파마산 오레가노</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">위트</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">화이트</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">통밀 랩</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</tbody>
							<!--// 빵 -->
							<!-- 미트류 -->
							<tbody data-menu="food07">
							<tr>
								<th scope="row">베이컨 비츠</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">베이컨</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">치킨 데리야끼</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">에그마요</th>
								<td><span class="a02"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a02"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">오믈렛</th>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">햄</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">K-바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">미트볼</th>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">페퍼로니</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">풀드 포크 바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">로스트 치킨</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">로티세리<br />바비큐 치킨</th>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">살라미</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">쉬림프</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스테이크</th>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">참치</th>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">터키</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<!-- Limited Time -->
							<tr>
								<th scope="row">스파이시 쉬림프</th>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">머쉬룸</th>
								<td><span class="a02"></span></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a02"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<!--// Limited Time -->
							</tbody>
							<!--// 미트류 -->
							<!-- 소스 & 드레싱 -->
							<tbody data-menu="food08">
							<tr>
								<th scope="row">머스타드</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">허니 머스타드</th>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">홀스 래디쉬</th>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">핫 칠리</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">케첩</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">마리나라</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">마요네즈</th>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">올리브 오일</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">랜치</th>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">레드와인식초</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스모크 바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">NEW 사우스웨스트 치폴레</th>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스위트 칠리</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스위트 어니언</th>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">이탈리안 드레싱</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">스파이시 바비큐</th>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</tbody>
							<!--// 소스 & 드레싱 -->
							<!-- 치즈 -->
							<tbody data-menu="food09">
							<tr>
								<th scope="row">아메리칸 치즈</th>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">모차렐라 치즈</th>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">슈레드 치즈</th>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</tbody>
							<!--// 치즈 -->
							<!-- 야채 -->
							<tbody data-menu="food10">
							<tr>
								<th scope="row">아보카도</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">오이</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">피망</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">할라피뇨</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">양상추</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">올리브</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">양파</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">피망</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">토마토</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="a01"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</tbody>
							<!--// 야채 -->
						</table>
					</div>
					<!--// 식품 table -->
				</div>
			</div>
		</div>
	</div>
<script>
$(document).ready(function(){
	popfootTab();//popup : 알레르기유발성분 탭
	scrollTab();
	function scrollTab(){
		var st = 0;
		var allergyNotice = $('.allergy_wrapper .notice');
		var allergySummary = $('.allergy_wrapper .summary');

		$('#popup_wrap .scrollwrapper').scroll(function(e){
			st = $(this).scrollTop();
			if ( st > 114 ) {
				$('#popup_wrap .allergy_wrapper').addClass('fixed');
				allergyNotice.hide();
				allergySummary.hide();
			} else {
				$('#popup_wrap .allergy_wrapper').removeClass('fixed');
				allergyNotice.show();
				allergySummary.show();
			}
		});
	}

	function popfootTab(){//popup : 알레르기유발성분 탭
		$('.food_tab ul li a').on('click', function(){
			var tg = $(this).attr('href');
			$(this).parent().addClass('active').siblings('li').removeClass('active')
			$('.food_table tbody').hide();
			$('.food_table tbody[data-menu="'+tg+'"]').show();
			return false;
		})
	}
})
</script>

</body>
</html>