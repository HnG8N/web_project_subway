<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.javalec.dao.BoardDAO" %>
<%@ page import="com.javalec.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="jsp/board/css/bootstrap.css">
<link rel="stylesheet" href="jsp/board/css/custom.css">
<title>사용자 게시판</title>
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
		<%
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>			
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="home.do">홈</a></li>
				<li class="active"><a href="board.do">게시판</a></li>
			</ul>
			<%
				if(userId == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li><a href="login_view.do">로그인</a></li>
					<li><a href="signup_view.do">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.do">로그아웃</a></li>						
					</ul>
				</li>
			</ul>
		 	 <% 
				}
			%>
		</div>
	</nav>	

	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="boTitle" onkeyup="searchFunction()" type="text" size="20">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" onclick="searchFunction();" type="button">제목 검색</button>
			</div>
		</div>
		
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #00B800">
				<thead>
					<tr>
						<th style="background-color: #00A600; text-align: center;">번호</th>
						<th style="background-color: #00A600; text-align: center;">제목</th>
						<th style="background-color: #00A600; text-align: center;">작성자</th>				
						<th style="background-color: #00A600; text-align: center;">작성일</th>
						<th style="background-color: #00A600; text-align: center;">조회수</th>  					
					</tr>
				</thead>
				<tbody id="ajaxTable">				
				<%
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<BoardDTO> list = boardDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++){
				%>
				 <tr>
					<td><%= list.get(i).getBoardID()%></td>
					 <td><a href="javascript:viewBbc('<%= list.get(i).getBoardID() %>')">
				<%
					for(int j = 0; j < list.get(i).getBoardLevel(); j++){
				%>
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: red;"></span> 
				<%
					}
				%><%= list.get(i).getBoTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></a></td>
					<td><%= list.get(i).getBmID()%></td>
					<td><%= list.get(i).getBoDate().substring(0,11) + list.get(i).getBoDate().substring(11,13)+"시"+list.get(i).getBoDate().substring(14,16) +"분"%></td>
					<td><%= list.get(i).getBoardHit()%></td>
				</tr>
				<%
					}				
				%>					
				</tbody>								
			</table>			
			<a href="bwrite.do" class="btn btn-primary pull-right">글쓰기</a>	 			
		</div>
	</div>	
	
<div class="container" style="text-align: center;">
    <div class="row">	
	 <%
	 	int totalPages = boardDAO.getTotalPages();
		int postsPerPage = 10; // 한 페이지에 표시되는 게시글의 수를 설정하세요
		int visiblePageRange = 5; // 표시할 페이지 링크의 개수를 설정하세요
		int totalBPages = (int) Math.ceil((double) totalPages / postsPerPage); // 전체 페이지 수 계산
		
	  	int startPage = Math.max(1, pageNumber - visiblePageRange / 2);
	 	int endPage = Math.min(totalBPages, startPage + visiblePageRange - 1);
	 	
	 	int prevPage = Math.max(1, pageNumber - 5); // 이전 5페이지
        int nextPage = Math.min(totalPages, pageNumber + 5); // 다음 5페이지

   		if (pageNumber > 1) {
	%>
    	<a href="board.do?pageNumber=<%= prevPage %>" class="btn btn-success btn-arrow-left"><</a>
	<%
    	}

   	 	for (int i = startPage; i <= endPage; i++) {
	%>
   		 <a href="board.do?pageNumber=<%= i %>" class="btn btn-success btn-rectangle <%= i == pageNumber ? "active" : "" %>"><%= i %></a>
	<%
   		 }
   	 	if (pageNumber < totalBPages) {
	%>
   	 	<a href="board.do?pageNumber=<%= nextPage %>" class="btn btn-success btn-arrow-right">></a>
	<%
   	 	}
	%>
	</div>
</div>
<script>
    function viewBbc(boardID) {
        window.location.href = "bview.do?boardID=" + boardID;
     //   alert("게시물 ID: " + boardID); // 함수가 호출되었는지 확인하기 위해 alert 창을 띄웁니다. 
    }   
</script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchFunction() {
		request.open("Post","./BoardSearchServlet?boTitle=" + encodeURIComponent(document.getElementById("boTitle").value),true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess(){
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		if(request.readyState == 4 && request.status == 200){
			var object = eval('(' + request.responseText +')');
			var result = object.result;
			for(var i = 0; i< result.length; i++){
				var row = table.insertRow(0);
				for(var j = 0; j < result[i].length; j++){
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
                // 클릭 이벤트 추가
                row.cells[1].onclick = function() {
                    var boardID = this.parentNode.cells[0].innerHTML;
                    viewBbc(boardID);
                };
			}
		}
	}
</script>
</body>
</html>