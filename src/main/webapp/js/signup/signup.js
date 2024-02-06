/**
 *  회원가입 java script
 */

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
				document.getElementById("extraAddress").value = extraAddr;

			} else {
				document.getElementById("extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();
		}
	}).open();
}

// 선택한 달에 따라서 일수바뀌는 함수
function updateDays() {
	
	var yearSelect = document.getElementById("yearSelect");
	var monthSelect = document.getElementById("monthSelect");
	var daySelect = document.getElementById("daySelect");
	
	var selectedYear = parseInt(yearSelect.value,10);
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
			if (selectedYear % 4 == 0){
				daysInMonth = 29;
			}
			else{
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

function validation() {
    var id = document.getElementById("id").value;
    var pw = document.getElementById("pw").value;
    var name = document.getElementById("name").value;
    var postcode = document.getElementById("postcode").value;
    var address = document.getElementById("address").value;
    var detailAddress = document.getElementById("detailAddress").value;
    var mid = document.getElementById("mid").value;
    var end = document.getElementById("end").value;

    // ID 유효성 검사: 영어 소문자 및 숫자 허용, 최대 15자
    var idRegex = /^[a-z0-9]{1,15}$/;
    if (!idRegex.test(id)) {
        alert("ID는 영어 소문자와 숫자만 사용 가능하며, 최대 15자까지 입력 가능합니다.");
        return false;
    }

    // PW 유효성 검사: 영어, 숫자, 특수문자 허용, 최대 15자
    var pwRegex = /^[a-zA-Z0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\-]{8,15}$/;
    if (!pwRegex.test(pw)) {
        alert("PW는 영어, 숫자, 특수문자만 사용 가능하며, 8자부터 15자까지 입력 가능합니다.");
        return false;
    }

    // 이름 유효성 검사: 한글 또는 영어만 허용, 최대 10자
    var nameRegex = /^[가-힣a-zA-Z]{1,10}$/;
    if (!nameRegex.test(name)) {
        alert("이름은 한글 또는 영어만 사용 가능하며, 최대 10자까지 입력 가능합니다.");
        return false;
    }
    
    // 주소 유효성 검사 : 빈칸이면 안됨
	if (postcode === '' || address === '' || detailAddress === '') {
        alert("주소 관련 필드는 모두 입력되어야 합니다.");
        return false;
    }

    // Mid, End 유효성 검사: 숫자만 허용, 각각 4자리
    var numberRegex = /^\d{4}$/;
    if (!numberRegex.test(mid) || !numberRegex.test(end)) {
        alert("전화번호는 숫자만 입력 가능하며, 각각 4자리여야 합니다.");
        return false;
    }
    
    // 모든 조건을 통과하면 폼 제출
    alert("회원가입 성공!");  // 실제로는 폼 제출 코드로 변경해야 합니다.
}
