<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원산지 정보</title>
	<link href="" rel="shortcut icon" type="image/x-icon" />
	<link href="./css/ui.common.css" rel="stylesheet" type="text/css" />
	<link href="./css/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css" />
	
	<script src="./js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="./js/jquery/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
	<script src="./js/jquery/TweenMax.min.js" type="text/javascript"></script>
	<link href="./css/ui.popup.css" rel="stylesheet" type="text/css" /><!-- 팝업 css -->
</head>
<body>
	<div id="popup_wrap">
		<h1 class="title">원산지정보</h1>
		<div class="popup_content">
			<div class="country_origin_wrapper">
				<div class="scrollwrapper">
					<ul>
						<li>
							<div class="icon">
								<img alt="쇠고기" src="./images/menu/icon_country_origin01.png" />
								<span>쇠고기</span>
							</div>
							<div class="info">
								<dl>
									<dt>미트볼</dt>
									<dd>: 호주산</dd>
									<dt>스테이크</dt>
									<dd>: 미국산</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="icon">
								<img alt="돼지고기" src="./images/menu/icon_country_origin02.png" />
								<span>돼지고기</span>
							</div>
							<div class="info">
								<dl>
									<dt>베이컨, 살라미, 페퍼로니, 풀드포크</dt>
                                    <dd>: 미국산</dd>
                                    <dt>베이컨 비츠</dt>
									<dd>: 미국산</dd>
									<dt>햄</dt>
									<dd>: 국내산과 외국산 섞음</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="icon">
								<img alt="닭고기" src="./images/menu/icon_country_origin03.png" />
								<span>닭고기</span>
							</div>
							<div class="info">
								<dl>
									<dt>치킨 스트립</dt>
									<dd>: 국내산</dd>
									<dt>치킨 브레스트</dt>
									<dd>: 국내산</dd>
									<dt>로티세리 치킨</dt>
									<dd>: 국내산과 브라질산 섞음</dd>
									<dt>치킨 브레스트 햄</dt>
									<dd>: 국내산</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="icon">
								<img alt="참치" src="./images/menu/icon_country_origin06.png" />
								<span>참치</span>
							</div>
							<div class="info">
								<dl>
									<dt>참치</dt>
									<dd>: 태국산</dd>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
        $(document).ready(function(){
            $('#popup_wrap .scrollwrapper').mCustomScrollbar();
        })
	</script>
</body>
</html>