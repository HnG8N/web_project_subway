/**
 * 
 */
$(document).ready(function() {
	$("#findPw").click(function() {
		var id = $("#id").val();
		var name = $("#name").val();
		var year = $("#yearSelect").val();
		var month = $("#monthSelect").val();
		var day = $("#daySelect").val();
		var date = year + "-" + month + "-" + day
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		var email = email1 + "@" + email2;
		var form = document.findPwForm;

		// 이메일 중복 확인
		$.ajax({
			type: "POST",
			url: "FindPw",
			data: { id: id, name: name, date: date, email: email },
			success: function(response) {
				if (response > 0) {
					$.ajax({
						type: "GET",
						url: "SendPw",
						data: { id: id, name: name, date: date, email: email },
						success: function(data) {
							alert("이메일을 성공적으로 전송했습니다.");
							form.submit();
						},
						error: function(xhr, status, error) {
							alert("이메일 전송에 실패했습니다.");
						}
					});
				} else {
					alert("회원 정보가 없습니다. 회원가입을 진행해주세요.");
				}
			}
		});
	});
});

// 선택한 달에 따라서 일수바뀌는 함수
function updateDays() {

	var yearSelect = document.getElementById("yearSelect");
	var monthSelect = document.getElementById("monthSelect");
	var daySelect = document.getElementById("daySelect");

	var selectedYear = parseInt(yearSelect.value, 10);
	var selectedMonth = parseInt(monthSelect.value, 10);
	var daysInMonth;

	switch (selectedMonth) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			daysInMonth = 31;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			daysInMonth = 30;
			break;
		// 윤년 계산
		case 2:
			if (selectedYear % 4 == 0) {
				daysInMonth = 29;
			}
			else {
				daysInMonth = 28;
			}
			break;
		default:
			daysInMonth = 0; // 에러 처리 등을 위해 0으로 설정
	}

	// 기존 옵션을 제거하고 새로운 일 수로 업데이트
	while (daySelect.options.length > 0) {
		daySelect.remove(0);
	}

	// 새로운 일 수로 옵션 추가
	for (var i = 1; i <= daysInMonth; i++) {
		var option = document.createElement("option");
		option.text = i;
		option.value = i;
		daySelect.add(option);
	}
}