<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
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
	margin: 10px 0; 
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
    height: 900px;
/*     background-color: #ffaaaa; */
    justify-content: space-evenly;
    align-items: center;
    flex-wrap: wrap;
    border: 1px solid black;
}

.main_content1 {
	display: flex;
	flex-direction: column;
	width: 36%;
	/* height: 98%; */
	height:90%;
/* 	background-color: #fff; */
}

.main_content2 {
	width: 62%;
	height:90%;
	background-color: #fff;
	padding: 0 30px;
}

.main_left1 {
	width: 100%;
	height: 35%;
	padding: 15px;
	border: 5px solid #26a653;
	border-radius: 15px 15px 0 0;
/* 	background-color: #fffaec; */
/* 	color: #fff; */
}

#user_info > ul {
	list-style-type: none;
	padding: 0;
}

#user_info > ul > li{
	padding: 10px 0;
}

.main_left2 {
	width: 100%;
	height: 65%;
	padding: 15px;
	border: 5px solid #26a653;
	border-top: none;
	border-radius: 0 0 15px 15px;
/* 	background-color: #fffaec; */
/* 	background-color: #fff; */
}

.main_right1 {
	width: 100%;
	height: 50%;
	padding: 15px;
	border: 5px solid #26a653;
	border-radius: 15px 15px 0 0;
/* 	background-color: #fffaec; */
	
}

.main_right2 {
	width: 100%;
	height: 50%;
	padding: 15px;
	border: 5px solid #26a653;
	border-top: none;
	border-radius: 0 0 15px 15px;
/* 	background-color: #fffaec; */
	
}

.name1 {
	display: inline-block;
}

.main_left2 > ul{
	list-style-type: none;
	padding: 0;
	margin: 10px 0;
}

.main_left2 > ul > li {
	margin-bottom: 30px;
}

.main_left2 > ul > li > a {
	display:inline-block;
	text-decoration: none;
/* 	border: 1px solid black; */
	border-radius: 20px;
	color: #000;
	text-align: center;
	width: 100%;
	height: 100%;
	padding: 30px 0;
	background-color: #fffaec;
}

.main_right1 > ul, .main_right2 > ul{
	list-style-type: none;
	padding: 0;
	margin: 10px 0;
}

.main_right1 > ul > li, .main_right2 > ul > li {
	margin-bottom: 10px;
}

.main_right1 > ul > li > a, .main_right2 > ul > li > a {
	display:inline-block;
	text-decoration: none;
/* 	border: 1px solid black; */
	border-radius: 20px;
	color: #000;
	text-align: center;
	width: 100%;
	height: 100%;
	padding: 20px 0;
	background-color: #fffaec;
}


.bottom_banner {
	width: 100%;
	height: 205px;
	background-color: #cef8e8;
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
			<h1 class="main_title">나의 EZ</h1>
				<div class="main_content1">
					<section class="main_left1">
						<div id="user_info">
							<ul>
								<li><h3 class="name1">${userVO.userName }</h3><span>(유저코드:${userVO.userCode })</span></li>
								<li>주소 : ${userVO.userLocal }</li>
								<li>Email : ${userVO.userEmail1}${userVO.userEmail2 }</li>
								<li>랭크 : ${uinVO.userLevel }</li>
								<li>승률 : ${uinVO.userVr*100}% <span>(00전 00승 00패)</span></li>
								<li>Team : ${uinVO.userGroup }</li>
							</ul>
						</div>
					</section>
					<section class="main_left2">
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">랭킹시스템 소개</a></li>
							<li><a href="#">EZ풋볼 규칙설명</a></li>
							<li><a href="#">대충 머시기 있지않을까..?</a></li>
						</ul>
					</section>
				</div>
				<div class="main_content2">
					<section class="main_right1">
						<h3>도구</h3>
						<ul>
							<li><a href="">경기내역</a></li>
							<li><a href="">구장예약 내역</a></li>
							<li><a href="${pageContext.request.contextPath}/myPage/changePw">비밀번호 변경</a></li>
							<li><a href="${pageContext.request.contextPath}/loginPage/logout">로그아웃</a></li>
						</ul>
					</section>
					<section class="main_right2">
						<h3>더보기</h3>
						<ul>
							<li><a href="">고객문의</a></li>
							<li><a href="">자주 묻는 질문 (Q&A)</a></li>
							<li><a href="">매니저 지원</a></li>
							<li><a href="">구장제휴</a></li>
						</ul>
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
        
        </script>
	</div>
</body>
</html>