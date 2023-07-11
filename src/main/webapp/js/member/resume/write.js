$(document).ready(function () {
    updateMilitaryRankDisplay();

    $("input[name='militaryService']").change(function () {
        updateMilitaryRankDisplay();
    });
});


// 첫 번째 입력그룹들에서는 삭제버튼 숨김
$('.inputContainer').each(function () {
    $(this).find('.deleteButton').first().hide();
})

let careerId = 1;
$("#addCareerButton").click(function () {
    let newCareerGroup = $(".careerGroup").first().clone();
    careerId++;

    newCareerGroup.find(".careerId").attr('id', `careerId${careerId}`);
    newCareerGroup.find(".companyName").attr('id', `careerId${careerId}`);
    newCareerGroup.find(".startDate").attr('id', `careerId${careerId}`);
    newCareerGroup.find(".endDate").attr('id', `careerId${careerId}`);
    newCareerGroup.find(".position").attr('id', `careerId${careerId}`);
    newCareerGroup.find(".task").attr('id', `careerId${careerId}`);
    newCareerGroup.find(".others").attr('id', `careerId${careerId}`);

    newCareerGroup.find('input').val('');
    newCareerGroup.find('.deleteButton').show();

    $('#careerContainer').append(newCareerGroup);

    // // 경력 그룹 삭제 버튼
    // newCareerGroup.find('.deleteButton').click(function() {
    //     $(this).closest('.careerGroup').remove();
    // });
});

// 입력 그룹 삭제 버튼
$(".inputContainer").on('click', '.deleteButton', function () {
    $(this).closest('.inputDetailGroup').remove();
});

// 경력 입력 항목 추가
let careers = [];
$('.careerGroup').each(function() {
    let career = {};
    career.careerId = $(this).find('.careerId').val();
    career.companyName = $(this).find('.companyName').val();
    career.entryDate = $(this).find('.entryDate').val();
    career.resignationDate = $(this).find('.resignationDate').val();
    career.task = $(this).find('.task').val();
    career.position = $(this).find('.position').val();
    career.description = $(this).find('.description').val();

    careers.push(career);
});

// 학력 입력 항목 추가
let educationId = 1;
$("#addEducation").click(function () {
    let newEducationGroup = $(".educationGroup").first().clone();
    educationId++;

    newEducationGroup.find("#educationType").attr('id', `educationType${educationId}`);
    newEducationGroup.find("#schoolName").attr('id', `schoolName${educationId}`);
    newEducationGroup.find("#enterDate").attr('id', `enterDate${educationId}`);
    newEducationGroup.find("#gradDate").attr('id', `gradDate${educationId}`);
    newEducationGroup.find("#major").attr('id', `major${educationId}`);
    newEducationGroup.find("#gradStatus").attr('id', `gradStatus${educationId}`);

    newEducationGroup.find('input').val('');
    newEducationGroup.find('.deleteButton').show();

    $('#educationContainer').append(newEducationGroup);
});

let educations = [];

$('.educationGroup').each(function() {
    let education = {};
    education.educationType = $(this).find('.educationType').val();
    education.schoolName = $(this).find('.schoolName').val();
    education.enterDate = $(this).find('.enterDate').val();
    education.gradDate = $(this).find('.gradDate').val();
    education.major = $(this).find('.major').val();
    education.gradStatus = $(this).find('.gradStatus').val();

    educations.push(education);
});


// 자격증 입력 항목 추가
let certId = 1;
$("#addCertification").click(function () {
    let newCertGroup = $(".certificationGroup").first().clone();
    certId++;

    newCertGroup.find(".certName").attr('id', `certName${certId}`);
    newCertGroup.find(".acquisitionDate").attr('id', `acquisitionDate${certId}`);
    newCertGroup.find(".validity").attr('id', `validity${certId}`);

    newCertGroup.find('input').val('');
    newCertGroup.find('.deleteButton').show();

    $('#certificationContainer').append(newCertGroup);
});

let certifications = [];

$(".certificationGroup").each(function() {
    let cert = {};
    cert.certName = $(this).find('.certName').val();
    cert.acquisitionDate = $(this).find('.acquisitionDate').val();
    cert.validity = $(this).find('.validity').val();

    certifications.push(cert);
});

// 근무지역 추가
var workAreaIndex = 2;
$("#addWorkArea").click(function() {
    let newWorkArea = $(".desiredLocation").first().clone();
    newWorkArea.attr("id", "desiredLocation" + workAreaIndex++);
    newWorkArea.val('');
    newWorkArea.appendTo("#workAreaContainer");
});



// 이력서 제출 등록
$("#submitResumeButton").click(function () {

    // 경력
    let careers = [];
    $('.careerGroup').each(function () {
        let career = {};
        // career.careerId = $(this).find('.careerId').val();
        career.companyName = $(this).find('.companyName').val();
        career.entryDate = $(this).find('.entryDate').val();
        career.resignationDate = $(this).find('.resignationDate').val();
        career.task = $(this).find('.task').val();
        career.position = $(this).find('.position').val();
        career.description = $(this).find('.description').val();

        careers.push(career);
    });

    // 학력
    let educations = [];
    $('.educationGroup').each(function () {
        let education = {};
        // education.educationId = $(this).find('.educationId').val();
        education.educationType = $(this).find('.educationType').val();
        education.schoolName = $(this).find('.schoolName').val();
        education.entryDate = $(this).find('.enterDate').val();
        education.graduationDate = $(this).find('.gradDate').val();
        education.major = $(this).find('.major').val();
        education.status = $(this).find('.gradStatus').val();

        educations.push(education);
    });

    // 자격증
    let certifications = [];
    $('.certificationGroup').each(function () {
        let certification = {};
        certification.certificationName = $(this).find('.certificationName').val();
        certification.getDate = $(this).find('.getDate').val();
        certification.organization = $(this).find('.organization').val();

        certifications.push(certification);
    });

    // 희망 근무지역
    let workAreas = [];
    $(".desiredLocation").each(function() {
        let workArea = $(this).val();
        if(workArea) {  // 입력이 비어있지 않은 경우에만 추가
            workAreas.push({
                "hopedWorkArea": workArea
            });
        }
    });

    // 희망 근무조건
    let workCondition = {
        "salary": $("#desiredSalary").val(),
        "employmentType": $("#employmentType").val()
    };

    // 이력서 제목
    let title = $('#resumeTitle').val()

    // 병역여부
    let militaryService = $("input[name='militaryService']:checked").val();
    let militaryRank = $('#militaryRank').val();
    let military;

    military = (militaryService === 'fulfilled') ? militaryRank : militaryService;

    // 자기소개
    let intro = $('#selfIntroduction').val();

    // 희망업종
    let industry = $('#desiredIndustry').val();

    // 서버에 보낼 데이터
    let resume = {
        resumeId: 1, // 테스트 resumeId
        careers: careers,
        educations: educations,
        certifications: certifications,
        workAreas: workAreas,
        workCondition: workCondition,
        title: title,
        military: military,
        intro: intro,
        industryId: industry
    }

    fetch("/member/resume/write", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(resume),

    })
        .then(data => {
            console.log("career data has been sent successfully");
        })
        .catch(error => {
            console.log("career data send error", error);
        });

});

function updateMilitaryRankDisplay() {
    if ($('#fulfilled').is(':checked')) {
        $('#militaryRank').show();
    } else {
        $('#militaryRank').hide();
    }
}



