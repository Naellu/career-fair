listAnswer();
const toast = new bootstrap.Toast(document.querySelector('.toast'));

$("#sendAnswerBtn").click(function() {
    const questionId = $("#questionIdText").text().trim();
    const content = $("#answerTextArea").val();
    const data = { questionId, content };

    $.ajax({
        url: "/answer/add",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: function(jqXHR) {
            listAnswer();
            $(".toast-body").text(jqXHR.responseJSON.message);
            toast.show();

            $("#answerTextArea").val("");
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
    const questionId = $("#questionIdText").text().trim();

    $.ajax("/qna/id/" + questionId, {
        method: "get",
        success: function (qna) {
            const qnaId = qna.qnaId;

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

                        $("#answerListContainer").append(`
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
                        $(".answerUpdateButton").click(function () {
                            const id = $(this).attr("data-answer-id");
                            $.ajax("/answer/id/" + id, {
                                success: function (data) {
                                    $("#answerUpdateIdInput").val(data.id);
                                    $("#answerUpdateTextArea").val(data.content);

                                }
                            })
                        });

                        $(".answerDeleteButton").click(function () {
                            const answerId = $(this).attr("data-answer-id");
                            $("#deleteAnswerModalButton").attr("data-answer-id", answerId);
                        });
                    }
                    ;
                }
            });
        }
    });
}
