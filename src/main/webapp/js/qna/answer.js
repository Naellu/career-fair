listAnswer();
const toast = new bootstrap.Toast(document.querySelector('.toast'));

$("#sendAnswerBtn").click(function() {
    const qnaId = $("#questionIdText").text().trim();
    const content = $("#answerTextArea").val();
    const data = {
        qnaId,
        content};

    $.ajax({
        url: "/answer/add",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function(data) {
            listAnswer();
            if (data && data.message) {
                $(".toast-body").text(data.message);
            } else {
                $(".toast-body").text("응답이 올바르지 않습니다.");
            }
            toast.show();

            $("#answerTextArea").val("");
        },
        error: function () {
            $(".toast-body").text("로그인 해주세요");
            toast.show();
        }
    });

});

$("#updateAnswerBtn").click(function() {
    const answerId = $("#answerUpdateIdInput").val();
    const content = $("#answerUpdateTextArea").val();
    const data = {
        id: answerId,
        content: content
    }
    $.ajax("/answer/update", {
        method: "put",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: function(jqXHR) {
            listAnswer();
            $(".toast-body").text(jqXHR.responseJSON.message);
            toast.show();
        }
    })
})

$("#deleteAnswerModalButton").click(function() {
    const answerId = $(this).attr("data-answer-id");
    console.log(answerId)
    $.ajax("/answer/id/" + answerId, {
        method: "delete",
        complete: function(jqXHR) {
            listAnswer();
            $(".toast-body").text(jqXHR.responseJSON.message);
            toast.show();
        }
    });
});


function listAnswer() {
    const qnaId = $("#questionIdText").text().trim();

    $.ajax("/qna/id/" + qnaId, {
        method: "get",
        success: function (qna) {

            $.ajax("/answer/list?question=" + qnaId, {
                method: "get",
                success: function (answers) {
                    $("#answerListContainer").empty();
                    for (const answer of answers) {
                        const editButtons = `
                            <button 
                                id="answerDeleteBtn${answer.id}" 
                                class="answerDeleteButton btn btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#deleteAnswerConfirmModal"
                                data-answer-id="${answer.id}">
                                    <i class="fa-regular fa-trash-can"></i>
                            </button>
                            <button
                                id="answerUpdateBtn${answer.id}"
                                class="answerUpdateButton btn btn-secondary"
                                data-bs-toggle="modal" data-bs-target="#answerUpdateModal"
                                data-answer-id="${answer.id}">
                                    <i class="fa-regular fa-pen-to-square"></i>
                            </button>
                        `;

                        const $answerItem = $(`
                            <li class="list-group-item d-flex justify-content-between align-items-start">
                                <div class="ms-2 me-auto">
                                    <div class="fw-bold"> <i class="fa-regular fa-user"></i>${answer.memberId}</div>
                                    <div style="white-space: pre-wrap;">${answer.content}</div>
                                </div>
                                <div>
                                    <span class="badge bg-primary rounded-pill">${answer.created}</span>
                                </div>
                                <div class="text-end mt-2">
                                    ${answer.isWriter ? editButtons : ''}
                                </div>
                            </li>
                        `);

                        // 수정 버튼 클릭 이벤트 핸들러 등록
                        $answerItem.find(`#answerUpdateBtn${answer.id}`).click(function () {
                            const id = $(this).attr("data-answer-id");
                            $.ajax("/answer/id/" + id, {
                                success: function (data) {
                                    $("#answerUpdateIdInput").val(data.id);
                                    $("#answerUpdateTextArea").val(data.content);
                                }
                            });
                        });

                        // 삭제 버튼 클릭 이벤트 핸들러 등록
                        $answerItem.find(`#answerDeleteBtn${answer.id}`).click(function () {
                            const answerId = $(this).attr("data-answer-id");
                            $("#deleteAnswerModalButton").attr("data-answer-id", answerId);
                        });

                        $("#answerListContainer").append($answerItem);
                    }
                }
            });
        }
    });
}