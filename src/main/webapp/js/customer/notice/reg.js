const regBtn = document.querySelector("#reg-btn");
regBtn.addEventListener("click", function () {
    const formData = new FormData();

    const fileInput = document.querySelector("#formFile");
    const files = fileInput.files;

    for (let i = 0; i < files.length; i++) {
        formData.append("files", files[i]);
    }

    formData.append("title", document.querySelector("#title").value);
    formData.append("content", document.querySelector("#content").value);

    console.log(formData);

    fetch(`/api/notices`, {
        method: "POST",
        headers: {},
        body: formData
    })
        .then(response => {
            location.href = "/customer/notice/list"
        })
        .catch(error => {
            console.error("Error:", error);
        });
});