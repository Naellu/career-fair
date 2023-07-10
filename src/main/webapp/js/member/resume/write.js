
$(document).ready(function () {
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

        $('#careerContainer').append(newCareerGroup);
    });

    let careers = [];

    $('.careerGroup').each(function() {
        let career = {};
        career.careerId = $(this).find('.careerId').val();
        career.companyName = $(this).find('.companyName').val();
        career.startDate = $(this).find('.startDate').val();
        career.endDate = $(this).find('.endDate').val();
        career.position = $(this).find('.position').val();
        career.task = $(this).find('.task').val();
        career.others = $(this).find('.others').val();

        careers.push(career);
    });
});


