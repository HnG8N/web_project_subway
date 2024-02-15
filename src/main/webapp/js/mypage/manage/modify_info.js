function validation() {
	var pw = document.getElementById("newpw").value;

	if (pw.trim() == "") {
		alert("비밀번호를 입력해주세요");
		return false;
	}

	// PW 유효성 검사: 영어, 숫자, 특수문자 허용, 최대 15자
	var pwRegex = /^[a-zA-Z0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\-]{8,15}$/;
	if (!pwRegex.test(pw)) {
		alert("PW는 영어, 숫자, 특수문자만 사용 가능하며, 8자부터 15자까지 입력 가능합니다.");
		return false; // 폼 제출을 막음
	}

	// 모든 조건을 통과하면 폼 제출
	alert("회원정보가 수정되었습니다.");
	return true; // 폼 제출을 허용
}

$(document).ready(function() {

	$("#deleteInfo").click(function() {
		alert("회원탈퇴가 완료되었습니다.");
	});

	$("#check123").click(function() {
		var mypw = $("#mypw").val();
		var pw = $("#pw").val();

		if (mypw == pw) {
			alert("비밀번호가 맞습니다. 비밀번호 수정을 진행하세요.");
			$("#changePasswordForm").show(); // 비밀번호 변경 폼 보이기
		} else {
			alert("비밀번호가 아닙니다. 다시 입력해주세요.");
		}
	});
});

function pwCheck() {
	if ($('#newpw').val() == $('#newpwcheck').val()) {
		$('#result').text('비밀번호 일치').css('color', 'green')
	} else {
		$('#result').text('비밀번호 불일치').css('color', 'red')
	}
}

// 다음 주소 api 받아오는 함수
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("address").value = "(" + data.zonecode + ") " + addr + " " + extraAddr;

			}
		}
	}).open();
}

