listAnswer();
const toast = new bootstrap.Toast(document.querySelector('.toast'));

$("#sendAnswerBtn").click(function() {
    const questionId = $("#questionIdText").text().trim();
    const content = $("#answerTextArea").val();
    const data = { questionId, content };

    $.ajax({
        url: "/answer/add", // URL 수정
        method: "POST", // HTTP 메소드 수정
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

function listAnswer() {
    const questionId = $("#questionIdText").text().trim();
    $.ajax("/answer/list?question=" + questionId, {
        method: "get", // 생략 가능
        success: function(answers) {
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
                            <div class="fw-bold"> <i class="fa-regular fa-user"></i> Nice to Meat you</div>
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
            };
        }
    });
}
