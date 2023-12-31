let password_check = true;
let searchEmail = true;
let checkEmail = true;
let checkphoneNumber = true;
let password = true;

//===============================유효성 모두 완료되면 수정 가능=======================================
function modiEnableSubmit() {
    if (password_check && searchEmail && checkEmail && checkphoneNumber) {
        $("#modify-Button").removeAttr("disabled").css("cursor", "pointer");
    } else {
        $("#modify-Button").attr("disabled", "");
    }
}

//==============================비밀번호 유효성검사 ==============================================
$("#input-password").keyup(function() {
    let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    password_check = false;

    if ($("#input-password").val() == "") {
        $("#pwdcheck-blank1").css("color", "red");
        $("#pwdcheck-blank1").text("패스워드를 입력해주세요.");
        password = false;
        modiEnableSubmit();
    }
    else if (!pwdCheck.test($("#input-password").val())) {
        $("#pwdcheck-blank1").css("color", "red");
        $("#pwdcheck-blank1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
        password = false;
        modiEnableSubmit();
    }else {
        $("#pwdcheck-blank1").css("color", "blue");
        $("#pwdcheck-blank1").text("사용 가능한 비밀번호 입니다. 비밀번호를 확인해주세요");
        password = true;
        modiEnableSubmit();
    }


});

//==============================비밀번호 확인 ==============================================
$("#password-check").blur(function() {

    password_check = false;
    if($("#password-check").val() === "") {
        $("#pwdcheck-blank2").css("color", "red");
        $("#pwdcheck-blank2").text("패스워드를 입력해주세요.");
        password_check = false;
        modiEnableSubmit();
    }
    else if(password === true && $("#input-password").val() === $("#password-check").val()) {
        $("#pwdcheck-blank2").css("color", "blue");
        $("#pwdcheck-blank2").text("비밀번호가 일치합니다.");
        password_check = true;
        modiEnableSubmit();
    }else {
        $("#pwdcheck-blank2").css("color", "red");
        $("#pwdcheck-blank2").text("비밀번호를 다시 확인해주세요.");
        $("#password-check").val("");
        password_check = false;
        modiEnableSubmit();
    }

});

//===========================폰 유효성 검사 =====================================

//회원가입 불가 해제
$("#totalphone-num").keyup(function() {
    // 전화번호 재입력시
    checkphoneNumber = false;
    console.log(checkphoneNumber)
    $("#checkPhoneNumBtn").prop("disabled", true);
    $("#availablePhoneNumMessage").addClass("d-none");
    $("#notAvailablePhoneNumMessage").addClass("d-none");
    const pn = $("#totalphone-num").val();
    const phoneNumberRegex = /^\d{3}\d{3,4}\d{4}$/;
    if (phoneNumberRegex.test(pn)) {
        let formattedPhoneNumber = "";
        $("#checkPhoneNumBtn").prop("disabled", false);
        if (pn.length === 10) {
            formattedPhoneNumber = pn.substring(0, 3) + "-" + pn.substring(3, 6) + "-" + pn.substring(6);
        } else if (pn.length === 11) {
            formattedPhoneNumber = pn.substring(0, 3) + "-" + pn.substring(3, 7) + "-" + pn.substring(7);
        }

        $("#phone-num").val(formattedPhoneNumber);
    }else {
        $("#checkPhoneNumBtn").prop("disabled", true);
    }
    modiEnableSubmit();
});

$("#checkPhoneNumBtn").click(function() {
    const userphoneNum = $("#totalphone-num").val();


    // 입력한 ID와 ajax 요청 보내서
    $.ajax("/members/checkphoneNumber/" + userphoneNum, {
        success: function(data) {

            if (data.available) {
                // 사용 가능하다는 메세지 출력
                $("#availablePhoneNumMessage").removeClass("d-none");
                $("#notAvailablePhoneNumMessage").addClass("d-none");
                checkphoneNumber = true;
            } else {
                // 사용 가능하지 않다는 메세지 출력
                $("#availablePhoneNumMessage").addClass("d-none");
                $("#notAvailablePhoneNumMessage").removeClass("d-none");
                checkphoneNumber = false;
            }
        },
        complete: modiEnableSubmit
    })
});

//================================ 이메일 중복 확인 =====================================

$("#search-email").click(function() {
    const userEmail = $("#totalemail").val();

    // 이메일이 비어있는 경우에는 중복 확인 버튼 동작하지 않도록 처리
    if (userEmail == "") {
        alert("이메일 주소를 입력해주세요.");
        return;
    }

    // 입력한 ID와 ajax 요청 보내서
    $.ajax("/members/searchMail", {
        method: "post",
        data: {
            email: userEmail
        },
        success: function(data) {

            if (data.available) {
                // 사용 가능하다는 메세지 출력
                $("#availableEmailMessage").removeClass("d-none");
                $("#notAvailableEmailMessage").addClass("d-none");
                $("#search-email").hide();
                $("#checkEmailBtn").show();
                searchEmail = true;
                checkEmail = false;
            } else {
                // 사용 가능하지 않다는 메세지 출력
                $("#availableEmailMessage").addClass("d-none");
                $("#notAvailableEmailMessage").removeClass("d-none");
                searchEmail = false;
                checkEmail = false;
            }
        },
        complete: modiEnableSubmit
    })
});

//================================ 이메일 인증 =========================================
// 이메일 인증 버튼 클릭 이벤트 처리
$("#totalemail").keyup(function (){
    searchEmail = false;
    modiEnableSubmit();
});
$("#checkEmailBtn").click(function() {
    // 인증하기 버튼을 클릭하면 인증번호 입력 칸과 확인 버튼을 나타내고, 인증하기 버튼은 숨김
    $("#inputVerificationCode").removeAttr("style");
    $("#verifyEmailBtn").show();
    $("#checkEmailBtn").hide();

    var email = $("#totalemail").val();
    if (email) {
        // 이메일 전송 요청
        $.ajax({
            url: "/members/mail",
            method: "POST",
            data: {
                email: email
            },
            success: function(response) {
                // 이메일 전송 성공 시 처리
                $("#totalemail").prop("disabled", true);
                $("#verifyEmailBtn").hide();
                $("#inputVerificationCode").removeAttr("style");
                $("#verifyCodeBtn").show();
            },
            error: function() {
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
            url: "/members/mailCheck",
            method: "POST",
            data: {
                enteredCode: enteredCode
            },
            success: function(response) {
                var authentication = response.authentication;
                console.log("authentication => " + authentication);

                if (authentication) {
                    // 인증번호 일치 시 회원 가입 진행
                    checkEmail = true;
                    $("#verificationSuccessText").show();
                    modiEnableSubmit();
                    alert("인증이 완료되었습니다.");
                } else {
                    alert("인증번호가 일치하지 않습니다. 다시 확인해 주세요.");
                }
            }

        });
    }
});

