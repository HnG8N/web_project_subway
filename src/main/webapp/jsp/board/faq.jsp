<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY - FAQ</title>
    <link href="http://subway.co.kr/" rel="canonical" /><!-- 20180221 -->
    <meta content="신선하고 건강한 글로벌 NO.1 샌드위치 브랜드, 써브웨이" name="description" /><!-- 20181212 -->
    <link rel="shortcut icon" type="image/x-icon" href="./images/common/subway_favicon.ico?v=2023051202" />
        <!-- 20180131 -->
        <link rel="stylesheet" type="text/css" href="./css/ui.common.css?v=2023051202" />
        <link rel="stylesheet" type="text/css" href="./css/jquery.mCustomScrollbar.min.css?v=2023051202" />
		<link rel="stylesheet" type="text/css" href="./css/ui.customer.css?v=2023051202" />

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
        
		<script type="text/javascript" src="./js/subway.pagination.js?v=2023051202"></script>
		<script type="text/javascript" src="./js/customer/faq.js?v=2023051202"></script>
		<script type="text/javascript">
			var currentCategory = 0;
			var faqCategory = [{'code':1101,'codeNm':'\uC0AC\uC774\uD2B8\u318D\uC571 \uC774\uC6A9','etc':'','gcode':11,'gname':'FAQ \uAD6C\uBD84','orderNo':1,'useFg':'Y'},{'code':1003,'codeNm':'\uC368\uBE0C\uCE74\uB4DC\u318D\uD3EC\uC778\uD2B8','etc':'','gcode':11,'gname':'FAQ \uAD6C\uBD84','orderNo':2,'useFg':'Y'},{'code':1102,'codeNm':'\uC81C\uD488','etc':'','gcode':11,'gname':'FAQ \uAD6C\uBD84','orderNo':3,'useFg':'Y'},{'code':1106,'codeNm':'\uB9E4\uC7A5\uC774\uC6A9','etc':'','gcode':11,'gname':'FAQ \uAD6C\uBD84','orderNo':4,'useFg':'Y'},{'code':1107,'codeNm':'\uAC00\uB9F9\uC810\uBB38\uC758','etc':'','gcode':11,'gname':'FAQ \uAD6C\uBD84','orderNo':5,'useFg':'Y'}];
			var pg = JSON.parse('{\"requestData\":{\"pageNo\":1,\"itemCountPerPage\":5,\"displayPageNoCount\":5},\"responseData\":{\"displayStartPageNo\":1,\"displayEndPageNo\":5,\"totalItemCount\":38,\"startItemNo\":0,\"maxPageNo\":8}}');
			var faqList = JSON.parse('[{\"idx\":74,\"category\":1101,\"subject\":\"\uC2E4\uBA85 \uC815\uBCF4(\uC774\uB984, \uC0DD\uB144\uC6D4\uC77C \uB4F1)\uB97C \uC218\uC815\uD558\uACE0 \uC2F6\uC2B5\uB2C8\uB2E4.\",\"content\":\"\uAC1C\uBA85, \uC8FC\uBBFC\uB4F1\uB85D\uBC88\uD638 \uBC1C\uAE09\xB7\uC218\uC815 \uB4F1\uC758 \uC774\uC720\uB85C \uC2E4\uBA85 \uC815\uBCF4(\uC774\uB984, \uC0DD\uB144\uC6D4\uC77C, \uC131\uBCC4)\uAC00 \uBCC0\uACBD\uB41C \uACBD\uC6B0\uC5D0 \uD55C\uD558\uC5EC \uC815\uBCF4 \uBCC0\uACBD\uC774 \uC644\uB8CC\uB41C \uBCF8\uC778 \uBA85\uC758 \uD734\uB300\uD3F0\uC73C\uB85C \uBCF8\uC778 \uC778\uC99D\uD558\uC5EC \uC9C1\uC811 \uC218\uC815\uD560 \uC218 \uC788\uC2B5\uB2C8\uB2E4.<br/>\uB2E8, \uC774\uB984/\uC0DD\uB144\uC6D4\uC77C/\uAC1C\uC778\uACE0\uC720\uC2DD\uBCC4\uC815\uBCF4(\uC554\uD638\uD654\uB41C \uB3D9\uC77C\uC778\uC2DD\uBCC4\uC815\uBCF4) \uC911 \uC77C\uCE58\uD558\uB294 \uC815\uBCF4\uAC00 \uC788\uC5B4\uC57C \uC218\uC815\uC774 \uAC00\uB2A5\uD558\uBA70, \uD0C0\uC778\uC758 \uC815\uBCF4\uB85C\uB294 \uC218\uC815\uD560 \uC218 \uC5C6\uC2B5\uB2C8\uB2E4.<br/><br/>\uC2E4\uBA85 \uC815\uBCF4 \uC218\uC815 \uBC29\uBC95<br/>\uB85C\uADF8\uC778 \u2192MY-SUB\u2192 \uD68C\uC6D0\uC815\uBCF4 \uBCC0\uACBD\u2192 \uC815\uBCF4\uBCC0\uACBD\u2192\uBCF8\uC778 \uC778\uC99D\u2192\uC800\uC7A5\",\"enable\":\"Y\",\"regDt\":\"Apr 14, 2021 9:13:06 PM\",\"pagingStartIdx\":0,\"pagingItemCount\":0},{\"idx\":73,\"category\":1003,\"subject\":\"\uD3EC\uC778\uD2B8\uB294 \uBB34\uC5C7\uC774\uACE0 \uC5B4\uB5BB\uAC8C \uC801\uB9BD\u318D\uC0AC\uC6A9\uD558\uB098\uC694?\",\"content\":\"\uC571 \uC0AC\uC6A9\uC774 \uAC00\uB2A5\uD55C \uB9E4\uC7A5\uC774\uB77C\uBA74 \uC5B4\uB290 \uB9E4\uC7A5\uC5D0\uC11C\uB4E0 \uC571 \uC8FC\uBB38 \uBC0F \uB9E4\uC7A5 \uC8FC\uBB38 \uC2DC\uC5D0 \uC801\uB9BD\u318D\uC0AC\uC6A9\uD558\uC2E4 \uC218 \uC788\uB294 \uD1B5\uD569 \uD3EC\uC778\uD2B8 \uC11C\uBE44\uC2A4\uC774\uBA70, <br/>\uC368\uBE0C\uC6E8\uC774 \uC571 \uB610\uB294 \uD648\uD398\uC774\uC9C0\uB97C \uD1B5\uD574 \uD68C\uC6D0\uAC00\uC785\uD558\uC2DC\uBA74, \uC11C\uBE44\uC2A4\uB97C \uC774\uC6A9\uD558\uC2E4 \uC218 \uC788\uC2B5\uB2C8\uB2E4.<br/><br/>(1) \uC801\uB9BD<br/>\uC571\uC744 \uD1B5\uD574 \uC8FC\uBB38\uD558\uC2E0 \uACBD\uC6B0 \uACB0\uC81C\uAE08\uC561\uC5D0 \uB530\uB77C \uD3EC\uC778\uD2B8\uAC00 \uC790\uB3D9 \uC801\uB9BD \uB429\uB2C8\uB2E4.<br/>\uB9E4\uC7A5\uC5D0\uC11C(\uC624\uD504\uB77C\uC778) \uACB0\uC81C \uC2DC\uC5D0\uB294 \uD3EC\uC778\uD2B8 \uC801\uB9BD\uC744 \uC694\uCCAD\uD558\uC2DC\uACE0 \uC9C1\uC6D0 \uC548\uB0B4\uC5D0 \uB530\uB77C \uC571 \uB0B4 QR \uCF54\uB4DC\uB97C \uB9AC\uB529 \uB610\uB294 \uD578\uB4DC\uD3F0 \uBC88\uD638\uB97C \uC870\uD68C\uD558\uC5EC \uD558\uC5EC \uC801\uB9BD \uBC1B\uC73C\uC2E4 \uC218 \uC788\uC2B5\uB2C8\uB2E4. <br/><br/>(2) \uC0AC\uC6A9<br/>\uD3EC\uC778\uD2B8\uB294 \uAC00\uC6A9 \uD3EC\uC778\uD2B8\uAC00 3,000\uD3EC\uC778\uD2B8 \uC774\uC0C1\uC77C \uB54C\uBD80\uD130 10\uD3EC\uC778\uD2B8 \uB2E8\uC704\uB85C \uC0AC\uC6A9 \uAC00\uB2A5\uD569\uB2C8\uB2E4. <br/>\uC628\uB77C\uC778: \uACB0\uC81C \uC2DC \uD3EC\uC778\uD2B8 \uB780\uC5D0 10\uD3EC\uC778\uD2B8 \uB2E8\uC704\uB85C \uC785\uB825\uD558\uC5EC \uC0AC\uC6A9\uD569\uB2C8\uB2E4. <br/>\uC624\uD504\uB77C\uC778: \uACB0\uC81C \uC2DC \uD3EC\uC778\uD2B8 \uC0AC\uC6A9\uC744 \uC694\uCCAD\uD558\uC2DC\uACE0, \uC368\uBE0C\uC6E8\uC774 \uC571\uC758 QR\uCF54\uB4DC\uB97C \uB9AC\uB529\uD558\uC5EC \uD3EC\uC778\uD2B8\uB85C \uACB0\uC81C\uD558\uC2E4 \uC218 \uC788\uC2B5\uB2C8\uB2E4.\uB2E8, \uD734\uB300\uD3F0 \uBC88\uD638 \uC870\uD68C\uB97C \uD1B5\uD55C \uD3EC\uC778\uD2B8 \uC0AC\uC6A9\uC740 \uBD88\uAC00\uD569\uB2C8\uB2E4.<br/><br/>(3)\uC18C\uBA78<br/>\uD3EC\uC778\uD2B8 \uC720\uD6A8\uAE30\uAC04\uC740 \uC801\uB9BD\uC77C\uB85C\uBD80\uD130 12\uAC1C\uC6D4\uC774\uBA70, \uC720\uD6A8\uAE30\uAC04\uC774 \uACBD\uACFC\uB41C \uD3EC\uC778\uD2B8\uB294 \uC720\uD6A8\uAE30\uAC04\uC774 \uC885\uB8CC\uB418\uB294 \uD574\uB2F9 \uC6D4 \uB9D0\uC77C\uC5D0 \uC18C\uBA78\uB418\uBA70 \uC18C\uBA78\uB41C \uD3EC\uC778\uD2B8\uB294 \uBCF5\uAD6C\uAC00 \uBCF5\uAD6C\uAC00 \uBD88\uAC00\uD569\uB2C8\uB2E4.<br/>\uC18C\uBA78 \uC608\uC815 \uD3EC\uC778\uD2B8\uB294 \uC571 \uB0B4 \'\uBA64\uBC84\uC2ED\'-> \'\uD3EC\uC778\uD2B8 \uD604\uD669\'\uC5D0\uC11C \uD655\uC778\uD558\uC2E4 \uC218 \uC788\uC73C\uBA70, \uB4F1\uB85D\uB41C \uC774\uBA54\uC77C\uC744 \uD1B5\uD574 \uC548\uB0B4\uB4DC\uB9AC\uACE0 \uC788\uC2B5\uB2C8\uB2E4.<br/>\uB2E4\uB9CC \uBA54\uC77C \uC124\uC815\uC5D0 \uB530\uB77C \uC774\uBA54\uC77C \uC548\uB0B4\uAC00 \uB3C4\uB2EC\uD558\uC9C0 \uC54A\uAC70\uB098 \uC2A4\uD338\uC73C\uB85C \uBD84\uB958\uB418\uB294 \uACBD\uC6B0\uAC00 \uC788\uC73C\uB2C8 \uC774\uC6A9\uC5D0 \uCC38\uACE0\uD558\uC5EC \uC8FC\uC2ED\uC2DC\uC624.<br/>\",\"enable\":\"Y\",\"regDt\":\"Aug 27, 2020 12:21:23 PM\",\"pagingStartIdx\":0,\"pagingItemCount\":0},{\"idx\":72,\"category\":1003,\"subject\":\"\uC368\uBE0C\uCE74\uB4DC\uB780 \uBB34\uC5C7\uC774\uACE0 \uC5B4\uB5BB\uAC8C \uCDA9\uC804\u318D\uC0AC\uC6A9\uD558\uB098\uC694?\",\"content\":\"\uC368\uBE0C\uCE74\uB4DC\uB780 \uC368\uBE0C\uC6E8\uC774\uC5D0\uC11C \uC0AC\uC6A9\uD560 \uC218 \uC788\uB294 \uBAA8\uBC14\uC77C \uC120\uBD88 \uCE74\uB4DC\uB85C \uD68C\uC6D0 \uAC00\uC785 \uD6C4 \uC790\uB3D9 \uBC1C\uAE09\uB429\uB2C8\uB2E4. <br/><br/>\uC571\u318D\uD648\uD398\uC774\uC9C0\uC758  \\\"MY-SUB \u2192 \uC368\uBE0C\uCE74\uB4DC\u2192\uCDA9\uC804\uD558\uAE30\\\"\uB97C \uD1B5\uD574 \uCDA9\uC804\uD558\uC2DC\uAC70\uB098, \uC571\uC774 \uC0AC\uC6A9\uAC00\uB2A5\uD55C \uB9E4\uC7A5\uC5D0\uC11C \uC368\uBE0C\uCE74\uB4DC \uCDA9\uC804\uC744 \uC694\uCCAD\uD558\uC5EC \uC571\uC758 QR\uCF54\uB4DC\uB97C \uB9AC\uB529 \uBC0F \uCDA9\uC804 \uAE08\uC561\uC744 \uAE30\uD0C0 \uACB0\uC81C \uC218\uB2E8\uC73C\uB85C \uACB0\uC81C\uD558\uC5EC \uC0AC\uC6A9\uD558\uC2E4 \uC218 \uC788\uC2B5\uB2C8\uB2E4.\",\"enable\":\"Y\",\"regDt\":\"Aug 27, 2020 12:20:58 PM\",\"pagingStartIdx\":0,\"pagingItemCount\":0},{\"idx\":71,\"category\":1003,\"subject\":\"e-Gift\uB294 \uBB34\uC5C7\uC778\uAC00\uC694?\",\"content\":\"e-Gift\uB780 \uBAA8\uBC14\uC77C \uC368\uBE0C\uCE74\uB4DC\uB97C \uC120\uBB3C \uD560 \uC218 \uC788\uB294 \uC11C\uBE44\uC2A4\uC785\uB2C8\uB2E4. <br/>\uCD5C\uC18C 5,000\uC6D0\uBD80\uD130 \uCD5C\uB300 5\uB9CC\uC6D0\uAE4C\uC9C0 \uC120\uBB3C\uD558\uAE30\uAC00 \uAC00\uB2A5\uD569\uB2C8\uB2E4. <br/>e-Gift\uB97C \uC120\uBB3C \uBC1B\uC73C\uC2DC\uB294 \uBD84\uC740 \uBB38\uC790 \uD639\uC740 \uCE74\uCE74\uC624\uD1A1\uC744 \uD1B5\uD574 \uB4F1\uB85D url\uC744 \uBC1B\uAC8C \uB418\uC2DC\uACE0, \uC368\uBE0C\uC6E8\uC774 \uC571\uC744 \uD1B5\uD574 \uC120\uBB3C\uBC1B\uC73C\uC2E0 e-Gift\uB97C \uB4F1\uB85D \uD6C4 \uC0AC\uC6A9\uD558\uC2E4 \uC218 \uC788\uC2B5\uB2C8\uB2E4. \",\"enable\":\"Y\",\"regDt\":\"Aug 27, 2020 12:20:29 PM\",\"pagingStartIdx\":0,\"pagingItemCount\":0},{\"idx\":70,\"category\":1003,\"subject\":\"\uC624\uD504\uB77C\uC778 \uAD6C\uB9E4 \uC2DC \uD3EC\uC778\uD2B8 \uC801\uB9BD\uC744 \uD558\uC9C0 \uBABB\uD588\uC2B5\uB2C8\uB2E4. \uCD94\uD6C4 \uC801\uB9BD\uC774 \uAC00\uB2A5\uD55C\uAC00\uC694?\",\"content\":\"\uD604\uC7A5 \uC801\uB9BD\uC744 \uD558\uC9C0 \uBABB\uD558\uC2E0 \uACBD\uC6B0, \uAD6C\uB9E4\uC77C\uB85C\uBD80\uD130 7\uC77C \uC774\uB0B4\uB85C \uC601\uC218\uC99D\uC744 \uC9C0\uCC38\uD558\uC5EC \uAD6C\uB9E4 \uB9E4\uC7A5\uC5D0 \uBC29\uBB38\uD558\uC2DC\uBA74 \uCD94\uD6C4 \uC801\uB9BD\uC744 \uBC1B\uC73C\uC2E4 \uC218 \uC788\uC2B5\uB2C8\uB2E4. <br/>(\uC608) 7\uC6D4 1\uC77C \uAD6C\uB9E4 \uC2DC 7\uC6D4 8\uC77C\uAE4C\uC9C0 \uCD94\uD6C4\uC801\uB9BD \uAC00\uB2A5\",\"enable\":\"Y\",\"regDt\":\"Aug 27, 2020 12:20:06 PM\",\"pagingStartIdx\":0,\"pagingItemCount\":0}]');
			
			pagination.requestData = pg.requestData;
			pagination.responseData = pg.responseData;
		</script>
