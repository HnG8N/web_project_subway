var favor  = {
		
		favorite : function(frm) {
			var form = $(frm);
			
			// 단체주문때문에 로그인여부 체크
			if(!memberVO){
				alert('로그인후 이용해주세요');
				location.href = "/member/login?returnUrl=" + location.pathname;  
			}
			
			if(form.is(':checked')) {
				var obj = {
						franchiseIdx : form.data('idx'),
						franchiseNo : form.data('frno'),
						url :"/mypage/franchise/form/favorite",
						success : "자주찾는 매장으로 등록 완료되었습니다.",
						fail : "등록이 실패하였습니다.",
						flag : "insert",
						form : form
				};
				favor.favorCnt(obj);
				
			} else {
				if(confirm('자주찾는 매장에서 삭제하시겠습니까?')){
					var obj = {
							franchiseIdx : form.data('idx'),
							franchiseNo : form.data('frno'),
							url :"/mypage/franchise/form/del",
							success : "자주찾는 매장에서 삭제되었습니다.",
							fail : "삭제 실패하였습니다.",
							flag : "delete",
							form : form
					};
				favor.favorAjax(obj);
				}else
				form.prop("checked", true);
			}
			
		},
		
		favorCnt : function(obj){
			$.post("/mypage/franchise/form/cnt","POST",JSON.stringify(obj), function(data){
				
				if(!data.cntFlag) {
					obj.form.prop("checked", false);
					alert('자주 찾는 매장의 등록 개수가 초과되었습니다. 이전매장을 해체하고 등록해주세요.');
				} else if(!data.overlapFlag) {
					obj.form.prop("checked", false);
					alert('등록되어 있는 매장입니다.');
				} else{
					favor.favorAjax(obj);
				}
			});
			
		},
		
		favorAjax : function(obj) {
			var param = {
					franchiseIdx : obj.franchiseIdx,
					franchiseNo : obj.franchiseNo
			}
			$.post(obj.url,"POST", JSON.stringify(param), function(data){
				
				if(data.result){
					alert(obj.success);
				} else {
					alert(obj.fail);
					if(data.flag == 'insert'){
						obj.form.prop('checked',false);
					} else{
						obj.form.prop('checked',true);
					}
				}
			}), function(data){
				alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
			}
		}
}