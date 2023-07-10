modifyView();

const companyNameInput = document.querySelector('#input-company-name');
const registrationNumberInput = document.querySelector('#input-registration-number');
const numberOfEmployeesInput = document.querySelector('#input-number-of-employees');
const establishmentDateInput = document.querySelector('#input-establishment-date');
const revenueInput = document.querySelector('#input-revenue');
const ceoNameInput = document.querySelector('#input-ceo-name');
const industryIdInput = document.querySelector('#input-industry-id');
const postalCodeInput = document.querySelector('#post-code');
const addressInput = document.querySelector('#input-address');
const detailAddressInput = document.querySelector('#input-detail-address');
const fileNameContainer = document.querySelector('#file-name');
const updateBtn = document.querySelector('#update-btn');

function modifyView() {
    const url = window.location.href;
    const companyId = url.substring(url.lastIndexOf("/") + 1);
    fetch(`/api/user/recruiter/${companyId}`)
        .then(response => response.json())
        .then(data => {
            const company = data.company;

            industryList(company.industryId);

            companyNameInput.value = company.companyName;
            registrationNumberInput.value = company.registrationNumber;
            numberOfEmployeesInput.value = company.numberOfEmployees;
            establishmentDateInput.value = company.establishmentDate;
            revenueInput.value = company.revenue;

            ceoNameInput.value = company.ceoName;
            postalCodeInput.value = company.postalCode;
            addressInput.value = company.address;
            detailAddressInput.value = company.detailAddress;

            if (data.company.fileName.length === 0) {
                fileNameContainer.classList.add('d-none');
            } else {
                data.company.fileName.forEach(fileName => {
                    // 새로운 <div> 요소 생성
                    var div = document.createElement("div");
                    div.className = "form-check form-switch";

                    // 새로운 <input> 요소 생성
                    var input = document.createElement("input");
                    input.className = "form-check-input";
                    input.type = "checkbox";
                    input.role = "switch";
                    input.id = "removeCheckBox";
                    input.name = "removeFiles";
                    input.value = fileName;

                    // 새로운 <label> 요소 생성
                    var label = document.createElement("label");
                    label.className = "form-check-label";
                    label.htmlFor = "removeCheckBox";

                    // 새로운 <i> 요소 생성
                    var icon = document.createElement("i");
                    icon.className = "fa-solid fa-trash-can";
                    icon.style.color = "red";

                    // <i> 요소를 <label> 요소에 추가
                    label.appendChild(icon);

                    // <input> 요소를 <div> 요소에 추가
                    div.appendChild(input);

                    // <label> 요소를 <div> 요소에 추가
                    div.appendChild(label);

                    // 생성한 <div> 요소를 원하는 위치에 추가
                    fileNameContainer.appendChild(div);

                    const fileLink = document.createElement('a');
                    fileLink.href = `${bucketUrl}/company/${companyId}/${fileName}`;
                    fileLink.textContent = fileName;
                    fileLink.classList.add('form-control');
                    fileLink.download = `${fileName}`;

                    fileNameContainer.appendChild(fileLink);
                });
            }
        })
        .catch(error => {
            console.error("Error:", error);
        });
}

updateBtn.addEventListener("click", function () {
    const url = window.location.href;
    const companyId = url.substring(url.lastIndexOf("/") + 1);

    const checkboxes = document.querySelectorAll("[name=removeFiles]");

    const removeFiles = [];

    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            removeFiles.push(checkboxes[i].value);
        }
    }

    const formData = new FormData();

    const fileInput = document.querySelector("#form-file");
    const files = fileInput.files;

    for (let i = 0; i < files.length; i++) {
        formData.append("files", files[i]);
    }

    formData.append("removeFiles", removeFiles);
    formData.append("companyId", companyId);
    formData.append("companyName", companyNameInput.value);
    formData.append("registrationNumber", registrationNumberInput.value);
    formData.append("numberOfEmployees", numberOfEmployeesInput.value);
    formData.append("establishmentDate", establishmentDateInput.value);
    formData.append("revenue", revenueInput.value);
    formData.append("ceoName", ceoNameInput.value);
    formData.append("industryId", industryIdInput.value);
    formData.append("postalCode", postalCodeInput.value);
    formData.append("address", addressInput.value);
    formData.append("detailAddress", detailAddressInput.value);


    fetch(`/api/user/recruiter/${companyId}`, {
        method: "POST",
        headers: {},
        body: formData
    })
        .then(response => {
            if (response.status === 200) {
                // 수정이 성공한 경우
                location.href = "/user/recruiter/list";
                alert("수정이 완료되었습니다.");
            } else {
                location.href = `/user/recruiter/modify/${companyId}`;
                alert("수정에 실패하였습니다.");
            }
        })
        .catch(error => {
            location.href = `/`;
            alert("오류가 발생했습니다 관리자에게 문의해주세요");
        });
});

function industryList(industryId) {
    fetch(`/api/user/recruiter/industry`, {
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

                    if (industry.industryId === industryId) {
                        option.selected = true;
                    }

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



