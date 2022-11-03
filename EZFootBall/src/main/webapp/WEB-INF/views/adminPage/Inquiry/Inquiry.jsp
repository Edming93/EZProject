<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main_content1">
			<div class="main_item1">
				<table id="inquiry_list">
					<tr>
						<th>문의번호</th>
						<th>문의제목</th>
						<th>문의날짜</th>
						<th>문의상태</th>
					</tr>
					
				<c:forEach var="list" items="${list}">
					<tr class="inquiry_item${list.inquiryCode} item_box">
						<td>${list.inquiryCode}</td>
						<td>${list.inquiryTitle}</td>
						<td>${list.createDate}</td>
						<td>${list.inquiryState}</td>
					</tr>	
					<script type="text/javascript">
						$('.inquiry_item${list.inquiryCode}').on("click",function(){
							location.href = "${pageContext.request.contextPath}/myPage/inquiry_detail/${list.inquiryCode}";
						 });
					</script>
				</c:forEach>
				</table>
			</div>
			<div class="main_item2">
		</div>
		<div class="btn_box">
			<button id="inquiry">문의하기</button>
			<button id="btn">뒤로가기</button>
		</div>
	</div>
</body>
</html>