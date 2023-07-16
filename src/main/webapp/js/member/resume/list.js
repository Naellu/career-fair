$(document).ready(function () {


    $('.deleteBtn').click(function (e) {
        e.preventDefault();

        // 클릭된 버튼의 id에서 이력서 id를 추출
        let resumeId = this.id.split("_").pop();
        let confirmDelete = confirm("이력서를 삭제하시겠습니까?");

        if (confirmDelete) {
            fetch('/member/resume/' + resumeId, {
                method: 'DELETE',
            }).then((response) => {
                if (response.ok) {
                    return response.text();
                } else {
                    throw new Error("잘못된 사용자 입력입니다");
                }
            }).then((responseMessage) => {
                alert(responseMessage);
                location.reload();
            }).catch((error) => {
                alert('삭제에 실패했습니다');
                console.log(error);
            })
        }


        // DELETE 요청을 보냄
        // fetch(url, {
        //     method: "DELETE",
        // })
        // .then(response => {
        //     if(response.ok){
        //         return response.text();
        //     }
        //     throw new Error('Delete request failed.');
        // })
        // .then(data => {
        //     alert(data);
        //     location.reload();
        // })
        // .catch((error) => {
        //     console.error('Error:', error);
        // });

    });

});
