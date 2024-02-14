var view = {
    authIncomingPage: '',

    init: function () {
        // init pageInfo
        view.initPage();
        view.bindEvent();
    },

    initPage: function () {
        // is rememberId cookie exist?
        view.initUsername();
    },

    bindEvent: function () {
        // loginFunction
        $('#loginBtn').on('click', function (e) {
            e.preventDefault();
            view.login();
        });

        // requuired-check value
        $('.required-value').on('keyup', function (e) {
            var result = true;

            // change btn class
            $.each($('.required-value'), function (i, v) {
                if ($(v).val() == 'undefined' || $(v).val() == '') {
                    result = false;
                    return false;
                }
            });

            if (result)
                $('#loginBtn').addClass('on');
            else
                $('#loginBtn').removeClass('on');

            // enter event
            if (e.keyCode == '13')
                $('#loginBtn').click();
        });

        // findId btn
        $('#findIdBtn').on('click', function (e) {
            view.authIncomingPage = '/member/find/id';
            view.callCheckAuth('find-id');
        });

        // findPw btn
        $('#findPwBtn').on('click', function (e) {
            view.authIncomingPage = '/member/set/pw';
            view.callCheckAuth('find-pw');
        });
    },

    // login function
    login: function () {
        var returnUrl = $('#returnUrl').val() == null ? "/mypage" : $('#returnUrl').val();
        var dormantCloseYn = $('#dormantCloseYn').val();

        var username = $('#username').val();
        var password = $('#password').val();

        // validation - todo replace
        if (username == 'undefined' || username == '') {
            alert('아이디를 입력해주세요.');
            $('#username').focus();
            return false;
        }

        if (password == 'undefined' || password == '') {
            alert('비밀번호를 입력해주세요.');
            $('#password').focus();
            return false;
        }

        var obj = {
            username: username
            , password: password
        }

        // convert to json
        var param = JSON.stringify(obj);

        // call ajax
        $.post('/loginProcessing?returnUrl=' + returnUrl + '&dormantCloseYn=' + dormantCloseYn, "POST", param, function (data) {

            switch (data.resultCode) {
                case "NORMAL":
                    // if checked rememberId checkBox
                    if ($('#rememberId').is(":checked"))
                        view.saveUsername(username);

                    // if checked autoLogin checkBox
                    if ($('#autoLogin').is(":checked"))
                        view.saveAutoLogin();

                    if (data.dormantCloseYn == 'Y') {
                        popup_open_wh($('#popMemberAgrNoti'), 710, 490);
                    } else {
                        location.href = data.returnUrl;
                    }

                    break;
                case "NEED_PASSWORD":
                    alert(data.message);
                    location.href = '/member/need/mod-pw?returnUrl=' + data.returnUrl;
                    break;
                case "NEED_CELLPHONE_NO":
                    alert(data.message);
                    location.href = '/mypage/info/modify';
                    break;
                case "FAIL":
                    if (data.leadPwdReset && "Y" == data.leadPwdReset) {	// (2020.08.27 추가)
                        if (confirm(data.message)) {
                            view.callCheckAuth('find-pw');
                        }
                    } else {
                        alert(data.message);
                    }
                    break;
                case "DORMANCY": //휴면 관련
                    popup_open_wh($('#popDormantNoti'), 680, 380);
                    break;
                default:
                    alert(data.message);
                    break;
            }
        }, function (data) {
            //console.log(data);
        });
    },

    // save username at cookie
    // it is using jquery.cookie.js
    saveUsername: function (username) {
        $.cookie('saved_username', username, {
            expires: 365, 						//쿠키 저장 기간
            path: '/'
        });
    },

    // get username from cookie
    getSavedUsername: function () {
        return $.cookie('saved_username');
    },

    // init username
    initUsername: function () {
        var username = view.getSavedUsername() || '';
        if (username) {
            $('#username').val(username);
            $('#rememberId').prop('checked', true);
        }
    },

    // save autoLogin at cookie
    saveAutoLogin: function () {
        $.cookie('loginToken', username, {
            expires: 365,
            path: '/'
        });
    },

    // nice auth popup
    callCheckAuth: function (returnUrl) {
        // cl.Auth.js
        var deviceType = 'mo'
        var returnUrl = returnUrl;

        auth.doMobileAuth({
            returnUrl: returnUrl,
            deviceType: deviceType,
            authIncomingPage: view.authIncomingPage
        });

        if (returnUrl == 'dormancy') {
            view.fnDormantPopClose();
        }
    },

    // callback of nice auth popup
    callbackAuthPage: function (returnUrl) {
        if (returnUrl == 'find-id') {
            // 아이디 찾기
            $.post('/member/find/id/auth', 'post', '', function (data) {

                // 결과 페이지로 이동
                location.href = "/member/find/id/result";
            }, function (data) {

            });
        } else if (returnUrl == 'find-pw') {
            // 패스워드 찾기
            $.post('/member/set/pw/auth', 'post', '', function (data) {

                // 변경 페이지로 이동
                location.href = "/member/set/pw";
            }, function (data) {

            });
        } else if (returnUrl == 'dormancy') {
            //휴면 회원해지 -> 휴면회원인지 조회
            $.post('/member/find/dormancy', 'post', '', function (data) {
                if (data > 0) {
                    $.post('/member/set/pw/auth', 'POST', '', function(data) {
                        if(data.result) {
                            location.href = '/member/set/pw';
                        } else {
                            alert('처리 중 문제가 생겼습니다.\n잠시 후 다시 시도해주세요.');
                        }
                    });
                } else {
                    alert('인증에 실패하였습니다.\n잠시 후 다시 시도해주세요.');
                    location.reload();
                }
            }, function (data) {

            });
        } else {
            // 그 외
            alert('본인인증 중 문제가 발생했습니다.');
        }
    },

    //휴면 해지
    updateCloseDormancy: function (memberIdx) {
        var data = {"mbrIdx": memberIdx};
        $.ajax({
            url: '/member/closeDormancy',
            type: "POST",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (data) {
                if (data > 0) {
                    popup_open_wh($('#popDormantClosing'), 410, 250);
                } else {
                    alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
                    location.href = "/";
                }
            }, error: function () {

            }

        });
    },

	fnDormantPopClose: function() {
		$(".popup_iframe_wrapper .btn_close").click();
	},
    fnDormantClosingAfter: function(url) {
        view.fnDormantPopClose();

        if (url == null || url == '') {
            url = $('#returnUrl').val() == null ? "/mypage" : $('#returnUrl').val();
        }
        location.href = url;
    }
}


$(document).ready(function () {
    view.init();
});