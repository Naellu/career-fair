
//==============================아이디 유효성검사 ==============================================
$("#input-id").blur(function (){
    let idCheck = /^(?=.*[a-zA-Z])[a-zA-Z0-9]{6,20}$/;

    if($("#input-id").val() == "") {
        $("#idcheck-blank").css("color", "red");
        $("#idcheck-blank").text("아이디는 필수 입력");
        id = false;
    }else if(!idCheck.test($("#input-id").val())) {
        $("#idcheck-blank").css("color", "red");
        $("#idcheck-blank").text("영문 또는 영문 숫자 조합하여 6~20자만 가능");
        id = false;
    }else {
        $("#idcheck-blank").css("color", "blue");
        $("#idcheck-blank").text("사용 가능한 아이디입니다. 중복확인을 해주세요.");
        id = true;
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
                } else {
                    $("#idcheck-blank").css("color", "red");
                    $("#idcheck-blank").text("중복된 아이디입니다.");
                }
            },
            error: function() {
                alert("오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }
});

//==============================비밀번호 유효성검사 ==============================================
$("#input-password").blur(function() {
    let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

    if ($("#input-password").val() == "") {
        $("#pwdcheck-blank1").css("color", "red");
        $("#pwdcheck-blank1").text("패스워드를 입력해주세요.");
        password = false;
    }
    else if (!pwdCheck.test($("#input-password").val())) {
        $("#pwdcheck-blank1").css("color", "red");
        $("#pwdcheck-blank1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
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
        $("#pwdcheck-blank2").text("패스워드를 입력해주세요.");
        password_check = false;
    }
    else if(password == true && $("#input-password").val() == $("#password-check").val()) {
        $("#pwdcheck-blank2").css("color", "blue");
        $("#pwdcheck-blank2").text("비밀번호가 일치합니다.");
        password_check = true;
    }else {
        $("#pwdcheck-blank2").css("color", "red");
        $("#pwdcheck-blank2").text("비밀번호를 다시 확인해주세요.");
        $("#password-check").val("");
        password_check = false;
    }
});

//==============================이름 확인 ==============================================
$("#input-name").blur(function() {
    let nameCheck = /^[a-zA-Z가-힣]{2,20}$/;

    if ($("#input-name").val() == "") {
        $("#namecheck-blank").css("color", "red");
        $("#namecheck-blank").text("이름은 필수 입력입니다.");
        name = false;
    } else if (!nameCheck.test($("#input-name").val())) {
        $("#namecheck-blank").css("color", "red");
        $("#namecheck-blank").text("이름은 한글 또는 영어로 이루어져야 하며, 2자에서 20자 사이여야 합니다.");
        name = false;
    } else {
        $("#namecheck-blank").css("color", "blue");
        $("#namecheck-blank").text("유효한 이름입니다.");
        name = true;
    }
});

//================================성 별 =========================================
function Gender() {
    const mRadioButton = $("#input-gender-m");
    const fRadioButton = $("#input-gender-w");

    if (!mRadioButton.checked && !fRadioButton.checked) {
        alert("성별을 선택해주세요.");
        return false;
    }

    return true;
}

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