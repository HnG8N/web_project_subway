<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
<link rel="stylesheet" type="text/css" href="./css/ui.common.css?v=2023051202" />
<link rel="stylesheet" type="text/css" href="./css/ui.main.css?v=2023051202" />
<link rel="stylesheet" type="text/css" href="./css/ui.menu.css?v=2023051202" />
<link rel="stylesheet" type="text/css" href="./css/ui.order.css?v=2023051202" />
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
<article>
    <!-- 본문 내용 추가 -->
<!-- container s -->
<div class="main_wrapper" id="container">
	<!-- main top event -->
	<div class="main_tap_event_wrapper">
		<ul>
			<li>
				<div class="wrap">
					
						<a href="/eventView?eventIdx=243">
							<div class="img"><img alt="SUBPICK" src="./jsp/upload/banner/썹픽_PC 메인 배너_20240205093541800.jpg" /></div>
						</a>
					
					
				</div>
			</li>
			<li>
				<div class="wrap">
					
						<a href="/eventView?eventIdx=241">
							<div class="img"><img alt="써브웨이 오늘의 수프" src="./jsp/upload/banner/오늘의수프_PC 메인 배너_20231204091713189.jpg" /></div>
						</a>
					
					
				</div>
			</li>
			<li>
				<div class="wrap">
					
						<a href="/eventView?eventIdx=180">
							<div class="img"><img alt="02.내손안의 작은 써브웨이" src="./jsp/upload/banner/main_PC_1920x440_20201006040046969.jpg" /></div>
						</a>
					
					
				</div>
			</li>
		</ul>

		<!-- quick link -->
		<div class="quick_link">
			<div class="quick_link_content">
				<div class="store">
					<a href="storeSearch.do">
						<strong>매장찾기</strong>
					</a>
				</div>
				<div class="franchise">
					<a href="#"><strong>가맹신청ㆍ문의</strong></a>
				</div>
			</div>
		</div>
		<!--// quick link -->
	</div>
	<!--// main top event -->

	<!-- section subway menu s -->
	<div class="section_subway_menu">
		<div class="hd">
			<h2>Subway's Menu</h2>

			<div class="tab">
				<ul>
					<li class="active"><a href="#sandwich_cl">클래식</a></li>
					<li><a href="#sandwich_fl">프레쉬&amp;라이트</a></li>
					<li><a href="#sandwich_pm">프리미엄</a></li>
					<li><a href="#sandwich_bf">아침메뉴</a></li>
				</ul>
			</div>
		</div>

		<div class="subway_menu_slider_wrapper">
			<!-- 클래식 -->
			<div class="subway_menu_slider active" id="sandwich_cl" style="left:0">
				<div>
					<ul>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1291">
								<div class="wrap">
									<div class="img"><img alt="에그마요" src="./images/menu/sandwich_cl06_01.jpg" /></div>
									<strong class="title">에그마요</strong>
									<p>부드러운 달걀과 고소한 마요네즈가 만나<br />더 부드러운 스테디셀러</p>
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1290">
								<div class="wrap">
									<div class="img"><img alt="이탈리안 비엠티" src="./images/menu/sandwich_cl01_01.jpg" /></div>
									<strong class="title">이탈리안 비엠티</strong>
									<p>페퍼로니, 살라미 그리고 햄이 만들어내는 최상의 조화! 전세계가 사랑하는 써브웨이의 베스트셀러! Biggest Meatiest Tastiest, its’ B.M.T!</p>
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1289">
								<div class="wrap">
									<div class="img"><img alt="비엘티" src="./images/menu/sandwich_cl02_01.jpg" /></div>
									<strong class="title">비엘티</strong>
									<p>오리지널 아메리칸 스타일 베이컨의<br />풍미와 바삭함 그대로</p>
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1287">
								<div class="wrap">
									<div class="img"><img alt="햄" src="./images/menu/sandwich_cl04_01.jpg" /></div>
									<strong class="title">햄</strong>
									<p>기본 중에 기본!<br />풍부한 햄이 만들어내는<br />입 안 가득 넘치는 맛의 향연</p><!-- 20180207 -->
								</div>
							</a>
						</li>
					</ul>
					<ul>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1286">
								<div class="wrap">
									<div class="img"><img alt="참치" src="./images/menu/sandwich_cl05_01.jpg" /></div>
									<strong class="title">참치</strong>
									<p>남녀노소 누구나 좋아하는<br />담백한 참치와 고소한 마요네즈의<br />완벽한 조화</p><!-- 20180207 -->
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!--// 클래식 -->
			<!-- 프레쉬&amp;라이트 -->
			<div class="subway_menu_slider" id="sandwich_fl">
				<div>
					<ul>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1406">
								<div class="wrap">
									<div class="img"><img alt="로티세리 바비큐 치킨" src="./images/menu/sandwich_fl01_01.jpg" /></div>
									<strong class="title">로티세리 바비큐 치킨</strong>
									<p>촉촉한 바비큐 치킨의 풍미가득.<br />손으로 찢어 더욱 부드러운 치킨의 혁명</p><!-- 20180207 -->
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1401">
								<div class="wrap">
									<div class="img"><img alt="로스트 치킨" src="./images/menu/sandwich_fl02_01.jpg" /></div>
									<strong class="title">로스트 치킨</strong>
									<p>오븐에 구워 담백한 저칼로리<br />닭가슴살의 건강한 풍미</p><!-- 20180207 -->
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1405">
								<div class="wrap">
									<div class="img"><img alt="써브웨이 클럽" src="./images/menu/sandwich_fl04_01.jpg" /></div>
									<strong class="title">써브웨이 클럽</strong>
									<p>명실공히 시그니처 써브!<br />치킨 슬라이스, 햄, 베이컨의 완벽한 앙상블</p>
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1449">
								<div class="wrap">
									<div class="img"><img alt=" 치킨 슬라이스" src="./images/menu/sandwich_fl05_01.jpg" /></div>
									<strong class="title">치킨 슬라이스</strong>
									<p>닭가슴살로 만든 치킨 슬라이스로 즐기는<br />담백한 맛!</p>
								</div>
							</a>
						</li>
					</ul>
					<ul>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1403">
								<div class="wrap">
									<div class="img"><img alt="베지" src="./images/menu/sandwich_fl06_01.jpg" /></div>
									<strong class="title">베지</strong>
									<p>갓 구운 빵과 신선한 7가지 야채로<br />즐기는 깔끔한 한끼</p><!-- 20180207 -->
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!--// 프레쉬&amp;라이트 -->
			<!-- 프리미엄 -->
			<div class="subway_menu_slider" id="sandwich_pm">
				<div>
					<ul>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1392">
								<div class="wrap">
									<div class="img"><img alt="쉬림프" src="./images/menu/sandwich_pm10_01.jpg" /></div>
									<strong class="title">쉬림프</strong>
									<p> 탱글한 식감이 그대로 살아있는 통새우가<br />5마리 들어가 한 입 베어 먹을 때 마다<br />진짜 새우의 풍미가 가득</p>
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1398">
								<div class="wrap">
									<div class="img"><img alt="풀드 포크 바비큐" src="./images/menu/sandwich_pm08_01.jpg" /></div>
									<strong class="title">풀드 포크 바비큐</strong>
									<p>훈연한 미국 정통 스타일의 리얼 바비큐 풀드포크가 들어간 샌드위치</p>
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1391">
								<div class="wrap">
									<div class="img"><img alt="스테이크&amp;치즈" src="./images/menu/sandwich_pm01_01.jpg" /></div>
									<strong class="title">스테이크&amp;치즈</strong>
									<p>육즙이 쫙~<br />풍부한 비프 스테이크의 풍미가 입안 한가득</p><!-- 20180207 -->
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1448">
								<div class="wrap">
									<div class="img"><img alt="치킨 베이컨 아보카도" src="./images/menu/sandwich_pm02_01.jpg" /></div>
									<strong class="title">치킨 베이컨 아보카도</strong>
									<p>담백하게 닭가슴살로 만든 치킨 슬라이스와 베이컨,<br />부드러운 아보카도의 만남</p>
								</div>
							</a>
						</li>
					</ul>
					<ul>
                        <!-- #210504 써브웨이 멜트 삭제 (#574)
                        <li>
                            <a href="/menuView/sandwich?menuItemIdx=1396">
                                <div class="wrap">
                                    <div class="img"><img src="./images/menu/sandwich_pm04.jpg" alt="써브웨이 멜트"></div>
                                    <strong class="title">써브웨이 멜트</strong>
                                    <p>자신있게 추천하는 터키, 햄, 베이컨의<br />완벽한 맛의 밸런스</p>&lt;!&ndash; 20180207 &ndash;&gt;
                                </div>
                            </a>
                        </li>-->
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1395">
								<div class="wrap">
									<div class="img"><img alt="스파이시 이탈리안" src="./images/menu/sandwich_pm06_01.jpg" /></div>
									<strong class="title">스파이시 이탈리안</strong>
									<p>살라미, 페퍼로니가 입안 한가득!<br />쏘 핫한 이탈리아의 맛</p><!-- 20180207 -->
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/sandwich?menuItemIdx=1394">
								<div class="wrap">
									<div class="img"><img alt="치킨 데리야끼" src="./images/menu/sandwich_pm07_01.jpg" /></div>
									<strong class="title">치킨 데리야끼</strong>
									<p>담백한 치킨 스트립에 달콤짭쪼름한 써브웨이<br />특제 데리야끼 소스와의 환상적인 만남</p><!-- 20180207 -->
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!--// 프리미엄 -->
			<!-- 아침메뉴 -->
			<div class="subway_menu_slider" id="sandwich_bf">
				<div>
					<ul>
						<li>
							<a href="/menuView/morning?menuItemIdx=1339">
								<div class="wrap">
									<div class="img"><img alt="햄, 에그&치즈" src="./images/menu/sandwich_bf01.png" /></div>
									<strong class="title">햄, 에그&치즈</strong>
									<p>푹신한 오믈렛과 햄의 가장 클래식한 조화</p>
								</div>
							</a>
						</li>
						<li>
							<a href="/menuView/morning?menuItemIdx=1340">
								<div class="wrap">
									<div class="img"><img alt="웨스턴, 에그 & 치즈" src="./images/menu/sandwich_bf02.png" /></div>
									<strong class="title">웨스턴, 에그 & 치즈</strong>
									<p>토마토, 피망, 양파 세가지 야채가 더해져<br />더욱 신선한 하루 시작</p><!-- 20180207 -->
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!--// 아침메뉴 -->
		</div>
	</div>
	<!--// section subway menu e -->

	<!-- section subway s -->
	<div class="section_subway">
		<!-- content top -->
		<div class="content_top">
			<!-- 이용방법 -->
			<div class="utilization">
				<p>써브웨이를<br />제대로 즐기는 방법!</p>
				<a class="btn" href="utilizationSubway.do"><span>이용방법</span></a>
			</div>
			<!--// 이용방법 -->

			<!-- 써브웨이 역사 -->
			<div class="history">
				<p>50년 역사를 가진<br />No.1 프랜차이즈의 성장기</p>
				<a class="btn" href="history.do"><span>써브웨이 역사</span></a>
				<img src="./images/main/img_subway_history.png" />
			</div>
			<!--// 써브웨이 역사 -->
		</div>
		<!--// content top -->

		<!-- content bottom -->
		<div class="content_bottom">
			<!-- whats new -->
			<div class="whats_new">
				<div class="hd">
					<h2>What's New</h2>
					<p>
						써브웨이의 다양한 소식을<br />
						빠르게 전달해드립니다.
					</p>
				</div>
				<div class="board_list">
					<ul>
						<li><a href="#" onclick="view.noticeView(this);return false;" data-idx="292">써브웨이와 함께하는 JTBC 수목드라마 &#39;이 연애는 불가항력&#39;</a></li>
						<li><a href="#" onclick="view.noticeView(this);return false;" data-idx="291">써브웨이와 함께하는 SBS 금토드라마 &#39;소방서 옆 경찰서 그리고 국과수&#39;</a></li>
						<li><a href="#" onclick="view.noticeView(this);return false;" data-idx="290">써브웨이와 함께하는 tvN &#39;이번 생도 잘 부탁해&#39;</a></li>
					</ul>
					<a class="more" href="/newsList">more</a>
				</div>
			</div>
			<!--// whats new -->

			<!-- banner sponsor -->
			<div class="banner_sponsor">
				<div class="bxslider">
						<div>
								<a href="/newsView?noticeIdx=292">
									<img alt="써브웨이와 함께하는 JTBC 수목드라마 &#39;이 연애는 불가항력&#39;" src="./jsp/upload/banner/270X300 (1)_20230829025721267.jpg" />
								</a>
						</div>
					
						<div>
								<a href="/newsView?noticeIdx=291">
									<img alt="써브웨이와 함께하는 SBS 금토드라마 &#39;소방서 옆 경찰서 그리고 국과수&#39;" src="./jsp/upload/banner/270X300_20230804045136791.jpg" />
								</a>
							
						</div>
					
				</div>
			</div>
			<!--// banner sponsor -->
		</div>
		<!--// content bottom -->
	</div>
	<!--// section subway e -->

	<!-- quick menu -->
	<div class="quick_menu">
		<ul>
			<li class="qm01">
				<a href="#">
					<div class="icon"></div>
					<strong>프랜차이즈</strong>
					<span>개설절차/투자비용 정보</span>
				</a>
			</li>
			<li class="qm02">
				<a href="#">
					<div class="icon"></div>
					<strong>지사안내</strong>
					<span>수도권/지방 지사정보</span>
				</a>
			</li>
			<li class="qm03">
				<a href="#">
					<div class="icon"></div>
					<strong>광고영상</strong>
					<span>TV광고/동영상</span>
				</a>
			</li>
			<li class="qm04">
				<a href="faq.do">
					<div class="icon"></div>
					<strong>고객문의</strong>
					<span>자주하는 질문/1:1문의</span>
				</a>
			</li>
		</ul>
	</div>
	<!--// quick menu -->

	<!-- // 팝업 :: (2018.11.21) 관리자 등록으로 기능 변경 -->
	
	<!--// 팝업 -->

	<script type="text/javascript">
		function getCookie(name) {
			var nameOfCookie = name + "=";
			var x = 0;
			while (x <= document.cookie.length) {
				var y = (x + nameOfCookie.length);
				if (document.cookie.substring(x, y) == nameOfCookie) {
					if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
						endOfCookie = document.cookie.length;
					return unescape(document.cookie.substring(y, endOfCookie));
				}
				x = document.cookie.indexOf(" ", x) + 1;
				if (x == 0) break;
			}
			return "";
		}

		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + Number(expiredays));
			document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}

		$(document).ready(function(){
			// 오늘 하루 안보기
			$(".notToday").click(function () {
				var popupId = $(this).attr("id").replace("notToday_", "");

				setCookie(popupId, "Y", "1");
				$("#" + popupId).hide();
				return false;
			});

			// 닫기
			$("a.close").click(function () {
				var popupId = $(this).attr("id").replace("close_", "");

				$("#" + popupId).hide();
				return false;
			});

			$.each($(".openpopup_wrapper"), function(idx, data){
				if (getCookie(data.id) != "Y") {
					$("#" + data.id).show();
				} else {
					$("#" + data.id).hide();
				}
			});

			/*
                            var toDate = new Date();
                            var endDate = new Date(('2018-02-17 00:00:00').replace(/-/g, "/"));
                            if(toDate >= endDate){
                                $("div[class=openpopup_wrapper]").hide();
                            }else{
                                if(getCookie("popup_20180214") != "Y"){
                                    $("div[class=openpopup_wrapper]").show();
                                }else{
                                    $("div[class=openpopup_wrapper]").hide();
                                }
                            }
            */
		});
	</script>

</div>
</article>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
