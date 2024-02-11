<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장찾기</title>
    <link href="http://subway.co.kr/" rel="canonical" /><!-- 20180221 -->
    <meta content="신선하고 건강한 글로벌 NO.1 샌드위치 브랜드, 써브웨이" name="description" /><!-- 20181212 -->
    <link rel="shortcut icon" type="image/x-icon" href="./images/common/subway_favicon.ico?v=2023051202" />
        <!-- 20180131 -->
        <link rel="stylesheet" type="text/css" href="./css/ui.common.css?v=2023051202" />
        <link rel="stylesheet" type="text/css" href="./css/jquery.mCustomScrollbar.min.css?v=2023051202" />
	<link rel="stylesheet" type="text/css" href="./css/ui.subway.css?v=2023051202" />
        
        

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


	<script type="text/javascript" src="./js/jquery/jquery.tmpl.min.js?v=2023051202"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bva5oks3qe&amp;submodules=geocoder"></script>
	<script type="text/javascript" src="./js/subway.map.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/subway.pagination.js?v=2023051202"></script>
	<script type="text/javascript" src="./js/subway/storeSearch.js?v=2023051202"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			searchStore_scrollbar();//매장찾기 검색결과 scrollbar
		});
	</script>
	<script id="franchiseList" type="text/x-jQuery-tmpl">
	{{each franchiseInfoList}}
		<li onclick="shopMap.showStoreInfoLayer('${franchiseNo}', '${storNm}', '${storAddr1}', '${storAddr2}', '${storTel}', '${openTm}', '${closeTm}', '${lat}', '${lon}', '${etc}'); return false;">
			<!--<em class="num">${pageNo - $index}</em>-->
			<strong>${storNm}</strong>
			<div class="info">
				{{if storAddr2 == null}}<span>${storAddr1}</span>{{/if}}
				{{if storAddr2 != null}}<span>${storAddr1}&nbsp;${storAddr2}</span>{{/if}}
				{{if storTel != null && storTel != ""}}<span>연락처 : ${storTel.phoneFomatter('-')}</span>{{/if}}
				{{if openTm != null && closeTm != null && openTm != "" && closeTm != ""}}<span>영업시간 : ${openTm.timeFormat()} - ${closeTm.timeFormat()}</span>{{/if}}
				{{if etc != null && etc != ""}}<span> (${etc})</span>{{/if}}
			</div>
			<div class="service">
				{{if oneCupYn == "Y"}}<span>컵 보증금</span>{{/if}}
				{{if op24Yn == "Y"}}<span>24시간</span>{{/if}}
				{{if preOrdYn == "Y"}}<span>APP-패스트썹</span>{{/if}}
				{{if dvYn == "Y"}}<span>APP-홈썹</span>{{/if}}
				{{if pkYn == "Y"}}<span>주차가능</span>{{/if}}
				{{if drYn == "Y"}}<span>배달가능</span>{{/if}}
				{{if morningMentYn == "Y"}}<span>아침메뉴</span>{{/if}}
				{{if dtYn == "Y"}}<span>Drive Thru</span>{{/if}}
				{{if groupOrdYn == "Y"}}<span>단체주문</span>{{/if}}
				{{if openYn == "Y" && (remodelingYn == "N" || remodelingYn == null)}}
					{{if grilledSaleYn == "Y"}}<span>그릴드랩</span>{{else}}<span>시그니처랩</span>{{/if}}
				{{/if}}
			</div>
		</li>
	{{/each}}
	</script>
	<script type="text/javascript">
	/*<![CDATA[*/
		var newFranchise = [{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'305','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':632,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.5348461','lon':'126.9949108','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'Coming Soon','openTmString':'Co:on','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'','payOtpKey':'','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'N','rgn1Cd':null,'rgn1Nm':'\uC11C\uC6B8\uD2B9\uBCC4\uC2DC','rgn2Cd':null,'rgn2Nm':'\uC6A9\uC0B0\uAD6C','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73515','storCeo':null,'storFax':null,'storNm':'\uC774\uD0DC\uC6D0\uC5ED','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'448','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':630,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'35.1873043','lon':'129.0816474','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'Coming Soon','openTmString':'Co:on','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'','payOtpKey':'','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'N','rgn1Cd':null,'rgn1Nm':'\uBD80\uC0B0\uAD11\uC5ED\uC2DC','rgn2Cd':null,'rgn2Nm':'\uC5F0\uC81C\uAD6C','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'71984','storCeo':null,'storFax':null,'storNm':'\uBD80\uC0B0\uC5F0\uC0B0','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'490','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':631,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.7519512','lon':'127.0697270','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'Coming Soon','openTmString':'Co:on','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'','payOtpKey':'','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'N','rgn1Cd':null,'rgn1Nm':'\uACBD\uAE30\uB3C4','rgn2Cd':null,'rgn2Nm':'\uC758\uC815\uBD80\uC2DC','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73436','storCeo':null,'storFax':null,'storNm':'\uC758\uC815\uBD80\uAE08\uC624','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'423','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':627,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'35.2114004','lon':'128.1118851','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-31','openTmString':'20:31','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw73113','payOtpKey':'ZvtzlzVbThx7EEb6xAS4GjszGgtanjDU','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'N','rgn1Cd':null,'rgn1Nm':'\uACBD\uC0C1\uB0A8\uB3C4','rgn2Cd':null,'rgn2Nm':'\uC9C4\uC8FC\uC2DC','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73113','storCeo':null,'storFax':null,'storNm':'\uC9C4\uC8FC\uCD08\uC804','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'311','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'\uD751\uC11D\uB3D9','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':85,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.5070302','lon':'126.9584326','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-29','openTmString':'20:29','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw52048','payOtpKey':'N1yMLRLyBvtjKx8MPIm3MB5VwZnFiap2','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'Y','rgn1Cd':null,'rgn1Nm':'\uC11C\uC6B8\uD2B9\uBCC4\uC2DC','rgn2Cd':null,'rgn2Nm':'\uB3D9\uC791\uAD6C','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'52048','storCeo':null,'storFax':null,'storNm':'\uC911\uC559\uB300','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'490','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':626,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.7561818','lon':'128.8979912','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-23','openTmString':'20:23','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw72445','payOtpKey':'ZomKcBLxQASaOi4R2DdXGyWatVc2RhDx','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'N','rgn1Cd':null,'rgn1Nm':'\uAC15\uC6D0\uB3C4','rgn2Cd':null,'rgn2Nm':'\uAC15\uB989\uC2DC','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'72445','storCeo':null,'storFax':null,'storNm':'\uAC15\uB989\uC911\uC559\uB85C','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'311','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'\uC5ED\uC0BC1\uB3D9','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':101,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.4916842','lon':'127.0314711','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-21','openTmString':'20:21','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw64444','payOtpKey':'MnFiiiVF4Bw9g2WQSVywppbGMRBb6lE4','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'Y','rgn1Cd':null,'rgn1Nm':'\uC11C\uC6B8\uD2B9\uBCC4\uC2DC','rgn2Cd':null,'rgn2Nm':'\uAC15\uB0A8\uAD6C','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'64444','storCeo':null,'storFax':null,'storNm':'\uAC15\uB0A8\uC6B0\uC131','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'403','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':629,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'36.8256446','lon':'127.1370221','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-20','openTmString':'20:20','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw73486','payOtpKey':'hgamzzL0JiHaJZq76HlsdOitei2IO5Rt','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'N','rgn1Cd':null,'rgn1Nm':'\uCDA9\uCCAD\uB0A8\uB3C4','rgn2Cd':null,'rgn2Nm':'\uCC9C\uC548\uC2DC \uC11C\uBD81\uAD6C','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73486','storCeo':null,'storFax':null,'storNm':'\uCC9C\uC548\uC131\uC815','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'311','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':628,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.4956052','lon':'126.8435870','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-20','openTmString':'20:20','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw73437','payOtpKey':'emkZTfZLHu7BpT58YiEklZp0VShFVaWg','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uC11C\uC6B8\uD2B9\uBCC4\uC2DC','rgn2Cd':null,'rgn2Nm':'\uAD6C\uB85C\uAD6C','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73437','storCeo':null,'storFax':null,'storNm':'\uC624\uB958\uB3D9\uC5ED','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'311','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'\uC2E0\uC815\uB3D9','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':102,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.5174204','lon':'126.8653309','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-19','openTmString':'20:19','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw660600','payOtpKey':'8ddsOAM5cU4pqgVbUOQGAYV3i88aJyRH','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'Y','rgn1Cd':null,'rgn1Nm':'\uC11C\uC6B8\uD2B9\uBCC4\uC2DC','rgn2Cd':null,'rgn2Nm':'\uC591\uCC9C\uAD6C','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'66060','storCeo':null,'storFax':null,'storNm':'\uC591\uCC9C\uAD6C\uCCAD','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'473','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':625,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'36.1175931','lon':'128.1819973','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-17','openTmString':'20:17','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw73444','payOtpKey':'H2PyMwmGZYr3ElwJrDpgp9zYsTgFo4O0','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'N','rgn1Cd':null,'rgn1Nm':'\uACBD\uC0C1\uBD81\uB3C4','rgn2Cd':null,'rgn2Nm':'\uAE40\uCC9C\uC2DC','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73344','storCeo':null,'storFax':null,'storNm':'\uAE40\uCC9C\uD601\uC2E0','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'311','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':623,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.4930833','lon':'127.1471218','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-15','openTmString':'20:15','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw73370','payOtpKey':'pNKnGkwD31aWjhXXasRTSt8u3FVcnkSc','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uC11C\uC6B8\uD2B9\uBCC4\uC2DC','rgn2Cd':null,'rgn2Nm':'\uC1A1\uD30C\uAD6C','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73370','storCeo':null,'storFax':null,'storNm':'\uAC70\uC5EC\uC5ED','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'490','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':624,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.6314300','lon':'127.1177975','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-12','openTmString':'20:12','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw73105','payOtpKey':'clFf08y1DPsmGCp5MjO33E0CaabaUGNR','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'N','rgn1Cd':null,'rgn1Nm':'\uACBD\uAE30\uB3C4','rgn2Cd':null,'rgn2Nm':'\uAD6C\uB9AC\uC2DC','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73105','storCeo':null,'storFax':null,'storNm':'\uAD6C\uB9AC\uAC08\uB9E4','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'383','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':622,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'37.4331108','lon':'127.1293577','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-09','openTmString':'20:09','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw73136','payOtpKey':'aDOpFeqExNhmdzk5uZb6Smmna8GLfqF4','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uACBD\uAE30\uB3C4','rgn2Cd':null,'rgn2Nm':'\uC131\uB0A8\uC2DC \uC911\uC6D0\uAD6C','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73136','storCeo':null,'storFax':null,'storNm':'\uC131\uB0A8\uBAA8\uB780\uC5ED','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':'473','brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':'','drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':621,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':'36.4154482','lon':'128.1587117','managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':'2024-01-08','openTmString':'20:08','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':'sbw73228','payOtpKey':'tGnovrPea3LGJ3qo1ZBYCMctHOd8Yovu','pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':'N','rgn1Cd':null,'rgn1Nm':'\uACBD\uC0C1\uBD81\uB3C4','rgn2Cd':null,'rgn2Nm':'\uC0C1\uC8FC\uC2DC','saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':'73228','storCeo':null,'storFax':null,'storNm':'\uC0C1\uC8FC\uC911\uC559','storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null}];
		$(document).ready(function(){
			if (newFranchise != "") {
				var index = 0;
				var html="";

				$.each(newFranchise, function(idx, rs){
					if (index == 0) {
						if (idx > 0) {
							html +="</ul></li>";
						}
						html +="<li><ul class='store_list'>";
					}

					html +="<li>";
					html +="	<div class='region'>"+ (rs.rgn1Nm == null ? '' : rs.rgn1Nm)
							+"<strong>"+ rs.storNm +"</strong></div>";

                    if (rs.openTm == "Coming Soon") {
                        if(rs.remodelingYn == "Y"){
                            html +="	<div class='state coming'>Coming Soon (Remodeling)</div>";
                        }else{
                            html +="	<div class='state coming'>Coming Soon</div>";
                        }
                    } else {
                        if(rs.remodelingYn == "Y"){
                            html +="	<div class='state open'>Remodeling <strong>"+ rs.openTm + "</strong></div>";
                        }else{
                            html +="	<div class='state open'>OPEN <strong>"+ rs.openTm +"</strong></div>";
                        }
                    }

					html +="</li>";

					index++;
					if (index >= 8) {
						index = 0;
					}
				});

				html +="</ul></li>";

				$("#ui_new_franchise_list").html(html);
				newStore_slider()//신규매장안내 슬라이더
			} else {
				$(".new_store_content").hide();
			}
		});
	/*]]>*/
	</script>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
            <!-- container s -->
            <div id="container">
			<div class="sub_header">
				<div class="content">
					<a class="logo" href="home.do">HOME</a>
					<!-- sub location -->
					<div class="sub_loc">
						<ul>
	                        <li><a href="history.do">써브웨이 역사</a></li>
	                        <li class="active"><a href="#">매장찾기</a></li>
						</ul>
					</div>
					<!--// sub location -->
					<a class="top" href="#none">TOP</a>
				</div>
			</div>

			<!-- sub content s -->
			<div id="content">
				<!-- 매장찾기 s -->
				<div class="store_search_wrapper">
					<!-- 매장찾기 레이어 s -->
					<div class="store_search_layer">
						<h2>매장찾기</h2>
						<!-- 검색 -->
						<div class="form_search">
							<form id="mapFrm" method="POST" name="mapFrm" onsubmit="return shopMap.search()">
								<input id="keyword" maxlength="30" placeholder="지역 또는 매장명 입력" type="text" value="" />
								<a class="btn_search" href="#" onclick="shopMap.search();return false;"></a>
							</form>
						</div>
						<!--// 검색 -->
						<ul class="search_noti">
							<!--<li>* 운영시간은 매장 상황에 따라 상이할 수 있습니다.<br>관련 문의는 해당 매장에 문의하시기 바랍니다.</li>-->
							<li>* 운영시간은 매장 사정에 따라 변경될 수 있습니다.</li>
						</ul>

						<!-- 검색결과 -->
						<div class="search_result_cont" id="uiReslutCont" style="display:none;">
							<p class="search_total">검색 결과 <strong id="uiResultCount">0</strong>건</p>

							<div class="store_list_scroll">
								<ul id="uiResultList">
								</ul>
							</div>

							<!-- board 페이지 -->
							<div class="pagination" id="ui_pager"></div>
							<!--// board 페이지 -->
						</div>
						<!--// 검색결과 -->
					</div>
					<!--// 매장찾기 레이어 e -->

					<!-- 매장지도 s -->
					<div class="store_map">

						<!-- 임시 이미지 적용 -->
						<div id="uiShopMap" style="background:url(./images/temp/temp_store.jpg) 50% 0 no-repeat; height:700px;"></div>
						<!--// 임시 이미지 적용 -->
					</div>
					<!--// 매장지도 e -->
				</div>
				<!-- 매장찾기 e -->

				<!-- 신규매장안내 s -->
				<div class="new_store_content">
					<div class="content">
						<h3 class="h_title">신규매장안내</h3>
						<div class="new_store_slider_wrapper">
							<div class="new_store_slider_cont">
								<ul class="new_store_slider" id="ui_new_franchise_list">

							    </ul>
						  </div>
					  </div>
					</div>
				</div>
				<!--// 신규매장안내 e -->

				<!-- 전체매장 s -->
				<div class="all_store_content" id="storeList">
					<div class="content">
						<h3 class="h_title">전체매장</h3>
						<!-- board list s -->
						<div class="board_list_wrapper">
							<div class="content">
								<p class="board_total">총<strong id="pageCount">584</strong>개 매장이 있습니다.</p>

								<form id="searchFrm" method="GET" name="searchFrm">
									<input id="page" name="page" type="hidden" value="1" />
									<div class="cont_right">
										<!-- select -->
										<div class="form_select" style="width:196px;">
											<select id="rgn1Nm" name="rgn1Nm">
												<option value="">시/도</option>
												<option value="서울특별시">서울특별시</option>
												<option value="경기도">경기도</option>
												<option value="인천광역시">인천광역시</option>
												<option value="대전광역시">대전광역시</option>
												<option value="세종특별자치시">세종특별자치시</option>
												<option value="충청남도">충청남도</option>
												<option value="경상남도">경상남도</option>
												<option value="울산광역시">울산광역시</option>
												<option value="부산광역시">부산광역시</option>
												<option value="대구광역시">대구광역시</option>
												<option value="제주특별자치도">제주특별자치도</option>
												<option value="전라북도">전라북도</option>
												<option value="충청북도">충청북도</option>
												<option value="광주광역시">광주광역시</option>
												<option value="전라남도">전라남도</option>
												<option value="경상북도">경상북도</option>
												<option value="강원도">강원도</option>
											</select>
										</div>
										<!--// select -->
										<!-- select -->
										<div class="form_select" style="width:196px;">
											<select id="rgn2Nm" name="rgn2Nm">
												<option value="">시/군/구</option>
												
											</select>
										</div>
								</form>

								<table>
									<caption>전체매장 목록 테이블</caption>
									<colgroup>
										<col width="100px" />
										<col width="185px" />
										<col width="*" />
										<col width="250px" /><!-- 20180208 -->
										<col width="170px" />
										<col width="55px" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">NO</th>
											<th scope="col">매장명</th>
											<th scope="col">매장주소</th>
											<th scope="col">주요서비스</th>
											<th scope="col">연락처</th>
											<th class="hide" scope="col">자세히보기</th>
										</tr>
									</thead>
									<tbody>
										
										<tr>
											<td><div class="num">584</div></td>
											<td><a href="/storeDetail?franchiseNo=632">이태원역</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=632">서울특별시 용산구 이태원로 189 </a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span class="on">24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
													<td><div class="coming">Coming Soon</div></td>
												
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=632"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
										<tr>
											<td><div class="num">583</div></td>
											<td><a href="/storeDetail?franchiseNo=631">의정부금오</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=631">경기도 의정부시 청사로 41 #106</a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
													<td><div class="coming">Coming Soon</div></td>
												
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=631"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
										<tr>
											<td><div class="num">582</div></td>
											<td><a href="/storeDetail?franchiseNo=630">부산연산</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=630">부산광역시 연제구 중앙대로 1116, 1층(연산동) </a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
													<td><div class="coming">Coming Soon</div></td>
												
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=630"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
										<tr>
											<td><div class="num">581</div></td>
											<td><a href="/storeDetail?franchiseNo=629">천안성정</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=629">충청남도 천안시 서북구 쌍용대로 317 </a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
												
													<td><div class="tel">041-587-2345</div></td>
													
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=629"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
										<tr>
											<td><div class="num">580</div></td>
											<td><a href="/storeDetail?franchiseNo=628">오류동역</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=628">서울 구로구 경인로20길 4 </a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
												
													<td><div class="tel">02-6368-3535</div></td>
													
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=628"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
										<tr>
											<td><div class="num">579</div></td>
											<td><a href="/storeDetail?franchiseNo=627">진주초전</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=627">경상남도 진주시 초전북로51번길 34 </a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
												
													<td><div class="tel">055-761-1951</div></td>
													
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=627"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
										<tr>
											<td><div class="num">578</div></td>
											<td><a href="/storeDetail?franchiseNo=626">강릉중앙로</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=626">강원도 강릉시 경강로 2117 </a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
												
													<td><div class="tel">033-646-1146</div></td>
													
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=626"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
										<tr>
											<td><div class="num">577</div></td>
											<td><a href="/storeDetail?franchiseNo=625">김천혁신</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=625">경상북도 김천시 혁신3로 16 </a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
												
													<td><div class="tel">054-437-1687</div></td>
													
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=625"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
										<tr>
											<td><div class="num">576</div></td>
											<td><a href="/storeDetail?franchiseNo=624">구리갈매</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=624">경기도 구리시 갈매중앙로 80 </a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
												
													<td><div class="tel">031-528-1105</div></td>
													
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=624"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
										<tr>
											<td><div class="num">575</div></td>
											<td><a href="/storeDetail?franchiseNo=623">거여역</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=623">서울특별시 송파구 오금로 525 </a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;" class="on">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
												
													<td><div class="tel">02-408-3031</div></td>
													
												
											

											<td><a target="_blank" href="/storeDetail?franchiseNo=623"><img alt="자세히보기" src="./images/common/icon_detail_view.png" /></a></td><!-- 20180307 -->

										</tr>
									</tbody>
								</table>
							</div>

							<!-- board 페이지 -->
							<div>
								<div class="pagination">
										
										
										<a class="arr prev" href="javascript:void(0);"></a>
							
										
											<a class="active" href="#">1</a>
										
							
										
											<a href="#" onclick="paging.page(2);return false;">2</a>
										
							
										
											<a href="#" onclick="paging.page(3);return false;">3</a>
										
							
										
											<a href="#" onclick="paging.page(4);return false;">4</a>
										
							
										
											<a href="#" onclick="paging.page(5);return false;">5</a>
										
							
										
											<a href="#" onclick="paging.page(6);return false;">6</a>
										
							
										
											<a href="#" onclick="paging.page(7);return false;">7</a>
										
							
										
											<a href="#" onclick="paging.page(8);return false;">8</a>
										
							
										
											<a href="#" onclick="paging.page(9);return false;">9</a>
										
							
										
											<a href="#" onclick="paging.page(10);return false;">10</a>
										
							
										
										
										<a class="arr next" href="javascript:void(0);" onclick="paging.next(59);return false;"></a>
										
								</div>
							</div>
							<!--// board 페이지 -->
						</div>
						<!-- board list e -->
					</div>
				</div>
				<!--// 전체매장 e -->
			</div>
			<!--// sub content e -->
		</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>