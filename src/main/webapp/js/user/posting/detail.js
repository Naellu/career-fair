detailView();

const toastLiveExample = document.querySelector("#liveToast");
const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
const toastBody = document.querySelector(".toast-body");

function detailView() {
    const url = window.location.href;
    const postingId = url.substring(url.lastIndexOf("/") + 1);
    fetch(`/api/user/posting/${postingId}`)
        .then(response => response.json())
        .then(data => {
            const posting = data.posting;

            const companyName = document.querySelector("#company-name");
            const title = document.querySelector("#title");
            const workConditionUl = document.querySelector("#work-condition-ul");
            const hiringCount = document.querySelector("#hiring_count");
            const industry = document.querySelector("#industry-id");
            const level = document.querySelector("#level");
            const requirements = document.querySelector("#requirements");
            const preferences = document.querySelector("#preferences");
            const benefits = document.querySelector("#benefits");
            const period = document.querySelector("#period");
            const etc = document.querySelector("#etc");
            const applicationCount = document.querySelector("#application_count");
            const spareCount = document.querySelector("#spare_count");

            spareCount.value = posting.spareCount;
            applicationCount.value = posting.applicationCount;

            const industryId = posting.industryId - 1;
            const industryName = data.industryList[industryId].industryName;

            const h2Element = companyName.querySelector("h2");
            const aElement = companyName.querySelector("a");
            h2Element.innerHTML = posting.companyName;
            aElement.href = `/company/${posting.companyId}`;

            title.innerHTML = posting.title;

            workConditionUl.innerHTML = "";
            const conditionHtml = `
                <li>근무지: ${posting.address}</li>
                <li>근무형태: ${posting.employmentType}</li>
                <li>연봉: ${posting.salary}원</li>
            `;
            workConditionUl.innerHTML = conditionHtml;

            hiringCount.value = posting.hiringCount + '명';

            industry.value = industryName;

            level.value = posting.experienceLevel + " " + posting.educationLevel;

            requirements.innerHTML = posting.requirement;
            resizeTextarea(requirements);

            preferences.innerHTML = posting.preference;
            resizeTextarea(preferences);

            benefits.innerHTML = posting.benefit;
            resizeTextarea(benefits);

            period.value = `${posting.startDate} ~ ${posting.endDate}`;

            const textAreaElement = etc.querySelector("textarea");
            if (posting.etc != null) {
                textAreaElement.innerHTML = posting.etc;
                resizeTextarea(etc);
            } else {
                etc.classList = "d-none";
            }

            const senderId = data.senderId;
            const recipientId = posting.memberId;

            //쪽지 처리
            const noteBtn = document.querySelector("#note-btn");
            if (senderId === "notLogin") {
                noteBtn.addEventListener("click", function () {
                    toastBody.innerHTML = "로그인 후 이용해주세요!";
                    toastBootstrap.show();
                });
            } else {
                // 쪽지보내기 이벤트 넣기
                noteBtn.addEventListener("click", function () {
                    const Url = `/note/write?senderId=${senderId}&recipientId=${recipientId}`
                    window.open(Url, '_blank', 'width=600,height=400');
                });
            }

            // 좋아요 상태 표시
            const wishBtn = document.querySelector("#wish-btn");
            if (posting.scraped) {
                wishBtn.innerHTML = "<i class=\"fa-regular fa-star\"></i> 공고찜취소";
                wishBtn.classList = "btn btn-outline-danger";
            } else {
                wishBtn.innerHTML = "<i class=\"fa-regular fa-star\"></i> 공고찜하기";
                wishBtn.classList = "btn btn-outline-warning";
            }

            wishBtn.addEventListener("click", wish);

        })
        .catch(error => {
            console.error("Error:", error);
        });
}

// textarea의 내용이 변경될 때마다 크기 조정
function resizeTextarea(textarea) {
    textarea.style.height = 'auto'; // 먼저 기존의 높이를 초기화
    textarea.style.height = textarea.scrollHeight + 'px'; // 내용의 높이에 따라 새로운 높이를 설정
}

function wish() {
    const url = window.location.href;
    const postingId = url.substring(url.lastIndexOf("/") + 1);
    fetch(`/scrap/${postingId}`, {
        method: "POST"
    })
        .then(response => {
            if (response.status === 403) {
                toastBody.innerHTML = "로그인 후 이용해주세요!";
                toastBootstrap.show();
            }
            return response.json();
        })
        .then(data => {
            const scraped = data.scraped;
            const wishBtn = document.querySelector("#wish-btn");
            if (scraped === true) {
                wishBtn.innerHTML = "<i class=\"fa-regular fa-star\"></i> 공고찜취소";
                wishBtn.classList = "btn btn-outline-danger";
            } else {
                wishBtn.innerHTML = "<i class=\"fa-regular fa-star\"></i> 공고찜하기";
                wishBtn.classList = "btn btn-outline-warning";
            }
        })
        .catch(error => {
            console.error("Error:", error);
        });
}