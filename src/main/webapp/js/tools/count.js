
$(document).ready(function() {

    $('#textInputArea').keyup(function() {
        let text = $(this).val();
        $('#totalCount').text(text.length);

        if (text.length > 500) {
            $(this).val($(this).val().substring(0, 500));
            alert("글자수는 500자까지 입력 가능합니다");
        }

        let textWithoutSpaces = text.replace(/\s/g, "");
        $('#nonBlankCount').text(textWithoutSpaces.length);
    });

});