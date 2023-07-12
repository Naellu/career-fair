let pageValue = "1";

detailView(pageValue);

function detailView(pageValue) {
    const url = window.location.href;
    const companyId = url.substring(url.lastIndexOf("/") + 1);

    const requestData = {
        page: pageValue
    };

    // URL 매개변수로 데이터 직렬화
    const params = new URLSearchParams(requestData).toString();

    fetch(`/api/company/${companyId}?${params}`)
        .then(response => response.json())
        .then(data => {
            const company = data.company;
            const round = data.round;
            const nowPostingList = data.nowPostingList;
            const pastPostingList = data.pastPostingList;
            const pageInfo = data.pageInfo;

            const industryId = company.industryId - 1;
            const industryName = data.industryList[industryId].industryName;

            const postalCode = company.postalCode;
            const address = company.address;
            const detailAddress = company.detailAddress;

            const fullAddress = `(${postalCode}) ${address} ${detailAddress}`;

            const companyTableBody = document.querySelector("#company-table tbody");
            const cHeader = document.querySelector("#c-header");
            cHeader.innerHTML = `${company.companyName}`;

            companyTableBody.innerHTML = "";
            const companyHtml = `
                     <tr>
                        <th style="width: 130px">사업자등록번호</th>
                        <td>${company.registrationNumber}</td>
                        <th style="width: 70px;">업종</th>
                        <td>${industryName}</td>
                    </tr>
                    <tr>
                        <th>매출액</th>
                        <td>${company.revenue}원</td>
                        <th>사원수</th>
                        <td>${company.numberOfEmployees}명</td>
                    </tr>
                    <tr>
                        <th>대표자명</th>
                        <td>${company.ceoName}</td>
                        <th>설립일</th>
                        <td>${company.establishmentDate}</td>
                    </tr>
                    <tr>
                        <th colspan="1">주소</th>
                        <td colspan="3">${fullAddress}</td>
                    </tr>
            `
            companyTableBody.insertAdjacentHTML('beforeend', companyHtml);

            const postingTableBody = document.querySelector("#posting-table tbody");

            postingTableBody.innerHTML = "";

            nowPostingList.forEach(nowPosting => {
                const postingHtml = `
                    <tr>
                        <td>${nowPosting.startDate} ~ ${nowPosting.endDate}</td>
                        <td><a href="#">${nowPosting.title}</a></td>
                        <td>${nowPosting.hiringCount}</td>
                        <td>${nowPosting.employmentType}</td>
                        <td>${nowPosting.experienceLevel}</td>
                        <td>${nowPosting.educationLevel}</td>
                    </tr>
                    `;
                postingTableBody.insertAdjacentHTML('beforeend', postingHtml);
            });

            const pastPostingTableBody = document.querySelector("#past-posting-table tbody");

            pastPostingTableBody.innerHTML = "";
            pastPostingList.forEach(pastPosting => {
                const postingHtml = `
                    <tr>
                        <td>${pastPosting.startDate} ~ ${pastPosting.endDate}</td>
                        <td><a href="#">${pastPosting.title}</a></td>
                        <td>${pastPosting.hiringCount}</td>
                        <td>${pastPosting.employmentType}</td>
                        <td>${pastPosting.experienceLevel}</td>
                        <td>${pastPosting.educationLevel}</td>
                    </tr>
                `;
                pastPostingTableBody.insertAdjacentHTML('beforeend', postingHtml)
            });

            /* 지도 */
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 생성
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색
            geocoder.addressSearch(`${address}`, function (result, status) {

                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: `<div style="width:150px;text-align:center;padding:6px 0;">${company.companyName}</div>`
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동
                    map.setCenter(coords);
                }
            });

            const pageUl = document.querySelector("#page-ul");
            pageUl.innerHTML = "";
            createPagination(pageInfo, pageUl);


        })
        .catch(error => {
            console.error("Error:", error);
        });
}

function createPagination(pageInfo, pageUl) {

    // 이전 페이지로
    if (pageInfo.currentPageNum !== 1) {
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
            detailView(pageValue);
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
            detailView(pageValue);
            event.preventDefault();
        };

        pageItem.appendChild(pageLinkItem);
        pageUl.appendChild(pageItem);
    }

    // 다음 페이지로
    if (pageInfo.currentPageNum !== pageInfo.lastPage) {
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
            detailView(pageValue);
            event.preventDefault();
        };
        pageItem.appendChild(pageLinkItem);
        pageUl.appendChild(pageItem);
    }
}