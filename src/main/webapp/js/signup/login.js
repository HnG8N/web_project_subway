
$(document).ready(function() {
	$("#login").click(function(event) {
		event.preventDefault(); // 기본 제출 동작을 중지

		// 유효성 검사 수행
		if (validation()) {
			var form = document.loginForm;
			var id = $("#id").val();
			var pw = $("#pw").val();

			$.ajax({
				type: "POST",
				url: "CheckPw", // 비밀번호 확인을 위한 서블릿 또는 URL
				data: { mid: id },
				success: function(response) {
					if (response.replaceAll("\"","") === pw) {
						// 비밀번호가 일치할 경우 로그인 액션을 실행
						form.submit();
					} else {
						alert("비밀번호가 일치하지 않습니다.");
					}
				}
			});
		}
	});
});

// 유효성 검사 함수
function validation() {
	var id = $("#id").val();
	var pw = $("#pw").val();


	// 아이디와 비밀번호가 비어 있는지 확인
	if (id.trim() === '' || pw.trim() === '') {
		alert("아이디와 비밀번호를 모두 입력하세요.");
		return false; // 폼 제출을 막음
	}

	// 모든 조건을 통과하면 true 반환
	return true;
}