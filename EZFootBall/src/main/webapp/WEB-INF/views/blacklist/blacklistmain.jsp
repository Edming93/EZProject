<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="icon" href="../image/ez_con.png">
<link rel="stylesheet" href="../css/review.css">	
<style>

.main_logo {
	background: url("${pageContext.request.contextPath}/image/ez_logo.svg")
		no-repeat center;
	background-size: 65px 35px;
	cursor: pointer;

	div1 {
		font-size: 20px;
		
	}
	
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
	<div class="header_container">
			<div class="header_area">
				<div class="header_content">
					<div class="header_left main_logo">
						<!-- 					<img class="ez_icon" src="/image/ez_logo.svg"> -->
					</div>
					<div class="header_right login_btn etc_btn">
						<input type="text" class="search_input">
						<div class="login_icon">
							<a href="${pageContext.request.contextPath}/loginPage/login">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
										clip-rule="evenodd"
										d="M12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2ZM9 7C9 5.34315 10.3431 4 12 4C13.6569 4 15 5.34315 15 7C15 8.65685 13.6569 10 12 10C10.3431 10 9 8.65685 9 7Z"
										fill="#464A54" />
                            <path fill-rule="evenodd"
										clip-rule="evenodd"
										d="M12 13.5C7.5502 13.5 5.07689 15.0054 3.93312 16.0093C3.22723 16.6288 3 17.4996 3 18.2447C3 20.3187 4.68132 22 6.75534 22H17.2447C19.3187 22 21 20.3187 21 18.2447C21 17.4996 20.7728 16.6288 20.0669 16.0093C18.9231 15.0054 16.4498 13.5 12 13.5ZM5.25244 17.5124C6.03934 16.8217 8.04626 15.5 12 15.5C15.9537 15.5 17.9607 16.8217 18.7476 17.5124C18.8856 17.6335 19 17.8668 19 18.2447C19 19.2141 18.2141 20 17.2447 20H6.75534C5.78589 20 5 19.2141 5 18.2447C5 17.8668 5.11441 17.6335 5.25244 17.5124Z"
										fill="#464A54" />
                            </svg>
							</a>
						</div>
						<div class="etc_icon">
							<a href="${pageContext.request.contextPath}/etc/etc"> <svg
									width="24" height="24" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
                                <path
										d="M5.5 10.5C6.32843 10.5 7 11.1716 7 12C7 12.8284 6.32843 13.5 5.5 13.5C4.67157 13.5 4 12.8284 4 12C4 11.1716 4.67157 10.5 5.5 10.5Z"
										fill="#464A54" />
                                <path
										d="M12 10.5C12.8284 10.5 13.5 11.1716 13.5 12C13.5 12.8284 12.8284 13.5 12 13.5C11.1716 13.5 10.5 12.8284 10.5 12C10.5 11.1716 11.1716 10.5 12 10.5Z"
										fill="#464A54" />
                                <path
										d="M18.5 10.5C19.3284 10.5 20 11.1716 20 12C20 12.8284 19.3284 13.5 18.5 13.5C17.6716 13.5 17 12.8284 17 12C17 11.1716 17.6716 10.5 18.5 10.5Z"
										fill="#464A54" />
                            </svg>
							</a>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="big_menu_container">
			<div class="big_menu_area">
				<div class="big_menu_content">
					<div class="menu menu1">
						<a class="menu1_a" href="${pageContext.request.contextPath}/">소셜
							매치</a>
					</div>
					<div class="menu menu2">
						<a class="menu2_a" href="${pageContext.request.contextPath}/">팀
							매치</a>
					</div>
					<div class="menu menu3">
						<a class="menu3_a"
							href="${pageContext.request.contextPath}/rental/rental">구장 예약</a>
					</div>
					<div class="menu menu4">
						<a class="menu4_a" href="#">랭킹</a>
					</div>
					<div class="menu menu5">
						<a class="menu5_a"
							href="${pageContext.request.contextPath}/review/reviewmain">커뮤니티</a>
					</div>
				</div>
			</div>

		</div>

		<div class="reviewmain1">
			<div class="banner_container">
				<div class="banner_content_area">
					<div class="banner_content">
						<img class="banner_image" src="../image/bannerblack.jpg"
							alt="">
					</div>
				</div>
			</div>
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