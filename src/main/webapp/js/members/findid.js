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
    // 인증하기 버튼을 클릭하면 인증번호 입력 칸과 확인 버튼을 나타내고, 인증하기 버튼은 숨김
    $("#inputVerificationCode").removeClass("d-none");
    $("#verifyEmailBtn").show();
    $("#checkEmailBtn").hide();

    var email = $("#inputEmail").val();
    if (email) {
        // 이메일 전송 요청
        $.ajax({
            url: "/member/mail",
            method: "POST",
            data: {
                email: email
            },
            success: function(response) {
                // 이메일 전송 성공 시 처리
                $("#inputEmail").prop("disabled", true);
                $("#verifyEmailBtn").hide();
                $("#inputVerificationCode").removeClass("d-none");
                $("#verifyCodeBtn").show();
            },
            error: function() {
                // 에러 처리 로직 추가
            }
        });
    }
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
    if (enteredCode) {
        // 이메일 전송 요청
        $.ajax({
            url: "/member/mailCheck",
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
    }
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
                $('#id_value').text("회원 정보를 확인해주세요!");
                $('#name').val('');
                $('#email').val('');
            } else {
                $('#id_value').text(data);
                $('#name').val('');
                $('#email').val('');

            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
};

const modal = document.getElementById("modal")
const btnModal = document.getElementById("find_id")

btnModal.addEventListener("click", e => {
    modal.style.display = "flex"
})


const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})

modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
    }
})