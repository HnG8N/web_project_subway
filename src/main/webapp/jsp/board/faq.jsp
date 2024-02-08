<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<!-- container s -->
<div id="container">
	<div class="sub_header">
		<div class="content">
			<a class="logo" href="#none">HOME</a>
			<!-- sub location -->
			<div class="sub_loc">
				<ul>
					<li class="active"><a href="#">FAQ</a></li>
					<li><a href="/qna">1:1문의</a></li>
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
<%@ include file="../../footer.jsp"%>