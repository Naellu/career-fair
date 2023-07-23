function resizeTextarea(textarea) {
    textarea.style.height = 'auto'; // 먼저 기존의 높이를 초기화
    textarea.style.height = textarea.scrollHeight + 'px'; // 내용의 높이에 따라 새로운 높이를 설정
}

const etc = document.querySelector("#textarea");
const textAreaElement = document.querySelector("textarea");

textAreaElement.innerHTML = etc.value;
resizeTextarea(textAreaElement);
