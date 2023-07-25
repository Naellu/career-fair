
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