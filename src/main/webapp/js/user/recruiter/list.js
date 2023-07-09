let roundValue = "all";

listView(roundValue);

function listView(roundValue) {

    const requestData = {
        roundValue: roundValue
    };

    // URL 매개변수로 데이터 직렬화
    const params = new URLSearchParams(requestData).toString();

    fetch(`/api/user/recruiter/?${params}`)
        .then(response => response.json())
        .then(data => {
            const companyList = data.companyList;
            const tbody = document.querySelector("#recruiter-table tbody");
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
                        <td style="text-align: left;" >${company.companyName}</td>
                        <td style="text-align: center; " >${company.registrationNumber}</td>
                        <td style="text-align: center; " >${company.ceoName}</td>
                        <td style="text-align: center; " >${statusText}</td>
                        <td style="text-align: center; " ><a href="/user/recruiter/${company.companyId}" class="btn btn-secondary">상세페이지로</a></td>
                    </tr>
                `;
                tbody.insertAdjacentHTML('beforeend', recruiterHtml);
            });

        })
        .catch(error => {
            console.error("Error:", error);
        });
}

const statusButtons = document.querySelectorAll("#round-btn button");


statusButtons.forEach(button => {
    button.addEventListener("click", function (event) {
        roundValue = button.value;
        event.preventDefault();
        listView(roundValue);
    });
});

