<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="js/signup/findId.js"></script>
<title>아이디 찾기</title>
</head>
<body>
	<form action="login_view.do" method="post" name="findIdForm">
	
	이름 : <input type="text" id="name" name="name"><br>
	
	생년월일 : <select name="year" id="yearSelect" name="year">
        		<c:forEach var="i" begin="1924" end="2024">
            		<option><c:out value="${i}" /></option>
        	 	</c:forEach>
    		 </select>년
    
    		<select name="month" id="monthSelect" name="month" onchange="updateDays()">
		        <c:forEach var="i" begin="1" end="12">
		            <option><c:out value="${i}" /></option>
		        </c:forEach>
		    </select>월

		    <select name="day" id="daySelect" name="day">
		        <c:forEach var="i" begin="1" end="31">
		            <option><c:out value="${i}" /></option>
		        </c:forEach>
		    </select>일<br>
		    
	이메일 : <input type="text" id="email1" name="email1"> @ <select id="email2" name="email2">
				   												<option>naver.com</option>
				   												<option>gmail.com</option>
				   											</select>
	<br>
	
	<input type="button" value="아이디 찾기" id="findId">
	
	</form>
</body>
</html>