function checkRecipientId (){
    const recipientId = $("#recipientId").val();
    $.ajax("/member/members/checkId/" + recipientId, {
        method:"get",
        success:function (result){
            if(!result.available){
                $("#checkRecipient").text("발송가능한 ID입니다.");
                $("#checkRecipient").data('check',true);
                $("#sendBtn").removeAttr("disabled");
            } else{
                $("#checkRecipient").text("없는 ID 입니다.")
                $("#checkRecipient").data('check',false);
                $("#sendBtn").attr("disabled","disabled");
            }
        }
    })
}


$("#recipientId").on("keyup",function(){
    checkRecipientId();
})