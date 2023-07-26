modifyView();
const bucketUrl = document.querySelector("#bucketUrl").value;

function modifyView() {
    const url = window.location.href;
    const noticeId = url.substring(url.lastIndexOf("/") + 1);
    fetch(`/api/notices/${noticeId}`)
        .then(response => response.json())
        .then(data => {
            const notice = data.notice;

            const titleInput = document.querySelector('#title');
            titleInput.value = notice.title;

            const writerInput = document.querySelector('#writer');
            writerInput.value = notice.modifierId;

            const createdInput = document.querySelector('#created');
            const options = {
                year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit',
            };
            createdInput.value = new Date(notice.modified).toLocaleString('ko-KR', options);

            const contentTextarea = document.querySelector('#content');
            contentTextarea.value = notice.content;

            const fileNameContainer = document.querySelector('#file-name');

            if (data.notice.fileName.length === 0) {
                fileNameContainer.classList.add('d-none');
            } else {
                data.notice.fileName.forEach(fileName => {
                    // 새로운 <div> 요소 생성
                    var div = document.createElement("div");
                    div.className = "form-check form-switch";

                    // 새로운 <input> 요소 생성
                    var input = document.createElement("input");
                    input.className = "form-check-input";
                    input.type = "checkbox";
                    input.role = "switch";
                    input.id = "removeCheckBox";
                    input.name = "removeFiles";
                    input.value = fileName;

                    // 새로운 <label> 요소 생성
                    var label = document.createElement("label");
                    label.className = "form-check-label";
                    label.htmlFor = "removeCheckBox";

                    // 새로운 <i> 요소 생성
                    var icon = document.createElement("i");
                    icon.className = "fa-solid fa-trash-can";
                    icon.style.color = "red";

                    // <i> 요소를 <label> 요소에 추가
                    label.appendChild(icon);

                    // <input> 요소를 <div> 요소에 추가
                    div.appendChild(input);

                    // <label> 요소를 <div> 요소에 추가
                    div.appendChild(label);

                    // 생성한 <div> 요소를 원하는 위치에 추가
                    fileNameContainer.appendChild(div);

                    const fileLink = document.createElement('a');
                    fileLink.href = `${bucketUrl}/${noticeId}/${fileName}`;
                    fileLink.textContent = fileName;
                    fileLink.classList.add('form-control');
                    fileLink.download = `${fileName}`;

                    fileNameContainer.appendChild(fileLink);
                });
            }
        })
        .catch(error => {
            console.error("Error:", error);
        });
}

const updateBtn = document.querySelector("#update-btn");
updateBtn.addEventListener("click", function () {
    const url = window.location.href;
    const noticeId = url.substring(url.lastIndexOf("/") + 1);

    const checkboxes = document.querySelectorAll("[name=removeFiles]");

    const removeFiles = [];

    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            removeFiles.push(checkboxes[i].value);
        }
    }

    const formData = new FormData();

    const fileInput = document.querySelector("#formFile");
    const files = fileInput.files;

    for (let i = 0; i < files.length; i++) {
        formData.append("files", files[i]);
    }

    formData.append("removeFiles", removeFiles);
    formData.append("noticeId", noticeId);
    formData.append("title", document.querySelector("#title").value);
    formData.append("content", document.querySelector("#content").value);

    fetch(`/api/notices/${noticeId}`, {
        method: "POST",
        headers: {},
        body: formData
    })
        .then(response => {
            if (response.status === 200) {
                // 수정이 성공한 경우
                location.href = `/customer/notice/${noticeId}`;
                alert("수정이 완료되었습니다.");
            } else {
                location.href = `/customer/notice/modify/${noticeId}`;
                alert("수정에 실패하였습니다.");
            }
        })
        .catch(error => {
            console.error("Error:", error);
        });
});
