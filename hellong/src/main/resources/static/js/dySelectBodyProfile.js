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

// 추천 버튼 클릭 시 이벤트 처리
document.getElementById("recommendButton").addEventListener("click", function() {
    // 현재 버튼의 상태를 가져옴 (추천 상태인지 아닌지)
    var isRecommended = this.classList.contains("recommended");

    if (isRecommended) {
        // 이미 추천된 상태이면 추천 취소 처리
        this.classList.remove("recommended");
        // 추천 수 감소 로직 수행 (서버로 전송 등)
        decreaseRecommendCount();
    } else {
        // 추천되지 않은 상태이면 추천 처리
        this.classList.add("recommended");
        // 추천 수 증가 로직 수행 (서버로 전송 등)
        increaseRecommendCount();
    }
});

// 추천 수 증가 함수
function increaseRecommendCount() {
    // 추천 수를 표시하는 HTML 요소를 가져옴
    var recommendCountElement = document.getElementById("recommendCount");
    // 추천 수 증가 로직 수행 (예: 서버로 요청 등)
    // 여기서는 임의로 1씩 증가하는 것으로 가정
    var currentCount = parseInt(recommendCountElement.textContent);
    recommendCountElement.textContent = currentCount + 1;
}

// 추천 수 감소 함수
function decreaseRecommendCount() {
    // 추천 수를 표시하는 HTML 요소를 가져옴
    var recommendCountElement = document.getElementById("recommendCount");
    // 추천 수 감소 로직 수행 (예: 서버로 요청 등)
    // 여기서는 임의로 1씩 감소하는 것으로 가정
    var currentCount = parseInt(recommendCountElement.textContent);
    recommendCountElement.textContent = currentCount - 1;
}