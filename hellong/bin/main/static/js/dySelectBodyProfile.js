function confirmDeletion(element) {
    var bNumber = element.getAttribute('data-bnumber'); // 이렇게 데이터를 가져옵니다.
    var confirmAction = confirm("정말로 게시글을 삭제하시겠습니까?");
    if (confirmAction) {
        location.href='dyDeleteBodyProfile?b_number=' + bNumber; // bNumber 변수를 사용합니다.
        return true;
    } else {
        return false;
    }
}