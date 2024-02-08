<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
<link rel="stylesheet" type="text/css" href="/css/ui.common.css?v=2023051202" />
<link rel="stylesheet" type="text/css" href="/css/ui.main.css?v=2023051202" />
<link rel="stylesheet" type="text/css" href="/css/ui.menu.css?v=2023051202" />
<link rel="stylesheet" type="text/css" href="/css/ui.order.css?v=2023051202" />
<link rel="stylesheet" type="text/css" href="/css/jquery.mCustomScrollbar.min.css?v=2023051202" />

    <script type="text/javascript" src="/js/jquery/jquery-1.12.4.min.js?v=2023051202"></script>
    <script type="text/javascript" src="/js/jquery/jquery-ui-1.12.0.min.js?v=2023051202"></script>
    <script type="text/javascript" src="/js/jquery/jquery.easing.1.3.min.js?v=2023051202"></script>
    <script type="text/javascript" src="/js/jquery/jquery.bxslider.min.js?v=2023051202"></script>
    <script type="text/javascript" src="/js/jquery/jquery.mCustomScrollbar.concat.min.js?v=2023051202"></script>
    <!-- block ui -->
    <script type="text/javascript" src="/js/jquery/jquery.blockUI.min.js?v=2023051202"></script>

    <script type="text/javascript" src="/js/jquery/TweenMax.min.js?v=2023051202"></script>
    <script type="text/javascript" src="/js/jquery/jquery.cookie.js?v=2023051202"></script>
    <!--<script type="text/javascript" th:src="'/js/lottie.js?v=' + ${cacheParam}"></script>-->
    <script type="text/javascript" src="/js/ui.common.js?v=2023051202"></script>
    <script type="text/javascript" src="/js/subway.common.js?v=2023051202"></script>
    <script type="text/javascript" src="/js/util/jsrender.js?v=2023051202"></script>
    <script type="text/javascript" src="/js/jquery/jquery.tmpl.min.js?v=2023051202"></script>
	<script type="text/javascript" src="/js/waffle/waffle.utils.js?v=2023051202"></script>
	<script>
		var view = {
			noticeView : function(frm) {
				var idx = $(frm).attr("data-idx");
				var query = "page=1&subject="
				location.href = "/newsView?noticeIdx=" + idx + "&query="
						+ encodeURIComponent(query);
			}
		}
		$(document).ready(function() {
			mainScript();
		});
		/* 2018.01.30 공지사항 슬라이드 배너 스크립트 추가 */
		$(function() {
			$(".bxslider").bxSlider();
		});
	</script>
<!-- 추가적인 스타일 및 스크립트 파일들을 여기에 추가 -->
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<!-- 상품목록 int mncode, String mnctg, String mnname, String mnengname, String mninfo, String mnimg,
			int mnprice-->
<div class="pd_list_wrapper">
    <ul>
    	<c:forEach items="${MenuList}" var="dto" varStatus="status">
        <li data-menusubsort="${status.count}" data-menumainsort="${status.count}" class="ITEM_SANDWICH.PREMIUM">
            <div class="img"><img onError="this.src='/images/common/noneImage.jpg'"
                    src="/upload/menu/${dto.mnimg}" alt="${dto.mnname}" />${dto.mnimg}</div>
            <strong class="tit">${dto.mnname}</strong>
            <span class="eng">${dto.mnengname}</span>
            <span class="cal">${dto.mnprice}</span>
            <div class="summary">
                <p>
                ${dto.mninfo}
                </p>
            </div>
            <a href="#" onclick="menuDetail(this); return false;" data-category="sandwich" data-menuitemidx="${dto.mncode}"
                class="btn_view"></a>
        </li>
        </c:forEach>
    </ul>
</div>
<!--// 상품목록 -->
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>