/**********************************************************************
 * ■ pay.*.js 규칙
 * 1. 반드시 pay.js 스크립트를 먼저 선언해주세요.
 * 2. param에 대한 모든 validation은 해당 파일 내에서 진행해주세요.
 * 3. 2019.09.16 기준으로 callback함수의 이름은 view.callbackPay로 고정되어 있습니다.
 * 
 *********************************************************************/
/*sale 정의*/
var sale = {
		
		payFormId : 'h6cs7me8lol2q78agqx36tyjdpal5e',
		
		// executePay
		executePay : function(param) {

			// 결제상품명 세팅
			var totalItem = $("[data-target=mainItem] strong");
			var mainItem = totalItem.eq(0).text();
			var couponAmt = subwayCommon.stringCurrencyFormatToNumber($('#couponAmt').val());
			//var oneCupAmt =
			
			mainItem = totalItem.length > 1 ? mainItem + "외 " + (totalItem.length -1) + "건" : mainItem;
			
			/*--------------------------------------------*/
			/*	create Data								  */
			/*--------------------------------------------*/			
			// extend tempTransactionObject
			var tempTransactionObject = $.extend(param, 
				{
						mainItemNm 		: mainItem		
					  , subcardAmt		: subwayCommon.stringCurrencyFormatToNumber($('[name=subcardAmt]').val())
					  , pointAmt		: subwayCommon.stringCurrencyFormatToNumber($('[name=pointAmt]').val())
					  , oneCupAmt       : subwayCommon.stringCurrencyFormatToNumber($('#oneCupAmt').val())
					  , paveFg			: $('[name=paveFg]').val()
					  , payMethod		: $('[name=payment]:checked').val()
					  , ordMemoContent : $("[name=ordMemoContent]").val()
					  , ordAddMemoContent : $("[name=ordAddMemoContent]").val()
					  , disposableFg : $("[name=disposableFg]:checked").val() == "Y" ? $("[name=disposableFg]:checked").val() : "N"
					  , ordHp : $("[name=ordHp]").val()
					  , receiptYn : $("[name=receiptYn]").val()
					  , receiptType : $("[name=receiptType]:checked").val()
					  , receiptNo : $("[name=receiptNo]").val()
					  , voucherNo : voucherAmt > 0 ? $("[name=voucher]").val() : null
					  , couponCode : $("[name=couponCode]").val()
					  , couponAmt : couponAmt
					  , couponItemCode : $("[name=couponItemCode]").val()
					  , couponItemIndex : $("[name=couponItemIndex]").val()
				});
			

			// validation
			if(!sale.validation(param))
				return false;
			
			var payParam = JSON.stringify(tempTransactionObject);			

			// call ajax
			$.post('/pay/open/sale',"POST", payParam, function(data){
				// param문 생성
				var param = {
					  targetUrl : data.targetUrl
					, payData	: data.payData
				};
				
				// pay 공통 실행 호출
				pay.executePay(param);
			}, function(data){
				console.log(data);
			});
		},

		validation : function(object) {
			// 요청 객체가 null인가?
			if (object == null || object == 'undefined') {
				alert('결제 요청 객체가 null일 수 없습니다.');
				return false;
			}
			
			// 충전 타입인가?
			if ('PAY_DIVISION.SALE' != object.ordVO.payDivision) {
				alert('잘못된 요청입니다.');
				return false;
			}				
			
			
			return true;
		}
};

$(document).ready(function(){
	
	/*set pay*/
	pay.sale  = sale;
});