detailView();
const bucketUrl = document.querySelector("#bucketUrl").value;

function detailView() {
    const url = window.location.href;
    const noticeId = url.substring(url.lastIndexOf("/") + 1);

    fetch(`/api/notices/${noticeId}`)
        .then(response => response.json())
        .then(data => {
            const notice = data.notice;
            const prevId = data.prevNotice;
            const nextId = data.nextNotice;

            const titleInput = document.querySelector('#title');
            titleInput.value = notice.title;

            const writerInput = document.querySelector('#writer');
            writerInput.value = notice.modifierId;

            const createdInput = document.querySelector('#created');
            const options = {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
            };
            createdInput.value = new Date(notice.modified).toLocaleString('ko-KR', options);

            const contentTextarea = document.querySelector('#content');
            contentTextarea.value = notice.content;

            const fileNameContainer = document.querySelector('#file-name');

            if (data.notice.fileName.length === 0) {
                fileNameContainer.classList.add('d-none');
            } else {
                data.notice.fileName.forEach(fileName => {
                    const fileLink = document.createElement('a');
                    fileLink.href = `${bucketUrl}/notice/${noticeId}/${fileName}`;
                    fileLink.textContent = fileName;
                    fileLink.classList.add('form-control');

                    fileNameContainer.appendChild(fileLink);
                });
            }

            const prev = document.querySelector('#prev');

            if (prevId === parseInt(noticeId)) {
                prev.addEventListener("click", function () {
                    alert("이전글이 없습니다.");
                });
            } else {
                prev.href = `/customer/notice/${prevId}`;
            }

            const next = document.querySelector('#next');

            if (nextId === parseInt(noticeId)) {
                next.addEventListener("click", function () {
                    alert("다음글이 없습니다.");
                });
            } else {
                next.href = `/customer/notice/${nextId}`;
            }

        })
        .catch(error => {
            console.error("Error:", error);
        });
}

const removeBtn = document.querySelector("#remove-btn");
removeBtn.addEventListener("click", function () {
    const url = window.location.href;
    const noticeId = url.substring(url.lastIndexOf("/") + 1);

    fetch(`/api/notices/${noticeId}`, {
            method: "DELETE"
        })
        .then(response => {
                if (response.status === 200) {
                    // 수정이 성공한 경우
                    location.href = "/customer/notice/list";
                    alert("삭제 되었습니다");
                } else {
                    location.href = `/customer/notice/${noticeId}`;
                    alert("삭제 실패하였습니다.");
                }
            }
        )
        .catch(error => {
            console.error("Error:", error);
        });
});