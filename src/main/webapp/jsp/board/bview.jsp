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
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>사용자 게시판</title>
</head>
<body>
	<%
		String bmid = null;
		if(session.getAttribute("id") != null){
			bmid = (String)session.getAttribute("id");
		}		
		int bseq = 0;
		if(request.getParameter("bseq")!= null){
			bseq = Integer.parseInt(request.getParameter("bseq"));
		}
		if (bseq == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.do'");
			script.println("</script>");
		}
		BoardDTO boardDTO = new BoardDAO().getBbs(bseq);
		
		if (boardDTO == null) {
		    PrintWriter script = response.getWriter();
		    script.println("<script>");
		    script.println("alert('해당 게시물을 찾을 수 없습니다.')");
		    script.println("location.href = 'board.do'");
		    script.println("</script>");
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
				<li><a href="../home/home.jsp">홈</a></li>
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
						<li><a href="logoutAction.jsp">로그아웃</a></li>						
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
						<td colspan="2"><%=boardDTO.getBtitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")  %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=boardDTO.getBmid() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=boardDTO.getBdate().substring(0,11) + boardDTO.getBdate().substring(11,13)+"시"+boardDTO.getBdate().substring(14,16) +"분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=boardDTO.getBcontent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>						
					</tbody>					
				</table>
				<a href="board.do" class="btn btn-primary">목록</a>
				<%
					if(bmid != null && bmid.equals(boardDTO.getBmid())){
				%>
						<a href="bupdate.do?bseq=<%=bseq %>" class="btn btn-primary">수정</a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="bdeleteAction.do?bseq=<%=bseq %>" class="btn btn-primary">삭제</a>
				<%		
					}
				%>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">			
		</div>
	</div>	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>