<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<!-- 상품목록 int mncode, String mnctg, String mnname, String mnengname, String mninfo, String mnimg,
			int mnprice-->
<div class="pd_list_wrapper">
    <ul>
    	<c:forEach items="${MenuList}" var="dto" varStatus="status">
        <li data-menusubsort="${status.count}" data-menumainsort="${status.count}" class="ITEM_SANDWICH.PREMIUM">
            <div class="img"><img onError="this.src='./images/common/noneImage.jpg'"
                    src="./upload/menu/${dto.mnimg}" alt="${dto.mnname}" />${dto.mnimg}</div>
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
<%@ include file="../footer.jsp" %>