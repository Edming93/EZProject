<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지 풋볼</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
	
<style>
.sideicon{
  			display: flex;
            position: fixed;
            right: 100px;
            width: 65px;
            height: 65px;
            bottom: 90px;

}

</style>	
</head>
<body>

	<div class="container">
		<div class="sideicon">
			<span><iconify-icon icon="fluent:clipboard-text-edit-20-filled" id="btn1" style="color: #05f;" width="100" height="100"></iconify-icon></span>
					
					
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
						<%-- <c:if test="${vo.isDelete == 1}"> --%>
						<tr>
							<td>${vo.blacklistCode}</td>
							<td>${vo.userName}</td>
							<td><a
								href="${pageContext.request.contextPath}/blacklist/blacklistmain/${vo.blacklistCode}">${vo.blacklistTitle}</a></td>
							<td>${vo.blacklistContent}</td>
							<td>${vo.blacklistLocal}</td>
							<td>${vo.blacklistCreateDate}</td>
						</tr>
						<%-- 	</c:if> --%>
					</c:forEach>
				</tbody>
			</table>
		</main>
	</div>
	<script type="text/javascript">
	/* 글쓰기 아이콘 누를시 이동 */
	document.getElementById("btn1").addEventListener("click",function(){

		$.ajax({
 			url : "${pageContext.request.contextPath}/loginPage/logincheck",
 			type : "GET",
 			contentType:"application/json; charset=utf-8",
 			dataType : "json",
 			data : JSON.stringify(),
 			success : function(data){
 
 				if(data==false){
 					Swal.fire({
 					   title: '글쓰기를 위해 로그인 해주세요!',
 					   text: '로그인 페이지로 이동하시겠습니까?',
 					   icon: 'warning',
 					   
 					   
 					   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
 					   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
 					   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
 					   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
 					   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
 					   
	 					   
 					   reverseButtons: false, // 버튼 순서 거꾸로
 					   
 					}).then(result => {
 					   // 만약 Promise리턴을 받으면,
 					   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
 					   
 						  location.href="${pageContext.request.contextPath}/loginPage/login";
 					   	  	
 					   }
 					});
 				} else {
 					location.href = "${pageContext.request.contextPath}/blacklist/blacklistmain/setbbs";
 				}
			}
 		});
	});
		
	</script>


</body>
</html>