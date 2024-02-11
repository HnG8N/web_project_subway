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
		if (bmid == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.do'");
			script.println("</script>");
		}
		int bseq = 0;
		if(request.getParameter("bseq")!= null){
			bseq = Integer.parseInt(request.getParameter("bseq"));
		}
		if (bseq == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		BoardDTO bbsDTO = new BoardDAO().getBbs(bseq);
		if(!bmid.equals(bbsDTO.getBmid())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
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
				<li><a href="home.jsp">홈</a></li>
				<li class="active"><a href="board.do">게시판</a></li>
			</ul>			
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
		</div>
	</nav>
	<div class="container">
		<div class="row">
		<form method="post" action="bupdateAction.do?bseq=<%=bseq %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정</th>									
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="btitle" maxlength="50" value="<%=bbsDTO.getBtitle()%>"></td>
					</tr>
					<tr>	
						<td><textarea class="form-control" placeholder="글 내용" name="bcontent" maxlength="2048" style="height: 350px;"><%=bbsDTO.getBcontent()%></textarea></td>
					</tr>
					</tbody>					
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글수정">	
			</form>		
		</div>
	</div>	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>