
$(document).ready(function () {
    updateMilitaryRankDisplay();

    $("input[name='militaryService']").change(function () {
        updateMilitaryRankDisplay();
    });
});

// 입력 그룹 첫 번째 삭제 버튼 표시 안함
$('.inputContainer').each(function () {
    $(this).find('.deleteButton').first().hide();
})

// 병역사항 군필 체크 시 셀렉트 박스 노출
function updateMilitaryRankDisplay() {
    if ($('#fulfilled').is(':checked')) {
        $('#militaryRank').show();
    } else {
        $('#militaryRank').hide();
    }
}


// 입력 그룹 삭제 버튼
$(".inputContainer").on('click', '.deleteButton', function () {
    $(this).closest('.inputDetailGroup').remove();
});



let careerId = $(".careerGroup").length;

$("#addCareerButton").click(function () {
    careerId++;

    let newCareerGroup = $(".careerGroup").first().clone();
    newCareerGroup.find("input").val("");

    newCareerGroup.find("input").each(function() {
        let className = $(this).attr('class').split(' ')[1];
        $(this).attr('id', className + careerId);
    });

    $('#careerContainer').append(newCareerGroup);
});




// 수정버튼 클릭 시 데이터 전송 이벤트
$('#updateResumeBtn').click(function () {

    let resumeId = $('#resumeId').val();
    let title = $('#resumeTitle').val();

    let careers = [];
    $('.careerGroup').each(function (index, element) {
        let career = {
            careerId: $(this).find('.careerId').val(),
            companyName: $(this).find('.companyName').val(),
            entryDate: $(this).find('.entryDate').val(),
            resignationDate: $(this).find('.resignationDate').val(),
            task: $(this).find('.task').val(),
            position: $(this).find('.position').val(),
            description: $(this).find('.description').val(),
            resumeId: $('#resumeId').val()
        }

        careers.push(career);
    });
    console.log(careers);

    let educations = [];
    $('.educationGroup').each(function (index, element) {
        let education = {
            educationId: $(this).find('.educationId').val(),
            educationType: $(this).find('.educationType').val(),
            schoolName: $(this).find('.schoolName').val(),
            major: $(this).find('.major').val(),
            entryDate: $(this).find('.enterDate').val(),
            graduationDate: $(this).find('.gradDate').val(),
            status: $(this).find('.gradStatus').val(),
            resumeId: $('#resumeId').val()
        };
        educations.push(education);
    });
    console.log(educations);

    let certifications = [];
    $('.certificationGroup').each(function(index, element) {
        let certification = {
            certificationId: $(this).find('.certificationId').val(),
            certificationName: $(this).find('.certificationName').val(),
            getDate: $(this).find('.getDate').val(),
            organization: $(this).find('.organization').val(),
            resumeId: $('#resumeId').val()
        };
        certifications.push(certification);
    });
    console.log(certifications);

    let workAreas = [];
    $('.desiredLocation').each(function(index, element) {
        let workArea = {
            workAreaId: $(this).prev('.workAreaId').val(), // 이전 요소에 ID가 있음
            hopedWorkArea: $(this).val(),
            resumeId: $('#resumeId').val()
        };
        workAreas.push(workArea);
    });
    console.log(workAreas);

    let workCondition = {};
    workCondition = {
        workConditionId: $('#workConditionId').val(),
        salary: $('#desiredSalary').val(),
        employmentType: $('#employmentType').val(),
        resumeId: $('#resumeId').val()
    }
    console.log(workCondition);

    let military = $("input[name='militaryService']:checked").val();
    if(military === 'fulfilled') {
        military = $("#militaryRank").val();
    }
    console.log(military);

    // 자기소개
    let intro = $("#selfIntroduction").val();
    console.log(intro);

    // 희망업종
    let industryId = $("#desiredIndustry option:selected").val();
    console.log(industryId);

    // 서버로 보낼 데이터를 구성합니다.
    let resumeData = {
        military: military,
        intro: intro,
        industryId: industryId
    };

    let updateResumeData = {
        resumeId: resumeId,
        careers: careers,
        educations: educations,
        certifications: certifications,
        workAreas: workAreas,
        workCondition: workCondition,

        title: title,
        military: military,
        intro: intro,
        industryId: industryId
    }

    fetch("/resume/" + resumeId, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(updateResumeData)
    })
    .then(response => {
        // 응답을 텍스트로 처리
        const status = response.status;
        response.text().then(text => {
            alert(text);

            // 성공 시 리다이렉트
            if (status === 200) {
                window.location.href = "/resume/" + resumeId;
            }
            // 실패 시 페이지 리다이렉트
            else {
                window.location.href = window.location.href;  // 현재 페이지로 리다이렉트
            }
        });
    })
    .catch((error) => {
        // 요청이 실패했을 때 실행할 코드
        alert(error);
    });

});
