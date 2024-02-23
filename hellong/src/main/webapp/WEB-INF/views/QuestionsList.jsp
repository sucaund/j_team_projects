<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 커뮤니티 - 1:1문의</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css">
    <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css"/>
    
</head>
<body>
   <header>
        <h1 class="title">헬롱</h1>
        <div class="search-container">
            <input type="text" id="searchBar" placeholder="Search...">
            <button id="searchButton">🔍</button>
        </div>
        <button id="loginButton">Login</button>
    </header>
    <nav class="navigation">
        <button>홈</button>
        <button>블로그</button>
        <button>프로젝트</button>
        <button>마이페이지</button>
    </nav>
    <div class="container">
        <aside class="sidebar">
            <ul>
                <li><a href="#">고객센터</a></li>
                <li><a href="#">공지사항</a></li>
                <li id="body-profile-category"><a href="#">1:1문의</a></li>
            </ul>
        </aside>
        <main class="main-content">
            <div class="posts-grid"></div>
            <div class="pagination">

			<c:set var="num" value="${page.total-page.start+1 }"></c:set>
<table>
		<tr><th >번호</th><th>제목</th><th>작성일</th><th>답글</th></tr>
			<c:forEach var="board" items="${listBoard}">
			<tr><td>${num}</td><p> 
			<td>${board.b_title }</td><p>
			<td>${board.b_regdate}</td><p>
			<td>${board.b_comm_group }</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>	
	
	<c:if test="${page.startPage > page.pageBlock }">
		<a href="listEmp?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="listEmp?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<a href="listEmp?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
	</c:if>	


            </div>
        </main>
    </div>
    <footer>
        <p>  2024 Hellong. All rights reserved.</p>
    </footer>
    <script src="<%= request.getContextPath() %>/js/index.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/index.js"></script>
</body>
</html>