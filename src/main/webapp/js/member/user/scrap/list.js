const cancelBtns = document.getElementsByName("cancelBtn")
for(const cancelBtn of cancelBtns){
    cancelBtn.addEventListener("click",function (){
        const scrapId = $(this).data("scrapId");
        $("#scrapId").attr("value",scrapId);
    })
}

