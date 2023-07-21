industryList();

let checkCompanyName = false;
let checkRegistrationNumber = false;
let checkNumberOfEmployees = false;
let checkRevenue = false;
let checkCeoName = false;

const companyNameInput = document.querySelector("#input-company-name");
const registrationNumberInput = document.querySelector("#input-registration-number");
const numberOfEmployeesInput = document.querySelector("#input-number-of-employees");
const establishmentDateInput = document.querySelector("#input-establishment-date");
const revenueInput = document.querySelector("#input-revenue");
const ceoNameInput = document.querySelector("#input-ceo-name");
const industryIdSelect = document.querySelector("#input-industry-id");
const postalCodeInput = document.querySelector("#post-code");
const addressInput = document.querySelector("#input-address");
const detailAddressInput = document.querySelector("#input-detail-address");
const fileInput = document.querySelector("#form-file");
const submitBtn = document.querySelector("#submit-btn");

submitBtn.addEventListener("click", function () {
    const formData = new FormData();

    formData.append("companyName", companyNameInput.value);
    formData.append("registrationNumber", registrationNumberInput.value);
    formData.append("numberOfEmployees", numberOfEmployeesInput.value);
    formData.append("establishmentDate", establishmentDateInput.value);
    formData.append("revenue", revenueInput.value);
    formData.append("ceoName", ceoNameInput.value);
    formData.append("industryId", industryIdSelect.value);
    formData.append("postalCode", postalCodeInput.value);
    formData.append("address", addressInput.value);
    formData.append("detailAddress", detailAddressInput.value);

    const files = fileInput.files;
    for (let i = 0; i < files.length; i++) {
        formData.append("files", files[i]);
    }
    // POST 요청 보내기
    fetch(`/api/company/join/`, {
        method: "POST",
        headers: {},
        body: formData,
    })
        .then(response => {
            if (response.status === 200) {
                // 수정이 성공한 경우
                location.href = "../../.."
                alert("신청이 완료되었습니다.");
            } else {
                location.href = "../../.."
                alert("신청에 실패하였습니다. 관리자에게 문의해주세요");
            }
        })
        .catch(error => {
            // 요청 실패 또는 오류 발생 시의 로직
            console.error(error);
        });
});

function enableSubmit() {
    if (checkCompanyName & checkRegistrationNumber & checkRevenue & checkCeoName) {
        submitBtn.disabled = false;
    } else {
        submitBtn.disabled = true;
    }
}

// 기업이름 미입력 체크
companyNameInput.addEventListener("keyup", function () {
    checkCompanyName = false;
    if (companyNameInput.value.trim() !== '') {
        checkCompanyName = true;
    }
    enableSubmit();
});

//사업자등록번호 미입력체크
registrationNumberInput.addEventListener("keyup", function () {
    checkRegistrationNumber = false;
    if (registrationNumberInput.value.trim() !== '') {
        checkRegistrationNumber = true;
    }
    enableSubmit();
});

// 사원수 미입력 체크
numberOfEmployeesInput.addEventListener("keyup", function () {
    checkNumberOfEmployees = false;
    if (numberOfEmployeesInput.value.trim() !== '') {
        checkNumberOfEmployees = true;
    }
    enableSubmit();
});

// 매출액
revenueInput.addEventListener("keyup", function () {
    checkRevenue = false;
    if (revenueInput.value.trim() !== '') {
        checkRevenue = true;
    }
    enableSubmit();
});

// 대표명
ceoNameInput.addEventListener("keyup", function () {
    checkCeoName = false;
    if (ceoNameInput.value.trim() !== '') {
        checkCeoName = true;
    }
    enableSubmit();
});


function industryList() {
    fetch(`/api/company/join/industry`, {
        method: "GET",
    })
        .then(response => response.json())
        .then(data => {
                const industryList = data;

                const industrySelect = document.querySelector("#input-industry-id");

                // 기존 옵션 제거
                industrySelect.innerHTML = "";

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

// 다음 주소검색 api
const searchAddressBtn = document.querySelector("#search-address-btn");

searchAddressBtn.addEventListener("click", function () {
    const postCode = document.querySelector("#post-code");
    const inputAddress = document.querySelector("#input-address");
    const inputDetailAddress = document.querySelector("#input-detail-address");
    new daum.Postcode({
        oncomplete: function (data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져올 수 있다.
            // 도로명 주소 = R 지번주소 = J
            // 사용자가 도로명 주소를 선택했을 경우
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                // 사용자가 지번 주소를 선택했을 경우(J)
                // 지번이어도 도로명 주소로 들어가게
                // addr = data.jibunAddress;
                addr = data.roadAddress;
            }

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== ''
                && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
            }

            // 건물명이 있고 공동주택일 경우 추가한다.
            if (data.buildingName !== ''
                && data.apartment === 'Y') {
                extraAddr += (extraAddr !== '' ? ', '
                    + data.buildingName
                    : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우 괄호까지 추가한 최종 문자열을 만든다.
            if (extraAddr !== '') {
                extraAddr = ' (' + extraAddr + ')';
            }

            postCode.value = data.zonecode;
            inputAddress.value = addr + extraAddr;
            inputDetailAddress.focus();
        }
    }).open();
});



