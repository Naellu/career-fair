let searchValue = "";
let typeValue = "";
let industryValue = "";
let roundValue = "";
let pageValue = "8";
let count = "";

roundList();
industryList();

function roundList() {
    fetch(`/api/user/join/round`, {
        method: "GET",
    })
        .then(response => response.json())
        .then(data => {
                const round = data;
                roundValue = round;
                const roundUl = document.querySelector("#round-ul");
                listView(searchValue, typeValue, industryValue, roundValue, pageValue);
                roundUl.innerHTML = "";

                let i = round;

                for (i; i > 0; i--) {
                    let roundItem = document.createElement('li');
                    roundItem.classList.add('nav-item');

                    let roundLinkItem = document.createElement('a');
                    roundLinkItem.classList.add('nav-link');
                    roundLinkItem.setAttribute('href', '#');
                    roundLinkItem.textContent = i + '회차';
                    roundLinkItem.value = i;

                    roundLinkItem.addEventListener("click", function (event) {
                        roundValue = roundLinkItem.value;
                        typeValue = "";
                        searchValue = "";
                        const search = document.querySelector("#search");
                        search.value = "";

                        const type = document.querySelector("#type");
                        type.value = 'all';
                        industryValue = "";

                        const industrySelect = document.querySelector("#industry-select");
                        industrySelect.value = "";

                        pageValue = "8";
                        listView(searchValue, typeValue, industryValue, roundValue, pageValue);
                        event.preventDefault();
                    });

                    roundItem.appendChild(roundLinkItem);
                    roundUl.appendChild(roundItem);
                }

            }
        )
        .catch(error => {
            console.error("Error:", error);
        });
}

function industryList() {
    fetch(`/api/user/join/industry`, {
        method: "GET",
    })
        .then(response => response.json())
        .then(data => {
                const industryList = data;
                const industrySelect = document.querySelector("#industry-select");

                industrySelect.innerHTML = "";

                const option = document.createElement("option");
                option.value = '';
                option.textContent = '전체업종';
                industrySelect.appendChild(option);

                industryList.forEach(industry => {
                    const option = document.createElement("option");
                    option.value = industry.industryId;
                    option.textContent = industry.industryName;
                    industrySelect.appendChild(option);
                });
            }
        )
        .catch(error => {
            console.error("Error:", error);
        });
}

function listView() {

    const requestData = {
        search: searchValue,
        type: typeValue,
        industryId: industryValue,
        roundValue: roundValue,
        page: pageValue
    };
    // URL 매개변수로 데이터 직렬화
    const params = new URLSearchParams(requestData).toString();

    fetch(`/api/user/join?${params}`)
        .then(response => response.json())
        .then(data => {
            const companyList = data.companyList;
            const industryList = data.industryList
            const companyView = document.querySelector("#company-view");
            const cnt = data.count;

            count = cnt;

            companyView.innerHTML = "";
            companyList.forEach(company => {
                const industryId = company.industryId - 1;
                const industryName = industryList[industryId].industryName;
                const companyHtml = `
                 <div class="col mb-5">
						<div class="card h-100">
							<div class="card-body p-4">
								<div class="text-center">
									<h5 class="fw-bolder">${company.companyName}</h5>
									<br/>
									사원수 : ${company.numberOfEmployees}
                                    <br />
									<br />
									설립일 : ${company.establishmentDate}
									<br />
                                    <br />
									업종 : ${industryName}
								</div >
                                </div >
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a class="btn btn-primary" href="/user/join/${company.companyId}">기업 정보 보기</a>
                                    </div>
                            </div >
                        </div >
                </div >
                `;
                companyView.insertAdjacentHTML('beforeend', companyHtml);
            })

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

    const industryId = document.querySelector("#industry-select");
    industryValue = industryId.value;

    pageValue = "8";

    listView(searchValue, typeValue, industryValue, roundValue, pageValue);
});

const pageBtn = document.querySelector("#page-btn");
pageBtn.addEventListener("click", function () {

    if (count < pageValue) {
        alert("목록이 더 없습니다.");
    } else {
        pageValue = parseInt(pageValue) + 8;

        listView(searchValue, typeValue, industryValue, roundValue, pageValue);
    }
});

