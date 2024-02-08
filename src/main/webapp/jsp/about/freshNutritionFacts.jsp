<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>SUBWAY - 영양성분표 팝업</title>
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />
	<meta content="" name="description" />
	<link href="" rel="shortcut icon" type="image/x-icon" />
    <link href="../css/ui.common.css" rel="stylesheet" type="text/css" />
	<link href="../css/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css" />
	<script src="../js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../js/jquery/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
    <script src="../js/jquery/TweenMax.min.js" type="text/javascript"></script>
	<link href="../css/ui.popup.css" rel="stylesheet" type="text/css" /><!-- 팝업 css -->
</head>
<body>
<!--신선한 재료 영양성분표-->
	<div id="popup_wrap">
		<h1 class="title">영양 성분표</h1>
		<div class="popup_content">

			<div class="allergy_wrapper ver_nutrition_acts">
				<div class="scrollwrapper">

					<!-- 식품 table -->
					<div class="food_table">
						<table>
							<caption>영양 성분표</caption>
							<thead>
								<tr>
									<th class="hide" scope="col">성분</th>
									<th scope="col">중량 (g)</th>
									<th scope="col">열량 (kcal)</th>
									<th scope="col">단백질 (g)</th>
									<th scope="col">포화지방 (g)</th>
									<th scope="col">당류 (g)</th>
									<th scope="col">나트륨 (mg)</th>
								</tr>
							</thead>
							<!-- 신선한 재료 -->
							<tbody style="display:table-row-group;">
								
									<tr>
										<th scope="row">화이트</th>
										<td>71</td>
										<td>202</td>
										<td>6.1 (11%)</td>
										<td>0.3 (2%)</td>
										<td>2.8 (3%)</td>
										<td>343 (17%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">파마산 오레가노</th>
										<td>74.5</td>
										<td>213</td>
										<td>6.3 (11%)</td>
										<td>0.4 (2%)</td>
										<td>3.2 (3%)</td>
										<td>489 (24%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">위트</th>
										<td>78</td>
										<td>192</td>
										<td>8.4 (15%)</td>
										<td>0.5 (4%)</td>
										<td>5 (5%)</td>
										<td>257 (13%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">허니오트</th>
										<td>88.6</td>
										<td>235</td>
										<td>8.8 (16%)</td>
										<td>0.6 (4%)</td>
										<td>9.3 (9%)</td>
										<td>306 (15%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">하티</th>
										<td>75</td>
										<td>210</td>
										<td>7 (13%)</td>
										<td>1 (3%)</td>
										<td>3 (3%)</td>
										<td>340 (17%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">플랫브레드</th>
										<td>172</td>
										<td>467</td>
										<td>16.2 (29%)</td>
										<td>1.7 (12%)</td>
										<td>3.9 (4%)</td>
										<td>936 (47%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">아메리칸치즈</th>
										<td>10</td>
										<td>35.3</td>
										<td>1.8 (3%)</td>
										<td>1.9 (13%)</td>
										<td>0.4 (0%)</td>
										<td>193 (10%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">슈레드치즈</th>
										<td>14</td>
										<td>53.6</td>
										<td>3.2 (6%)</td>
										<td>2.4 (16%)</td>
										<td>0 (0%)</td>
										<td>84.7 (4%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">모차렐라치즈</th>
										<td>14</td>
										<td>43.8</td>
										<td>2.8 (5%)</td>
										<td>2.1 (14%)</td>
										<td>0.2 (0%)</td>
										<td>82.3 (4%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">머스타드</th>
										<td>21</td>
										<td>15.3</td>
										<td>1.1 (2%)</td>
										<td>0.1 (1%)</td>
										<td>0.2 (0%)</td>
										<td>193 (10%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">레드 와인 식초</th>
										<td>3.5</td>
										<td>0.7</td>
										<td>0 (0%)</td>
										<td>0 (0%)</td>
										<td>0 (0%)</td>
										<td>0 (0%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">스위트 어니언</th>
										<td>21</td>
										<td>40.1</td>
										<td>0.1 (0%)</td>
										<td>0 (0%)</td>
										<td>8.2 (8%)</td>
										<td>81.7 (4%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">허니 머스타드</th>
										<td>21</td>
										<td>38.4</td>
										<td>0.4 (1%)</td>
										<td>0.4 (2%)</td>
										<td>6.3 (6%)</td>
										<td>145 (7%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">스위트 칠리</th>
										<td>21</td>
										<td>40</td>
										<td>0.1 (0%)</td>
										<td>0 (0%)</td>
										<td>9.2 (9%)</td>
										<td>163 (8%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">스모크 바비큐</th>
										<td>21</td>
										<td>32.8</td>
										<td>0.2 (0%)</td>
										<td>0.1 (0%)</td>
										<td>7 (7%)</td>
										<td>132 (7%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">랜치</th>
										<td>21</td>
										<td>116</td>
										<td>0.3 (1%)</td>
										<td>2.1 (14%)</td>
										<td>0.6 (1%)</td>
										<td>128 (6%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">마요네즈</th>
										<td>21</td>
										<td>158</td>
										<td>0.3 (0%)</td>
										<td>2.8 (19%)</td>
										<td>0.1 (0%)</td>
										<td>98.1 (5%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">핫 칠리</th>
										<td>21</td>
										<td>41.8</td>
										<td>0.2 (0%)</td>
										<td>0.1 (1%)</td>
										<td>5.3 (5%)</td>
										<td>180 (9%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">사우스웨스트 치폴레</th>
										<td>21</td>
										<td>96.5</td>
										<td>0.4 (1%)</td>
										<td>1.6 (11%)</td>
										<td>1 (1%)</td>
										<td>160 (8%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">홀스래디쉬</th>
										<td>21</td>
										<td>106</td>
										<td>0.3 (1%)</td>
										<td>1.6 (11%)</td>
										<td>2.6 (3%)</td>
										<td>152 (8%)</td>
									</tr>
								
								
									<tr>
										<th scope="row">올리브 오일</th>
										<td>3.5</td>
										<td>124</td>
										<td>0 (0%)</td>
										<td>2.1 (14%)</td>
										<td>0 (0%)</td>
										<td>0 (0%)</td>
									</tr>
								
							</tbody>
							<!--// 신선한 재료 -->
						</table>
					</div>
					<!--// 식품 table -->
					<p class="caution">※ 괄호 안 %는 1일 영양소 기준치에 대한 비율</p>
				</div>
			</div>

		</div>
	</div>
	<!--//신선한 재료 영양성분표-->
	<script>
        $(document).ready(function(){
            $('#popup_wrap .scrollwrapper').mCustomScrollbar();
        })
	</script>

</body>
</html>