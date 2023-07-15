
$('#getResumeUpdate').click(function () {
    let resumeId = $(this).val();
    window.location.href = "/member/resume/" + resumeId + "/update";
});