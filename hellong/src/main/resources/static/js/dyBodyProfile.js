/*$('#searchForm').submit(function(event) {
    event.preventDefault(); // 폼 제출 기본 동작 방지
    var formData = $(this).serialize(); // 폼 데이터 직렬화

    $.ajax({
        type: 'GET',
        url: 'dyBoardSearch', // 처리할 서버의 URL
        data: formData,
        success: function(data) {
            // 검색 결과 처리
            // 예를 들어, `data`를 검색 결과를 표시하는 데 사용
            $('.grid-container').html(data);
        },
        error: function() {
            // 오류 처리
            alert('검색에 실패했습니다. 다시 시도해주세요.');
        }
    });
});*/