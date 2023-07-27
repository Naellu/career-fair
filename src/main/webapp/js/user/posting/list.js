listView();

function listView() {
    const queryParams = new URLSearchParams(window.location.search);

    fetch(`/api/user/posting/?${queryParams}`)
        .then(response => response.json())
        .then(data => {
            const postingList = data.postingList;
            const industryList = data.industryList;
            const pageInfo = data.pageInfo;
            const topPostingList = data.topPostingList;

            const industryContainer = document.querySelector('#industry-container');

            const industrySide = document.querySelector('#industry-side');

            industryContainer.innerHTML = "";

            industrySide.innerHTML = "";

            industryList.forEach(industry => {
                const checked = queryParams.has('industrIds') && queryParams.getAll('industrIds').includes(industry.industryId.toString()) ? 'checked' : '';

                const industryHtml = `
                    <div class="form-check">
                        <input ${checked} class="form-check-input" name="industrIds" type="checkbox" value="${industry.industryId}">
                        <label class="form-check-label">
                            ${industry.industryName}
                        </label>
                    </div>
                `;

                industryContainer.insertAdjacentHTML('beforeend', industryHtml);

                const checkbox = industryContainer.querySelector(`input[value="${industry.industryId}"]`);
                checkbox.addEventListener("change", function () {
                    form.submit();
                });

                const industrySideHtml = `
                  <li><a class="justify-content-between d-flex" href="/user/posting/list?industrIds=${industry.industryId}"><p>${industry.industryName}</p>
                    <span>${industry.count}</span></a></li>
                `;

                industrySide.insertAdjacentHTML('beforeend', industrySideHtml);
            });

            const bucketInput = document.querySelector("#bucket-url");

            const bucketUrl = bucketInput.value;

            const postingContainer = document.querySelector('#posting-container');

            const countDiv = document.querySelector('#count-div');

            postingContainer.innerHTML = "";

            countDiv.innerHTML = "";

            const countHtml = `
            <p style="text-align: center; font-size: 20px; margin-top: 0; margin-bottom: 0;">현재 채용중인 공고 : ${pageInfo.count}건</p>
            `;

            countDiv.innerHTML = countHtml;

            postingList.forEach(posting => {
                const postingHtml = `
                    <div class="single-post d-flex flex-row">
                        <div class="thumb me-5">
                            <div class="d-flex justify-content-center">
                                <img src="${bucketUrl}/company/${posting.companyId}/logo.png" width="100px" height="100px" alt="사진준비중">
                            </div>
                            <ul class="tags">
                                <li>
                                    <a href="/user/join/${posting.companyId}">${posting.companyName}</a>
                                </li>
                            </ul>
                        </div>
                        <div class="details">
                            <div class="title d-flex flex-row justify-content-between">
                                <div class="titles posting-title">
                                       <a href="/user/posting/${posting.postingId}"><h4>${posting.title}</h4></a>
                                    <h6>${industryList[posting.industryId - 1].industryName}</h6>
                                </div>
                            </div>
                            <p>
                                ${posting.address}
                            </p>
                            <h5>${posting.experienceLevel} ${posting.employmentType} ${posting.educationLevel}</h5>
                            <p>마감일 : ${posting.endDate}</p>
                        </div>
                    </div>          
                `
                postingContainer.insertAdjacentHTML('beforeend', postingHtml);
            })


            const applicationSide = document.querySelector("#application-side");
            applicationSide.innerHTML = "";

            topPostingList.forEach(topPosting => {
                const topHtml = `
                    <li><a class="justify-content-between d-flex" href="/user/posting/${topPosting.postingId}"><p>${topPosting.title}</p>
                            <span>${topPosting.applicationCount}명</span></a></li>
                `;

                applicationSide.insertAdjacentHTML('beforeend', topHtml);
            });

            const pageUl = document.querySelector("#page-ul");
            pageUl.innerHTML = "";
            createPagination(pageInfo, pageUl);
        })
        .catch(error => {
            console.error("Error:", error);
        });
}

const cancelSearchBtn = document.querySelector('#cancel-search-btn');

if (cancelSearchBtn !== null) {
    cancelSearchBtn.addEventListener("click", function () {
        location.href = window.location.pathname;
    });
}

