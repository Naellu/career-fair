/*$(".removeButton").click(function () {
    alert("버튼");

    let postindId = $(this).data("postingId");
    console.log(postindId);
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
});*/

window.addEventListener("DOMContentLoaded", function () {
    let removeButtons = document.querySelectorAll(".removeButton");

    removeButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            let postingId = button.dataset.postingid;
            $.ajax({
              url: "/admin/management/remove",
              method: "POST",
              data: { postingId: postingId },
              success: function (response) {
                if(response.message === "success"){
                    alert("삭제완료 되었습니다.");
                    window.location.href = "/admin/management/recruitmanagement";
                }else {
                    alert("삭제에 실패하였습니다.");
                    window.location.href = "/admin/management/recruitmanagement";
                }
              },
              error: function (error) {
                console.error("삭제 요청 실패:", error);
              },
            });
        });
    });
});

window.addEventListener("DOMContentLoaded", function () {
    let statusButton = document.querySelectorAll(".statusButton");

    statusButton.forEach(function (button) {
        button.addEventListener("click", function () {
            let postingId = button.dataset.postingid;
            $.ajax({
                url: "/admin/management/recruitend",
                method: "POST",
                data: { postingId: postingId },
                success: function (response) {
                    if(response.message === "success"){
                        alert("마감이 완료 되었습니다.");
                        window.location.href = "/admin/management/recruitmanagement";
                    }else {
                        alert("마감 완료에 실패하였습니다.");
                        window.location.href = "/admin/management/recruitmanagement";
                    }
                },
                error: function (error) {
                    console.error("삭제 요청 실패:", error);
                },
            });
        });
    });
});