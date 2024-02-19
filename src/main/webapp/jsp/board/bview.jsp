<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.javalec.dao.BoardDAO" %>
<%@ page import="com.javalec.dto.BoardDTO" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="jsp/board/css/bootstrap.css">
<link rel="stylesheet" href="jsp/board/css/custom.css">
<title>사용자 게시판</title>
</head>
<body>
	<%
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}		
		int boardID = 0;
		if(request.getParameter("boardID")!= null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.do'");
			script.println("</script>");
		}
				
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO board = boardDAO.getBbs(boardID);

		// 조회수 증가
	try {
		  boardDAO.hit(Integer.toString(boardID)); // 게시물 증가
	} catch (Exception e) {
		 // 조회수 증가 중 오류가 발생한 경우
		  // 오류 메시지 설정 등 예외 처리 로직 추가
		  e.printStackTrace(); // 예외 정보를 콘솔에 출력
		// 예외가 발생한 경우에 대한 사용자에게 알리는 등의 작업을 추가할 수 있음
		  out.println("<p>조회수를 증가하는 도중 오류가 발생했습니다.</p>");
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
						<li><a href="../signup/signup.jsp">회원가입</a></li>	
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
		<div class="row">		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>									
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%=board.getBoTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")  %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=board.getBmID() %></td>
					</tr>
										
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=board.getBoDate().substring(0,11) + board.getBoDate().substring(11,13)+"시"+board.getBoDate().substring(14,16) +"분" %></td>
					</tr>
					<tr>										
						<td>조회수</td>
						<td colspan="2"><%=board.getBoardHit() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=board.getBoContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>						
					</tbody>					
				</table>
				<a href="board.do" class="btn btn-primary">목록</a>
				<%
					if(userId != null && userId.equals(board.getBmID())){
				%>
						<a href="bupdate.do?boardID=<%=boardID %>" class="btn btn-primary">수정</a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="bdeleteAction.do?boardID=<%=boardID %>" class="btn btn-primary">삭제</a>
								<%
					}else{
				%>
					<a href="breply.do?boardID=<%=boardID %>" class="btn btn-primary">답변</a>				
				<%		
					}
				%>
				<a href="bwrite.do" class="btn btn-primary pull-right">글쓰기</a>			
		</div>
	</div>	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>