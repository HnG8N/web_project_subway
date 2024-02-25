var bill  = {
	init: function() {
		//주문하기
		$("#startOrder").on("click", bill.startOrder);
	},
	
	// 주문하기
	startOrder : function() {
		
		 // 결제수단 벨리데이션
        if (!bill.checkPayMethVal()) {
            // $('#payTrial').val("N");
            return false;
        }
        
		// HTML 엘리먼트들 가져오기
		const trElements = document.querySelectorAll('tr[data-item-index]');
		
		// 데이터 속성 값들을 담을 배열 초기화
		const itemIndexArray = [];
		
		// 각 엘리먼트의 데이터 속성 값 가져와서 배열에 추가
		trElements.forEach((trElement) => {
		    const itemIndex = trElement.dataset.itemIndex;
		    itemIndexArray.push(itemIndex);
		});
		
		// 배열 출력
		console.log(itemIndexArray);
	
		// 주문 실행
		$.ajax({
			type: "POST",
			url: "Checkout",
			data: {"itemIndexArray[]" : itemIndexArray},
			async: false,
			success: function (result) {
				if(result>0){
					alert("주문이 완료 되었습니다.");
					location.href = "confirmOrder.do"// 마이페이지에서 주문내역을 볼 수 있으면 mypage.do로 변경하기.
				}
			},
			error: function (xhr, ajaxOptions, thrownError) {
				subwayCommon.errorAjaxProcess(xhr);
				alert("주문이 실패했습니다.");
			}
		});
	},
	
	// 결제수단 벨리데이션 체크
	checkPayMethVal : function() {

		// 약관 미동의시
		if ($('#paymentAgree:checked').val() != 'Y') {
			flag = false;
			msg = '구매 조건 및 결제진행 동의를 선택해주세요.';
			subwayCommon.scrollMove($("#paymentAgree"));
		}

		if(!flag) {
			alert(msg);
			return flag;
		}
		return flag;
	}//	end of 결제수단 벨리데이션 체크
}

$(document).ready(function() {
	bill.init();
});