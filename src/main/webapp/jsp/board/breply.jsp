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
<title>사용자 게시판</title>
<link rel="stylesheet" href="jsp/board/css/bootstrap.css">
<link rel="stylesheet" href="jsp/board/css/custom.css">
</head>
<body>
	<%
  	 	 String bmID = (String) session.getAttribute("userId");
    	if (bmID == null) {
        session.setAttribute("messageType", "오류 메시지");
        session.setAttribute("messageContent", "현재 로그인이 되어 있지 않습니다.");
        response.sendRedirect("index.jsp");
        return;
		}  	
    		
	    String boardID = request.getParameter("boardID");
	    if (boardID == null || boardID.equals("")) {
	        session.setAttribute("messageType", "오류 메시지");
	        session.setAttribute("messageContent", "게시물을 선택해주세요.");
	        response.sendRedirect("index.jsp");
	        return;
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
				<li><a href="home.do">메인</a></li>
				<li class="active"><a href=board.jsp>게시판</a></li>
			</ul>
			<%
				if(bmID == null){
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
		<div class="row">
		<form method="post" action="./boardBreply">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">답변 작성 양식</th>									
					</tr>
				</thead>
				 <tbody>						
					<tr>
						<td><input type="hidden" name="userId" value="<%=bmID %>">
							 <input type="hidden" name="boardID" value="<%=boardID %>">
						</td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="boTitle" maxlength="50"></td>
					</tr>
					<tr>	
						<td><textarea class="form-control" placeholder="글 내용" name="boContent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
				 </tbody>					
				</table>								
				<input type="submit" class="btn btn-primary pull-right" value="답변">	
			</form>		
		</div>
	</div>	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>