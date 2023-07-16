let searchValue = "";
let typeValue = "";
let pageValue = "1";
let statusValue = "all";

listView(searchValue, typeValue, pageValue, statusValue);

function listView(searchValue, typeValue, pageValue, statusValue) {

    const requestData = {
        search: searchValue,
        type: typeValue,
        page: pageValue,
        status: statusValue
    };

    // URL 매개변수로 데이터 직렬화
    const params = new URLSearchParams(requestData).toString();

    fetch(`/api/admin/recruiter/?${params}`)
        .then(response => response.json())
        .then(data => {
            const companyList = data.companyList;
            const pageInfo = data.pageInfo;
            const tbody = document.querySelector("#recruiter-table tbody");
            const pageUl = document.querySelector("#page-ul");
            tbody.innerHTML = "";
            companyList.forEach((company) => {
                let statusText = "";
                switch (company.status) {
                    case "review":
                        statusText = "심사중";
                        break;
                    case "hold":
                        statusText = "보류";
                        break;
                    case "approved":
                        statusText = "승인";
                        break;
                    case "rejected":
                        statusText = "반려";
                        break;
                    default:
                        statusText = "";
                }
                const recruiterHtml = `
                    <tr>
                        <td style="text-align: center; width: 70px;">${company.round}회차</td>
                        <td style="text-align: center; ">${company.memberId}</td>
                        <td style="text-align: left;" >${company.companyName}</td>
                        <td style="text-align: center; " >${company.registrationNumber}</td>
                        <td style="text-align: center; width: 150px">${company.establishmentDate}</td>
                        <td style="text-align: center; " >${company.ceoName}</td>
                        <td style="text-align: center; " >${statusText}</td>
                        <td style="text-align: center; " ><a href="/admin/recruiter/${company.companyId}" class="btn btn-secondary">상세페이지로</a></td>
                    </tr>
                `;
                tbody.insertAdjacentHTML('beforeend', recruiterHtml);
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

    listView(searchValue, typeValue, pageValue, statusValue);
});

const statusButtons = document.querySelectorAll("#status-btn button");
const allButton = document.querySelector('#status-btn button[value="all"]');

allButton.addEventListener("click", function (event) {
    typeValue = "";
    searchValue = "";
    const search = document.querySelector("#search");
    search.value = "";
    const type = document.querySelector("#type");
    type.value = "all";

    event.preventDefault();
    listView(searchValue, typeValue, pageValue, statusValue);
});


statusButtons.forEach(button => {
    button.addEventListener("click", function (event) {
        statusValue = button.value;
        pageValue = '1';

        event.preventDefault();
        listView(searchValue, typeValue, pageValue, statusValue);
    });
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
            listView(searchValue, typeValue, pageValue, statusValue);
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
            listView(searchValue, typeValue, pageValue, statusValue);
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
            listView(searchValue, typeValue, pageValue, statusValue);
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
            listView(searchValue, typeValue, pageValue, statusValue);
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
            listView(searchValue, typeValue, pageValue, statusValue);
            event.preventDefault();
        };
        pageItem.appendChild(pageLinkItem);
        pageUl.appendChild(pageItem);
    }
}
