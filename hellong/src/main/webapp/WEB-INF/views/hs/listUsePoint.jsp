<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포인트 충전내역</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style type="text/css">
		th, td {text-align: center;}
		
	    .button-container {
	        display: flex;
	        justify-content: flex-start;
	    }
	    
	    .button-container form {
	        margin-right: 10px;
	    }
	    
	    .button-container button:last-child {
	        margin-right: 0;
	        margin-left: auto;
	    }

	</style>
</head>
<body>
<main id="main" class="main">
		<section class="section container">
			<div class="row align-items-top col-8" style="margin: 0 auto">
				<% if (request.getAttribute("errorMessage") != null) { %>
				    <script>
				        alert('<%= request.getAttribute("errorMessage") %>');
				    </script>
				<% } %>
				
	<h3 style="text-align:left">포인트 내역</h3>
	<h4 style="text-align:left">${memberData.m_name }의 현재 포인트: ${memberData.m_currpoint }</h4>
	<p style="text-align:right">(총 내역수: ${totalListPoint})</p>
	

	<div class="button-container">
		<button type="button" class="btn btn-primary"
			onclick="location.href='hsListChargePoint?m_number=${memberData.m_number }'"><i class="bi bi-pencil-fill"></i>충전</button>
		<button type="button" class="btn btn-primary"
			onclick="location.href='hsListUsePoint?m_number=${memberData.m_number }'"><i class="bi bi-pencil-fill"></i>사용</button>
		<button type="button" class="btn btn-primary"
			onclick="location.href='hsListRefundPoint?m_number=${memberData.m_number }'"><i class="bi bi-pencil-fill"></i>환불</button>
		<button type="button" class="btn btn-primary"
			onclick="location.href='hsChargeFormPoint?m_number=${memberData.m_number}'"><i class="bi bi-pencil-fill"></i> 포인트 충전</button>
	</div>
	
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
	
	<table class="table" >
		<thead  style="background-color: #5494e8; color: white;">
		<tr><th>번호</th><th>유형</th><th>내용</th><th>포인트</th><th>날짜</th></tr>
		</thead>
		<c:choose>
			<c:when test='${listPoint == null or empty listPoint}'>
				<td colspan="4">
					<p align="center">
						<b><span style=''>포인트 내역이 없습니다.</span></b>
					</p>
				</td>
			</c:when>

			<c:when test="${listPoint != null }">
			
		<c:forEach var="listPoint" items="${listPoint }">
			<tr><td>${num }</td><td>${category }</td>
				<td>${listPoint.pl_content }   </td>
				<td>${listPoint.pl_point }</td>
				<td>${listPoint.pl_date }</td></tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</c:when>
		</c:choose>
	</table>

<div style="display: grid; place-items: center;">
		
	</div>
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="pagination d-flex justify-content-center">
	<c:if test="${page.startPage > page.pageBlock }">
		<li class="page-item"><a href="hsListUsePoint?currentPage=${page.startPage-page.pageBlock}&m_number=${memberData.m_number}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<li class="page-item"><a href="hsListUsePoint?currentPage=${i}&m_number=${memberData.m_number}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<li class="page-item"><a href="hsListUsePoint?currentPage=${page.startPage+page.pageBlock}&m_number=${memberData.m_number}">[다음]</a>
	</c:if>	
		</ul>
			</div>
		</div>
	</div>
	</div>
		</section>
	</main>	

</body>
</html>