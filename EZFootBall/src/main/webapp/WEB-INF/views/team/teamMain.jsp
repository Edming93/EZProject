<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지풋볼</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<style>
    * {
        box-sizing: border-box;
        margin: 0px;
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

    .big_menu_container {
        width: 100%;
        height: 70px;
        display: flex;
        justify-content: center;
	    margin-bottom: 13px;
	    margin-top: 13px;
	    align-items: center;
        
    }
    .big_menu_area {
        max-width: 1024px;
        width: 1024px;
	    padding-top: 15px;
	    padding-bottom: 15px;
    }

    .big_menu_content {
        height: 100%;
        justify-content: flex-start;
        align-items: center;
    }

    .big_menu_content a {
        font-size: 18px;
        text-decoration: none;
        color: black;
        align-items: center;
        display: flex;
        width: 90px;
        justify-content: center;
    }
    
    .menu1,.menu2,.menu3,.menu4,.menu5,.menu6 {
        width: 100px;
        justify-content: center;
        display: inline-block;
    }
    .menu2_a {
        font-weight: bold;
        padding-bottom:5px;
        border-bottom: 3px solid #26A653;
    }

    .banner_container {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        background-color: #fafafa;
    }
    .banner_content_area {
        max-width: 1024px;
        width:1024px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 15px;
    }
    .banner_image {
        width: 100%;
        height: 90%;
        border-radius: 23px;
    }

    .match_menu_container {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
   		 flex-direction: column;
        border-top: 1px solid #eee;
    }

    .match_menu_area {
        max-width: 1024px;
        width:1024px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .match_menu_content {
        width: 100%;
        height:100%;
        display:flex;
        justify-content: center;
    }

    /* .date_container {
        width: 100%;
        height: 90px;
    }
    .date_nav {
        display: flex;
        width: 100%;
        flex-direction: column;
        justify-content: center;

    }
    .select_filter {
        width: 100%;
        height: 46px;
    } */

    .rental_list_container {
        width:100%;
        height:100%;
        display:flex;
        justify-content: center;
    }
    
    .rental_list_area {
        width: 1024px;
        max-width: 1024px;
        height:100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .rental_list_content {
        width: 100%;
        height:100%;
        display:flex;
        justify-content: center;
        flex-direction: column;
    }

    .match_list_container {
        width: 100%;
        height: 3700px;
        display: flex;
        justify-content: center;
    }

    .match_menu_area {
        width: 1024px;
        max-width: 1024px;
        height:100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .match_menu_content {
        width: 100%;
        height:100%;
    }

    .bottom_banner {
        width:100%;
        height:205px;
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
        width:40%;

    }

    .footer_right {
        width:40%;

    }

    .login_icon {
        margin-left:15px;
    }
    .etc_icon {
        margin-left:10px;
    }

/* ------------------------------ */

.mainpage-post{
        
        width: 1024px;
        display: flex;
        flex-direction: column;
    }
    .mainpage-post .calender{
        flex : 1;
        display: flex;
        width: 1024px;
        justify-content: space-between;
        align-items: center;
    }
    .mainpage-post .settingbutton{
        flex: 1;
        display: flex;
        width: 1024px;
    }
    .mainpage-post .date ul{
       
       list-style-type: none;
    }
    .mainpage-post .date ul li{
        display: inline-block;
        width: 100px;
        height: 50px;
        text-align: center;
    }
    .mainpage-post .date ul li a{
        text-decoration: none;
    }
    .mainpage-post .date ul li:hover{
       background-color: blue;
    }
    .postingdiv{
	width: 100px;
    height: 1100px;
    margin-top: 464px;

   }
     .posting123{
    	position: sticky;
    
    width: 50px;
    top: 0
	    }
	    
	  #pbtn:hover{
	  	cursor : pointer;
	    
	  }  
	    
	 .hidemenu{
            display: flex;
            flex-direction: column;
            display: none;
            background-color : white;
            position : absolute;
        }
     .active {
     	    background-color: white;
		    color: white;
		    border: none;
     }
     .teamR{
         display: flex;
	   
	    width: 150px;
	    justify-content: center;
	    align-items: center;
	   }
	   .teamR p{
         color : black;
         font-weight : 700;
	   }
     .matchR{
      display: flex;
	   
	    width: 180px;
	    justify-content: center;
	    align-items: center;
     }
     .matchR p{
      color : black;
         font-weight : 700;
     }
     .teamR:hover{
     	cursor:pointer;
     	transition : all 0.2s linear;
     	transform : scale(1.2);
     	
     }
     .teamR p:hover{
     	color : blue;
     }
      .matchR:hover{
      	cursor:pointer;
      	transition : all 0.2s linear;
     	transform : scale(1.2);
      }
      .matchR p:hover{
      	color : blue;
      }

</style>
</head>
<body>
<div class="container">
    <div class="header_container">
        <div class="header_area">
            <div class="header_content">
               <div class="header_left main_logo">

               </div>
               <div class="header_right login_btn etc_btn">
                  <div class="search_input_area">
	                  <input type="text" class="search_input">
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
                     <a href="${pageContext.request.contextPath}/etc/etc">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
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
                <div class="menu menu1"><a class="menu1_a" href="${pageContext.request.contextPath}/home">소셜 매치</a></div>
                <div class="menu menu2"><a class="menu2_a" href="${pageContext.request.contextPath}/team/team">팀 매치</a></div>
                <div class="menu menu3"><a class="menu3_a" href="${pageContext.request.contextPath}/rental/rental">구장 예약</a></div>
                <div class="menu menu4"><a class="menu4_a" href="${pageContext.request.contextPath}/rank/rank">랭킹</a></div>
                <div class="menu menu5"><a class="menu5_a" href="${pageContext.request.contextPath}/review/reviewmain">커뮤니티</a></div>
                <div class="menu menu6"><a class="menu5_a" href="${pageContext.request.contextPath}/blacklist/blacklistmain">블랙리스트</a></div>
            </div>
        </div>
    </div>
    
        <div class="banner_container">
            <div class="banner_content_area">
                <div class="banner_content">
                    <img class="banner_image" src="../image/banner-new_stadium_pc_cnh_rental2.png" alt="">
                </div>
            </div>
        </div>
    <div class="match_menu_container">
        <div class="match_menu_area">
            <div class="match_menu_content">
            	<jsp:include page="./team.jsp"></jsp:include>
            				
            </div>
             <div class="postingdiv">
				<div class="posting123">
				  <span id="pbtn"><img src="${pageContext.request.contextPath}/image/pecil.jpg"><h4>글쓰기</h4></span>
				    <div class="hidemenu">
				       <div class="teamR">
				        <span class="p1"><iconify-icon icon="fluent:people-team-add-24-filled" style="color: #26a563;" width="40" height="40"></iconify-icon></span><p>팀 등록하기</p>
				        </div>
				        <div class="matchR">
				        <span id="posting"><iconify-icon icon="fluent:pen-24-filled" style="color: #26a563;" width="40" height="40"></iconify-icon></span><p>팀 매치 작성하기</p>
				        </div>
				    </div>
				</div>   
        </div> 
    </div>

    <div class="bottom_banner">


    </div>
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
		<script>
        var hide = document.querySelector(".hidemenu");
        var p1 = document.querySelector(".p1");
        var p2 = document.querySelector(".p2");

        document.getElementById("pbtn").addEventListener("click",function(){
            hide.classList.toggle('active');
            if(hide.classList.contains('active')){
                hide.style.display = "block";
                hide.style.backgroundColor = "transparent";
                hide.style.border = "none";

            }else{
                hide.style.display = "none";
            }
        });
        </script>
        <script type="text/javascript">
        document.querySelector(".teamR").addEventListener("click",function(){

			$.ajax({
	 			url : "${pageContext.request.contextPath}/loginPage/logincheck",
	 			type : "GET",
	 			contentType:"application/json; charset=utf-8",
	 			dataType : "json",
	 			data : JSON.stringify(),
	 			success : function(data){
	 
	 				if(data==false){
	 					Swal.fire({
	 					   title: '팀등록을 위해 로그인 해주세요!',
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
	 					location.href="${pageContext.request.contextPath}/team/register";
	 				}
				}
	 		});
		});
        </script>
</body>
</html>