<!-- 추가적인 스타일 및 스크립트 파일들을 여기에 추가 -->
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<!-- container s -->
<div id="container">
	<div class="sub_header">
		<div class="content">
			<a class="logo" href="#none">HOME</a>
			<!-- sub location -->
			<div class="sub_loc">
				<ul>
					<li class="active"><a href="#">FAQ</a></li>
					<li><a href="qna.do">1:1문의</a></li>
				</ul>
			</div>
			<!--// sub location -->
			<a class="top" href="#none">TOP</a>
		</div>
	</div>
	<div class="board_list_wrapper">
		<!-- sub content s -->
		<div id="content">
			<h2 class="subTitle">FAQ</h2>
			<!-- faq -->
			<div class="faq_wrapper">
				<div class="tab_menu" id="ui_category"></div>
				<div style="width: 1170px; margin: 0 auto; display: table">
					<p class="board_total">
						총<strong id="totalCnt">0</strong>건의 게시글이 있습니다.
					</p>

					<div class="cont_right">
						<div class="form_search">
							<form id="searchForm" method="GET" name="searchForm"
								onsubmit="return view.search();">
								<input name="page" type="hidden" /> <input name="category"
									type="hidden" value="0" /> <input name="subject"
									placeholder="검색어를 입력하세요" type="text" value="" /> <a
									class="btn_search" href="#"
									onclick="view.search();return false;"></a>
							</form>
						</div>
					</div>
				</div>
				<ul class="faq_contet" id="ui_faq_items">
				</ul>
				<!-- board 페이지 -->
				<div class="pagination" id="ui_pager">
					<a class="arr prev" href="#none"></a> 
					<a class="active" href="#none">1</a> 
					<a href="#none">2</a> 
					<a href="#none">3</a> 
					<a href="#none">4</a> 
					<a href="#none">5</a> 
					<a class="arr next" href="#none"></a>
				</div>
				<!--// board 페이지 -->
			</div>
			<!--// faq -->
		</div>
		<!--// sub content e -->
	</div>
	<!--// container e -->
</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>