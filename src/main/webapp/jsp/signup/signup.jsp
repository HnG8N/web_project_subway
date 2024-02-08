<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
  	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="js/signup/signup.js"></script>
    <title>회원가입</title>
  </head>
  <body>
  	<h1>회원가입</h1>
  	
  	<form action="signup.do" method="post" onsubmit="return validation()">
  	아이디 : <input type="text" id="id" name="id">
  			<button type="button" id="checkid">아이디 중복 검사</button><br>
  			<div id="result"></div>
  	
  	비밀번호 : <input type="password" id="pw" oninput="pwCheck()" name="pw"><br>
  	비밀번호 확인 : <input type="password" id="pwcheck" oninput="pwCheck()" name="pwcheck"><br>
  			<div id="result4"></div>
  	
  	
 	이름 : <input type="text" id="name" name="name"><br>
  	
    주소 : <input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly">
    	  <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
    	  <input type="text" id="address" name="address" placeholder="주소"readonly="readonly"><br>
    	  <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" >
    	  <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" readonly="readonly"><br>
    
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
	
	전화번호 : <select name="start">
				<option>010</option>
				<option>011</option>
			</select>
			-
    		<input type="text" id="mid" name="mid" maxlength="4">
    		-
    		<input type="text" id="end" name="end" maxlength="4"><br>
   	이메일 : <input type="text" id="email1" name="email1"> @ <select id="email2" name="email2">
   												<option>naver.com</option>
   												<option>gmail.com</option>
   											</select>
   			<button type="button" id="sendemail">인증번호 발송</button><br>
   	<div id="result2"></div>
   			
    인증번호 : <input type="text" id="emailcode" maxlength="4">
    <button type="button" id="codecheck" >인증확인</button><br>
    <div id="result3"></div>
    
    <input type="submit" value="회원가입">
    </form>
  </body>
</html>