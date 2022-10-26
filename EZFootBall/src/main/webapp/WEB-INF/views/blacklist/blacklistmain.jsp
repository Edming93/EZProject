<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지 풋볼</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

</head>
<body>

	<div class="container">
	
	<div class="pannel">
			<button id="btn1">글쓰기</button>
		</div>
		
		<main>
			<table>
				<thead>
					<tr>
						<th>글 번호</th>
						<th>글쓴이</th>
						<th>제목</th>
						<th>내용</th>
						<th>지역</th>
						<th>작성일/작성시간</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="vo" items="${list}">			
					<tr>
						<td>${vo.blacklistCode}</td>
						<td>${vo.userName}</td>
						<td><a href="${pageContext.request.contextPath}/blacklist/blacklistmain/${vo.blacklistCode}">${vo.blacklistTitle}</a></td>
						<td>${vo.blacklistContent}</td>
						<td>${vo.blacklistLocal}</td>
						<td>${vo.blacklistCreateDate}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
	</div>
	<script type="text/javascript">

document.getElementById("btn1").addEventListener("click", function(){
	//로그인 여부
	//로그인 컨트롤러에서 logincheck를 ajax로 불러옴
	location.href="${pageContext.request.contextPath}/blacklist/blacklistmain/setbbs";	
	
	
});




</script>
	

</body>
</html>