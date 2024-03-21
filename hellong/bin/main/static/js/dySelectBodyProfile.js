// 게시글 삭제 알림
function confirmDeletion(element) {
	var b_number = element.getAttribute('data-b_number'); 
	var confirmAction = confirm("정말로 게시글을 삭제하시겠습니까?");
	if (confirmAction) {
		location.href = 'dyDeleteBodyProfile?b_number=' + b_number; 
		return true;
	} else {
		return false;
	}
}
// 게시글 신고
function submitReport() {
	var reportSelect = $("#reportSelect").val();
	var b_number = $("#b_number").val(); // 게시글 번호를 input 필드로 받아옴
	var m_number = $("#m_number").val(); // m_number를 input 필드로 받아옴

	if (reportSelect) {
		var formAction = 'dyReported?b_number=' + b_number + '&m_number=' + m_number + '&common_bcd=400&common_mcd=' + reportSelect;
		$("#reportForm").attr('action', formAction).submit();
	} else {
		alert("신고 유형을 선택해주세요.");
	}
}

// 추천기능 
document.addEventListener("DOMContentLoaded", function() {
	const recommendButton = document.getElementById("recommendButton");
	recommendButton.addEventListener("click", function() {
		const b_number = this.getAttribute("data-b_number");

		fetch("/recommend", {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded",
			},
			body: `b_number=${b_number}`
		})
			.then(response => response.text())
			.then(data => {
				alert(data);
				if (data === "추천되었습니다.") {
					let recommCountElement = document.getElementById("recommCount");
					recommCountElement.innerText 
						= parseInt(recommCountElement.innerText) + 1;
				}
			})
			.catch(error => console.error('Error:', error));
	});
});


