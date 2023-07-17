let checkEmail = false;

function enableSubmit() {
    if (checkEmail) {
        $("#checkBtn").removeAttr("disabled");
    } else {
        $("#checkBtn").attr("disabled", "");
    }
}

// 이메일 인증 버튼 클릭 이벤트 처리
$("#checkEmailBtn").click(function() {
    // 인증하기 버튼을 클릭하면 인증번호 입력 칸과 확인 버튼을 나타내고, 인증하기 버튼은 숨김
    $("#inputVerificationCode").removeAttr("style");
    $("#verifyEmailBtn").show();
    $("#checkEmailBtn").hide();

    var email = $("#inputEmail").val();
    if (email) {
        // 이메일 전송 요청
        $.ajax({
            url : "/member/members/mail",
            method : "POST",
            data : {
                email : email
            },
            success : function(response) {
                // 이메일 전송 성공 시 처리
                $("#inputEmail").prop("disabled", true);
                $("#verifyEmailBtn").hide();
                $("#inputVerificationCode").removeAttr("style");
                $("#verifyCodeBtn").show();
            },
            error : function() {
                // 에러 처리 로직 추가
            }
        });
    }
});

// 확인 버튼 클릭 이벤트 처리
$("#verifyEmailBtn").click(function() {
    var enteredCode = $("#verificationCode").val();
    if (enteredCode) {
        // 이메일 전송 요청
        $.ajax({
            url : "/member/members/mailCheck",
            method : "POST",
            data : {
                enteredCode : enteredCode
            },
            success : function(response) {
                var authentication = response.authentication;

                if (authentication) {
                    // 인증번호 일치 시 회원 가입 진행
                    alert("인증이 완료되었습니다.");
                    checkEmail = true;
                    $("#verificationSuccessText").css("color","blue");
                    $("#verificationSuccessText").show();
                    enableSubmit()
                } else {
                    alert("인증번호가 일치하지 않습니다. 다시 확인해 주세요.");
                }
            }

        });
    }
});

function checkPwClick() {
    var id = $('#member-id').val()
    var email = $('#inputEmail').val()

    $.ajax({
        url : "./sendPw",
        type : "POST",
        data : {
            "id" : id,
            "email" : email
        },
        success : function(data) {
            if (data) {
                $('#id_value').text("회원 정보를 확인해주세요!");
                $('#member-id').val('');
                $('#email').val('');
                alert("입력하신 메일로 임시 비밀번호가 발송되었습니다!!")
            } else {
                $('#id_value').text(data);
                $('#member-id').val('');
                $('#email').val('');

            }
        },
        error : function() {

            alert("에러입니다");
        }
    });
};