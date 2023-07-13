let checkEmail = false;

function enableSubmit() {
    if (checkEmail) {
        $("#find_id").removeAttr("disabled");
    } else {
        $("#find_id").attr("disabled", "");
    }
}

// 이메일 인증 버튼 클릭 이벤트 처리
$("#checkEmailBtn").click(function() {


    var email = $("#inputEmail").val();
    // 이메일이 빈값인 경우 처리
    if (!email) {
        alert("이메일 주소를 입력해주세요.");
        return; //이메일 비어있으면 함수 실행 중단
    }

    // 인증하기 버튼을 클릭하면 인증번호 입력 칸과 확인 버튼을 나타내고, 인증하기 버튼은 숨김 ,다시하기 버튼이 출력
    $("#inputVerificationCode").show();
    $("#verifyEmailBtn").show();
    $("#checkEmailBtn").hide();
    $("#recheck-EmailBtn").show();
        // 이메일 전송 요청
        $.ajax({
            url: "/member/members/mail",
            method: "POST",
            data: {
                email: email
            },
            success: function(response) {
                // 이메일 전송 성공 시 처리
                $("#inputEmail").prop("disabled", true);
                $("#verifyEmailBtn").hide();
                $("#verifyCodeBtn").show();
            },
            error: function() {
                // 에러 처리 로직 추가
            }
        });

});

// 확인 버튼 클릭 시 동작
$("#verifyEmailBtn").click(function() {
    // 인증 확인 버튼을 클릭하면 인증번호 입력 칸과 확인 버튼을 숨기고, 인증 완료 메시지를 나타냄
    //    $("#inputVerificationCode").hide();
    //    $("#verifyEmailBtn").hide();

    $("#verificationSuccessText").show();
});


// 확인 버튼 클릭 이벤트 처리
$("#verifyEmailBtn").click(function() {
    var enteredCode = $("#verificationCode").val();
    if (!enteredCode) {
        return;
    }
        // 이메일 전송 요청
        $.ajax({
            url: "/member/members/mailCheck",
            method: "POST",
            data: {
                enteredCode: enteredCode
            },
            success: function(response) {
                var authentication = response.authentication;


                if (authentication) {
                    // 인증번호 일치 시 회원 가입 진행
                    checkEmail = true;
                    enableSubmit();

                    alert("인증이 완료되었습니다.");
                } else {
                    alert("인증번호가 일치하지 않습니다. 다시 확인해 주세요.");
                }
            }

        });

});


function findId_click(){
    var name=$('#name').val()
    var email=$('#inputEmail').val()

    $.ajax({
        url:"./findId",
        type:"POST",
        data:{"name":name, "email":email} ,
        success:function(data){
            if(data == 0){
                $('#find-div').show();
                $('#id_value').text("회원 정보를 확인해주세요!");
                $('#name').val('');
                $('#email').val('');
            } else {
                $('#find-div').show();
                $('#id_value').text('ID : ' + data);
                $('#name').val('');
                $('#email').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
};

//이메일 유효성 검사
function validateEmail(email) {
    // 이메일 유효성 검사 정규식
    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    return emailRegex.test(email);
}


$("#checkEmailBtn").click(function() {
    var email = $("#inputEmail").val();

    if (!validateEmail(email)) {
        // 이메일 유효성 검사 실패
        alert("올바른 이메일 주소를 입력해주세요.");
        return;
    }
    // 버튼 및 인증번호 입력란 처리
    $("#recheck-EmailBtn").remove();
    $("#inputVerificationCode").show();
});

// 인증 확인 버튼 클릭 이벤트 처리
$("#verifyEmailBtn").click(function() {
    var enteredCode = $("#verificationCode").val();
    if (enteredCode) {
        // 이메일 인증 로직 진행
        // ...

        // 인증번호 일치 시 처리
        $("#inputVerificationCode").hide();
        $("#verificationSuccessText").show();
    }
});

