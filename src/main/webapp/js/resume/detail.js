
$('#getResumeUpdate').click(function () {
    let resumeId = $(this).val();
    window.location.href = "/resume/" + resumeId + "/update";
});