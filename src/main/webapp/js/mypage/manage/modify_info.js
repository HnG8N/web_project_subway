var view = {

    // 본인인증여부
    checkAuth: false,

    // 마케팅 수신 동의여부
    emailRecep: '',
    pushRecep: '',
    smsKakaoRecep: '',

    init: function () {
        // 버튼 바인딩
        view.bindEvent();
        // 체크박스 바인딩
        // view.checkBoxEvent();

        //기존 마케팅 정보 수신 여부
        view.emailRecep = $('[name=email_agr_fg]').val();
        view.pushRecep = $('[name=push_agr_fg]').val();
        view.smsKakaoRecep = $('[name=smsKakao_agr_fg]').val();

        view.onbeforeunload();
    },
    /*---------------------------------------------------*/
    /*  init fn									 		 */
    /*---------------------------------------------------*/
    bindEvent: function () {

        // 본인인증 버튼
        $('#checkAuthBtn').on('click', function () {
            view.callCheckAuthToModify();
        });

        // 회원탈퇴
        $('#withdrawal').on('click', function () {
            location.href = '/mypage/info/pw/withdrawal';  // #210310 회원탈퇴 로직 변경 (#517)
        });


        // 수정 버튼
        $('#modInfo').on('click', function () {
            view.modify('/mypage/form/info/modify');
        });

        // 주소검색 버튼 click
        $('#addressSearchBtn').on('click', function (e) {
            e.preventDefault();

            var defaultWidth = 400;
            var defaultHeight = 600;

            daum.postcode.load(function () {
                new daum.Postcode({
                    popupName: 'zen9Zipcode',
                    width: defaultWidth,
                    height: defaultHeight,
                    oncomplete: view.zipCodeCallback
                })
                    .open({
                        left: (window.screen.width / 2) - (defaultWidth / 2),
                        top: (window.screen.height / 2) - (defaultHeight / 2)
                    });
            });
        });

        // agreeAllCbx
        $('#agreeAllCbx').on('click', function (e) {

            if ($(this).is(":checked")) {
                $('.chk-value').prop('checked', true);
                $('.sns-value').prop('checked', true);
            } else {
                $('.chk-value').prop('checked', false);
                $('.sns-value').prop('checked', false);
            }
        });

        // checkBox
        $('.chk-value').on('click', function (e) {
            if ($('.chk-value').length != $('.chk-value:checked').length)
                $('#agreeAllCbx').prop('checked', false);
            else
                $('#agreeAllCbx').prop('checked', true);
        });

        //현재 비밀번호 입력- 본인인증 안됐을경우
        $('#pw').on('keyup', function (e) {
            if (!view.checkAuth) {
                alert('본인인증 후 변경 가능합니다.');
                $('#pw').val('');
                flag = false;
            }
            $('#newPw').val('');
            $('#subPw').val('');
        });
    },

    zipCodeCallback: function (d) {
        fullAddr = d.roadAddress;

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        $('#zipCd').val(d.zonecode);
        $('#baseAddr').val(fullAddr);
        $('#dtlAddr').focus();
        $('#modInfo').addClass('i_reg');
    },

    // 약관 동의 팝업
    policyPopup: function (elm) {
        var cdElm = $(elm).parent().find('.cd-value');
        if (!cdElm) return false;

        window.open('', 'Window', 'width=520, height=1000, top=0, left=0, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes,location=no, scrollbar=yes');

        var form = document.getElementById('form');
        if (form) $(form).remove();
        form = document.createElement('form');

        $(form).attr('method', 'get');
        $(form).attr('target', 'Window');
        $(form).attr('action', '/member/join/step1/popup');

        var hiddenField1 = document.createElement('input');
        hiddenField1.setAttribute('type', 'hidden');
        hiddenField1.setAttribute('name', 'id');
        hiddenField1.setAttribute('value', $(cdElm).attr('id'));
        form.appendChild(hiddenField1);

        var hiddenField2 = document.createElement('input');
        hiddenField2.setAttribute('type', 'hidden');
        hiddenField2.setAttribute('name', 'code');
        hiddenField2.setAttribute('value', $(cdElm).data('code'));
        form.appendChild(hiddenField2);

        var body = document.getElementsByTagName('body').item(0);
        body.appendChild(form);
        $(form).submit();
    },

    // 동의 정보 to objectArr
    createAgrObj: function () {
        var termsList = new Array();
        $.each($('.cd-value'), function (i, v) {
            var obj = {
                "agrCode": $(v).data('code')
                , "agrFg": ($(v).is(':checked') ? 'Y' : 'N')
                , "memberAgrIdx": $(v).data('agridx')
            };

            termsList.push(obj);
        });

        return termsList;
    },


    /*---------------------------------------------------*/
    /*  auth check fn									 */
    /*---------------------------------------------------*/
    // call nice auth popup to auth
    callCheckAuthToCheckWithdrawal: function () {
        // cl.Auth.js
        var deviceType = 'mo'
        var returnUrl = 'auth-to-withdraw';

        auth.doMobileAuth({
            returnUrl: returnUrl,
            deviceType: deviceType
        });
    },

    // call nice auth popup to modify
    callCheckAuthToModify: function () {
        // cl.Auth.js
        var deviceType = 'mo'
        var returnUrl = 'auth-to-change';
        var authIncomingPage = '/mypage/form/info/auth/change';

        auth.doMobileAuth({
            returnUrl: returnUrl,
            deviceType: deviceType,
            authIncomingPage: authIncomingPage
        });
    },

    // callback of nice auth popup
    callbackAuthPage: function (returnUrl) {
        if (returnUrl == 'auth-to-change')
            view.afterAuthToChange();
        else if (returnUrl == 'auth-to-withdraw')
            view.aterAuthWithDraw();
        else
            alert('인증 과정에서 오류가 발생하였습니다.');

    },

    aterAuthWithDraw: function () {
        var obj = {};
        var param = JSON.stringify(obj);

        $.post('/mypage/info/withdrawal/auth', 'post', param, function (data) {

            if (data.result) {
                location.href = '/mypage/info/withdrawal';
            } else
                alert('사용 불가능한 휴대폰 번호입니다.');
        }), function (data) {

            // TODO change alert Message
            if (data.message && data.message != '')
                alert(data.message);
            else
                alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
        }
    },

    // 휴대폰번호 변경을 위한 인증인 경우
    afterAuthToChange: function () {
        var obj = {};
        var param = JSON.stringify(obj);

        $.post('/mypage/form/info/auth/change', 'post', param, function (data) {
            if (data.result) {
                alert('정보가 변경되었습니다.');
                $('#cpNo').val(data.cpNo);
                $('#mbrNm').text(data.mbrNm);
                $('#mbrBirth').text(data.mbrBirth);

            } else
                alert('사용 불가능한 휴대폰 번호입니다.');
        }), function (data) {

            // TODO change alert Message
            if (data.message && data.message != '')
                alert(data.message);
            else
                alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
        }
    },

    // 페이지 이탈 감지 함수
    onbeforeunload: function () {
        window.onbeforeunload = function (e) {
            e.preventDefault();

            var pushRecep = $('#push_recep').is(':checked') ? 'Y' : 'N';
            var emailRecep = $('#email_recep').is(':checked') ? 'Y' : 'N';
            var smsKakaoRecep = $('#smsKakao_recep').is(':checked') ? 'Y' : 'N';

            //회원정보 변경 버튼 클릭 여부
            var modifyChk = $('#modifyChk').val();
            if (pushRecep != view.pushRecep || emailRecep != view.emailRecep || smsKakaoRecep != view.smsKakao_recep) {
                if (modifyChk != 'Y') {
                    return '';
                }
            } else {
                return;
            }
        };
    },

    /*---------------------------------------------------*/
    /*  정보 수정 fn										 */
    /*---------------------------------------------------*/
    modify: function (url) {

        // 동의정보 obj
        var arrayObj = view.createAgrObj();
        var $iframe = $('iframe').contents();
        // 회원 obj
        var obj = {
            cpNo: $('#cpNo').val(),
            mbrLgnId: $('#mbrLgnId').val(),
            zipCd: $('#zipCd').val(),
            baseAddr: $('#baseAddr').val(),
            dtlAddr: $('#dtlAddr').val(),
            pw: $iframe.find('#pw').val(),
            newPw: $iframe.find('#newPw').val(),
            subPw: $iframe.find('#subPw').val(),
            memberAgrVoList: arrayObj
        }

        var param = JSON.stringify(obj);

        $.post(url, 'POST', param, function (data) {

            if (data.result) {
                alert("수정완료되었습니다.");
                $('#modifyChk').val('Y');
                location.reload();
            } else {
                alert("회원정보 수정을 실패했습니다.");
            }

            $.hideMask();

        }), function (data) {
            alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
            $.hideMask();
        }
    },
    changePw: function () {
        $('#pop').attr('href', 'modifyPW.do');
        subwayCommon.popupValidation($('#pop'), 1000);
    },

    onloadAgrEvent: function() {
        if (view.pushRecep == 'Y') {
            $('#push_recep').prop('checked', true);
        } else {
            $('#push_recep').prop('checked', false);
        }
        if (view.emailRecep == 'Y') {
            $('#email_recep').prop('checked', true);
        } else {
            $('#email_recep').prop('checked', false);
        }
        if (view.smsKakaoRecep == 'Y') {
            $('#smsKakao_recep').prop('checked', true);
        } else {
            $('#smsKakao_recep').prop('checked', false);
        }
    }
}

