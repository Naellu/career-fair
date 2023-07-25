window.onload = function() {
    const check = $("#check").text();


    if(check == "true"){
        alert("지원이 취소되었습니다.");
    } else{
        alert("다시 시도해주세요")
    }
    window.opener.location.reload();
    window.close();
};