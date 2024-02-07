<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="js/signup/login.js"></script>
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	
	<form action="login.do" method="post" name="loginForm">
		아이디 : <input type="text" id="id" name="id"><br> 
		비밀번호 : <input type="text" id="pw" name="pw"><br> 
		<input type="button" value="로그인" id="login"> 
	</form>
	
	<a href="signup_view.do">회원가입</a> ㅣ <a href="findid_view.do">아이디 찾기</a> ㅣ <a href="findpw_view.do">비밀번호 찾기</a>
</body>
</html>