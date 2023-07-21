const mailCheckBtn = document.querySelector("#mail-check-btn");
const emailText = document.querySelector("#email-text");

const memberInput = document.querySelector("#member-id-input");

mailCheckBtn.addEventListener("click", function () {
    const memberId = memberInput.value;
    fetch(`/api/login/locked?memberId=${memberId}`, {
        method: "GET",
    })
        .then(response => response.json())
        .then(data => {
            //이메일 있는지 확인
            const status = data.status;
            if (status === 'notFound') {
                emailText.classList.remove("d-none");
                emailText.classList.remove("text-primary");
                emailText.classList.add("text-danger");
                emailText.innerHTML = "존재하지 않는 회원 입니다.";
            } else {
                //있는지 확인 후 처리
                const email = data.email;

                fetch("/api/login/locked/send-email", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({email: email})
                })
                    .then(response => response.json())
                    .then(data => {
                        const message = data.message;

                        if (message === 'success') {
                            emailText.classList.remove("d-none");
                            emailText.classList.remove("text-danger");
                            emailText.classList.add("text-primary");
                            emailText.innerHTML = "입력하신 아이디의 등록된 이메일로 인증번호가 발송되었습니다 확인해주세요.";
                        } else {
                            alert("메일전송에 문제가 발생했습니다. 관리자에게 문의해주세요");
                        }
                    })
                    .catch(error => {
                        console.log("error발생: " + error);
                    })
            }
        })
        .catch(error => {
            console.log("error발생: " + error);
        })
});

const authCodeCheck = document.querySelector("#auth-code-check");
const mailConfirmInput = document.querySelector("#mail-confirm");

authCodeCheck.addEventListener("click", function () {
    const inputAuthCode = mailConfirmInput.value;
    const memberId = memberInput.value;
    console.log(inputAuthCode);
    fetch("/api/login/locked/verification", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            inputAuthCode: inputAuthCode,
            memberId: memberId
        })
    })
        .then(response => response.json())
        .then(data => {
            const message = data.message;
            if (message === 'success') {
                alert("활성화되었습니다. 로그인창으로가서 로그인해주세요")
                location.href = "/login";
            } else {
                alert("인증에 실패하였습니다. 다시한번 시도해주세요");
                location.href = "/login/locked";
            }
        })
        .catch(error => {
            console.log("error발생: " + error);
        })
});
