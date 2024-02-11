<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>사용자 게시판</title>
</head>
<body>
	<%
		session.invalidate();	
	%>
	<script>
		location.href = "login_view.do";
	</script>

</body>
</html>