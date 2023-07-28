let checkId = false;
let password_check = false;
let name = false;
let gender = false;
let searchEmail = false;
let checkEmail = false;
let checkphoneNumber = false
let checkAgree = false;
//===============================유효성 모두 완료되면 가입가능======================================
function enableSubmit() {
    if (checkId && password_check && name && gender && searchEmail && checkEmail && checkphoneNumber && checkAgree) {
        $("#signup-submit").removeAttr("disabled").css("cursor", "pointer");
        $("#need-sign").hide();
    } else {
        $("#signup-submit").attr("disabled", "");
        $("#need-sign").show();
    }
}
//==============================아이디 유효성검사 ================================================
$("#input-id").blur(function (){
    let idCheck = /^(?=.*[a-zA-Z])[a-zA-Z0-9]{6,20}$/;

    if($("#input-id").val() == "") {
        $("#idcheck-blank").css("color", "red");
        $("#idcheck-blank").text("! 아이디는 필수 입력");
        id = false;
        enableSubmit();
    }else if(!idCheck.test($("#input-id").val())) {
        $("#idcheck-blank").css("color", "red");
        $("#idcheck-blank").text("! 영문 또는 영문 숫자 조합하여 6~20자만 가능");
        id = false;
        enableSubmit();
    }else {
        $("#idcheck-blank").css("color", "blue");
        $("#idcheck-blank").text("사용 가능한 아이디입니다. 중복확인을 해주세요.");
        id = true;
        enableSubmit();
    }
    if(id == true) {
        $("#id-Confirm").show();
    }else {
        $("#id-Confirm").hide();
    }
});

//==============================아이디 중복검사 ==============================================
$("#id-Confirm").click(function() {
    const member_id = $("#input-id").val();
    if (member_id == "") {
        alert("아이디를 입력해주세요.");
    } else {
        $.ajax({
            url: "/members/checkId/" + member_id,
            type: "get",
            success: function(data) {
                if (data.available) {
                    $("#idcheck-blank").css("color", "blue");
                    $("#idcheck-blank").text("사용가능한 아이디입니다.");
                    checkId = true;
                } else {
                    $("#idcheck-blank").css("color", "red");
                    $("#idcheck-blank").text("! 중복된 아이디입니다.");
                    checkId = false;
                }
            },
            error: function() {
                alert("오류가 발생했습니다. 다시 시도해주세요.");
            }
            ,complete: enableSubmit
        });
    }
});

//==============================비밀번호 유효성검사 ==============================================
$("#input-password").blur(function() {
    let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

    if ($("#input-password").val() == "") {
        $("#pwdcheck-blank1").css("color", "red");
        $("#pwdcheck-blank1").text("! 패스워드를 입력해주세요.");
        password = false;
    }
    else if (!pwdCheck.test($("#input-password").val())) {
        $("#pwdcheck-blank1").css("color", "red");
        $("#pwdcheck-blank1").text("! 비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
        password = false;
    }else {
        $("#pwdcheck-blank1").css("color", "blue");
        $("#pwdcheck-blank1").text("사용 가능한 비밀번호 입니다. 비밀번호를 확인해주세요");
        password = true;
    }


});

//==============================비밀번호 확인 ==============================================
$("#password-check").blur(function() {
    if($("#password-check").val() == "") {
        $("#pwdcheck-blank2").css("color", "red");
        $("#pwdcheck-blank2").text("! 패스워드를 입력해주세요.");
        password_check = false;
        enableSubmit();
    }
    else if(password == true && $("#input-password").val() == $("#password-check").val()) {
        $("#pwdcheck-blank2").css("color", "blue");
        $("#pwdcheck-blank2").text("비밀번호가 일치합니다.");
        password_check = true;
        enableSubmit();
    }else {
        $("#pwdcheck-blank2").css("color", "red");
        $("#pwdcheck-blank2").text("! 비밀번호를 다시 확인해주세요.");
        $("#password-check").val("");
        password_check = false;
        enableSubmit();
    }

});

//==============================이름 확인 ==============================================
$("#input-name").blur(function() {
    let nameCheck = /^[a-zA-Z가-힣]{2,20}$/;

    if ($("#input-name").val() == "") {
        $("#namecheck-blank").css("color", "red");
        $("#namecheck-blank").text("! 이름은 필수 입력입니다.");
        name = false;
        enableSubmit();
    } else if (!nameCheck.test($("#input-name").val())) {
        $("#namecheck-blank").css("color", "red");
        $("#namecheck-blank").text("! 이름은 한글 또는 영어로 이루어져야 하며, 2자에서 20자 사이여야 합니다.");
        name = false;
        enableSubmit();
    } else {
        $("#namecheck-blank").css("color", "blue");
        $("#namecheck-blank").text("유효한 이름입니다.");
        name = true;
        enableSubmit();
    }
});

//================================성 별 =========================================

$("#input-gender-m").change(function (){
    gender = true;
    enableSubmit();
})

$("#input-gender-w").change(function (){
    gender = true;
    enableSubmit();
})
//================================연락처=========================================
function maxLengthCheck(object){
    if (object.value.length > object.maxLength) {
        object.value = object.value.slice(0, object.maxLength);
    }
}

//폰 번호 합치기
$("#phoneNum1").change(function (){
    phone();
});

$("#phoneNum2").change(function (){
    phone();
});
$("#phoneNum3").change(function (){
    phone();
});

function phone() {
    const phonenum = $("#phoneNum1").val();
    const firsthyphen = $("#first-hyphen").text();
    const middlenum = $("#phoneNum2").val();
    const secondhypen = $("#second-hyphen").text();
    const lastnum = $("#phoneNum3").val();
    if(phonenum != "" && middlenum != "" && lastnum != "") {
        $("#totalphone-num").val(phonenum+firsthyphen+middlenum+secondhypen+lastnum);
    }
};

//회원가입 불가 해제
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
        complete: enableSubmit
    })
});

//=============================== 메일 주소값 합치기 =================================
//이메일 주소 합치기
$("#user-email").blur(function (){
    email();
});

$("#email_address").change(function (){
    email();
});

function email() {
    const email = $("#user-email").val();
    const middle = $("#middle-email").text();
    const address = $("#email_address").val();
    if(email != "" && address != "") {
        $("#totalemail").val(email+middle+address);
    }
};

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
            } else {
                // 사용 가능하지 않다는 메세지 출력
                $("#availableEmailMessage").addClass("d-none");
                $("#notAvailableEmailMessage").removeClass("d-none");
                searchEmail = false;
            }
        },
        complete: enableSubmit
    })
});

//================================ 이메일 인증 =========================================
// 이메일 인증 버튼 클릭 이벤트 처리
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
                    $("#verificationSuccessText").css("color" , "blue");
                    $("#verificationSuccessText").show();
                    enableSubmit();

                    alert("인증이 완료되었습니다. 회원 가입을 진행합니다.");
                } else {
                    alert("인증번호가 일치하지 않습니다. 다시 확인해 주세요.");
                }
            }

        });
    }
});

//============================회원가입 동의사항================================================
//팝업창 형태
function agree1() {
    window. open('/members/agree', '약관1', 'width=700px,height=500px,scrollbars=yes');
}

//동의 여부 유효성
$(function(){
    $("#agree1").click(function(){
        checkAgree = $(this).is(":checked");
        if(checkAgree){
            $("#agree1").prop('checked', true);
            enableSubmit();
        } else {
            $("#agree1").prop('checked', false);
            enableSubmit();
        }
    });
});