<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장예약 내역</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<style>
    * {
        box-sizing: border-box;
        margin: 0px;
        font-family: 'Noto Sans KR', sans-serif;
    }
    
    
    .container {
        width: 100%;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .header_container {
        width: 100%;
        height: 56px;
        display: flex;
        justify-content: center;
    }

    .header_area {
        width: 1024px;
        height: 100%;
        padding-top: 15px;
    }

    .header_content {
        display: flex;
        height: 100%;
        justify-content: space-between;
    }
    .header_left {
        width:95px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .main_logo{
        background: url("${pageContext.request.contextPath}/image/ez_logo1.svg") no-repeat center;
        background-size: 95px 35px;
    	cursor: pointer;
    }
    .ez_icon {
        width: 65px;
        height:35px;
    }
    
      .search_input_area {
      	 position: relative;
      }

      .search_input {
         width: 375px;
         height: 35px;
         background-color: white;
         border: 1px solid #e5e5e5;
         border-radius: 10px;
      }
      
      .glass {
      	 font-size: 20px;
	     position: absolute;
	     right: 13px;
	     top: 8px;
	     color: #464a54;
      }
    .header_right {
        display: flex;
        justify-content: center;
        align-items: center;
    }

.main_title{
	display: block;
	width: 100%;
	background: url("${pageContext.request.contextPath}/image/myPage2.png") no-repeat 10px;
	background-size: contain;
 	padding: 8px 0;
	text-indent: -9999px;
}

#main_container {
    display: flex;
    width: 100%;
    height: 100%;
    justify-content: center;
/*     background-color: #ccc; */
}

.main_area {
	display:flex;
    width: 1024px;
/*     height: 900px; */
    min-height: 900px;
/*     background-color: #ffaaaa; */
    justify-content: space-evenly;
    align-items: center;
    flex-wrap: wrap;
/*     border: 1px solid black; */
}

.main_content1 {
	display: flex;
	flex-direction: column;
	width: 98%;
	/* height: 98%; */
	height:90%;
	background-color: #fff;
}

.main_box1 {
	width: 100%;
	height: 100%;
	padding: 15px;
/* 	background-color: #fffaec; */
/* 	color: #fff; */
}


#rantal_nav	{
	display: block;
	width: 100%;
	height: 50%;
/* 	border: 1px solid black; */
}


#rantal_list{
	width: 100%;
	border-collapse: collapse;
	font-size: 0.8rem;
	background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
}

#rantal_list th, td {
	border-bottom: 1px solid black;
	padding: 10px;
	text-align: center;
}

#rantal_list th:first-child{
	border-radius: 15px 0 0 0;
}

#rantal_list th:last-child{
	border-radius: 0 15px 0 0;
}

#rantal_list th {
	background-color: #26a653;
	color: #fff;
	border-bottom: 1px solid black;
}

.collapsible {
	display: none;
	background: #C9CCD3;
}

.rantal_content{
	padding: 10px;
}

.rantal_content > ul {
	display:flex;
	list-style-type: none;
	padding: 0;
	text-align: left;
	justify-content: center;
}

.rantal_content > ul > li {
	display: inline-block;
	padding: 15px 5px;
/* 	border: 1px solid black; */
	margin-right: 20px;
	background-color: #fff;
	border-radius: 15px;
}

.rantal_item:nth-child(4n) {
    background-color: #ddd;
}

.rantal_item td:last-child {
	font-weight: 800;
}


.bottom_banner {
	width: 100%;
	height: 205px;
	background-color: #26A653;
	margin-top: 100px;
}

footer {
	width: 100%;
	height: 423px;
	display: flex;
	justify-content: space-evenly;
	padding: 30px;
	background-color: #2a2a2a;
}

.footer_left {
	width: 40%;
}

.footer_right {
	width: 40%;
}

.login_icon {
	margin-left: 15px;
}

.etc_icon {
	margin-left: 10px;
}
</style>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<body>
	<div class="container">
		<div class="header_container">
			<div class="header_area">
				<div class="header_content">
               <div class="header_left main_logo">

               </div>
               <div class="header_right login_btn etc_btn">
                  <div class="search_input_area">
  		  			  <jsp:include page="../search/search.jsp"></jsp:include>
<!--                   <input type="text" class="search_input"> -->
	                  <iconify-icon class="glass" icon="fa6-solid:magnifying-glass"></iconify-icon>
                  </div>
                  <div class="login_icon">
                     <a href="${pageContext.request.contextPath}/loginPage/login">
<!--                      <iconify-icon icon="akar-icons:person"></iconify-icon> -->
                        <svg width="25" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2ZM9 7C9 5.34315 10.3431 4 12 4C13.6569 4 15 5.34315 15 7C15 8.65685 13.6569 10 12 10C10.3431 10 9 8.65685 9 7Z"
                              fill="#464A54" />
                           <path fill-rule="evenodd" clip-rule="evenodd"
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
        <div id="main_container">
            <div class="main_area">
			<h1 class="main_title">구장예약 내역</h1>
				<div class="main_content1">
					<section class="main_box1">
						<div id="rantal_nav">
							<table id="rantal_list">
								<!-- <thead> -->
									<tr>
										<th>예약번호</th>
										<th>구장명</th>
										<th>구장위치</th>
										<th>매치일자</th>
										<th>매치시간</th>
										<th>상태</th>
									</tr>
								<!-- </thead> -->
								<!-- <tbody> -->
