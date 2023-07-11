detailView();

function detailView() {
    const url = window.location.href;
    const companyId = url.substring(url.lastIndexOf("/") + 1);
    fetch(`/api/company/${companyId}`)
        .then(response => response.json())
        .then(data => {
            const company = data.company;
            const round = data.round;

            const industryId = company.industryId - 1;
            const industryName = data.industryList[industryId].industryName;

            const postalCode = company.postalCode;
            const address = company.address;
            const detailAddress = company.detailAddress;

            const fullAddress = `(${postalCode}) ${address} ${detailAddress}`;

            const companyTableBody = document.querySelector("#company-table tbody");
            const cHeader = document.querySelector("#c-header");

            cHeader.innerHTML = `${company.companyName}`;

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

            const postingHtml = `
                <tr>
                    <td>2023.07.11 ~ 2023.07.12</td>
                    <td>노예구함</td>
                    <td>500명</td>
                    <td>노예</td>
                    <td>10년</td>
                    <td>학력</td>
                </tr>
            `;
        })
        .catch(error => {
            console.error("Error:", error);
        });
}
