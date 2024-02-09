<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY - 1:1 문의 </title>
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
        
		<script type="text/javascript" src="./js/plugin/inputmask/jquery.inputmask.bundle.min.js?v=2023051202"></script>
		<script type="text/javascript" src="./js/waffle/waffle.fileUpload.js?v=2023051202"></script>
		<script type="text/javascript" src="./js/customer/qna.js?v=2023051202"></script>
		<script type="text/javascript">
			var groupCodeList = [{'code':12,'codeNm':'\uACE0\uAC1D\uBB38\uC758','etc':'','gcode':0,'gname':'\uACE0\uAC1D\uBB38\uC758','orderNo':3,'useFg':'Y'},{'code':20,'codeNm':'\uC571 \uAD00\uB828 \uBB38\uC758','etc':'','gcode':0,'gname':'\uC571 \uAD00\uB828 \uBB38\uC758','orderNo':8,'useFg':'Y'},{'code':17,'codeNm':'\uB9C8\uCF00\uD305 \uC81C\uD734/\uC81C\uC548','etc':'','gcode':0,'gname':'\uB9C8\uCF00\uD305 \uC81C\uD734/\uC81C\uC548','orderNo':9,'useFg':'Y'},{'code':18,'codeNm':'\uBA54\uB274','etc':'','gcode':0,'gname':'\uBA54\uB274','orderNo':10,'useFg':'Y'}];
			var codeList = [{'code':2001,'codeNm':'Fast-Sub_\uC8FC\uBB38/\uACB0\uC81C','etc':'','gcode':20,'gname':'\uC571 \uAD00\uB828 \uBB38\uC758','orderNo':1,'useFg':'Y'},{'code':1201,'codeNm':'\uCE6D\uCC2C\uD558\uAE30','etc':'','gcode':12,'gname':'\uACE0\uAC1D\uBB38\uC758','orderNo':1,'useFg':'Y'},{'code':1202,'codeNm':'\uAC1C\uC120\uD558\uAE30','etc':'','gcode':12,'gname':'\uACE0\uAC1D\uBB38\uC758','orderNo':2,'useFg':'Y'},{'code':2002,'codeNm':'Home-Sub_\uC8FC\uBB38/\uACB0\uC81C','etc':'','gcode':20,'gname':'\uC571 \uAD00\uB828 \uBB38\uC758','orderNo':2,'useFg':'Y'},{'code':2003,'codeNm':'Subcard','etc':'','gcode':20,'gname':'\uC571 \uAD00\uB828 \uBB38\uC758','orderNo':3,'useFg':'Y'},{'code':2004,'codeNm':'\uD3EC\uC778\uD2B8','etc':'','gcode':20,'gname':'\uC571 \uAD00\uB828 \uBB38\uC758','orderNo':4,'useFg':'Y'},{'code':2005,'codeNm':'e-Gift','etc':'','gcode':20,'gname':'\uC571 \uAD00\uB828 \uBB38\uC758','orderNo':5,'useFg':'Y'},{'code':2006,'codeNm':'\uAE30\uD0C0','etc':'','gcode':20,'gname':'\uC571 \uAD00\uB828 \uBB38\uC758','orderNo':6,'useFg':'Y'}];
			var regionList = [{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uAC15\uC6D0\uB3C4','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uACBD\uAE30\uB3C4','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uACBD\uC0C1\uB0A8\uB3C4','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uACBD\uC0C1\uBD81\uB3C4','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uAD11\uC8FC\uAD11\uC5ED\uC2DC','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uB300\uAD6C\uAD11\uC5ED\uC2DC','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uB300\uC804\uAD11\uC5ED\uC2DC','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uBD80\uC0B0\uAD11\uC5ED\uC2DC','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uC11C\uC6B8\uD2B9\uBCC4\uC2DC','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uC138\uC885\uD2B9\uBCC4\uC790\uCE58\uC2DC','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uC6B8\uC0B0\uAD11\uC5ED\uC2DC','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uC778\uCC9C\uAD11\uC5ED\uC2DC','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uC804\uB77C\uB0A8\uB3C4','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uC804\uB77C\uBD81\uB3C4','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uC81C\uC8FC\uD2B9\uBCC4\uC790\uCE58\uB3C4','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uCDA9\uCCAD\uB0A8\uB3C4','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null},{'areaNm':null,'baseItemLsmIdx':null,'bizopNo':null,'brncCd':null,'brncNm':null,'cartStorCd':null,'ceoMail':null,'ceoTel':null,'ceoTelDecrypt':null,'closeTm':null,'closeTmString':'','compCd':null,'deliveryFee':null,'deliveryTime':null,'detailYn':null,'distance':null,'distanceArea':null,'dong':null,'drYn':null,'dtYn':null,'dvYn':null,'etc':null,'favorYn':null,'franchiseDetail':null,'franchiseIdx':null,'franchiseNo':0,'grilledSaleYn':null,'groupOrdYn':null,'homeCloseTm':null,'homeOpenTm':null,'keyword':null,'lat':null,'lon':null,'managerId':null,'mbrIdx':null,'minPage':0,'modifier':0,'modifyDt':null,'morningEndDt':null,'morningMentYn':null,'morningStartDt':null,'morningTimeYn':null,'oneCupYn':null,'op24Yn':null,'openTm':null,'openTmString':'','openYn':null,'ordCnt':null,'ordEndTm':null,'ordStartTm':null,'ordTmYn':null,'ordType':null,'orderEndTm':null,'orderMinAmount':null,'orderStartTm':null,'page':null,'pageCount':0,'pageNo':0,'pageSize':0,'pageYn':null,'pagingItemCount':0,'pagingStartIdx':0,'payMid':null,'payOtpKey':null,'pickupTime':null,'pkYn':null,'preOrdYn':null,'regDt':null,'registerer':0,'remodelingYn':null,'rgn1Cd':null,'rgn1Nm':'\uCDA9\uCCAD\uBD81\uB3C4','rgn2Cd':null,'rgn2Nm':null,'saleYn':null,'statusDrYn':null,'storAddr1':null,'storAddr2':null,'storCd':null,'storCeo':null,'storFax':null,'storNm':null,'storNo':null,'storTel':null,'storeCheckList':null,'storeCode':null,'useFg':null,'useYn':null}];
			var member = {'accessToken':'QmVhcmVyLlYx.lyxENaY3w9207IjRXCUnLhzyupG8Hbl5lqWr9pevlUGpcxYjaPVPXgz4z+gpyHCRaIYVUmZNfjgDyfMof7RVSksxBAfIS168PO2lQ0bA6CnXkdewB2B+INDrX5aznVkmoFJhtqzOO4kg31SZR2nMWT7NEK4DuwG/X9Fic/SIkGwuNrOEJMeOWEPnFmUlPYz9Z4Sgam6XK9+sP4XXPBbAwNX8l63ZiJkhEApSvHYVLfY8iKL67TwiDANJAG+SadblWOLgX91j5ozPCeRWT198k5gOi7fezdmj/VtudwAYJamx3JUFjXhQss4gKtc6GaF6VAoR/KcYXSMOWdqIyVW7+jp10C8pdCJV6MBKOWcB7HYIAJKixhbXzlPvvd2J/wx2cQJpiI4OkQF6CY7LeJVH0cw3LiOQc100YVjaQ2OHgBoT8jyRi0hAZ/Uvnzw7aO7Il1CcY9yboK7wFgWPsgfsM0vVtAKhzSh7fLnlibUaRf9uwlIH79JwR8i/zTSdHKgU','accountNonExpired':false,'accountNonLocked':false,'authorities':[{'authority':'ROLE_USER'}],'baseAddr':'','ciVal':'ZouYqu7gKMLPsZflZSu8/lcnBkfrBwD74GRSn8CwNSRfubZ3excm5y49p77tYT3TXWBobTEZ9waSLnYJ3AcdXw==','couponCount':0,'couponList':[],'cpCarrCd':null,'cpNo':'01088487702','credentialsNonExpired':false,'diVal':'MC0GCCqGSIb3DQIJAyEAu0vyEXjo0zGbjK4bKyGOKo8cXv3QJwct5C5p5/eP56Q=','dtlAddr':'','duplicatedCpNoYn':null,'editDt':'2024-02-07T22:07:39.000+09:00','edtiKey':0,'emailOption':true,'enabled':false,'expireDate':'2024-02-09T05:26:37.000+09:00','favoriteStore':null,'gender':'Female','gndrCd':null,'lastInfoModDt':'2024-02-01T13:45:45.000+09:00','lastLgnDt':'2024-02-07T22:07:39.000+09:00','lastOrdDt':null,'mbrBrith':'Thu Sep 09 09:00:00 KST 1982','mbrGrdCd':null,'mbrGrdChDt':null,'mbrIdx':4769263,'mbrLgnId':'ssujjy@gmail.com','mbrNm':'\uAE40\uC218\uC9C4','mbrStatCd':'MEMBER_STATUS.ACTIVE','mbrStatCdDt':null,'mbrStatNm':null,'mbrTpCd':null,'memberAgrVoList':null,'modifyLog':null,'newPw':null,'oldMemberIdx':null,'password':null,'profileId':'a0e1f7724390447e86ed89559452ed13','pw':null,'pwModDt':null,'qrImgNm':null,'reJoinDate':null,'refreshToken':null,'refreshTokenExpireDate':null,'regDt':'2024-02-01T13:45:45.000+09:00','regKey':0,'smsOption':true,'subCardVo':{'cardImgUrl':'/images/common/logo_qrcode.png','cardNumber':'3106460051833294604','cardStatus':'Active','giftDollars':0.0,'giftDollarsIntVal':0,'invalidEmail':false,'registrationComplete':false,'rewardDollars':0.0,'rewardDollarsIntVal':0,'rfmSegment':'\uBCA0\uC774\uBE44'},'subPw':null,'subcardNo':'3106460051833294604','surveyCouponCount':0,'surveyCouponList':[],'useFg':'Y','username':'ssujjy@gmail.com','voucherCount':0,'voucherList':null,'zipCd':''};
	
			$(document).ready(function(){
				pd_agress_scrollbar();
			})
	
		</script>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
            <!-- container s -->
            <div class="bg_type01" id="container">
			<div style="display: none;">
				<form action="/franchiseInquiry" id="sendFrm" method="post" name="sendFrm">
					<input id="frWriter" name="writer" type="hidden" value="" />
					<input id="frContact" name="contact" type="hidden" value="" />
					<input id="frEmail" name="email" type="hidden" value="" />
					<input id="frSubject" name="subject" type="hidden" value="" />
					<textarea id="frContent" name="content"></textarea>
				</form>
			</div>
			<div class="sub_header">
				<div class="content">
					<a class="logo" href="home.do">HOME</a>
					<!-- sub location -->
					<div class="sub_loc">
						<ul>
							<li><a href="faq.do">FAQ</a></li>
							<li class="active"><a href="#">1:1문의</a></li>
						</ul>
					</div>
					<!--// sub location -->
					<a class="top" href="#none">TOP</a>
				</div>
			</div>

			<!-- sub content s -->
			<div id="content">
				<div class="inquiry_wrapper">
					<h2 class="subTitle">1:1문의</h2>

					<div class="content">
						<form id="frm" method="post" name="frm">
						<div class="pd_agree_wrapper">
							<!-- 개인정보수집 및 이용동의 -->
							<div class="pd_agree">
								<h3>개인정보수집 및 이용동의</h3>
								<!-- 20180131 -->
								<div class="scroll_wrapper">
									■ 개인정보의 수집 및 이용목적<br />
									서비스 이용에 따른 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달
									(민원처리를 위해 해당 매장 및 매장 담당 지사에 성함 및 연락처가 전달될 수 있음을
									알려드립니다.)<br /><br />

									■ 개인정보의 수집 항목<br />
									이름,이메일,연락처 및 개인정보처리방침에서 명시한 자동으로 수집되는 정보<br /><br />

									■ 개인정보의 보유 및 이용기간<br />
									원칙적으로, 개인정보 수집 및 이용목적이 달성된 후(회원 탈퇴 등)에는 귀하의 개인정보를 지체 없이 파기합니다. 단,관계법령의 규정에 의하여 보존할
									필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br />
									- 서비스이용기록, 접속로그, 접속IP정보 : 3개월 (통신비밀보호법)<br />
									- 표시/광고에 관한 기록 : 6개월 (전자상거래법등에서의 소비자보호에 관한 법률)<br />
									- 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래법등에서의 소비자보호에 관한 법률)<br />
									- 대금결제 및 재화 등의 공급에 관한 기록: 5년 (전자상거래법등에서의 소비자보호에 관한 법률)<br />
									- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래법등에서의 소비자보호에 관한 법률)<br />
								</div>
								<!--// 20180131 -->
								<!-- checkbox -->
								<label class="form_checkbox">
									<input name="agree1" type="checkbox" />
									<span class="icon"></span>개인정보수집 및 이용에 동의합니다. <em>(필수)</em>
								</label>
								<!--// checkbox -->
							</div>
							<!--// 개인정보수집 및 이용동의 -->
							<!-- 개인정보 위탁동의 -->
							<div class="pd_agree">
								<h3>개인정보 위탁동의</h3>
								<!-- 20180131 -->
								<div class="scroll_wrapper">
									회사는 서비스의 향상을 위하여 아래와 같이 외부 전문업체를 통하여 업무를 위탁하여
									운영하고 있습니다. 위탁 업무를 위해 제공되는 정보는 해당 업무를 위해 필요한 최소
									한의 정보만 제공됩니다.<br /><br />

									- 데이터 전산 처리 및 유지관리 : Wylie.Co.Ltd, IMT Soft Corporation<br />
									- 결제 처리업체 : Fiserv<br />
									- 고객 경험 관리 서비스 제공, 써브카드 프로그램 및 마케팅 관리 : 써브카드 코리아<br />
									,IPCA, Simplicity Australasia Ltd<br />
									- 고객센터 운영 : 씨엔티테크 ㈜<br /><br />

									회사는 고객님의 개인정보를 중요시하며, “정보통신망 이용촉진 및 정보보호＂에 관한
									법률을 준수하고 있습니다.<br />
								</div>
								<!--// 20180131 -->
								<!-- checkbox -->
								<label class="form_checkbox">
									<input name="agree2" type="checkbox" />
									<span class="icon"></span>개인정보 위탁에 동의합니다. <em>(필수)</em>
								</label>
								<!--// checkbox -->
							</div>
							<!--// 개인정보 위탁동의 -->
						</div>

						<h3 class="h_title">문의 작성하기</h3>

						<!-- board list s -->
						<div class="board_write_wrapper">
							<p class="rt_note">필수입력사항<span class="ess"></span></p>
							<table>
								<caption>문의 작성하기 테이블</caption>
								<colgroup>
									<col width="130px" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="col">이름<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<!-- #210416 이름, 연락처, 이메일 readonly 추가 요청 -->
												<input id="qaWriter" maxlength="10" name="writer" placeholder="이름을 입력해주세요" type="text" readonly="readonly" value="김수진" />
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col">연락처<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<!-- #210416 이름, 연락처, 이메일 readonly 추가 요청 -->
												<input id="qaContact" maxlength="15" name="contact" onkeyup="subwayCommon.inputOnlyDigit(this);" placeholder="연락 가능한 전화번호를 입력해주세요" type="text" readonly="readonly" value="01088487702" />
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col">이메일<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:200px">
												<input id="qaEmail1" maxlength="50" name="email1" onkeyup="subwayCommon.inputEmail(this);" placeholder="이메일" type="text" readonly="readonly" />
											</span>
											<span class="em">@</span>
											<span class="form_text" style="width:200px">
												<!--<input type="text" name="email2" id="qaEmail2" maxlength="50" onkeypress="view.onchangeEmailDomail(); return true;" onkeyup="subwayCommon.inputEmail(this);"/>-->
												<input id="qaEmail2" maxlength="50" name="email2" type="text" readonly="readonly" />
											</span>
											<div class="form_select" style="width:196px; margin-left:7px;">
                                                <!-- #210416 이름, 연락처, 이메일 readonly 추가 요청 -->
                                                <select id="emailDomain" name="dmain" onchange="view.domain();" readonly="readonly">
													<option value="">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="nate.com">nate.com</option>
													<option value="empas.com">empas.com</option>
													<option value="dreamwiz.com">dreamwiz.com</option>
													<option value="lycos.co.kr">lycos.co.kr</option>
													<option value="korea.com">korea.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="hanmir.com">hanmir.com</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="col">카테고리<span class="ess"></span></th>
										<td>
											<div class="form_select" style="width:170px;">
												<select name="category1">
													<option value="">1차분류</option>
												</select>
											</div>
											<div class="form_select" id="ui_div_category" style="width:200px;">
												<select name="category2">
													<option value="">2차분류</option>
												</select>
											</div>
										</td>
									</tr>
									<tr id="uiRegion" style="display:none">
										<th scope="col">지역/매장<span class="ess"></span></th>
										<td>
											<div class="form_select" id="ui_sido" style="width:196px;">
												<select name="region1">
													<option value="">시/도</option>
													<option value="강원도">강원도</option>
													<option value="경기도">경기도</option>
													<option value="경상남도">경상남도</option>
													<option value="경상북도">경상북도</option>
													<option value="광주광역시">광주광역시</option>
													<option value="대구광역시">대구광역시</option>
													<option value="대전광역시">대전광역시</option>
													<option value="부산광역시">부산광역시</option>
													<option value="서울특별시">서울특별시</option>
													<option value="세종특별자치시">세종특별자치시</option>
													<option value="울산광역시">울산광역시</option>
													<option value="인천광역시">인천광역시</option>
													<option value="전라남도">전라남도</option>
													<option value="전라북도">전라북도</option>
													<option value="제주특별자치도">제주특별자치도</option>
													<option value="충청남도">충청남도</option>
													<option value="충청북도">충청북도</option>
												</select>
											</div>
											<!--
											<div class="form_select" style="width:196px;"  id="ui_gugun">
												<select name="region2">
													<option value="">시/군/구</option>
												</select>
											</div>
											<div class="form_select" style="width:196px;" id="ui_dong">
												<select name="region3">
													<option value="">동</option>
												</select>
											</div>
											-->
											<div class="form_select" id="ui_shop" style="width:196px;">
												<select name="region4">
													<option value="">매장명</option>
												</select>
											</div>
										</td>
									</tr>
									<tr id="uiCalendar" style="display:none;">
										<th scope="col">방문일<span class="ess"></span></th>
										<td>
											<div class="date_calendar">
                                                <input class="datepicker" id="visitDate" maxlength="10" name="visitDate" type="text" />
											</div>
										</td>
									</tr>
									<tr>
										<th scope="col">제목<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input id="qaSubject" maxlength="50" name="subject" placeholder="제목을 입력해주세요" type="text" />
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col">내용<span class="ess"></span></th>
										<td>
											<span class="form_textarea" style="width:100%">
												<textarea cols="5" id="qaContent" name="content" placeholder="&#183; 욕설, 비속어, 비방성 등 부적절한 단어가 포함되어 있는 경우, 답변 진행이 어려울 수 있습니다 &#13;&#10;&#183; 문의가 집중되거나 주말의 경우 답변이 지연될 수 있습니다. 최대한 빠르게 답변 드리도록 하겠습니다" rows="10" style="height:230px;"></textarea>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col">첨부파일</th>
										<td>
											<label class="form_file" style="width:466px;">
												<input data-maxsize="5" data-maxupload="1" id="file" name="file" onchange="formFile(this); return false;" type="file" />
												<input readonly="readonly" type="text" />
											</label>

											<span class="file_note">※ 등록 가능 확장자 : pdf,docx,pptx,xlsx,jpg,jpeg,gif,png / 최대 5MB</span>
										</td>
									</tr>
								</tbody>
							</table>

							<div class="agree_info type01">
								<p>답변회신 여부</p>
								<div class="cont_flex">
									<p class="cont_left"><span style="font-size: 13px;color: #999999;"> - 답변 필요 선택 시, 신청·문의사항에 대한 답변은 메일로 발송됩니다. </span></p>
									<!-- radio -->
									<div class="cont_right">
										<label class="form_circle" for="r2">
											<input id="r2" name="agree3" type="radio" value="Y" />
											<span class="icon"></span>
											<em> 답변 필요
											</em>
										</label>
										<label class="form_circle" for="r1">
											<input id="r1" name="agree3" type="radio" value="N" />
											<span class="icon"></span>
											<em> 답변 불필요
											</em>
										</label>
									</div>
									<!--// radio -->
								</div>
							</div>
						</div>

						<div class="btns_wrapper">
							<a class="btn bgc_white" href="#" onclick="view.cancel();return false;" style="width:126px;"><span>취소</span></a>
							<a class="btn bgc_point i_reg" href="#" onclick="view.save();return false;" style="width:170px;"><span>등록하기</span></a>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!--// sub content e -->
		</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>