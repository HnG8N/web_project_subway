var view = {

	init : function(){
		$(function() {
			$('#add_menu').on('click', function() {
				location.href = "/mypage/store/bookmark/find";
			})
		});

	},

	logout : function(frm) {
			if(confirm("로그아웃 하시겠습니까?")) {
				var logout = $(frm);
				logout.attr('href','/logout');
			}
	},

	del : function(fun) {

		var form = $(fun);
		var obj = {
				"franchiseNo" : form.data('frno')
		};
		var param = JSON.stringify(obj);
		var url = '/mypage/redirect/favorite/my';
		$.post("/mypage/franchise/form/del","POST", param, function(data){

			if(data.result){
				alert("자주찾는 매장에서 삭제되었습니다.");
				//$('#book_mark_store').load(url);
				location.reload();
			} else {
				alert("삭제 실패");
			}
		}), function(data){
			alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
		}
	},

	// e-Gift 선물여부 검사
	checkEgiftPresent : function() {

		if ($('#egiftOrdNo').val() != undefined && $('#egiftOrdNo').val() != '') {

			if(confirm('e-Gift 선물이 도착했습니다. 지금 확인하시겠습니까?'))
				location.href= '/mypage/gift/regist/card/' + $('#egiftOrdNo').val()
		}
	}
}

$(document).ready(function (){
	
});

function pwCheck() {
	if ($('#newpw').val() == $('#subpw').val()) {
		$('#result').text('비밀번호 일치').css('color', 'green')
		pwValidated = "true";
	} else {
		$('#result').text('비밀번호 불일치').css('color', 'red')
		pwValidated = "false";
	}
}