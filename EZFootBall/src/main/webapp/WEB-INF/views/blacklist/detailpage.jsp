<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지풋볼</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<script src="https://kit.fontawesome.com/3a7191171a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>

* {
	box-sizing: border-box;
	margin: 0px;
	font-family: 'Noto Sans KR', sans-serif;
}

body{
	
	margin : 0 auto;
	
}
.containerdetail {
	margin : 0 auto;
	display: grid;
  	grid-template-columns: 5vh 1fr 5vh;
	grid-template-rows: 3vh 2vh 3vh 40vh 0.5vh 5vh 10vh 10vh 30vh;
	gap: 10px 10px;
	grid-auto-flow: row;
	grid-template-areas: 
	". . ." 
	". header ." 
	". . ." 
	". main ." 
	". . ." 
	". footer ."
	". insert ."
	". . ." 
	". comment .";
	height: 80vh;	
}
  
  
  
  #div1 {
	font-family: 'Gowun Dodum', sans-serif;
    background-color: white;
    margin: 0 auto;
    padding: 30px;
    width: 50%;
    margin-top: 3%;
    border-radius: 15px;
    border: 3px solid rgb(38, 166, 83);
	
	
}

.header {
	
	grid-area: header;
	display: grid;
	grid-template-columns: 75px 1fr;
	grid-template-rows: 1fr;
	gap: 3px;
}

.header h4 {
	font-family: 'Gowun Dodum', sans-serif;
	margin: 10px;
}

.maindetail {
	grid-area: main;
	border: 1px solid black;
	border-radius: 15px;
	padding: 15px;
}

.maindetail p{
	font-family: 'Gowun Dodum', sans-serif;
}


.footerdetail {
	grid-area: footer;
	display: flex;
	flex-direction: row-reverse;
}

.comment {
	grid-area: comment;
	display: flex;
	flex-direction: column;
	
}

.comment > div{
	 border-radius: 3px;
	 font-family: 'Gowun Dodum', sans-serif;
	 margin-top: 3px;
}

.comment > div > p{
	 font-family: 'Gowun Dodum', sans-serif;
}

.comment > div > h4{
	 font-family: 'Gowun Dodum', sans-serif;
}

