listView();

function listView() {
    const queryParams = new URLSearchParams(window.location.search);

    fetch(`/api/user/posting?${queryParams}`)
        .then(response => response.json())
        .then(data => {
            const postingList = data.postingList;
            const industryList = data.industryList;

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

            postingContainerTbody.insertAdjacentHTML('beforeend', `<tr><td colspan="3" style="background-color: beige; text-align: center">현재 채용중인 공고 : 100건</td></tr>`);

            postingList.forEach(posting => {
                const postingHtml = `
                    <tr>
                        <td style="height: 100px; width: 200px; text-align : center; vertical-align : middle;">
                            <a href="/company/${posting.companyId}">${posting.companyName}</a>
                        </td>
                        <td style="vertical-align : middle;">
                            <a href="#">
                                ${posting.title}
                                <br>
                                ${posting.experienceLevel} ${posting.employmentType} ${posting.educationLevel}
                                <br>
                                업종 : ${industryList[posting.industryId - 1].industryName}
                            </a>
                        </td>
                        <td style="text-align : center; width: 200px">
                            <a href="#"><div class="badge rounded-pill text-bg-danger mt-1">즉시지원</div></a>
                            <br/>
                            마감일
                            <br/>
                            ~ ${posting.endDate}
                        </td>
                    </tr>
                `
                postingContainerTbody.insertAdjacentHTML('beforeend', postingHtml);
            })
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
