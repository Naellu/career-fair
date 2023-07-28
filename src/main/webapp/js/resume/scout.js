$(document).ready(function() {
    let urlParams = new URLSearchParams(window.location.search);
    let industries = urlParams.getAll('industry').map(Number);

    $.each(industries, function(index, industryId) {
        let checkbox = $('#industry_' + industryId);
        if (checkbox.length) {
            checkbox.prop('checked', true);
        }
    });

    initHashTags(); // 페이지 로딩 시 조건이 체크된 상태에 따라 해시태그 출력
});

// 해시태그 생성
function createTagElement(industryName, industryId) {
    return $('<span></span>')
        .text('#' + industryName)
        .addClass('badge bg-primary me-1 industry-tag')
        .attr('data-id', industryId);
}

// 체크박스 상태 변경 시
function handleIndustryChange() {
    let industryId = $(this).val();
    let industryName = $("label[for='industry_" + industryId + "']").text();

    // 체크된 상태면 해시태그 추가
    if ($(this).is(":checked")) {
        $("#selectedIndustry").append(createTagElement(industryName, industryId));
    } else {
        // 체크해제 상태면 해시태그 제거
        $(".industry-tag[data-id='" + industryId + "']").remove();
    }
}

// 해시태그 클릭 시 태그 삭제 및 체크 해제
function handleTagClick() {
    let industryId = $(this).data('id');
    $("#industry_" + industryId).prop('checked', false);
    $(this).remove();
}

// 조건 초기화
function resetIndustrySelection() {
    $("input[type=checkbox][name=industry]").prop('checked', false);
    $(".industry-tag").remove();

    // URL의 쿼리 파라미터 삭제
    let url = window.location.protocol + "//" + window.location.host + window.location.pathname;
    // 페이지 리로드
    window.location.href = url;
}

// 체크된 체크박스에 대해 해시태그를 생성
function initHashTags() {
    $("input[type=checkbox][name=industry]:checked").each(function() {
        let industryId = $(this).val();
        let industryName = $("label[for='industry_" + industryId + "']").text();
        $("#selectedIndustry").append(createTagElement(industryName, industryId));
    });
}

$("input[type=checkbox][name=industry]").change(handleIndustryChange);
$(document).on('click', '.industry-tag', handleTagClick);
$('#resetButton').click(resetIndustrySelection);