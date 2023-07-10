detailView();
const bucketUrl = document.querySelector("#bucketUrl").value;

function detailView() {
    const url = window.location.href;
    const companyId = url.substring(url.lastIndexOf("/") + 1);
    fetch(`/api/user/recruiter/${companyId}`)
        .then(response => response.json())
        .then(data => {
            const company = data.company;
            const companySpan = document.querySelector('#company-name');
            const roundInput = document.querySelector('#round');
            const memberIdInput = document.querySelector('#member-id');
            const registrationNumberInput = document.querySelector('#registration-number');
            const numberOfEmployeesInput = document.querySelector('#number-of-employees');
            const establishmentDateInput = document.querySelector('#establishment-date');
            const revenueInput = document.querySelector('#revenue');
            const postalCodeInput = document.querySelector('#postalCode');
            const addressInput = document.querySelector('#address');
            const detailAddressInput = document.querySelector('#detail-address');
            const ceoNameInput = document.querySelector('#ceo-name');
            const industryIdInput = document.querySelector('#industry-id');
            const industryNameInput = document.querySelector('#industry-name');
            const statusInput = document.querySelector('#status');
            const fileNameContainer = document.querySelector('#file-name');

            const industryId = company.industryId -1;

            const industryName = data.industryList[industryId].industryName;

            companySpan.innerHTML = company.companyName;
            roundInput.value = company.round;
            memberIdInput.value = company.memberId;
            registrationNumberInput.value = company.registrationNumber;
            numberOfEmployeesInput.value = company.numberOfEmployees;
            establishmentDateInput.value = company.establishmentDate;
            revenueInput.value = company.revenue;
            postalCodeInput.value = company.postalCode;
            addressInput.value = company.address;
            detailAddressInput.value = company.detailAddress;
            ceoNameInput.value = company.ceoName;
            industryIdInput.value = company.industryId;
            industryNameInput.value = industryName;

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
            statusInput.value = statusText;

            if (data.company.fileName.length === 0) {
                fileNameContainer.classList.add('d-none');
            } else {
                data.company.fileName.forEach(fileName => {
                    const fileLink = document.createElement('a');
                    fileLink.href = `${bucketUrl}/company/${companyId}/${fileName}`;
                    fileLink.textContent = fileName;
                    fileLink.classList.add('form-control');
                    fileLink.download = fileName;

                    fileNameContainer.appendChild(fileLink);
                });
            }
        })
        .catch(error => {
            console.error("Error:", error);
        });
}
