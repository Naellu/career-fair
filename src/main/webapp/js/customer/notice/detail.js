detailView();
const bucketUrl = document.querySelector("#bucket-url").value;

function detailView() {
    const url = window.location.href;
    const noticeId = url.substring(url.lastIndexOf("/") + 1);

    fetch(`/api/notices/${noticeId}`)
        .then(response => response.json())
        .then(data => {
            const notice = data.notice;
            const prevId = data.prevNotice;
            const nextId = data.nextNotice;
            const topNoticeList = data.topNoticeList;

            const title = document.querySelector('#title');
            title.innerHTML = notice.title;

            const noticeUl = document.querySelector('#notice-ul');

            const options = {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
            };
            const fommatedDate = new Date(notice.modified).toLocaleString('ko-KR', options);

            const noticeHtml = `
                <li>
                    <i class="fa-regular fa-square-check"></i>
                    <span>작성자 : ${notice.modifierId}</span>
                </li>
                <li>
                    <i class="fa-regular fa-square-check"></i>
                    <span>작성일시 : ${fommatedDate}</span>
                </li>
            `;

            noticeUl.innerHTML = noticeHtml;

            const contentTextarea = document.querySelector('#content');
            contentTextarea.value = notice.content;

            resizeTextarea(contentTextarea);

            const fileNameContainer = document.querySelector('#file-name');
            const imageFiles = [];
            const otherFiles = [];

            data.notice.fileName.forEach(fileName => {
                if (fileName.toLowerCase().endsWith('.img') || fileName.toLowerCase().endsWith('.png')) {
                    imageFiles.push(fileName);
                } else {
                    otherFiles.push(fileName);
                }
            });

            // 이미지 파일 먼저 추가
            imageFiles.forEach(fileName => {
                const imgElement = document.createElement('img');
                imgElement.src = `${bucketUrl}/notice/${noticeId}/${fileName}`;
                imgElement.alt = 'Image Preview';
                imgElement.classList.add('img-preview');
                imgElement.classList.add('mt-2');

                // 이미지 크기 제한 (500 x 500)
                imgElement.style.maxWidth = '500px';
                imgElement.style.maxHeight = '500px';

                fileNameContainer.appendChild(imgElement);
            });

            // 이미지가 아닌 파일 추가
            otherFiles.forEach(fileName => {
                const fileLink = document.createElement('a');
                fileLink.href = `${bucketUrl}/notice/${noticeId}/${fileName}`;
                fileLink.textContent = fileName;
                fileLink.classList.add('form-control');
                fileLink.classList.add('mt-2');

                fileNameContainer.appendChild(fileLink);
            });

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

            const topNotice = document.querySelector("#top-notice");
            topNotice.innerHTML = "";

            topNoticeList.forEach(notice => {
                const topNoticeHtml = `
                    <li><a href="/customer/notice/${notice.noticeId}" class="justify-content-between align-items-center d-flex"><h6>${notice.title}</h6></li>
                    `

                topNotice.insertAdjacentHTML('beforeend', topNoticeHtml);
            });
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

// textarea의 내용이 변경될 때마다 크기 조정
function resizeTextarea(textarea) {
    textarea.style.height = 'auto'; // 먼저 기존의 높이를 초기화
    textarea.style.height = textarea.scrollHeight + 'px'; // 내용의 높이에 따라 새로운 높이를 설정
}