function createPagination(pageInfo, pageUl) {
    // 현재 URL에서 쿼리스트링 추출
    const queryParams = new URLSearchParams(window.location.search);

    if (pageInfo.currentPageNum !== 1) {
        queryParams.set('page', '1');
        let pageLink = `/user/posting/list?${queryParams.toString()}`;
        let prevPageItem = document.createElement('li');
        prevPageItem.classList.add('page-item');
        let prevPageLink = document.createElement('a');
        prevPageLink.classList.add('page-link');
        prevPageLink.href = pageLink;
        prevPageLink.innerHTML = '<i class="fa-solid fa-angles-left"></i>';
        prevPageItem.appendChild(prevPageLink);
        pageUl.appendChild(prevPageItem);
    }


    // 이전 페이지 (prevPageNum)
    if (pageInfo.leftPageNum > 1) {
        queryParams.set('page', pageInfo.prevPageNum);
        let pageLink = `/user/posting/list?${queryParams.toString()}`;

        let prevPageItem = document.createElement('li');
        prevPageItem.classList.add('page-item');
        let prevPageLink = document.createElement('a');
        prevPageLink.classList.add('page-link');
        prevPageLink.href = pageLink;
        prevPageLink.innerHTML = '<i class="fa-solid fa-angle-left"></i>';
        prevPageItem.appendChild(prevPageLink);
        pageUl.appendChild(prevPageItem);
    }

    // 페이지 번호
    for (let pageNum = pageInfo.leftPageNum; pageNum <= pageInfo.rightPageNum; pageNum++) {
        queryParams.set('page', pageNum);

        let pageLink = `/user/posting/list?${queryParams.toString()}`;
        let pageItem = document.createElement('li');
        pageItem.classList.add('page-item');
        let pageLinkItem = document.createElement('a');
        pageLinkItem.classList.add('page-link');
        if (pageNum === pageInfo.currentPageNum) {
            pageLinkItem.classList.add('active');
        }
        pageLinkItem.href = pageLink;
        pageLinkItem.textContent = pageNum;
        pageItem.appendChild(pageLinkItem);
        pageUl.appendChild(pageItem);

        queryParams.delete('page');
    }

    // 다음 페이지 (nextPageNum)
    if (pageInfo.currentPageNum < pageInfo.lastPageNum) {
        queryParams.set('page', pageInfo.nextPageNum);
        let pageLink = `/user/posting/list?${queryParams.toString()}`;

        let prevPageItem = document.createElement('li');
        prevPageItem.classList.add('page-item');
        let prevPageLink = document.createElement('a');
        prevPageLink.classList.add('page-link');
        prevPageLink.href = pageLink;
        prevPageLink.innerHTML = '<i class="fa-solid fa-angle-right"></i>';
        prevPageItem.appendChild(prevPageLink);
        pageUl.appendChild(prevPageItem);
    }

    // 마지막 페이지
    if (pageInfo.currentPageNum !== pageInfo.lastPageNum) {
        queryParams.set('page', pageInfo.lastPageNum);
        let pageLink = `/user/posting/list?${queryParams.toString()}`;
        let prevPageItem = document.createElement('li');
        prevPageItem.classList.add('page-item');
        let prevPageLink = document.createElement('a');
        prevPageLink.classList.add('page-link');
        prevPageLink.href = pageLink;
        prevPageLink.innerHTML = '<i class="fa-solid fa-angles-right"></i>';
        prevPageItem.appendChild(prevPageLink);
        pageUl.appendChild(prevPageItem);
    }
}

// 현재 URL에서 쿼리스트링 추출
const urlParams = new URLSearchParams(window.location.search);

// 체크박스 그룹들
const checkboxGroups = [
    {name: 'employmentTypes', checkboxes: document.querySelectorAll('input[type="checkbox"][name="employmentTypes"]')},
    {
        name: 'experienceLevels',
        checkboxes: document.querySelectorAll('input[type="checkbox"][name="experienceLevels"]')
    },
    {name: 'educationLevels', checkboxes: document.querySelectorAll('input[type="checkbox"][name="educationLevels"]')}
];

// 체크박스 그룹에 대한 처리
checkboxGroups.forEach(group => {
    group.checkboxes.forEach(checkbox => {
        const value = checkbox.value;
        if (urlParams.getAll(group.name).includes(value)) {
            checkbox.checked = true;
        }
    });
});

// 체크박스들을 선택합니다.
const checkboxes = document.querySelectorAll("input[type='checkbox']");

// form을 선택합니다.
const form = document.getElementById("filter-form");

// 체크박스들에 대해 이벤트 리스너를 등록합니다.
checkboxes.forEach(checkbox => {
    checkbox.addEventListener("change", function () {
        // 체크박스 상태 변화가 있을 때 form을 자동으로 제출
        form.submit();
    });
});