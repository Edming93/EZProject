<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>

</head>
<body>

<div class="container">

<form action="${pageContext.request.contextPath}/admin/reviewselect?comuselect=review" id="form1" method="post">
	
					<div class="search">
						<input type="text" name="reviewsel" id="reviewsel" placeholder="단어를 검색하세요" />
					</div>
					<div class="button">
						<button id="btn">검색</button>
					</div>
</form>
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
						<th>리뷰 번호</th>
						<th>유저 이름</th>
						<th>콘텐츠내용</th>
						<th>리뷰 날짜</th>
						<th>유저 코드</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${review}">
						<tr>
							<td><input type="checkbox" name="chBox" class="chBox"/></td>
							<td>${vo.reviewCode}</td>
							<td>${vo.userName}</td>
							<td>${vo.content}</td>
							<td>${vo.createDate}</td>
							<td>${vo.userCode}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		
	</div>
	<script type="text/javascript">
		$('#btn').on(click, function(){
			
		});
	</script>
</body>
</html>