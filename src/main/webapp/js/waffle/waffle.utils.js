var _ua = navigator.userAgent.toLowerCase()
var _isIE6 = (/msie ([6]{1})\./g).test(_ua);
var _isInitW = (screen.width < 1025) ? true : false;
var mikExp = /[$\\@\\\#%\^\&\*\(\)\[\]\+\_\{\}\`\~\=\|\,]/;

$.browser = {};
$.browser.mozilla = /mozilla/.test(navigator.userAgent.toLowerCase()) && !/webkit/.test(navigator.userAgent.toLowerCase());
$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());

/*====================================================================================
' 함수명 : String.format
' 인  수 : arguments
' 기  능 : 문자열 치환
' 리턴값 : 치환된 문자열
'=====================================================================================*/
String.prototype.format = function (args) {
    var str = this;
    return str.replace(String.prototype.format.regex, function (item) {
        var intVal = parseInt(item.substring(1, item.length - 1));
        var replace;
        if (intVal >= 0) {
            replace = args[intVal];
        } else if (intVal === -1) {
            replace = "{";
        } else if (intVal === -2) {
            replace = "}";
        } else {
            replace = "";
        }
        return replace;
    });
};

//숫자만
String.prototype.format.regex = new RegExp("{-?[0-9]+}", "g");

//앞뒤 공백제거
String.prototype.trim = function () {
	return this.replace(/^\s+|\s+$/g, '');
}

String.prototype.isNumber = function() {
	var str = (this == '' || this == null || this == undefined || this == 'undefined') ? '' : this;
	if (str == "") return true;

	var reg = /^[0-9]*$/;
	return reg.test(str);
}

String.prototype.isDouble = function() {
	var str = (this == '' || this == null || this == undefined || this == 'undefined') ? '' : this;
	if (str == "") return true;

	var reg = /^(\d{1,2}([.]\d{0,2})?)?$/;
	return reg.test(str);
}

String.prototype.strToNumber = function() {
	var str = (this == '' || this == null || this == undefined || this == 'undefined') ? 0 : this;
	var reg = /^[0-9]*$/;
	return reg.test(str) ? Number(str) : 0;
}

String.prototype.isDate = function() {
	var str = (this == '' || this == null || this == undefined || this == 'undefined') ? '' : this;
	if (str == "") return true;

	var reg = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return reg.test(str);
}

String.prototype.isEmail = function() {
	var str = (this == '' || this == null || this == undefined || this == 'undefined') ? '' : this;
	if (str == "") return true;

	var reg = new RegExp("^[\\w\\-]+(\\.[\\w\\-_]+)*@[\\w\\-]+(\\.[\\w\\-]+)*(\\.[a-zA-Z]{2,3})$", "gi");
	return reg.test(str)
}

String.prototype.isPhone = function() {
	var str = (this == '' || this == null || this == undefined || this == 'undefined') ? '' : this;
	if (str == "") return true;

	var reg = /^\d{2,3}-\d{3,4}-\d{4}$/;
	return reg.test(str);
}

/*
 - num : '-' 문자가 들어있지않은 숫자로된 전화번호
 - type : 0을 보내면 가운데자리를 숨겨준다
*/
String.prototype.phoneFomatter = function(type){

	var num = (this == '' || this == null || this == undefined || this == 'undefined') ? '' : this.replace(/-/g, '').trim();
    var formatNum = '';

    if(num.length == 11){
        if(type==0){
            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
        }else{
            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        }
    }else if(num.length==8){
        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
    }else{
        if(num.indexOf('02') == 0){
        	if(type==0){
                formatNum = num.replace(/(\d{2})(\d{3,4})(\d{4})/, '$1-****-$3');
            }else{
                formatNum = num.replace(/(\d{2})(\d{3,4})(\d{4})/, '$1-$2-$3');
            }
        }else{
        	if(type==0){
                formatNum = num.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-****-$3');
            }else{
                formatNum = num.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
            }
        }
    }
    return formatNum;
}

String.prototype.timeFormat = function() {
    var num = (this == '' || this == null || this == undefined || this == 'undefined') ? '' : this;
    num = num.replaceAll(':', '');
    return (num.trim().length == 4) ? num.substring(0, 2) + ':' + num.substring(2, 4) : (num.trim().length == 3) ? "0" + num.substring(0, 1) + ':' + num.substring(1, 3) : num;
}


var waffle = {
	isMobile: function() {
	    if (sessionStorage.desktop) // desktop storage
	        return false;
	    else if (localStorage.mobile) // mobile storage
	        return true;

	    // alternative
	    var mobile = ['iphone','ipad','android','blackberry','nokia','opera mini','windows mobile','windows phone','iemobile'];
	    for (var i in mobile) if (navigator.userAgent.toLowerCase().indexOf(mobile[i].toLowerCase()) > 0) return true;

	    // nothing found.. assume desktop
	    return false;
	}
};

