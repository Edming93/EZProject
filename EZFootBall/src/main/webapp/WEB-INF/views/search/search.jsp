<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<!-- CSS , JS -->
		<script src="js/jquery-3.6.1.min.js"></script>
		<link rel="stylesheet" href="css/search.css" />
		<style>
			
		</style>

		<body>
			<h1>검색창</h1>
			<div id="container">
				<form action="${pageContext.request.contextPath}/search_result" method="get">
					<div id="searchbar">
						<svg class="icon" width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg"
							class="icon">
							<circle data-v-454f7528="" cx="10.5" cy="10.5" r="6" stroke="#222836"></circle>
							<path data-v-454f7528="" stroke="#222836" d="M14.354 14.646l4.949 4.95"></path>
						</svg>
						<label for="search"><input type="text" name="search" id="search" placeholder="검색창" list=""/></label>
						<button id="searchbtn">검색</button>
					</div>
				</form>
				<div id="searchbox" class="saerchbox2">
					<span class="closebtn"><img src="image/close1.jpg" /></span>
					<div id="keyword">
						<p>최근 검색어</p>
						<ul id="keywords">

						</ul>
					</div>
					<section class="sch">
						<div class="schheader">
							<h3>다양한 매치</h3>
						</div>
						<div class="schmain">
							<a href="">
								<p>소셜매치</p>
							</a>
							<a href="">
								<p>팀매치</p>
							</a>
							<a href="">
								<p>구장예약</p>
							</a>
						</div>
					</section>
					<section class="sch">
						<div class="schheader">
							<h3>새로운 경기장</h3>
						</div>
						<div class="schmain2">
							<ul class="stadiumlist">
								<c:forEach items="${list}" var="field">
									<li><a class="recent" href="${pageContext.request.contextPath}/stadium/${field.fieldCode}">${field.fieldName}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</section>
				</div>
				<div id="search_result_box">
					<span class="closebtn"><img src="image/close1.jpg" /></span>
					<h5 id="search_result_box_inner"></h5>
					<section class="sch">
						<ul id="search_result_list">
							<li><a href="">임시결과창1</a></li>
							<li><a href="">임시결과창2</a></li>
							<li><a href="">임시결과창3</a></li>
							<li><a href="">임시결과창4</a></li>
							<li><a href="">임시결과창5</a></li>
							<li><a href="">임시결과창6</a></li>
							<li><a href="">임시결과창7</a></li>
							<li><a href="">임시결과창8</a></li>
							<li><a href="">임시결과창9</a></li>
							<li><a href="">임시결과창10</a></li>
						</ul>
					</section>
				</div>
			</div>
			<script type="text/javascript">
				/* X버튼 클릭시 검색창 종료 */
				const closebtn = document.querySelectorAll(".closebtn");
				const searchbox = document.getElementById("searchbox");
				closebtn.forEach(el => {
					el.addEventListener("click", e => {
						$("#searchbox").hide();
						$("#search_result_box").hide();
						$("#search").val(null);
					});
				});

				searchbox.addEventListener("click", e => {
					const evTarget = e.target;
					if (evTarget.classList.contains("saerchbox2")) {
						saerchbox.style.display = "none";
					}
				});
			</script>

			<script type="text/javascript">
				/* 모달하다망함 */
				$('#search').on("click", function () {
					if($('#search').val() == null || $('#search').val() == ''){
						$('#searchbox').show();
						$('#search_result_box').hide();
					}
					/* if($.trim($('#search').val()) != null || $.trim($('#search').val() != '')){
						$('#searchbox').hide();
						$('#search_result_box').show();
					} */
				});
				/* $(document).on('click',function(e){
					if($("#searchbox").is(e.target)){
						$("#searchbox").hide();
					}
				}); */

				/* 최근 검색어 저장 - 이벤트리스너 수정필요*/
				// document.getElementById("res").addEventListener("click", function () {
				// 	const search = document.getElementById("search").value;
				// 	const ul = document.getElementById("keywords");
				// 	var li = document.createElement("li");
				// 	var span = document.createElement("span");
				// 	span.innerText = " x ";
				// 	/* 여따가 검색어 저장해야함 */
				// 	li.append(search);
				// 	li.append(span);
				// 	ul.prepend(li);
				// 	console.log(search);
				// 	span.addEventListener("click", function () {
				// 		span.parentElement.remove();
				// 	});
				// });
				/* 최근 검색어 추가하기 */
				const readd = document.querySelectorAll(".recent");
				readd.forEach(el => {
					el.addEventListener("click", recentAdd);
				});

				/* 함수 영역 추가 */
				function recentAdd() {
					const searchData = document.getElementById("search").value;

					if (searchData.trim() == '' || searchData.trim() == null) {
						return;
					}

					const ul = document.getElementById("keywords");

					const simple_data = { searchData };

					$.ajax({
						url: "${pageContext.request.contextPath}/recent",
						type: "POST",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						data: JSON.stringify(simple_data),
						success: function (data) {
							console.log(data);

							if (data.state == "ok") {
								const li = document.createElement("li");
								const span1 = document.createElement("span");
								const span2 = document.createElement("span");
								span2.innerText = " x ";
								span1.classList.add("recent_data");
								span1.innerText = searchData;
								li.append(span1);
								li.append(span2);
								ul.append(li);
								span2.addEventListener("click", function () {
									const searchData = span1.innerText;
									const simple_data = { searchData };
									$.ajax({
										url: "${pageContext.request.contextPath}/delete_recent",
										type: "POST",
										contentType: "application/json; charset=utf-8",
										dataType: "json",
										data: JSON.stringify(simple_data),
										success: function (data) {
											console.log(data);
											if (data.state == "ok") {
												span2.parentElement.remove();
											}
										},
										error: function (e) {
											alert(e);
										}
									})
								});
							}
						},
						error: function (e) {
							alert(e);
						}
					});
				}

				/* 최근검색어 받아오기 */
				window.addEventListener("DOMContentLoaded", function () {
					$.ajax({
						url: "${pageContext.request.contextPath}/recent_list",
						type: "GET",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						success: function (data) {
							const ul = document.getElementById("keywords");

							for (let recent of data) { // json타입은 .으로 접근이 안되서어서 for문으로 접근을 하게 만듬
								const li = document.createElement("li");
								const span1 = document.createElement("span");
								const span2 = document.createElement("span");
								span2.innerText = " x ";
								span1.classList.add("recent_data");
								span1.innerText = recent.searchData;
								li.append(span1);
								li.append(span2);
								ul.append(li);
								span2.addEventListener("click", function () {
									const searchData = span1.innerText;
									const simple_data = { searchData };
									$.ajax({
										url: "${pageContext.request.contextPath}/delete_recent",
										type: "POST",
										contentType: "application/json; charset=utf-8",
										dataType: "json",
										data: JSON.stringify(simple_data),
										success: function (data) {
											console.log(data);
											if (data.state == "ok") {
												span2.parentElement.remove();
											}
										},
										error: function (e) {
											alert(e);
										}
									})
								});
							}
						},
						error: function (e) {
							alert(e);
						}
					});
				});
					
			</script>

			<script type="text/javascript">
				/* 검색창에입력시 ul안에 텍스트입력 */
				/* function printText(data) {
					const input = document.getElementById("search").value;
					const searchbox = document.getElementById("searchbox");
					const searchbox2 = document.getElementById("search_result_box");
					if(input != null){
						searchbox.style.display = "none";
						searchbox2.style.display = "block";
						searchbox2.innerHTML = "<h1>'"+input+"'에 대한 검색결과</h1>";
					} else if (input === null){
						searchbox.style.display = "block";
						searchbox2.style.display = "none";
					}
				} */
					$("#search").on("keyup", function(){
						// textarea 입력된 글자수 길이 확인
						var inputLength = $(this).val().length;

						// textarea 에 작성된 전체 데이터 확인
						var totalText = $(this).val();

						// textarea 에 현재 입력된 데이터 확인 
						var nowText = totalText.substring(inputLength - 1, inputLength);

						$("#search_result_box_inner").text("'"+totalText+"'에 대한 검색결과");

						if(inputLength != 0){
							$("#searchbox").css("display", "none");
							$("#search_result_box").css("display", "block");
						} else{
							$("#searchbox").css("display", "block");
							$("#search_result_box").css("display", "none");
						}
					});

					const simple_data = {totalText};
					$.ajax({
						url: "${pageContext.request.contextPath}/recent_list",
						type: "POST",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						data: JSON.stringify(simple_data),
						success: function (data) {
							console.log(data);

							if (data.state == "ok") {
								const li = document.createElement("li");
								const span1 = document.createElement("span");
								const span2 = document.createElement("span");
								
								
							}
						},
						error: function (e) {
							alert(e);
						}
					});
			</script>
		</body>

		</html>