<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>이지풋볼</title>
			<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
		</head>
		<!-- CSS , JS -->
		<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css" />

		<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<body>
			<div id="container">
				<form action="${pageContext.request.contextPath}/search_result" method="get">
					<div id="searchbar">
						<input type="text" name="search" id="search" placeholder="경기지역 검색" autocomplete="off" />
					</div>
				</form>
				<div id="searchbox" class="saerchbox2">
					<span class="closebtn"><img src="${pageContext.request.contextPath}/image/close1.jpg" /></span>
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
							<a href="${pageContext.request.contextPath}/home">
								<p>소셜매치</p>
							</a>
							<a href="${pageContext.request.contextPath}/team/team">
								<p>팀매치</p>
							</a>
							<a href="${pageContext.request.contextPath}/rental/rental">
								<p>구장예약</p>
							</a>
						</div>
					</section>
					<section class="sch">
						<div class="schheader">
							<h3>새로운 경기장</h3>
						</div>
						<div class="schmain2">
							<ul id="stadiumlist">
							</ul>
						</div>
					</section>
				</div>
				<div id="search_result_box">
					<span class="closebtn"><img src="${pageContext.request.contextPath}/image/close1.jpg" /></span>
					<h5 id="search_result_box_inner"></h5>
					<section class="sch">
						<ul id="insert_target"></ul>
						<ul id="search_result_list">
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
			$('#search').on("keypress", function(e){
				if(e.keyCode==13){
					e.preventDefault();
				}	
			});
			
			</script>


			<script type="text/javascript">
				/* 인풋창 입력시 데이터 실시간 받아오기 */
				$("#search").on("change keyup", react);
				function react(e) {
				
					// textarea 입력된 글자수 길이 확인	
					var inputLength = $(this).val().trim().length;

					// textarea 에 작성된 전체 데이터 확인
					var totalText = $(this).val();

					// textarea 에 현재 입력된 데이터 확인 
					var nowText = totalText.substring(inputLength - 1, inputLength);

					$("#search_result_box_inner").text("'" + totalText + "'에 대한 검색결과");

					if (inputLength == 0) {
						$("#searchbox").css("display", "block");
						$("#search_result_box").css("display", "none");
					} else {
						$("#searchbox").css("display", "none");
						$("#search_result_box").css("display", "block");
					}
					
					const searchText = document.getElementById("search").value;
					const simple_data1 = { searchText };

					const lastText = searchText.charAt(searchText.length - 1);
					$.ajax({
						url: "${pageContext.request.contextPath}/recent_list",
						type: "POST",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						data: JSON.stringify(simple_data1),
						async: false,
						success: function (data) {
							const ul = document.getElementById("search_result_list");

							if (ul.hasChildNodes()) {
								while (ul.hasChildNodes()) {
									ul.removeChild(ul.firstChild);
								}
							}

							for (let list of data) {
								const li = document.createElement("li");
								const a = document.createElement("a");
								if (inputLength > 0 && list.fieldName.trim() != null) {
									a.innerText = list.fieldName;
									a.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode=" + list.fieldCode;
									a.classList.add("recent");
									li.append(a);
									ul.append(li);
								}
							}
							$(".recent").on("click", recentAdd);
						},
						error: function (e2) {
							alert(e2);
						}
					});
				};



			</script>

			<script type="text/javascript">
				$('#search').on("click", function () {
					if ($('#search').val() == null || $('#search').val() == '') {
						$('#searchbox').show();
						$('#search_result_box').hide();
					}
				});

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


					const simple_data4 = { searchData };

					$.ajax({
						url: "${pageContext.request.contextPath}/recent",
						type: "post",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						data: JSON.stringify(simple_data4),
						async: false,
						success: function (data) {
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
						url: "${pageContext.request.contextPath}/recent",
						type: "GET",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						async: false,
						success: function (data) {
							const ul = document.getElementById("keywords");
							const ul2 = document.getElementById("stadiumlist");
							for (let recent of data) { 
								const li = document.createElement("li");
								const span1 = document.createElement("span");
								const span2 = document.createElement("span");
								span2.innerText = " x ";
								span1.classList.add("recent_data");
								span1.innerText = recent.searchData;
								li.append(span1);
								li.append(span2);
								ul.append(li);

								// 최근검색어 삭제 버튼 
								span2.addEventListener("click", function () {
									const searchData = span1.innerText;
									const simple_data2 = { searchData };
									$.ajax({
										url: "${pageContext.request.contextPath}/delete_recent",
										type: "POST",
										contentType: "application/json; charset=utf-8",
										dataType: "json",
										data: JSON.stringify(simple_data2),
										async: false,
										success: function (data) {
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
							$('.recent_data').click(function () {
								const data1 = $(this).text();
								$('#search').val(data1);
								const searchText = document.getElementById("search").value;
								const simple_data1 = { searchText };
								const s_data1 = { data1 };
								const ul = document.getElementById("search_result_list");
								
								$.ajax({
									url: "${pageContext.request.contextPath}/recent_list",
									type: "POST",
									contentType: "application/json; charset=utf-8",
									dataType: "json",
									data: JSON.stringify(simple_data1),
									async: false,
									success: function (data) {
										for (let list of data) {
										$("#searchbox").css("display", "none");
										$("#search_result_box").css("display", "block");
										$("#search_result_box_inner").text("'" + data1 + "'에 대한 검색결과");
											const li = document.createElement("li");
											const a = document.createElement("a");
											a.innerText = list.fieldName;
											a.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode=" + list.fieldCode;
											a.classList.add("recent");
											li.append(a);
											ul.append(li);
										}
									},
									error: function (e2) {
										alert(e2);
									}
								});
							});
						}
					});
				});

			</script>

			<script type="text/javascript">
				window.addEventListener("DOMContentLoaded", function(){
					$.ajax({
						url: "${pageContext.request.contextPath}/searchlist",
						type: "GET",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						async: false,
						success: function(data){
							const ul2 = document.getElementById("stadiumlist");
							for (const list of data) {
								const li2 = document.createElement("li");
								const a2 = document.createElement("a");
								const p = document.createElement("p");
								p.innerText = list.fieldName;
								a2.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode=" + list.fieldCode;
								a2.append(p);
								li2.append(a2);
								ul2.append(li2);		
							}
						},
						error: function(e){
							alert(e);
						}
					})
				});
			</script>
		</body>

		</html>