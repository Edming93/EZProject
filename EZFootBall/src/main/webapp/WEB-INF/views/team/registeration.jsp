<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팀매치 - 팀등록</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-ui.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    <style>
    *{
        box-sizing : border-box;
        
        
     
    }
    .posting{
        display: flex;
        flex-direction: column;
        width: 100%;
        height : 700px;
        border: 1px solid white;
        justify-content: center;
    	align-items: center;
    
    }
    
    .team_info{
        display: flex;
        flex-direction: column;
    }
    .team_info .team_register{
        display: flex;
        flex-direction : column;
        justify-content: center;
        align-items: center;
        font-weight: 700;
        font-size: 40px;
        width: 100%;
        padding-left: 5px;
    }
    .add_info{
    	color : red;
    	text-decoration : underline;
    	font-size : 20px;
    }
    .team_info .team_name{
        width: 100%;
        float: left;
    }
    .team_info .team_name p{
      
        font-weight: 700;
        font-size: 20px;
    }
    .team_info .team_name input{
        width: 100%;
        height: 40px;
        padding-left : 5px;
    }
    .team_info table{
        background-color: white;
        width : 100%;
        
    }
    .team_info table tr td input{
        
        width: 100%;
        float: left;
        padding-left: 5px;
    }

    .submit_button{
    	margin-top: 20px;
        width: 100%;
        height: 40px;
        background-color: #26a563;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius : 10px;
    }
    #writer_submit{
        width: 100%;
        height: 40px;
        background-color:  #26a563;
        border: none;
        color: black;
        font-weight: 700;
        font-size: 15px;
         border-radius : 10px;
    }
    #writer_submit:hover{
        cursor: pointer;
    }

   	
   	/* 헤더  */
   			.main_logo{
         background: url("${pageContext.request.contextPath}/image/ez_logo1.svg") no-repeat center;
         background-size: 95px 35px;
    	cursor: pointer;
    }	
    
      .container1 {
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
    



    .login_icon {
        margin-left:15px;
    }
    .etc_icon {
        margin-left:10px;
    }
    </style>
    
</head>
<body>
<body>
<div class="container1">
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
   </div>
    <div class="posting">
       
        <div class="team_info">
            <div class="team_register">
                <p>팀 등록하기</p><span class="add_info">※5명팀은 5명만 적어주세요</span>
            </div>
            <form action="${pageContext.request.contextPath}/team/teamUpdate" method="post">
            <div class="team_name">
                <p>팀 이름</p>
                <input type="text" name="teamName" id="teamName" placeholder="매력있는 팀 이름 정하기">
            </div>
           
            <table>
                <tr>
                    <th>이름</th>
                    <th>회원코드</th>
                </tr>
                <tr>
                    <td><input type="text" name="tmember1" class="tmem" placeholder="이름을 입력하세요" value="${user.userName}"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode1" class="userCode" placeholder="회원코드" value="${user.userCode}"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember2" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode2" class="userCode" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember3" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode3" class="userCode" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember4" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode4" class="userCode" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember5" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode5" class="userCode" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember6" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode6" class="userCode" placeholder="회원코드"></td>
                </tr>
            </table>
            
            <div class="submit_button">
            	<button id="writer_submit">팀 등록하기</button>
        	</div>
        	 </form>
        </div>
    </div>
  	<script type="text/javascript">
  	let btns = document.getElementsByClassName("btn");
  	for(let i=0; i<btns.length; i++){
  		
  	
   		btns[i].addEventListener("click", function(){
   		let userName = document.getElementsByClassName("tmem")[i].value;
		let userCode = document.getElementsByClassName("userCode")[i];
		
		
		const simple_data = {userName};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/team/usercode",
			type : "POST",
			contentType:"application/json; charset=utf-8",
			dataType : "json",
 			data : JSON.stringify(simple_data),
			success : function(data){
				
				console.log(data);
				for(let comment of data){
					if(comment.teamCode != null){
					
						alert("팀이 존재하여 추가할 수 없습니다.");
						
						
					}
					else{
						userCode.value = comment.userCode;
					}
				}

			},
			error : function(e){
				alert(e);
			}
		});
		
	});
  	}

    </script>
  	<script type="text/javascript">
	let main_logo = document.querySelector(".main_logo");
	
	main_logo.addEventListener("click",function() {
		location.href="${pageContext.request.contextPath}";
	});
</script>
   	
</body>
</html>