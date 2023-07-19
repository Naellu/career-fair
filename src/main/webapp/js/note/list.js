function openNoteWindow(Url) {

    window.open(Url, '_blank', 'width=600,height=450');
}

function writeNote(writeNoteURL){
    window.close();
    openNoteWindow(writeNoteURL);
}

const deleteButtons = document.getElementsByName("deleteButton");
for (const deleteButton of deleteButtons){
    deleteButton.addEventListener("click",function (){
        const noteId = $(this).data('noteId');
        $("#deleteNoteById").attr("value", noteId);
        console.log($("#deleteNoteById").val());
    })
}