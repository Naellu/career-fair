function defaultSet(){
    const selectElements = document.querySelectorAll('select');

    for (const selectElement of selectElements){
        const value = selectElement.getAttribute('data-val');

        for (const option of selectElement.children){
            if (option.getAttribute('value') == value){
                option.selected = true;
            }

        }
    }

}

$("#removeFileBtn").on("click",function (){
    const selectedFiles = document.querySelectorAll('#fileList option:checked');

    const removeFiles = [];

    for (const file of selectedFiles) {
        removeFiles.push(file.value);
        file.remove();
    }
    const existingValue = $("#removeFiles").val(); // 기존 값 가져오기
    const updatedValue = existingValue + removeFiles.join(','); // 기존 값과 선택된 값들 연결

    $("#removeFiles").val(updatedValue); // 값 업데이트




})