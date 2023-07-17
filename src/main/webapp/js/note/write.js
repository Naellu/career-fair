function checkRecipientId (){
    const recipientId = $("#recipientId").val();
    $.ajax("/member/members/checkId/" + recipientId, {
        method:"get",
        success:function (result){
            if(!result.available){
                $("#checkRecipient").removeClass("d-none");
                $("#denyRecipient").addClass("d-none");
                $("#sendBtn").removeAttr("disabled");
            } else{
                $("#checkRecipient").addClass("d-none");
                $("#denyRecipient").removeClass("d-none");
                $("#sendBtn").attr("disabled","disabled");
            }
        }
    })
}


$("#recipientId").on("keyup",function(){
    checkRecipientId();
})