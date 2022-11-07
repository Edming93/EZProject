<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<style>
	*{
		box-sizing: border-box;
		margin: 0;
	}
	
	#inquiry_list{
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
	margin: 20px 0;
}

#inquiry_list th, td {
	border-bottom: 1px solid black;
	padding: 10px;
	text-align: center;
}

/* #inquiry_list th:first-child{ */
/* 	border-radius: 15px 0 0 0; */
/* } */

/* #inquiry_list th:last-child{ */
/* 	border-radius: 0 15px 0 0; */
/* } */

#inquiry_list th {
/* 	background-color: #26a653; */
/* 	color: #fff; */
	border-bottom: 1px solid black;
}
	
	.up_down{
	position: relative;
}

.up_down:after {
    position: absolute;
    left: -70px;
    top: 3px;
    content: '';
    width: 7px;
    height: 7px;
    border-top: 2px solid #fff;
    border-right: 2px solid #fff;
    transform: rotate(135deg);
}

.up_down2{
	display:none;
	position: relative;
/* 	float: right; */
    margin: 8px 0 0 0;
}

.up_down2:after {
    position: absolute;
    left: -70px;
    top: 8px;
    content: '';
    width: 7px;
    height: 7px;
    border-top: 2px solid #fff;
    border-right: 2px solid #fff;
    transform: rotate(315deg);
}

.select_box {
	position: absolute;
	display:none;
	right: 210px;
	top: 240px;
	color: #000;
}

.select_box1, .select_box2, .select_box3 {
	padding: 10px;
	background-color: #fff;
	cursor: pointer;
}


.main_content1 {
	display: flex;
	flex-direction: column;
	width: 70%;
	height:90%;
	background-color: #fff;
	padding: 20px;
}

.main_item1, .main_item2 {
	display: flex;
	width: 100%;
	height: 40vh;
	flex-direction: column;
}

.main_item1 p, .main_item2 p{
	display: block;
	font-size: 15px;
	opacity: 0.9;
}

.main_item1 h5, .main_item2 h5 {
	display: block;
	font-size: 15px;
	opacity: 0.9;
	min-width: 100px;
}


.detail_header {
	display:flex;
	width: 100%;
	padding: 20px 10px;
	border-bottom: 1px solid #ccc;
}

.header_item1{
	display:flex;
	width: 49%;
}

.header_item2{
	display:flex;
	width: 49%;
	justify-content: space-evenly;
}


.detail_title{
    display: flex;
    width: 100%;
    padding: 20px 10px;
    border-bottom: 1px solid #ccc;
}

.title_item {
	display: flex;
	width: 100%;
}

.detail_content {
	display:flex;
	width: 100%;
	min-height:60%;
	padding: 30px 10px;
	border-bottom: 1px solid #ccc;
}

.content_item {
	display: flex;
}

.content_item h5{
	align-self: center;
}

/* .title_item p { */
/* 	width: 70%; */
/* 	padding-left: 15%; */
/* } */

.btn_box{
	display: flex;
	justify-content: space-evenly;
}
    
    .btn_box button {
	display: inline-block;
	width: 40%;
	padding: 15px 0;
	text-decoration: none;
	margin: 20px 0;
	color: #fff;
	font-weight:bold;
	font-size:18px;
	border: 1px solid #26a653;
	text-align: center;
	background-color: #26a653;
	border-radius: 20px;
}

.btn_box button:hover {
	opacity: 0.8;
}
</style>
<body>
	<h1>문의내역</h1>
	<div id="main_controller">
		<c:if test="${detail eq null }">
		<table id="inquiry_list">
							<tr>
								<th>문의번호</th>
								<th>문의제목</th>
								<th>문의날짜</th>
								<th>유저코드</th>
								<th class="select">문의상태
									
<!-- 									<div class="select_box"> -->
<!-- 										<div class="select_box1">전체보기</div> -->
<!-- 										<div class="select_box2">답변대기</div> -->
<!-- 										<div class="select_box3">답변완료</div> -->
<!-- 									</div> -->
<!-- 									<i class="up_down"></i> -->
<!-- 									<i class="up_down2"></i> -->
								</th>
								
							</tr>
							
							<c:forEach var="list" items="${inquiryList}">
								<tr class="inquiry_item${list.inquiryCode} item_box">
									<td>${list.inquiryCode}</td>
									<td>${list.inquiryTitle}</td>
									<td>${list.createDate}</td>
									<td>${list.userCode}</td>
									<td>${list.inquiryState}</td>
								</tr>	
								<script type="text/javascript">
									 $('.inquiry_item${list.inquiryCode}').on("click",function(){
										location.href = "${pageContext.request.contextPath}/admin/detail/${list.inquiryCode}";
									 });
								</script>
							</c:forEach>
							
						</table>
						</c:if>
						<c:if test="${detail ne null }">
						<div class="main_content1">
					<div class="main_item1">
						<div class="detail_header">
							<section class="header_item1">
								<h5>등록일</h5><p>${inquiryVO.createDate}</p>
							</section>
							<section class="header_item2">
								<h5>처리상태</h5><p>${inquiryVO.inquiryState}</p>
							</section>
						</div>
						<div class="detail_title">
							<section class="title_item">
								<h5>제목</h5><p>${inquiryVO.inquiryTitle}</p>
							</section>
						</div>
						<div class="detail_content">
							<section class="content_item">
								<h5>내용</h5><p>${inquiryVO.inquiryContent}</p>
							</section>
						</div>
					</div>
					<!-- 관리자 답변 들어갈곳 -->
					<c:if test="${inquiryVO.inquiryState eq '답변완료'}">
					<div class="main_item2">
						<div class="detail_header">
							<section class="header_item1">
								<h5>답변일</h5><p>${inquiryVO.answerDate}</p>
							</section>
						</div>
						<div class="detail_content">
							<section class="content_item">
								<h5>답변</h5><p>${inquiryVO.answerContent}</p>
							</section>
						</div>
					</div>
					</c:if>
					<c:if test="${inquiryVO.inquiryState eq '답변대기'}">
					<div class="main_item2">
						<div class="detail_content">
							<section class="content_item">
								<h5>답변내용</h5> <textarea id="answer" name="answer" rows="10" cols="100"></textarea>
							</section>
						</div>
					</div>
					<button id="add">답변하기</button>
					</c:if>
					<div class="btn_box">
						<button id="btn">뒤로가기</button>
					</div>
					</div>
				</div>
			</c:if>
	</div>
	
	<script type="text/javascript">
		$('#btn').on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/adminselect?adminselect=qna";
		});
		
		$('#add').on("click", function(){
			const answer = $('#answer').val();
			location.href = "${pageContext.request.contextPath}/admin/inquiry_add?detail=${inquiryVO.inquiryCode}&answer="+answer;
		});
	</script>
</body>
</html>