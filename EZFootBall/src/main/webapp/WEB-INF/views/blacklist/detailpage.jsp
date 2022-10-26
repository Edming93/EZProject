<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.container {
	display: grid;
	grid-template-columns: 200px 1fr 200px;
	grid-template-rows: 50px 50px 20px 300px 50px 10px 1fr 10px 50px;
	gap: 5px 5px;
	grid-auto-flow: row;
	grid-template-areas: ". . ." ". header ." ". . ." ". main ."
		". footer ." ". . ." ". comment ." ". . ." ". insert .";
}

.header {
	grid-area: header;
	display: grid;
	grid-template-columns: 75px 1fr;
	grid-template-rows: 1fr;
	gap: 3px;
	border-bottom: 1px solid black;
}

.main {
	grid-area: main;
	border: 1px solid black;
}

.footer {
	grid-area: footer;
	display: flex;
	flex-direction: row-reverse;
}

.comment {
	grid-area: comment;
	display: flex;
	flex-direction: column;
}

.insert {
	grid-area: insert;
	display: flex;
	flex-direction: row;
}

.insert>textarea {
	flex: 1;
}

.insert>button {
	width: 50px;
}
</style>
</head>
<body>



	<div class="container">
		<div class="header">
			<h4>제목 :</h4>
			<h4>${BlacklistVO.blacklistTitle}</h4>
		</div>
		<div class="editdelete" id="editdelete">
		<c:if test="${BlacklistVO.userId eq requestScope.userdata.userId}">
		<button>수정</button>
		<button>삭제</button>
		</c:if>
		</div>
		<div class="main">
			<p>${BlacklistVO.blacklistContent}</p>
		</div>
		<div class="footer">
			<button id="return">뒤로가기</button>
		</div>
		<div class="comment" id="comment"></div>
		<div class="insert" id="insert">
			<textarea name="inittext" id="inittext"></textarea>
			<button id="ibtn">댓글달기</button>
		</div>
	</div>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>	
	<script type="text/javascript">

document.getElementById("inittext").addEventListener("click", function(){
	//로그인 여부
	//로그인 컨트롤러에서 logincheck를 ajax로 불러옴

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
				}
		}
		});
});
</script>


</body>
</html>