const fileNameList = document.querySelector("#file-name");
const bucketUrl = document.querySelector("#bucketUrl");
const fileNameContainer = document.querySelector('#file-container');

const fileList = fileNameList.value;

console.log(fileList);
/*
if (fileNameList.value.length === 0) {
    fileNameContainer.classList.add('d-none');
} else {
    fileList.value.forEach(fileName => {
        const fileLink = document.createElement('a');
        fileLink.href = `${bucketUrl}/exhibitionInfo/1/${fileName}`;
        fileLink.textContent = fileName;
        fileLink.classList.add('form-control');
        fileLink.download = fileName;

        fileNameContainer.appendChild(fileLink);
    });
}*/
