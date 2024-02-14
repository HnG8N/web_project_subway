$(document).ready(function() {
	$("#pwInfo").click(function(event) {
		alert("!@#!@#!@#$@Q#%");
		event.preventDefault(); // 기본 제출 동작을 중지

		// 유효성 검사 수행
		if (validation()) {
			var id = $("#id").val();
			var pw = $("#pw").val();

			$.ajax({
				
				type: "POST",
				url: "CheckPw", // 비밀번호 확인을 위한 서블릿 또는 URL
				data: { mid: id },
				success: function(response) {
					if (response.replaceAll("\"","") === pw) {
						// 비밀번호가 일치할 경우 로그인 액션을 실행
						alert("!!!");
					} else {
						alert("비밀번호가 일치하지 않습니다.");
					}
				}
			});
		}
	});
});