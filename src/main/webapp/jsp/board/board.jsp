<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalec.dao.BoardDAO" %>
<%@ page import="com.javalec.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>사용자 게시판</title>
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
		<%
		String bmid = null;
		if(session.getAttribute("id") != null){
			bmid = (String)session.getAttribute("id");
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
				<li><a href="http://localhost:8080/web_project_subway/">홈</a></li>
				<li class="active"><a href="board.do">게시판</a></li>
			</ul>
			<%
				if(bmid == null){
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
	
</head>
<body>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="btitle" onkeyup="searchFunction()" type="text" size="20">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
			</div>
		</div>
		
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #00B800">
				<thead>
					<tr>
						<th style="background-color: #00A600; text-align: center;">번호</th>
						<th style="background-color: #00A600; text-align: center;">작성자</th>
						<th style="background-color: #00A600; text-align: center;">제목</th>
						<th style="background-color: #00A600; text-align: center;">작성일</th>					
					</tr>
				</thead>
				<tbody id="ajaxTable">				
				</tbody>
				<tbody>
				<%
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<BoardDTO> list = boardDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++){
				%>
				 <tr>
					<td><%= list.get(i).getBseq()%></td>
					<td><%= list.get(i).getBmid()%></td>
					<td><a href="bview.do?bseq=<%= list.get(i).getBseq() %>"><%= list.get(i).getBtitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></a></td>
					<td><%= list.get(i).getBdate().substring(0,11) + list.get(i).getBdate().substring(11,13)+"시"+list.get(i).getBdate().substring(14,16) +"분"%></td>
					</tr>
				<%
					}				
				%>
					
				</tbody>								
			</table>
			<%
				if(pageNumber !=1){
			%>
				<a href ="board.do?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<% 		
				} if(boardDAO.nextPage(pageNumber + 1)){
			%>
				<a href ="board.do?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>	
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

<script src="https://code.jquery.com/jquery-3.1.1.min.js"><</script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchFunction() {
		request.open("Post","./BoardSearchServlet?btitle=" + encodeURIComponent(document.getElementById("btitle").value),true);
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
			}
		}
	}
</script>
</body>
</html>