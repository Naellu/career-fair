$("#removeButton").click(function () {
    const postingId = $("#postingid-text").val();
    const data = {postingId};

    $.ajax({
        type: 'post',
        url: "/admin/recruiter/remove",
        dataType: 'text',
        data: JSON.stringify(data),
        headers: {
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "POST"
        },
        success: function (result) {
            if (result == '{"result":1}'){
            alert("삭제에 성공하였습니다.")
            }
        },error: function(request, status, error) {
            console.log(error);
        }
    })
});