<!-- 									<tr class="rantal_item"> -->
<!-- 										<td>111111</td> -->
<!-- 										<td>대충 어딘가 경기장</td> -->
<!-- 										<td>대충어디도 어디시 어디동 11</td> -->
<!-- 										<td>2022-01-02</td> -->
<!-- 										<td>14:00 ~ 16:00</td> -->
<!-- 										<td>예약완료</td> -->
<!-- 									</tr> -->
<!-- 									<tr class="collapsible"> -->
<!-- 										<td class="rantal_content" colspan="10" height="100px"> -->
<!-- 											<ul> -->
<!-- 												<li>매치종류 : 구장예약</li> -->
<!-- 												<li>매치형태 : 6:6</li> -->
<!-- 												<li>예약자 : 사람1</li> -->
<!-- 												<li>예약신청일 : 2022-01-01</li> -->
<!-- 												<li>결제금액 : 120,000</li> -->
<!-- 											</ul> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 									<tr class="rantal_item"> -->
<!-- 										<td>222222</td> -->
<!-- 										<td>대충 어딘가 경기장</td> -->
<!-- 										<td>대충어디도 어디시 어디동 11</td> -->
<!-- 										<td>2022-01-02</td> -->
<!-- 										<td>14:00 ~ 16:00</td> -->
<!-- 										<td>예약완료</td> -->
<!-- 									</tr> -->
<!-- 									<tr class="collapsible"> -->
<!-- 										<td class="rantal_content" colspan="10" height="100px"> -->
<!-- 											<ul> -->
<!-- 												<li>매치종류 : 팀예약</li> -->
<!-- 												<li>매치형태 : 6:6</li> -->
<!-- 												<li>예약자 : 사람1</li> -->
<!-- 												<li>예약신청일 : 2022-01-01</li> -->
<!-- 												<li>결제금액 : 120,000</li> -->
<!-- 											</ul> -->
<!-- 										</td> -->
<!-- 									</tr> -->
								<!-- </tbody> -->
							</table>
						</div>
						
						
<!-- 										<li>예약번호 : 111111</li> -->
<!-- 										<li>예약일자 : 2022-01-01</li> -->
<!-- 										<li>예약구장 : 대충어딘가경기장</li> -->
<!-- 										<li>구장위치 : 대충어디도 어디시 어디동 11</li> -->
<!-- 										<li>매치타입 : 6:6</li> -->
<!-- 										<li>구장비용 : 120,000원</li> -->
<!-- 										<li>예약자 : 사람1</li> -->
<!-- 										<li>결제금액 : 120,000원</li> -->
<!-- 										<li>매치(대여)일자 : 2022-01-02</li> -->
<!-- 										<li>매치시간 : 09:00:00</li> -->
<!-- 										<li>상태 : 예약완료</li> -->
							
					</section>
				</div>
            </div>
        </div>

		
        
        <div class="bottom_banner"></div>
		<footer>
			<div class="footer_left"></div>
			<div class="footer_right"></div>

		</footer>

		<script type="text/javascript">
            let main_logo = document.querySelector(".main_logo");
            
            main_logo.addEventListener("click",function() {
                location.href="${pageContext.request.contextPath}";
            });
        </script>
        <script type="text/javascript">
        
        	// 목록 받아오기
        	window.addEventListener("DOMContentLoaded", function(){
					$.ajax({
						url: "${pageContext.request.contextPath}/myPage/getRentalList",
						type: "GET",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						async: false,
						success: function(data){
							const table = document.getElementById("rantal_list");
						
							console.log(data);
							for (const list of data.list) {
								console.log(data.userName);
								const tr1 = document.createElement("tr");
								const tr2 = document.createElement("tr");
								const td1 = document.createElement("td");

								tr1.innerHTML = 
									"<td>"+list.rvCode+"</td>"+
									"<td><a href='${pageContext.request.contextPath}/rental/rentalDetail?fieldCode="+ list.fieldCode+"'>"+list.fieldName+"</a></td>"+
									"<td>"+list.fieldAddress+"</td>"+
									"<td>"+list.gameDay+"</td>"+
									"<td>"+list.gameTime1+" ~ "+list.gameTime2+"</td>"+
									"<td>"+"예약완료"+"</td>";
									
								td1.innerHTML = "<ul><li>매치종류 : "+list.rvType+"</li>"+
									"<li>매치형태 : "+list.fieldType+"</li>"+
									"<li>예약신청일 : "+list.rvDay+"</li>"+
									"<li>예약자 : "+data.userName+"</li>"+
									"<li>결제금액 : "+list.userPayment+"</li>"+
									"</ul>";
								td1.classList.add("rantal_content");
								td1.style.height = "100px";
								td1.colSpan = "10";
								tr1.classList.add("rantal_item");
								tr2.classList.add("collapsible");
								tr2.append(td1);
								table.append(tr1);
								table.append(tr2);
								
							}
								// list 누르면 아래 박스추가
					        	$('.rantal_item').on("click",function(){
									$(this).next().nextAll('.collapsible').hide();
									$(this).next().prevAll('.collapsible').hide();
										console.log($(this).next().css('display'));
									if($(this).next().css('display') == "table-row"){
										$(this).next().hide();
										return;
									}
					        		$(this).next().show();
					        	});
							
						},
						error: function(e){
							alert(e);
						}
					})
				});
        </script>
	</div>
</body>
</html>