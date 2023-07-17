listView();

function listView() {
    const queryParams = new URLSearchParams(window.location.search);

    fetch(`/api/user/posting/?${queryParams}`)
        .then(response => response.json())
        .then(data => {
            const postingList = data.postingList;
            const industryList = data.industryList;
            const pageInfo = data.pageInfo;

            const industryContainer = document.querySelector('#industry-container');

            industryContainer.innerHTML = "";

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
            });

            const postingContainerTbody = document.querySelector('#posting-container tbody');

            postingContainerTbody.innerHTML = "";

            postingContainerTbody.insertAdjacentHTML('beforeend', `<tr><td colspan="3" style="background-color: beige; text-align: center">현재 채용중인 공고 : ${pageInfo.count}건</td></tr>`);

            postingList.forEach(posting => {
                const postingHtml = `
                    <tr>
                        <td style="height: 100px; width: 200px; text-align : center; vertical-align : middle;">
                            <a href="/company/${posting.companyId}">${posting.companyName}</a>
                        </td>
                        <td style="vertical-align : middle;">
                            <a href="/user/posting/${posting.postingId}">
                                ${posting.title}
                                <br>
                                ${posting.experienceLevel} ${posting.employmentType} ${posting.educationLevel}
                                <br>
                                업종 : ${industryList[posting.industryId - 1].industryName}
                            </a>
                        </td>
                        <td style="text-align : center; width: 200px; vertical-align : middle;">
                            마감일
                            <br/>
                            ~ ${posting.endDate}
                        </td>
                    </tr>
                `
                postingContainerTbody.insertAdjacentHTML('beforeend', postingHtml);
            })

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
    { name: 'employmentTypes', checkboxes: document.querySelectorAll('input[type="checkbox"][name="employmentTypes"]') },
    { name: 'experienceLevels', checkboxes: document.querySelectorAll('input[type="checkbox"][name="experienceLevels"]') },
    { name: 'educationLevels', checkboxes: document.querySelectorAll('input[type="checkbox"][name="educationLevels"]') }
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