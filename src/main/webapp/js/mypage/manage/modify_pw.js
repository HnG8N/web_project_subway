var view = {
    // 초기화 여부
    checkAuth: false,

    init: function () {
        // 이벤트 바인딩
        view.bindEvent();
        $('.pw_check').hide();
    },

    /*---------------------------------------------------*/
    /*  초기화 함수										 */
    /*---------------------------------------------------*/
    bindEvent: function () {
        // 비밀번호 수정 버튼 클릭 시
        /*$('#pwInfo').on('click', function () {
            view.modify();
        });*/

        // 비밀번호 입력 시 실시간 검증
        //$('.input_pw').on('keyup', function (e) {
        $('#newPw').on('keyup', function (e) {
            var flag = false;
            var inputPwDiv = $(this).closest('.input_pw_div');
            var worngMsgElm = $(this).closest('.input_pw_div').find('.pw_check');

            if ($(this).val() == null || $(this).val() == '') {
                $(worngMsgElm).text('비밀번호를 입력해주세요.');
                $(worngMsgElm).show();
                flag = false;
            } else if ($(this).val().length < 8) {
                $(worngMsgElm).text('영문(대문자+소문자)+숫자+특수문자를 포함한 8자 이상을 입력해주세요.');
                $(worngMsgElm).show();
                flag = false;
            } else if (!/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]){8,}/.test($(this).val())) {
                $(worngMsgElm).text('영문(대문자+소문자)+숫자+특수문자를 포함한 8자 이상을 입력해주세요.');
                $(worngMsgElm).show();
                flag = false;
            } else if (/(\w)\1\1/.test($(this).val()) || /([\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])\1\1/.test($(this).val()) || /([가-힣\x20])\1\1/.test($(this).val())) {
                $(worngMsgElm).text('3자 이상 동일 문자를 사용할 수 없습니다.');
                $(worngMsgElm).show();
                flag = false;
            } else if ($(this).val() == $("#pw").val()) {
                $(worngMsgElm).text('현재 비밀번호와 동일합니다.');
                $(worngMsgElm).show();
                flag = false;
            } else {
                $(inputPwDiv).find('dl').addClass('true_v');
                $(worngMsgElm).text('사용할 수 있는 비밀번호입니다.');
                $(worngMsgElm).show();
                $('#subPw').attr("readonly", false);
                flag = true;
            }

            return flag;
        });

        // 확인 비밀번호 입력 시 일치 여부 검증
        $('#subPw').on('keyup', function (e) {
            var flag = false;
            var inputPwDiv = $(this).closest('.input_pw_div');
            var worngMsgElm = $(this).closest('.input_pw_div').find('.pw_check');

            if ($('#subPw').val() != null && $('#subPw').val() != '') {
                if ($('#newPw').val() != $('#subPw').val()) {
                    inputPwDiv.find('dl').removeClass('true_v');
                    worngMsgElm.text('비밀번호가 일치하지 않습니다.');
                    worngMsgElm.show();
                    flag = false;
                } else {
                    if ($('#newPw').val() != null && $('#newPw').val() != '') {
                        inputPwDiv.find('dl').addClass('true_v');
                        worngMsgElm.hide();
                        flag = true;
                    }
                }
            }

            return flag;
        });

        // 현재 비밀번호 입력 시 오류 메시지 숨김
        $('#pw').on('keyup', function (e) {
            if ($("#pw").val() != null && $("#pw").val() != '') {
                if (!$("#pw").closest('.input_set').find('.pw_check').is(':hidden')) {
                    $("#pw").closest('.input_set').find('.pw_check').hide();
                }
            }
        });
    },

    /*---------------------------------------------------*/
    /*  비밀번호 변경 함수									 */
    /*---------------------------------------------------*/
    modify: function () {
        // 유효성 검사
        if (!view.validation())
            return false;

        // 서버 전송 (주석 처리된 부분)
        /*var obj = {
            pw: $('#pw').val(),
            newPw: $('#newPw').val(),
            subPw: $('#subPw').val(),
            cpNo: $('#cpNo').val(),
        }
        var param = JSON.stringify(obj);

        $.post('/mypage/form/pw/modify', 'POST', param, function (data) {
            if (data.result) {
                alert("비밀번호가 성공적으로 변경되었습니다.");
                parent.closeIFrame();
            } else {
                alert("비밀번호 변경에 실패하였습니다.");
            }
            $.hideMask();
        }), function (data) {
            alert("서버 오류로 인해 처리되지 않았습니다.\n나중에 다시 시도해 주세요.");
            $.hideMask();
        }*/
    },

    // 유효성 검사
    validation: function () {
        var flag = true;

        // 현재 비밀번호 체크
        if ($("#pw").val() == 'undefined' || $("#pw").val() == '') {
            $("#pw").closest('.input_set').find('.pw_check').text("현재 비밀번호를 입력해주세요.");
            $("#pw").closest('.input_set').find('.pw_check').show();

            $("#pw").focus();
            flag = false;
            return;
        }

        // 현재 비밀번호와 새로운 비밀번호가 같을 경우
        if ($("#newPw").val() != null && $("#newPw").val() != '' && $("#pw").val() == $("#newPw").val()) {
            $("#newPw").closest('.input_pw_div').find('.pw_check').text("현재 비밀번호와 동일합니다.");
            $("#newPw").closest('.input_pw_div').find('.pw_check').show();

            $("#newPw").val('');
            $("#subPw").val('');

            $("#newPw").focus();
            flag = false;
            return;
        }

        return flag;
    }
}

$(document).ready(function () {
    view.init();
});
