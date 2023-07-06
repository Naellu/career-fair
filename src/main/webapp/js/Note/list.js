function openNoteWindow(Url) {

    window.open(Url, '_blank', 'width=600,height=400');
}

function writeNote(writeNoteURL){
    window.close();
    openNoteWindow(writeNoteURL);
}

const deleteButtons = document.getElementsByName("deleteButton");
for (const deleteButton of deleteButtons){
    deleteButton.click(function (){
        alert('hi')
       /*
        const noteId = $(this).data('noteId');
        const data ={
            noteId: noteId
        }
        $.ajax('/note/delete',{
            method: "post",
            contentType:"application/json",
            data:JSON.stringify(data),
            success: function (response){
                alert(response.message)
            },
            error(){
                alert("에러~")
            }
        })
        */
    })


}