$(document).ready(function () {
    view.init();
});
$(window).load(function () {
    view.onloadAgrEvent();
});

function closeIFrame() {
    $('body').css('overflow-y', 'auto')
    $('.popup_iframe_wrapper').remove();
    $('.popup_dim').remove();
}

function writeIFrame() {
    var flag = true;
    var $iframe = $('iframe').contents();

    var pw = $iframe.find('#pw');
    var newPw = $iframe.find('#newPw');
    var subPw = $iframe.find('#subPw');

    if (pw.val() == null || pw.val() == '') {
        $iframe.find('#wrong-msg-pw').html('현재 비밀번호를 입력해 주세요.');
        newPw.val('');
        $('#pw').focus();
        flag = false;
        // alert('비밀번호 양식을 맞춰주세요.');
        return flag;
    }

    if (newPw.val() == null || newPw.val() == '') {
        $iframe.find('#wrong-msg-newPw').text('새 비밀번호를 입력해 주세요.');
        flag = false;
        // alert('비밀번호 양식을 맞춰주세요.');;
        return flag;
    }

    if (newPw.val().length < 8) {
        $iframe.find('#wrong-msg-newPw').text('암호는 8자 이상이어야 합니다.');
        flag = false;
        // alert('비밀번호 양식을 맞춰주세요.');;
        return flag;
    }

    if (!/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]){8,}/.test(newPw.val())) {
        $iframe.find('#wrong-msg-newPw').text('영문+숫자+특수문자 조합 8자리 이상 입력해 주세요.');
        flag = false;
        // alert('비밀번호 양식을 맞춰주세요.');;
        return flag;
    }

    if (/(\w)\1\1/.test(newPw.val()) || /([\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])\1\1/.test(newPw.val()) || /([가-힣ㄱ-ㅎㅏ-ㅣ\x20])\1\1/.test(newPw.val())) {
        $iframe.find('#wrong-msg-newPw').text('3자리 이상 문자가 반복될수 없습니다.');
        flag = false;
        // alert('비밀번호 양식을 맞춰주세요.');;
        return flag;
    }

    // #201119 공백 체크
    if (newPw.val().length != newPw.val().replace(/\s/g, "").length) {
        $iframe.find('#wrong-msg-newPw').text('새 비밀번호에 공백이 있습니다.');
        flag = false;
        //alert('비밀번호 양식을 맞춰주세요.');
        return flag;
    }

    if (pw.val() == newPw.val()) {
        $iframe.find('#wrong-msg-newPw').text('현재 비밀번호와 다르게 입력해 주세요.');
        newPw.val('');
        subPw.val('');

        flag = false;
        return flag;
    }

    if (newPw.val() != subPw.val()) {
        $iframe.find('#wrong-msg-subPw').text('새 비밀번호와 일치 하지 않습니다.');
        flag = false;
        // alert('비밀번호 양식을 맞춰주세요.');;
        return flag;
    }

    if (flag) {
        view.modify('/mypage/form/pw/modify');
    }
    /* else {
        alert('비밀번호 양식을 맞춰주세요.');
    }*/
}