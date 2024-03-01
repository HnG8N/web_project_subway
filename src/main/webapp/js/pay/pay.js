/**********************************************************************
 * ■ pay.js 
 * PC 결제 모듈을 iframe으로 
 * 
 * 
 * 1. 사용되는 elm ID는 view에서 절대 사용되지 않을 임의의 문자열로 생성합니다.
 * 2. ui.common.js에서 선언한 popup_open_wh 를 사용합니다. 이 메소드가 수정될 시
 *    영향을 받을 수 있습니다.
 * 3. view.callbackPay 메소드를 필수로 요구합니다.
 * 
 *********************************************************************/
var pay = {
		// url ID
		targetUrlId : 'afdsfadfdffadfkjohjohnio',

		// paydata ID
		paydataId : 'qerfdsdvsfdfasdffasadfasdfer',
		
		// payBtn ID
		payBtnId : 'ubuivcoiueornozvuov',
		
		// open pg layer
		executePay : function(param) {
			
			/**
			 * 1  validation
			 */
			if(!pay.validation(param))
				return false;	

			
			/**
			 * 2, create
			 */
			// 요청에 필요한 값의 input 생성
			if (document.getElementById(pay.targetUrlId))
				document.getElementById(pay.targetUrlId).remove();	

			if (document.getElementById(pay.paydataId))
				document.getElementById(pay.paydataId).remove();
			
			if (document.getElementById(pay.payBtnId))
				document.getElementById(pay.payBtnId).remove();
			
			
			var input1 = document.createElement("input");
			input1.setAttribute('type',"hidden");
			input1.setAttribute('id', pay.targetUrlId);
			input1.setAttribute('value', param.targetUrl);
			
			var input2 = document.createElement("input");
			input2.setAttribute('type',"hidden");
			input2.setAttribute('id', pay.paydataId);
			input2.setAttribute('value', param.payData);			
			
			document.getElementsByTagName('body')[0].appendChild(input1);
			document.getElementsByTagName('body')[0].appendChild(input2);
			
			
			/**
			 * 3. execute
			 * - 공통 iframe 레이어 팝업을 호출할 a태그 생성
			 */
			if("zeroPayment" == param.payData) {
				if (document.getElementById(pay.payBtnId))
					document.getElementById(pay.payBtnId).remove();
				
				var form = document.createElement("form");
				form.setAttribute('method',"post");			
				form.setAttribute('action', param.targetUrl);
				form.setAttribute('id', pay.payBtnId);
				form.setAttribute('accept-charset', 'UTF-8');
				
				var input = document.createElement("input");
				input.setAttribute('type',"hidden");
				input.setAttribute('name',"PAYDATA");
				input.setAttribute('value',param.payData);
				
				form.appendChild(input);
				document.getElementsByTagName('body')[0].appendChild(form);		
				$('#'+pay.payBtnId).submit();
			} else {
				var aTeg = document.createElement("span");
				aTeg.setAttribute('id', pay.payBtnId);
				aTeg.setAttribute('href',	 "/pay/iframe");
				aTeg.setAttribute('onclick', "subwayCommon.popupValidation(this,600,'bill'); return false;");
				aTeg.click();
				$(".popup_iframe_wrapper").addClass("no_wrapper");
			}
		},
		
		// pay callback
		callbackPay : function(code, msg) {
			if (view.callbackPay)
				view.callbackPay(code, msg);
		},
		
		// validation
		validation : function(object) {

			// 요청 객체가 null인가?
			if (object == null || object == '') {
				alert('PAY :: 결제 요청 객체가 null일 수 없습니다.');
				return false;
			}
			
			// url 정보가 존재하는가?
			if (object.targetUrl == null || object.targetUrl == '') {
				alert('PAY :: 결제 url이 존재하지 않습니다.');
				return false;
			}			
			
			// pay_data 가 존재하는가?
			if (object.payData == null || object.payData == '') {
				alert('PAY :: 결제에 필요한 PARAM이 존재하지 않습니다.');
				return false;
			}

			return true;
		}
};