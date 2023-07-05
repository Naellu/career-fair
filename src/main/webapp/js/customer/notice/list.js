listView();

let searchValue = "";
let typeValue = "";
let pageValue = "";

function listView(searchValue, typeValue, pageValue) {
    const search = searchValue;
    const type = typeValue;

    const requestData = {
        search: searchValue,
        type: typeValue,
        page : pageValue
    };

    // URL 매개변수로 데이터 직렬화
    const params = new URLSearchParams(requestData).toString();

    fetch(`/customer/notice/api/list?${params}`)
        .then(response => response.json())
        .then(noticeList => {
            // 이하 코드는 동일합니다.
            const tbody = document.querySelector("#noticeTable tbody");
            tbody.innerHTML = "";

            noticeList.forEach(notice => {
                const noticeHtml = `
                    <tr>
                        <td>${notice.noticeId}</td>
                        <td><a href="#">${notice.title}</a></td>
                        <td>${notice.created}</td>
                        <td>${notice.memberId}</td>
                        <td>${notice.hit}</td>
                    </tr>
                `;
                tbody.insertAdjacentHTML('beforeend', noticeHtml);
            });
        })
        .catch(error => {
            console.error("Error:", error);
        });
}

const searchBtn = document.querySelector("#search-btn");
searchBtn.addEventListener("click", function () {
    const search = document.querySelector("#search");
    searchValue = search.value;

    const type = document.querySelector("#type");
    typeValue = type.value;

    listView(searchValue, typeValue);
});

const pageLinks = document.querySelectorAll(".page-link.page-num");

// 각 페이지 링크에 이벤트 핸들러를 추가합니다.
pageLinks.forEach(function (linkElement) {
    linkElement.addEventListener("click", function (event) {
        // 데이터 속성을 통해 페이지 번호를 가져옵니다.
        const page = linkElement.getAttribute("data-page");
        pageValue = page;
        listView(searchValue, typeValue, pageValue);
        event.preventDefault();
    });
});
