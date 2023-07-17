const closeBtn = document.querySelector("#close-btn");

closeBtn.addEventListener("click", function () {
    window.close();
});

const submitBtn = document.querySelector("#submit-btn");

submitBtn.addEventListener("click", function () {
    const formData = new FormData();

    const fileInput = document.querySelector("#form-file");
    const files = fileInput.files;

    for (let i = 0; i < files.length; i++) {
        formData.append("files", files[i]);
    }

    formData.append("age", document.querySelector("#age").value);
    formData.append("postingId", document.querySelector("#posting-id").value);
    formData.append("education", document.querySelector("#education").value);
    formData.append("experience", document.querySelector("#experience").value);

    fetch(`/api/user/posting/application`, {
        method: "POST",
        headers: {},
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            if (data.status) {
                alert("입사지원신청이 완료되었습니다.");
                window.close();
            } else {
                alert("입사지원신청이 실패하였습니다. 담당자에게 쪽지로 문의해주세요");
                window.close();
            }
        })
        .catch(error => {
            console.error("Error:", error);
        });
});




