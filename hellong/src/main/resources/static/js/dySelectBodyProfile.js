function confirmDeletion(element) {
    var b_number = element.getAttribute('data-b_number'); // 데이터 가져오기
    var confirmAction = confirm("정말로 게시글을 삭제하시겠습니까?");
    if (confirmAction) {
        location.href='dyDeleteBodyProfile?b_number=' + b_number; // bNumber 변수를 사용
        return true;
    } else {
        return false;
    }
}

$('#recommendButton').on('click', function() {
    var $this = $(this);
    var b_number = $this.data('bnumber');
    $.ajax({
        type: 'POST',
        url: '/board/' + b_number + '/recommend/toggle', // 추천 추가/취소 요청 처리 경로
        success: function(response) {
            if(response.recommended) {
                alert("추천하셨습니다.");
                $this.addClass('active');
            } else {
                alert("추천을 취소하셨습니다.");
                $this.removeClass('active');
            }
            // 추천수 업데이트
            $('.recommend-count').text(response.recommendCount);
        },
        error: function(error) {
            console.log(error);
        }
    });
});