.insert {
	grid-area: insert;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.insert>textarea {
	flex: 1;
}

.insert>button {
	width: 50px;
}


textarea {
	flex: 1;
	width: 100%;
	margin-top : 3vh;
	margin-right : 1vh;
	height: 10vh;
  	background-color: #f9f9f9;
  	border: 1px solid #e5e5e5;
  	border-radius: 3px;
  	resize: none;
  	font-family: 'Gowun Dodum', sans-serif;
}


input{
	
  width: 100%;
  padding: 1%;
  line-height: 1.4;
  background-color: #f9f9f9;
  border: 1px solid #e5e5e5;
  border-radius: 3px;
  -webkit-transition: 0.35s ease-in-out;
  -moz-transition: 0.35s ease-in-out;
  -o-transition: 0.35s ease-in-out;
  transition: 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
    margin-top: 5px;
    font-family: 'Gowun Dodum', sans-serif;
	
}

select{

  width: 100%;
  padding: 1%;
  line-height: 1.4;
  background-color: #f9f9f9;
  border: 1px solid #e5e5e5;
  border-radius: 3px;
  -webkit-transition: 0.35s ease-in-out;
  -moz-transition: 0.35s ease-in-out;
  -o-transition: 0.35s ease-in-out;
  transition: 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
margin-bottom: 5px;
font-family: 'Gowun Dodum', sans-serif;
}

button{
	width: 80px;
    border: 1px solid white;
    height: 40px;
    border-radius: 6px;
    font-family: 'Gowun Dodum', sans-serif;
    

}

#ibtn{
	display: flex;
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
    .menu6_a {
        font-weight: bold;
        padding-bottom:5px;
        border-bottom: 3px solid #26A653;
    }
    

    .banner_container {
        max-width: 1024px;
        width:1024px;
        display: flex;
        justify-content: center;
/*         background-color: #fafafa; */
        overflow: hidden;
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
                <div class="menu menu6"><a class="menu6_a" href="${pageContext.request.contextPath}/blacklist/blacklistmain">블랙리스트</a></div>
            </div>
        </div>
    </div>
    
	<div id="div1">
	
	<div class="containerdetail">
	
		<div class="header">
			<h4>제목 :</h4>
			<h4>${BlacklistVO.blacklistTitle}</h4>
		</div>
		<div class="maindetail">
			<p>${BlacklistVO.blacklistContent}</p>
		</div>
		<div class="footerdetail">
			<button id="backbtn">뒤로가기</button>
		<c:if test="${BlacklistVO.userId eq requestScope.userdata.userId}">
		
		<button id="deletebtn">삭제</button>
		<button id="editbtn">수정</button>
		</c:if>
		</div>
		<div class="insert" id="insert">
			<textarea name="inittext" id="inittext"></textarea>
			<%-- <c:if test="${BlacklistVO.userId eq requestScope.userdata.userId}"> --%>
			<button id="ibtn">댓글달기</button>
			<%-- </c:if> --%>
		</div>
		
	</div>
	<div class="comment" id="comment"></div>
	
	</div>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>	
	<script type="text/javascript">
	
	const commentmain = document.getElementById("comment");

	document.getElementById("ibtn").addEventListener("click",function(){
		
		let str = document.getElementById("inittext").value;
		
		
		const sendObj = {
				blackCode : ${BlacklistVO.blacklistCode},
				/* userCode : ${userdata.userCode},
				userName : ${vo.userName},*/
				content : str,
				orderCode : 0
		}
		
		fetch("${pageContext.request.contextPath}/blacklist/comment/", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify(sendObj)
		})
		.then((response) => response.json())
		.then((data) => {
			console.log(data);
			makecommentlist(0, data);
			
		})
		.catch(err => {
			console.log(err);
		});
		
	});
	
	window.addEventListener('DOMContentLoaded', (e) => {
		
		fetch("${pageContext.request.contextPath}/blacklist/comment/${BlacklistVO.blacklistCode}")
		  .then(response => response.json())
		  .then(data => {
			  
			  console.log(data);
				
				let commentlist = [];
			  
			  for(const obj of data) {  
				  //상위댓글이 아무것도 없을때
				  if(obj.orderCode === 0){
					  commentlist.push(obj);
					  }else{
						  //else문 상위댓글과 자신이 쓰는 댓글 아이디 비교
						  for(const comp of data){
							  //만약 비교한 댓글 아이디가 상위댓글 번호와 같고
							  if(comp.commentCode == obj.orderCode){
								  //비교댓글의 리스트가 비었을 경우
								  if(comp.innerlist == null){
									  //리스트를 담을 배열을 생성
									  comp.innerlist = [];
								  }
								  	//그후 리스트 배열을 obj에 푸쉬
								  	comp.innerlist.push(obj);
								  	break;
							  }
						  }
					  }
				  } 
				
			  console.log(commentlist);
				  
			  //for obj commentlist 순환
			  for(const obj of commentlist){
				  makecommentlist(0,obj);
			  }
			  
		  }).catch(err => {
			  console.log(err);
		  });
	});
				  
			//위에서 실행할 makecommentlist 함수생성	  
			function makecommentlist(num, item){
				const maindiv = document.createElement("div");
				maindiv.style.border = "1px solid black";
				maindiv.style.padding = "5px";
				
				let lpad = (40*num) + 5;
				maindiv.style.paddingLeft = lpad + "px"; 
				
				const h4 = document.createElement("h4");
				h4.innerText = item.userName;
				const p = document.createElement("p");
				
				let content = (num > 0)?"↳":"";
				p.innerText = content + item.content;
						
				maindiv.append(h4);
				maindiv.append(p);
						
				commentmain.append(maindiv);
				
				// 아이템의 innerlist가 비어있지 않다면
				if(item.innerlist != null){
					for(const inneritem of item.innerlist){
						makecommentlist(num+1,inneritem);
					}
				}
			}	  
			
			

			
			
			 
			
			 
	
	document.getElementById("backbtn").addEventListener("click",function(){
		location.href = "${pageContext.request.contextPath}/blacklist/blacklistmain";
	});
	
	
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



document.getElementById("editbtn").addEventListener("click",function(){
	location.href = "${pageContext.request.contextPath}/blacklist/blacklistmain/editbbs/${BlacklistVO.blacklistCode}";
});



document.getElementById("deletebtn").addEventListener("click",function(){
	let isDelete = confirm("정말로 삭제하시겠습니까?");
	if(isDelete){
		location.href = "${pageContext.request.contextPath}/blacklist/blacklistmain/deletebbs/${BlacklistVO.blacklistCode}";
	}
});


</script>


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
	
</body>
</html>