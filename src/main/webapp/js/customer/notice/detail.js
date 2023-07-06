detailView();
const bucketUrl = document.getElementById("bucketUrl").value;

function detailView() {
    const url = window.location.href;
    const noticeId = url.substring(url.lastIndexOf("/") + 1);

    fetch(`/api/notices/${noticeId}`)
        .then(response => response.json())
        .then(data => {
            const notice = data.notice;
            const prevId = data.prevNotice;
            const nextId = data.nextNotice;

            const titleInput = document.getElementById('title');
            titleInput.value = notice.title;

            const writerInput = document.getElementById('writer');
            writerInput.value = notice.modifierId;

            const createdInput = document.getElementById('created');
            const options = {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
            };
            createdInput.value = new Date(notice.modified).toLocaleString('ko-KR', options);

            const contentTextarea = document.getElementById('content');
            contentTextarea.value = notice.content;

            const fileNameContainer = document.getElementById('file-name');

            if (data.notice.fileName.length === 0){
                fileNameContainer.classList.add('d-none');
            } else{
                data.notice.fileName.forEach(fileName => {
                    const fileLink = document.createElement('a');
                    fileLink.href = `${bucketUrl}/${noticeId}/${fileName}`;
                    fileLink.textContent = fileName;
                    fileLink.classList.add('form-control');
                    fileLink.download = fileName;

                    fileNameContainer.appendChild(fileLink);
                });
            }

            const prev = document.getElementById('prev');

            if (prevId === parseInt(noticeId)) {
                prev.addEventListener("click", function() {
                    alert("이전글이 없습니다.");
                });
            } else {
                prev.href = `/customer/notice/${prevId}`;
            }

            const next = document.getElementById('next');

            if (nextId === parseInt(noticeId)) {
                next.addEventListener("click", function() {
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