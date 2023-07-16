let searchValue = "";
let typeValue = "";
let pageValue = "1";

listView(searchValue, typeValue, pageValue);

function listView(searchValue, typeValue, pageValue) {

    const requestData = {
        search: searchValue,
        type: typeValue,
        page: pageValue
    };

    // URL 매개변수로 데이터 직렬화
    const params = new URLSearchParams(requestData).toString();

    fetch(`/api/notices?${params}`)
        .then(response => response.json())
        .then(data => {
            const noticeList = data.noticeList;
            const pageInfo = data.pageInfo;
            const number = pageInfo.number;
            const tbody = document.querySelector("#noticeTable tbody");
            const pageUl = document.querySelector("#page-ul");
            tbody.innerHTML = "";
            noticeList.forEach((notice, index) => {
                const date = new Date(notice.modified);
                const options = {year: 'numeric', month: 'long', day: 'numeric'};
                const formattedDate = date.toLocaleDateString('ko-KR', options);

                const maxLength = 15; // 최대 길이 설정

                let truncatedTitle = "";

                if (notice.title.length > maxLength) {
                    truncatedTitle = notice.title.substring(0, maxLength) + '...';
                } else {
                    truncatedTitle = notice.title;
                }

                const noticeHtml = `
                    <tr>
                        <td style="text-align: center; width: 50px;">${number - index}</td>
                        <td style="text-align: left; width: 300px" ><a href="/customer/notice/${notice.noticeId}">${truncatedTitle}</a></td>
                        <td style="text-align: center; width: 230px " >${notice.modifierId}</td>
                        <td style="text-align: center; width: 70px">${notice.hit}</td>
                        <td style="text-align: center; width: 150px" >${formattedDate}</td>
                    </tr>
                `;
                tbody.insertAdjacentHTML('beforeend', noticeHtml);
            });

            pageUl.innerHTML = "";
            createPagination(pageInfo, pageUl);

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

    pageValue = '1';

    listView(searchValue, typeValue, pageValue);
});

function createPagination(pageInfo, pageUl) {

    // 첫 페이지 (prevPageNumber)
    if (pageInfo.currentPageNum !== 1) {
        let pageItem = document.createElement('li');
        pageItem.classList.add('page-item');

        let pageLinkItem = document.createElement('a');
        pageLinkItem.classList.add('page-link');
        pageLinkItem.classList.add('page-num');
        pageLinkItem.setAttribute('href', '#');

        let icon = document.createElement('i');
        icon.classList.add('fa-solid');
        icon.classList.add('fa-angles-left');

        pageLinkItem.appendChild(icon);

        pageLinkItem.onclick = (event) => {
            pageValue = 1;
            listView(searchValue, typeValue, pageValue);
            event.preventDefault();
        };
        pageItem.appendChild(pageLinkItem);
        pageUl.appendChild(pageItem);
    }

    // 이전 페이지로
    if (pageInfo.leftPageNum > 1) {
        let pageItem = document.createElement('li');
        pageItem.classList.add('page-item');

        let pageLinkItem = document.createElement('a');
        pageLinkItem.classList.add('page-link');
        pageLinkItem.classList.add('page-num');
        pageLinkItem.setAttribute('href', '#');

        let icon = document.createElement('i');
        icon.classList.add('fa-solid');
        icon.classList.add('fa-angle-left');

        pageLinkItem.appendChild(icon);

        pageLinkItem.onclick = (event) => {
            pageValue = pageInfo.prevPageNum;
            listView(searchValue, typeValue, pageValue);
            event.preventDefault();
        };
        pageItem.appendChild(pageLinkItem);
        pageUl.appendChild(pageItem);
    }

    // 페이지 번호
    for (let pageNum = pageInfo.leftPageNum; pageNum <= pageInfo.rightPageNum; pageNum++) {
        let pageItem = document.createElement('li');
        pageItem.classList.add('page-item');

        let pageLinkItem = document.createElement('a');
        pageLinkItem.classList.add('page-link');
        pageLinkItem.classList.add('page-num');
        pageLinkItem.setAttribute('href', '#');
        pageLinkItem.textContent = pageNum;

        if (pageNum === pageInfo.currentPageNum) {
            pageLinkItem.classList.add('active');
        }

        pageLinkItem.onclick = (event) => {
            pageValue = pageNum;
            listView(searchValue, typeValue, pageValue);
            event.preventDefault();
        };

        pageItem.appendChild(pageLinkItem);
        pageUl.appendChild(pageItem);
    }

    // 다음 페이지로
    if (pageInfo.rightPageNum !== pageInfo.lastPageNum) {
        let pageItem = document.createElement('li');
        pageItem.classList.add('page-item');

        let pageLinkItem = document.createElement('a');
        pageLinkItem.classList.add('page-link');
        pageLinkItem.classList.add('page-num');
        pageLinkItem.setAttribute('href', '#');

        let icon = document.createElement('i');
        icon.classList.add('fa-solid');
        icon.classList.add('fa-angle-right');

        pageLinkItem.appendChild(icon);

        pageLinkItem.onclick = (event) => {
            pageValue = pageInfo.nextPageNum;
            listView(searchValue, typeValue, pageValue);
            event.preventDefault();
        };
        pageItem.appendChild(pageLinkItem);
        pageUl.appendChild(pageItem);
    }

    // 마지막 페이지
    if (pageInfo.currentPageNum !== pageInfo.lastPageNum) {
        let pageItem = document.createElement('li');
        pageItem.classList.add('page-item');

        let pageLinkItem = document.createElement('a');
        pageLinkItem.classList.add('page-link');
        pageLinkItem.classList.add('page-num');
        pageLinkItem.setAttribute('href', '#');

        let icon = document.createElement('i');
        icon.classList.add('fa-solid');
        icon.classList.add('fa-angles-right');

        pageLinkItem.appendChild(icon);

        pageLinkItem.onclick = (event) => {
            pageValue = pageInfo.lastPageNum;
            listView(searchValue, typeValue, pageValue);
            event.preventDefault();
        };
        pageItem.appendChild(pageLinkItem);
        pageUl.appendChild(pageItem);
    }
}

// 동적으로 만들어지기 때문에 위에서 동적으로 클릭이벤트 추가함.
/*const pageLinks = document.querySelectorAll(".page-link.page-num");

// 각 페이지 링크에 이벤트 핸들러를 추가합니다.
pageLinks.forEach((linkElement) => {
    linkElement.addEventListener("click", (event) => {
        // 데이터 속성을 통해 페이지 번호를 가져옵니다.
        const page = linkElement.getAttribute("data-page");
        pageValue = page;
        listView(searchValue, typeValue, pageValue);
        event.preventDefault();
    });
});*/
