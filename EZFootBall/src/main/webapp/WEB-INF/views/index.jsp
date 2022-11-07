<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>

  <%
    String clientId = "poD0EBSOvA7nhaA84Yi5";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "16R_UFfDgk";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/EZFootBall/home", "UTF-8");
    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
        + "&client_id=" + clientId
        + "&client_secret=" + clientSecret
        + "&redirect_uri=" + redirectURI
        + "&code=" + code
        + "&state=" + state;
    String accessToken = "";
    String refresh_token = "";
    
    System.out.println(session.getAttribute("state"));
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuilder res = new StringBuilder();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if (responseCode == 200) {
        out.println(res.toString());
      }
    } catch (Exception e) {
      // Exception 로깅
    }
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지풋볼</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<script src="https://kit.fontawesome.com/3a7191171a.js" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
        align-items: center;
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
    .menu1_a {
        font-weight: bold;
        padding-bottom:5px;
        border-bottom: 3px solid #26A653;
    }
    

    .banner_container {
        max-width: 1024px;
        width:1024px;
        display: flex;
        justify-content: center;
        overflow: hidden;
        position: relative;
    }
    .banner_content_area {
        display: flex;
        justify-content: center;
        align-items: center;
        white-space: nowrap;
        width: 100%;
        height: 100%;
        transition: all 0.5s;
    }
    .banner_content {
        width: 100%;
        height: 100%;

    }
    .banner_image {
        width: 100%;
        height: 90%;
        border-radius: 35px;
        padding: 15px;
    }


    .match_list_container {
	    width: 100%;
	    height: 100%;
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
	    flex-direction: column;
	    display: flex;
	    align-items: center;
    }

    

    .bottom_banner {
        width:100%;
        height:205px;
        background-color: #26A653;
    	margin-top: 100px;
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
        .footer_subcon{
            max-width: 1024px;
        }
        .footer_left {
            width:100%;
            
        }
        .footer_left .footer_nav{
            display: flex;

        }
        .footer_nav ul {
            list-style-type: none;
            line-height: 200%;
        }
        .footer_nav ul h3 {
            color : rgba(255, 255, 255, 0.649);
        }
        .footer_nav ul li{
            color :rgba(255, 255, 255, 0.348)
        }
        .footer_right {
            width:30%;
            padding-top: 14px;

        }
        .footer_com{
            line-height: 150%;
        }
        .footer_com h2{
            color : rgba(255, 255, 255, 0.649);
            border-bottom: 3px solid #26A653;
            width: 32%;
        }
        .footer_com p{
            color :rgba(255, 255, 255, 0.348);
        }
        .managermove a{
            color : white;
            text-decoration: none;
        }

    .login_icon {
        margin-left:15px;
    }
    .etc_icon {
        margin-left:10px;
    }



         .page_container {
	         position: relative;
	         display: grid;
	         height: 100%;
	         max-height: 100%;
	         cursor: default;
	         max-width: 1200px;
	         margin: 0 auto;
         }
         .pagination-area {
         	position: absolute;
    		bottom: 35px;
         }

         .pagination_controller {
	         display: flex;
	         flex-direction: row;
	         align-items: center;
	         justify-content: space-between;
	         padding: 0 1rem;
	         width: 135px;
	         height: 36px;
	         font-size: .875rem;
	         color: #fff;
	         border-radius: 20px;
	         background-color: rgba(0, 0, 0, .5);

         }

         .index_num {
         margin-right: auto;
         }

         .control_wrapper {
         display: flex;
         align-items: center;
         justify-content: space-between;
         width: 50px;
         }

         .control_previous_button,
         .control_play_pause_button,
         .control_next_button {
         padding: 0;
         background: none;
         border: 0;
         color: #fff;
         cursor: pointer;
         }

         .control_play_pause_button {
         display: flex;
         align-items: center;
         max-height: 10px;

         }

         .fa-pause {
         display: block;
         font-size: 12px;
         }

         .fa-play {
         display: none;
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
  		  			  <jsp:include page="./search/search.jsp"></jsp:include>
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
                    <img class="banner_image" src="image/ez_banner1.png" alt="">
                    <img class="banner_image" src="image/ez_banner2.png" alt="">
                    <img class="banner_image" src="image/ez_banner3.png" alt="">
                </div>
            </div>
            
            <div class="pagination-area">
		         <div class="page_container">
		             <div class="pagination_controller">
		                 <div class="index_num">
		                     <span class="current_index">1</span>
		                     
		                     <span class="total_count">/ 3</span>
		                 </div>
		                 <div class="control_wrapper">
		                     <button class="control_previous_button e_previous_banner">
		                         <i class="fa-solid fa-angle-left"></i>
		                     </button>
		   
		                     <button type="button" class="control_play_pause_button e_play_pause_swiper">
		                       <svg class="fa-pause" width="14px" height="14px" enable-background="new 0 0 155.3 159.3" viewBox="0 0 155.3 159.3" xmlns="http://www.w3.org/2000/svg"><path fill="#ffffff" d="m62 135.3h-13.3c-1.9 0-3.4-1.5-3.4-3.4v-104.6c0-1.9 1.5-3.4 3.4-3.4h13.3c1.9 0 3.4 1.5 3.4 3.4v104.7c-.1 1.8-1.6 3.3-3.4 3.3z"></path><path fill="#ffffff" d="m106.6 135.3h-13.3c-1.9 0-3.4-1.5-3.4-3.4v-104.6c0-1.9 1.5-3.4 3.4-3.4h13.3c1.9 0 3.4 1.5 3.4 3.4v104.7c0 1.8-1.5 3.3-3.4 3.3z"></path></svg>
		                       <i class="fas fa-play"></i>
		                     </button>
		   
		                     <button type="button" class="control_next_button e_next_banner">
		                       <i class="fa-solid fa-angle-right">
		                     </i>
		                     </button>
		                 </div>
		             </div>
		            
		         </div>
		    </div>
    </div>


       

    <div class="match_list_container">
        <div class="match_menu_area">
            <div class="match_menu_content">
            <jsp:include page="./social/social.jsp"></jsp:include>
            </div>
        </div>


    </div>

    <div class="bottom_banner">

    </div>
     <footer>
        <div class="footer_subcon">
            <div class="footer_left">
                <div class="footer_nav">
                    <ul>
                        <h3>매치 정보</h3>
                        <li>소셜 매치</li>
                        <li>팀 매치</li>
                        <li>구장 예약</li>
                    </ul>
                    <ul>
                        <h3>서비스 지역</h3>
                        <li>서울</li>
                        <li>인천</li>
                        <li>경기</li>
                        <li>전라도</li>
                        <li>경상도</li>
                        <li>충청도</li>
                        <li>제주도</li>
                    </ul>
                    <ul>
                        <h3>이지풋볼</h3>
                        <li>이지풋볼 소개</li>
                        <li>공지사항</li>
                        <li>자주 묻는 질문</li>
                        <li>구장 제휴</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer_right">
            <div class="footer_com">
                <h2>EZfootball.com</h2>
                <p>풋살하고싶죠? 고민하지말고 이지풋볼</p>
                <p>이용약관 | 개인정보 처리방침 | 사업자 정보 확인</p>
                <p>이지풋볼 | 서울특별시 강서구 화곡동 까치산역 2번출구 앞 돗자리 |
                    대표메일 dragon695@naver.com | 마케팅 제안 : dragon695@naver.com |
                    국번없이 119
                </p>
                <p>주식회사 기밍지아케데미 | 사업자번호 : 000-00-00000 | 대표 김민지 |
                    통신판매업 신고 2022-서울강서-0000
                </p>
                <p>Copyright EZ ALL rights reserved</p>
            </div>
            <h3 class="managermove"><a href="${pageContext.request.contextPath}/admin/admin">관리자페이지 이동</a></h3>
        </div>
        
    </footer>
</div>


<script type="text/javascript">
	let main_logo = document.querySelector(".main_logo");
	
	main_logo.addEventListener("click",function() {
		location.href="${pageContext.request.contextPath}";
	});
</script>

<script>

let button_flag = true;
var time_out;

let page_num = document.querySelector(".current_index");
            
let pause_btn = document.querySelector(".fa-pause");
let play_btn = document.querySelector(".fa-play");

  // translate 먹일곳
  let top_banner = document.querySelector('.banner_content_area');
  let top_btn_right = document.querySelector(".e_next_banner");
  let top_btn_left = document.querySelector(".e_previous_banner");
  let slide_photo_cnt = document.querySelectorAll(".banner_image").length;

  // 최상단 디브
  let slider_area = document.querySelector(".banner_container");

  var slider_width = slider_area.clientWidth; // container의 width
  var slide_index = 0;

  let top_pagination_btn = document.getElementsByClassName("swiper_pagination_bullet");
  let more_pagination_btn = document.getElementsByClassName("pagination_bullet");


  top_btn_right.addEventListener("click", function () {
    clearTimeout(time_out);
    console.log("right:"+slide_index);
    if (slide_index > 0 && slide_index < slide_photo_cnt) {
      top_banner.style.transform = 'translate(' + (-(1024 * (slide_index - 1))) + 'px)';


      // slide_index++;
    } else {
      top_banner.style.transform = 'translateX(0vw)';
      slide_index = 0;
    }
    show_slides();
  })

  top_btn_left.addEventListener("click", function () {
    pause_btn.style.display = "none";
    play_btn.style.display = "block";

    button_flag = false;
    clearTimeout(time_out);
    console.log("left:"+slide_index);

    if (slide_index > 1 && slide_index <= slide_photo_cnt) {
      top_banner.style.transform = 'translateX(' + (-1024 * (slide_index - 2)) + 'px)';
      slide_index--;

      console.log("if");

    } else {
      top_banner.style.transform = 'translateX(' + (-1024 * (slide_photo_cnt - 1)) + 'px)';

      slide_index = slide_photo_cnt;
      console.log("else");
    }
    
    page_num.innerHTML = slide_index;
    console.log(slide_index);

   })


              // Top banner pagination bar

              pause_btn.addEventListener("click", function () {
                pause_btn.style.display = "none";
                play_btn.style.display = "block";

                button_flag = false;
                clearTimeout(time_out);
              });

              play_btn.addEventListener("click", function () {
                pause_btn.style.display = "block";
                play_btn.style.display = "none";

                button_flag = true;
                show_slides();
              });


              show_slides();


              function show_slides() {
                slide_index++;
            
                top_banner.style.transform = 'translate(' + (-(1024 * (slide_index - 1))) + 'px';
                console.log(slide_index);

                page_num.innerHTML = slide_index;

                if (slide_index === slide_photo_cnt) {  
                slide_index = 0;

                }

                if (button_flag == true) {
                  time_out = setTimeout(show_slides, 5000);
                  
                }

              }
   
</script>


  

</body>
</html>