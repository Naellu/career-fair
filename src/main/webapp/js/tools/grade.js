
// 학점 만점기준 변경 시 성적 option값 변경
$('#dev-grade-perfect-score-code').on('change', function() {
    let gradeScale = $(this).val();

    let gradeScale_45 = [
        {val: '', text: '선택'},
        {val: '4.5', text: 'A+'},
        {val: '4', text: 'A'},
        {val: '3.5', text: 'B+'},
        {val: '3', text: 'B'},
        {val: '2.5', text: 'C+'},
        {val: '2', text: 'C'},
        {val: '1.5', text: 'D+'},
        {val: '1', text: 'D'},
        {val: '0', text: 'F'}
    ];

    let gradeScale_43 = [
        {val: '', text: '선택'},
        {val: '4.3', text: 'A+'},
        {val: '4', text: 'A0'},
        {val: '3.7', text: 'A-'},
        {val: '3.3', text: 'B+'},
        {val: '3.0', text: 'B0'},
        {val: '2.7', text: 'B-'},
        {val: '2.3', text: 'C+'},
        {val: '2.0', text: 'C0'},
        {val: '1.7', text: 'C-'},
        {val: '1.3', text: 'D+'},
        {val: '1.0', text: 'D0'},
        {val: '0.7', text: 'D-'}
    ];

    let selectedGradeScale = gradeScale === '4.5' ? gradeScale_45 : gradeScale_43;

    $('.dev-grade').each(function() {
        let selectBox = $(this);
        selectBox.empty(); // 기존의 모든 옵션 제거

        // 새로운 성적 옵션 추가
        $.each(selectedGradeScale, function(key, value) {
            selectBox.append($('<option>').attr('value', value.val).text(value.text));
        });
    });

    // 성적 값 변경 시 입력값 초기화
    resetFields();
});



// 학점목록 추가 버튼
$('#dev-add-item').on('click', function() {
    // 새 테이블 행(TR) 생성
    let $newTr = $('<tr>');

    // 과목명 입력 필드 생성
    let $subjectInput = $('<input>')
        .addClass('form-control dev-subject')
        .attr({
            'type': 'text',
            'name': 'subject',
            'maxlength': '100',
            'title': '과목명'
        });

    // 학점 입력 필드 생성
    let $creditInput = $('<input>')
        .addClass('form-control dev-credit dev-two-decimal-places')
        .attr({
            'type': 'text',
            'name': 'credit',
            'maxlength': '4',
            'title': '학점'
        });

    // 성적 셀렉트 박스 생성
    let $gradeSelect = $('<select>')
        .addClass('form-control dev-grade dev-select')
        .attr('name', 'selPoint')
        .append([
            $('<option>').attr('value', '').text('선택'),
            $('<option>').attr('value', '4.5').text('A+'),
            $('<option>').attr('value', '4').text('A'),
            $('<option>').attr('value', '3.5').text('B+'),
            $('<option>').attr('value', '3').text('B'),
            $('<option>').attr('value', '2.5').text('C+'),
            $('<option>').attr('value', '2').text('C'),
            $('<option>').attr('value', '1.5').text('D+'),
            $('<option>').attr('value', '1').text('D'),
            $('<option>').attr('value', '0').text('F'),
            // ... 나머지 옵션들
        ]);

    // 전공 체크박스 생성
    let $majorCheckbox = $('<input>')
        .addClass('form-check-input dev-major')
        .attr({
            'type': 'checkbox',
            'value': ''
        });

    // 삭제 버튼 생성
    let $deleteButton = $('<button>')
        .addClass('btn btn-danger dev-delete-item')
        .attr('type', 'button')
        .text('삭제');

    // 새 행에 요소들 추가
    $newTr.append(
        $('<td>').append($subjectInput),
        $('<td>').append($creditInput),
        $('<td>').append($gradeSelect),
        $('<td>').append($('<div>').addClass('form-check').append($majorCheckbox)),
        $('<td>').append($deleteButton)
    );

    // 테이블에 새 행 추가
    $('#dataInputTable tbody').append($newTr);
});

// 학점 입력칸 삭제
$("#dataInputTable").on("click", '.dev-delete-item', function () {
    $(this).closest('tr').remove();
});


// 학점계산
// (학점 * 성적) / 총 학점
$('#dev-calculate').click(function() {

    let totalCredits = 0;
    let totalGradePoints = 0;
    let totalMajorCredits = 0;
    let totalMajorGradePoints = 0;

    let entriesFound = false;
    let incompleteFound = false;

    $('#dataInputTable tbody tr').each(function() {
        let credit = parseFloat($(this).find('.dev-credit').val()); // 학점
        let grade = parseFloat($(this).find('.dev-grade').val()); // 성적

        if (isNaN(credit) || isNaN(grade)) {
            // 학점, 성적 둘 중 하나라도 비어있는지 확인
            if (isNaN(credit) && isNaN(grade)) {
                // 학점, 성적 둘 다 비어있으면 계산하지 않고 패스
                return true;
            }
            incompleteFound = true;
            return false;
        }

        let isMajorChecked = $(this).find('.dev-major').is(':checked');
        if (isMajorChecked) {
            totalMajorCredits += credit; // 전공 이수학점
            totalMajorGradePoints += (credit * grade);
        }

        entriesFound = true;
        totalCredits += credit;
        totalGradePoints += (credit * grade);
    });

    // 둘 중에 하나라도 true이면 비정상적인 값
    if (!entriesFound || incompleteFound) {
        alert('올바른 학점/성적을 입력해주세요.');
        return;
    }

    let gpa = totalGradePoints / totalCredits;
    let majorGpa = totalMajorGradePoints / totalMajorCredits;

    if (isNaN(majorGpa)) {
        majorGpa = 0;
    }

    // 한번 더 검증
    if (typeof gpa === 'number' && typeof majorGpa === 'number' && isFinite(gpa)) {
        $('#dev-total-grade').text(gpa.toFixed(2));
        $("#dev-total-credit").text(totalCredits);
        $("#dev-major-grade").text(majorGpa.toFixed(2));
        $("#dev-total-major-credit").text(totalMajorCredits);
    } else {
        alert('올바른 학점/성적을 입력해주세요.');
    }
});

// 학점 입력 값 초기화
function resetFields() {
    $("#dataInputTable tbody tr").each(function () {
        $(this).find('input').val('');
        $(this).find('select').val('');
        $(this).find('.dev-major').prop('checked', false);
    });
    $('#dev-total-grade').text('0');
    $("#dev-total-credit").text('0');
    $("#dev-major-grade").text('0');
    $("#dev-total-major-credit").text('0');
}

// 초기화 버튼 클릭
$("#resetBtn").click(function () {
    resetFields();
});

// 학점에 숫자만 입력가능하게 하는 검사 코드
$('.dev-credit').on('input', function() {
    this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
    console.log("this value: " + this.value);
});