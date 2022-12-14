<%@page import="com.sample.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String authority = null;
	if(session.getAttribute("sessionVO") != null) {
		UserVO uvo = (UserVO)session.getAttribute("sessionVO");
		authority = uvo.getUserAuthority();
		
	}else {
		authority = "μΌλ°νμ";
		
	}
%>
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
        padding-top: 20px;
    }
    .header_icon {
	    text-decoration: none;
	    color: #4e4e4e;
	    font-size: 27px;
	    margin-left: 15px;
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
	background: url("${pageContext.request.contextPath}/image/myPageTitle.jpg") no-repeat;
	background-size: contain;
	padding: 10px 0;
	text-indent: -9999px;
}

#main_container {
    display: flex;
    width: 100%;
    height: 100%;
    justify-content: center;
}

.main_area {
    display: flex;
    width: 1024px;
    justify-content: space-evenly;
    align-items: flex-start;
    flex-wrap: wrap;
    margin-top: 75px;
}

.main_content1 {
	display: flex;
    flex-direction: column;
    width: 35%;
}


.main_content2 h3 {
	margin-bottom:15px;
	color: #2c2c2c;
}

.main_left1 {
	width: 100%;
    height: 35%;
    padding: 20px 0px 30px 20px;
    border-radius: 15px;
    box-shadow: 6px 6px 20px 0px #00000010;
}

#user_info > ul {
	list-style-type: none;
	padding: 0;
}

#user_info > ul > li{
    padding: 11px 0;
    display: flex;
    align-items: flex-start;
}
.info_margin {
	margin-bottom:7px;
}
.name_area {
    display: flex;
    flex-direction: column;
    margin: 5px 15px 0px 15px;
}

.email_area {
    padding-top: 5px;
    font-size: 19px;
    color: #26a653;
    padding-left: 35px;
    font-weight: bold;
}



.info_bold {
    font-weight: bold;
    margin: 0px 0px 0px 15px;
    width: 60px;
}
.info_small_size {
	font-size: 14px;
}

.email_font {
    color: #959595;
    margin-top: 5px;
    margin-left: 1px;
}



.main_left2 {
    width: 100%;
    height: 65%;
    border-top: none;
    border-radius: 0 0 15px 15px;
    font-size: 15px;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 340px;
}

.main_right1 {
	width: 100%;
	height: 62%;
	padding: 15px;
	border-radius: 15px 15px 0 0;
	font-size: 18px;
	padding-top: 0px;
}

.main_right2 {
	width: 100%;
	height: 38%;
	padding: 15px;
	border-top: none;
	border-radius: 0 0 15px 15px;
	font-size: 18px;	
}

.main_right3 {
	width: 100%;
    height: 38%;
    padding: 15px;
    border-top: none;
    border-radius: 0 0 15px 15px;
    font-size: 18px;
}

.name1 {
	display: inline-block;
}

.main_left2 > ul{
    list-style-type: none;
    padding: 0;
    margin: 15px 0;
    height: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    width: 90%;
}

.main_left2 > ul > li {
	color: #929292;
	font-size: 11px;
}

.main_left2 > ul > li > a {
	display: inline-block;
    text-decoration: none;
    border-radius: 20px;
    color: #929292;
    text-align: center;
    width: 100%;
    height: 100%;
    font-size: 13px;
}

.main_right1 > ul, .main_right2 > ul, .main_right3 > ul{
    list-style-type: none;
    padding: 0;
    margin: 10px 0;
    height: 90%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    border: 1px solid #d5d5d5;
    border-radius: 20px;
    overflow: hidden;
}

.main_right1 > ul > li, .main_right2 > ul > li, .main_right3 > ul > li {
	font-size: 16px;
    justify-content: center;
    display: flex;
    align-items: center;
    cursor: pointer;
    
}
.main_right1 > ul > li > div {
	cursor: pointer;
}

.main_right1 > ul > li:hover, .main_right2 > ul > li:hover, .main_right3 > ul > li:hover {
	background-color:#d6d6d6;
	font-weight: bold;
} 

.main_right1 > ul > li:hover div span, .main_right2 > ul > li:hover a, .main_right3 > ul > li:hover a{
	color:white;
}

.main_right1 > ul > li:hover .right_btn, .main_right2 > ul > li:hover .right_btn, .main_right3 > ul > li:hover .right_btn {
	padding-left:15px;
} 

.main_right1 > ul > li:hover div span, .main_right2 > ul > li:hover a, .main_right3 > ul > li:hover a{
	color:white;
}


.border_div {
	border-bottom: 1px solid #d6d6d6;
    width: 90%;
}
.no_border_div {
    width: 90%;
}

.bottom_banner {
        width:100%;
        height:235px;
        background-color: #26A653;
    	margin-top: 100px;
    	display: flex;
    	justify-content: center;
    	align-items: center;
}

footer {
	width: 100%;
	height: 423px;
	display: flex;
	justify-content: space-evenly;
	padding: 30px;
	background-color: #2a2a2a;
	margin-top: 150px;
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
.right_btn {
    display: inline-block;
    text-decoration: none;
    border-radius: 20px;
    color: #4e4e4e;
    width: 100%;
    height: 100%;
    padding: 20px 10px;
}
 .teambox{
    	width: 60%;
	    padding: 20px;
	    border-radius: 10px;
	    box-shadow: 2px 5px 10px 0 rgb(34 36 38 / 15%);
    }
    .teamInfo {
    	padding-top: 18px;
    	display: flex;
    	justify-content: space-between;
    	align-items: center;
    }
    .teamlist > ul {
    	list-style: none;
    	padding-left:0px;
    	display: flex;
    	flex-direction: column;
    	align-items: center;
    }
    .teamlist > ul > li {
	    padding: 20px 40px 20px 40px;
	    margin-top: 15px;
	    width: 95%;
	    border: 1px solid #26A653;
	    border-radius: 15px;
	}
	.checkbox {
	    width: 20px;
	    height: 20px;
	}

    .teambox2{
    	width: 60%;
	    padding: 30px;
	    border-radius: 10px;
	    box-shadow: 2px 5px 10px 0 rgb(34 36 38 / 15%);
    }
    .teambox2 > .teamInfo > h3	{
    	padding-top: 10px;
    }
    #out{
    	padding: 8px;
    	background: none;
    	border: 1px solid #26A653;
     	border-radius: 25px;
     	cursor: pointer;    	
    }
    #Mdel{
    	padding: 8px;
    	background: none;
    	border: 1px solid #26A653;
     	border-radius: 7px;
     	cursor: pointer; 
    }
    #Tdel{
    	padding: 8px;
    	background: none;
    	border: 1px solid #26A653;
     	border-radius: 7px;
     	cursor: pointer; 
    }
    .member_area {
    	display: flex;
    	justify-content: space-between;
    }
    
  	.member_h4 {
  		margin-bottom:10px;
  	}
  	#subInfo {
  		font-weight: 100;
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
	                  <iconify-icon class="glass" icon="fa6-solid:magnifying-glass"></iconify-icon>
                  </div>
                  <div class="adminMove">
                  	<% if(authority.equals("κ΄λ¦¬μ")){ %>
                  		<a class="header_icon admin_btn" href="${pageContext.request.contextPath}/admin/admin"><iconify-icon icon="clarity:administrator-solid"></iconify-icon></a>
				  	<%}else if(authority.equals("λ§€λμ ")){%>
				  		<a class="header_icon manager_btn" href="${pageContext.request.contextPath}/manager/manager"><iconify-icon icon="clarity:administrator-solid"></iconify-icon></a>
				  	<%} %>
                  </div>
                  
                  <div class="login_icon">
                     <a href="${pageContext.request.contextPath}/loginPage/login">
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
                  
                  <% if(session.getAttribute("sessionVO") == null) { %>
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
                  <% } %>
                  
                  <% if(session.getAttribute("sessionVO") != null) { %>
                  <div class="logout_icon">
                     <a class="header_icon logout_btn" href="${pageContext.request.contextPath}/loginPage/logout">
						<iconify-icon icon="codicon:sign-out"></iconify-icon>
                     </a>
                  </div>
                  <%} %>
               </div>
            </div>
            <script type="text/javascript">
				if(document.querySelector(".admin_btn")){
					let admin_btn = document.querySelector(".admin_btn");
					admin_btn.addEventListener("click",function() {
	     				if(confirm("κ΄λ¦¬μ νμ΄μ§λ‘ μ΄λ νμκ² μ΅λκΉ?")){
	     					admin_btn.href="${pageContext.request.contextPath}/admin/admin";
	     				}else{
	     					admin_btn.href="#";
	     				}
	            	});
				}	
            
				if(document.querySelector(".manager_btn")){
					let manager_btn = document.querySelector(".manager_btn");
					manager_btn.addEventListener("click",function() {
	     				if(confirm("λ§€λμ  νμ΄μ§λ‘ μ΄λ νμκ² μ΅λκΉ?")){
	     					manager_btn.href="${pageContext.request.contextPath}/manager/manager";
	     				}else{
	     					manager_btn.href="#";
	     				}
	            	});
				}	
            
            
            	if(document.querySelector(".logout_btn")){
            	let logout_btn = document.querySelector(".logout_btn");

					logout_btn.addEventListener("click",function() {
	     				if(confirm("λ‘κ·Έμμ νμκ² μ΅λκΉ?")){
	     					alert("λ‘κ·Έμμ λμμ΅λλ€.");
	     					logout_btn.href="${pageContext.request.contextPath}/loginPage/logout";
	     				}else{
	     					alert("λ‘κ·Έμμμ μ·¨μνμ¨μ΅λλ€.");
	     					logout_btn.href="#";
	     				}
	            	});
            	}
            </script>
				</div>
			</div>
		</div>
        <div id="main_container">
            <div class="main_area">
				<div class="main_content1">
					<section class="main_left1">
						<div id="user_info">
							<ul>
								<li class="info_margin"><img src="${pageContext.request.contextPath}/image/profile_photo.png">
									<div class="name_area">
										<h3 class="name1">${userVO.userName }</h3>
										<span class="info_small_size email_font">${userVO.userEmail1}${userVO.userEmail2}</span>
									</div>
									<span class="email_area">#${userVO.userCode}</span>
								</li>
								<li><span class="info_bold">Team</span>
								  	<c:if test="${uinVO.userGroup ne 'μμ'}"><span class="info_small_size">${uinVO.userGroup }</span></c:if>
								  	<c:if test="${uinVO.userGroup eq 'μμ'}"><span class="info_small_size">νμ΄ μμ΅λλ€.</span></c:if>
								 </li>
								<li><span class="info_bold">λ­ν¬</span>  <span class="info_small_size">${uinVO.userLevel }</span></li>
								<li><span class="info_bold">μΉλ₯ </span>
									<c:if test="${(userVO.userWin/(userVO.userWin+userVO.userLose))*100 ne 'NaN'}"> <span class="info_small_size">  <fmt:formatNumber value="${(userVO.userWin/(userVO.userWin+userVO.userLose))*100}" pattern=".0"/>% &nbsp;<span>(${userVO.userWin}μΉ ${userVO.userLose}ν¨)</span></span></c:if>
									<c:if test="${(userVO.userWin/(userVO.userWin+userVO.userLose))*100 eq 'NaN'}"> <span class="info_small_size">κ²½κΈ° κΈ°λ‘μ΄ μμ΅λλ€.</span></c:if>
								</li>
							</ul>
						</div>
					</section>
					<section class="main_left2">
						<div class="left2_image_area">
							<img src="${pageContext.request.contextPath}/image/EZ_image.png">
						</div>
						<ul>
							<li><a href="${pageContext.request.contextPath}/loginPage/logout">λ‘κ·Έμμ</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath}/myPage/notice">κ³΅μ§μ¬ν­</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath}/myPage/rankGuide">λ­νΉμκ°</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath}/myPage/guide1">μμκ°μ΄λ</a></li>
						</ul>
					</section>
				</div>
			
				
		<c:if test="${user.userCode != tmVO.userCode1}">
			<div class="teambox">
				<h3>ν μ λ³΄</h3>
					<div class="teamInfo">
						<h4>
							νμ΄λ¦ : ${tmVO.teamName } <span id="subInfo">(νμ½λ :	${tmVO.teamCode})</span>
						</h4>
						<button id="out">
							νλκ°κΈ°
						</button>
					</div>
					
					<div class="teamlist">
						<ul>

							<li class="m1"></li>
							<c:if test="${not empty tmVO.tmember2}">
								<li class="m2"></li>
							</c:if>
							<c:if test="${not empty tmVO.tmember3}">
								<li class="m3"></li>
							</c:if>
							<c:if test="${not empty tmVO.tmember4}">
								<li class="m4"></li>
							</c:if>
							<c:if test="${not empty tmVO.tmember5}">
								<li class="m5"></li>
							</c:if>
							<c:if test="${not empty tmVO.tmember6}">
								<li class="m6"></li>
							</c:if>
						</ul>
					</div>
					
				</div>
		</c:if>
		
		<c:if test="${user.userCode == tmVO.userCode1 }">
				<div class="teambox2">
					<h2>λΉμ μ μ£Όμ₯ μλλ€</h2>
					<div class="teamInfo">
						<h4>
							TeamName : ${tmVO.teamName } <span id="subInfo">(TeamCode :	${tmVO.teamCode})</span>
						</h4>
						<div>
						<button id="Mdel">
							μΆλ°©
						</button>
						<button id="Tdel">
							ν ν΄μ²΄
						</button>
						</div>
					</div>
					<div class=teamlistcon>
						<div class="teamlist">
							<ul>
								<li class="m1">
									<h4 class="member_h4">μ£Όμ₯</h4>
								</li>
								<c:if test="${not empty tmVO.tmember2}">
									<li class="m2">
										<div class="member_area">
											<h4 class="member_h4">νμ1</h4>
											<input type="checkbox" id="tmember2" class="checkbox" name="tmember2" value="${tmVO.userCode2}">
										</div>
									</li>
								</c:if>
								<c:if test="${not empty tmVO.tmember3}">
									<li class="m3">
										<div class="member_area">
											<h4 class="member_h4">νμ2</h4>
											<input type="checkbox" id="tmember3" class="checkbox" name="tmember3" value="${tmVO.userCode3}">
										</div>
										</li>
								</c:if>
								<c:if test="${not empty tmVO.tmember4}">
									<li class="m4">
										<div class="member_area">
											<h4 class="member_h4">νμ3</h4>
											<input type="checkbox" id="tmember4" class="checkbox" name="tmember4" value="${tmVO.userCode4}">
										</div>
									</li>

								</c:if>
								<c:if test="${not empty tmVO.tmember5}">

									<li class="m5">
										<div class="member_area">
											<h4 class="member_h4">νμ4</h4>
											<input type="checkbox" id="tmember5" class="checkbox" name="tmember5" value="${tmVO.userCode5}">
										</div>
									</li>

								</c:if>
								<c:if test="${not empty tmVO.tmember6}">
									<li class="m6">
										<div class="member_area">
											<h4 class="member_h4">νμ5</h4>
											<input type="checkbox" id="tmember6" class="checkbox" name="tmember5" value="${tmVO.userCode6}">
										</div>
									</li>									
								</c:if>
							</ul>
						</div>
						
					</div>
				</div>
		</c:if>
				
				
            </div>
        </div>
        
    <!-- ν λκ°κΈ° -->
	<script type="text/javascript">
	if(${user.userCode} != ${tmVO.userCode1}){
		document.getElementById("out").addEventListener("click",function(){
			var del = confirm("μ λ§ λκ°κ² μ΅λκΉ?");
			 if(del){
				 location.href="${pageContext.request.contextPath}/team/outteam?teamCode="+${tmVO.teamCode}+"&userCode="+${user.userCode};
			 }else{
				 location.reload();
			 }
	    });
	}
	
	</script>
	
	
	<!-- νμμ­μ  -->
	<script type="text/javascript">
	if(${user.userCode} == ${tmVO.userCode1}){
		
	document.getElementById("Mdel").addEventListener("click",function(){
		var usec = 0;
		var del = confirm("μ λ§ μΆλ°© νμκ² μ΅λκΉ?");
		 if(del){
			 for(var i=0; i<document.getElementsByClassName("checkbox").length; i++){
				 if(document.getElementsByClassName("checkbox")[i].checked == true){
					 usec = document.getElementsByClassName("checkbox")[i].value;
				 }
			 }
			 location.href="${pageContext.request.contextPath}/team/outteam?teamCode="+${tmVO.teamCode}+"&userCode="+usec;
		 }else{
			 location.reload();
		 }
    });
	}
	</script>
	
	<!-- ν ν΄μ²΄ -->
	<script type="text/javascript">
	if(${user.userCode} == ${tmVO.userCode1}){
	document.getElementById("Tdel").addEventListener("click",function(){
		var del = confirm("μ λ§ ν΄μ²΄ νμκ² μ΅λκΉ?");
		 if(del){
			 location.href="${pageContext.request.contextPath}/team/alltdal?teamCode="+${tmVO.teamCode};
		 }else{
			 location.reload();
		 }
    });
	}
	</script>

		
	 	<!-- 1λ² -->
        <script type="text/javascript">
        let data = {userCode : ${tmVO.userCode1}};
   	   	fetch("${pageContext.request.contextPath}/myPage/teamselect",{
 	         method : "POST",
 	         headers : {
 	            "Content-Type" : "application/json"},
 	         body : JSON.stringify(data)
 	      }).then(response => response.json()) 
 	      .then(data => {  
 	    	  	
	        	var divn = document.createElement("div");
	        	divn.innerHTML = "<iconify-icon icon='ic:twotone-drive-file-rename-outline' style='color: #26a563;' width='27' height='27'></iconify-icon>"+ "γ" +data.userName;
	        	divn.className = "listno";
	        	
	        	var divd = document.createElement("div");
	        	divd.innerHTML = "<iconify-icon class='icon_size' icon='ic:sharp-transgender' style='color: #26a653;' width='27' height='27'></iconify-icon>" + "γ" + data.userGender;
	        	divd.className = "listno";
	        	
	        	var divg = document.createElement("div");
	        	divg.innerHTML = "<iconify-icon icon='tabler:tournament' style='color: #26a563;' width='27' height='27' rotate='270deg'></iconify-icon>" +"γ" + data.userGroup;
	        	divg.className = "listno";
	        	
	        	var divl = document.createElement("div");
	        	divl.innerHTML = "<iconify-icon class='icon_size' icon='icon-park-twotone:level' style='color: #26a563;' width='27' height='27'></iconify-icon>" + "γ" + data.userLevel;
	        	divl.className = "listno";
	        	
	        	
	        	document.querySelector(".m1").append(divn);
	        	document.querySelector(".m1").append(divd);
	        	document.querySelector(".m1").append(divg);
	        	document.querySelector(".m1").append(divl);
	        	
 	      }).catch(error => {
 	         console.log("error");
 	      });
        	
        </script>
        
        <!-- 2λ² -->
        <script type="text/javascript">
        if('${tmVO.userCode2}' > 1){
        let data2 = {userCode : '${tmVO.userCode2}'};
   	   	fetch("${pageContext.request.contextPath}/myPage/teamselect",{
 	         method : "POST",
 	         headers : {
 	            "Content-Type" : "application/json"},
 	         body : JSON.stringify(data2)
 	      }).then(response => response.json()) 
 	      .then(data2 => {  
 	    	  	
	        	var divn = document.createElement("div");
	        	divn.innerHTML = "<iconify-icon icon='ic:twotone-drive-file-rename-outline' style='color: #26a563;' width='27' height='27'></iconify-icon>"+ "γ" +data2.userName;
	        	divn.className = "listno";
	        	
	        	var divd = document.createElement("div");
	        	divd.innerHTML = "<iconify-icon class='icon_size' icon='ic:sharp-transgender' style='color: #26a653;' width='27' height='27'></iconify-icon>" + "γ" + data2.userGender;
	        	divd.className = "listno";
	        	
	        	var divg = document.createElement("div");
	        	divg.innerHTML = "<iconify-icon icon='tabler:tournament' style='color: #26a563;' width='27' height='27' rotate='270deg'></iconify-icon>" +"γ" + data2.userGroup;
	        	divg.className = "listno";
	        	
	        	var divl = document.createElement("div");
	        	divl.innerHTML = "<iconify-icon class='icon_size' icon='icon-park-twotone:level' style='color: #26a563;' width='27' height='27'></iconify-icon>" + "γ" + data2.userLevel;
	        	divl.className = "listno";
	        	
	        	
	        	document.querySelector(".m2").append(divn);
	        	document.querySelector(".m2").append(divd);
	        	document.querySelector(".m2").append(divg);
	        	document.querySelector(".m2").append(divl);
	        	
 	      }).catch(error => {
 	         console.log("error");
 	      });
        }
        </script>
        
        
        <!-- 3λ² -->
        <script type="text/javascript">
        if('${tmVO.userCode3}' > 1){
        	
        let data3 = {userCode : '${tmVO.userCode3}'};
   	   	fetch("${pageContext.request.contextPath}/myPage/teamselect",{
 	         method : "POST",
 	         headers : {
 	            "Content-Type" : "application/json"},
 	         body : JSON.stringify(data3)
 	      }).then(response => response.json()) 
 	      .then(data3 => {  
 	    	  	
	        	var divn = document.createElement("div");
	        	divn.innerHTML = "<iconify-icon icon='ic:twotone-drive-file-rename-outline' style='color: #26a563;' width='27' height='27'></iconify-icon>"+ "γ" +data3.userName;
	        	divn.className = "listno";
	        	
	        	var divd = document.createElement("div");
	        	divd.innerHTML = "<iconify-icon class='icon_size' icon='ic:sharp-transgender' style='color: #26a653;' width='27' height='27'></iconify-icon>" + "γ" + data3.userGender;
	        	divd.className = "listno";
	        	
	        	var divg = document.createElement("div");
	        	divg.innerHTML = "<iconify-icon icon='tabler:tournament' style='color: #26a563;' width='27' height='27' rotate='270deg'></iconify-icon>" +"γ" + data3.userGroup;
	        	divg.className = "listno";
	        	
	        	var divl = document.createElement("div");
	        	divl.innerHTML = "<iconify-icon class='icon_size' icon='icon-park-twotone:level' style='color: #26a563;' width='27' height='27'></iconify-icon>" + "γ" + data3.userLevel;
	        	divl.className = "listno";
	        	
	        	
	        	document.querySelector(".m3").append(divn);
	        	document.querySelector(".m3").append(divd);
	        	document.querySelector(".m3").append(divg);
	        	document.querySelector(".m3").append(divl);
	        	
 	      }).catch(error => {
 	         console.log("error");
 	      });

        }
        	
        </script>
        
        
        <!-- 4λ² -->
        <script type="text/javascript">
        if('${tmVO.userCode4}' > 1){
        	
        let data4 = {userCode : '${tmVO.userCode4}'};
   	   	fetch("${pageContext.request.contextPath}/myPage/teamselect",{
 	         method : "POST",
 	         headers : {
 	            "Content-Type" : "application/json"},
 	         body : JSON.stringify(data4)
 	      }).then(response => response.json()) 
 	      .then(data4 => {  
 	    	  	
	        	var divn = document.createElement("div");
	        	divn.innerHTML = "<iconify-icon icon='ic:twotone-drive-file-rename-outline' style='color: #26a563;' width='27' height='27'></iconify-icon>"+ "γ" +data4.userName;
	        	divn.className = "listno";
	        	
	        	var divd = document.createElement("div");
	        	divd.innerHTML = "<iconify-icon class='icon_size' icon='ic:sharp-transgender' style='color: #26a653;' width='27' height='27'></iconify-icon>" + "γ" + data4.userGender;
	        	divd.className = "listno";
	        	
	        	var divg = document.createElement("div");
	        	divg.innerHTML = "<iconify-icon icon='tabler:tournament' style='color: #26a563;' width='27' height='27' rotate='270deg'></iconify-icon>" +"γ" + data4.userGroup;
	        	divg.className = "listno";
	        	
	        	var divl = document.createElement("div");
	        	divl.innerHTML = "<iconify-icon class='icon_size' icon='icon-park-twotone:level' style='color: #26a563;' width='27' height='27'></iconify-icon>" + "γ" + data4.userLevel;
	        	divl.className = "listno";
	        	
	        	
	        	document.querySelector(".m4").append(divn);
	        	document.querySelector(".m4").append(divd);
	        	document.querySelector(".m4").append(divg);
	        	document.querySelector(".m4").append(divl);
	        	
 	      }).catch(error => {
 	         console.log("error");
 	      });

        }
        	
        </script>
        
        <!-- 5λ² -->
        <script type="text/javascript">
        if('${tmVO.userCode5}' > 1){
        	
        let data5 = {userCode : '${tmVO.userCode5}'};
   	   	fetch("${pageContext.request.contextPath}/myPage/teamselect",{
 	         method : "POST",
 	         headers : {
 	            "Content-Type" : "application/json"},
 	         body : JSON.stringify(data5)
 	      }).then(response => response.json()) 
 	      .then(data5 => {  
 	    	  	
	        	var divn = document.createElement("div");
	        	divn.innerHTML = "<iconify-icon icon='ic:twotone-drive-file-rename-outline' style='color: #26a563;' width='27' height='27'></iconify-icon>"+ "γ" +data5.userName;
	        	divn.className = "listno";
	        	
	        	var divd = document.createElement("div");
	        	divd.innerHTML = "<iconify-icon class='icon_size' icon='ic:sharp-transgender' style='color: #26a653;' width='27' height='27'></iconify-icon>" + "γ" + data5.userGender;
	        	divd.className = "listno";
	        	
	        	var divg = document.createElement("div");
	        	divg.innerHTML = "<iconify-icon icon='tabler:tournament' style='color: #26a563;' width='27' height='27' rotate='270deg'></iconify-icon>" +"γ" + data5.userGroup;
	        	divg.className = "listno";
	        	
	        	var divl = document.createElement("div");
	        	divl.innerHTML = "<iconify-icon class='icon_size' icon='icon-park-twotone:level' style='color: #26a563;' width='27' height='27'></iconify-icon>" + "γ" + data5.userLevel;
	        	divl.className = "listno";
	        	
	        	
	        	document.querySelector(".m5").append(divn);
	        	document.querySelector(".m5").append(divd);
	        	document.querySelector(".m5").append(divg);
	        	document.querySelector(".m5").append(divl);
	        	
 	      }).catch(error => {
 	         console.log("error");
 	      });

        }
        	
        </script>
        
        
        
        <!-- 6λ² -->
        <script type="text/javascript">
        if('${tmVO.userCode6}' != ''){
        	
        let data6 = {userCode : '${tmVO.userCode6}'};
   	   	fetch("${pageContext.request.contextPath}/myPage/teamselect",{
 	         method : "POST",
 	         headers : {
 	            "Content-Type" : "application/json"},
 	         body : JSON.stringify(data6)
 	      }).then(response => response.json()) 
 	      .then(data6 => {  
 	    	  	
	        	var divn = document.createElement("div");
	        	divn.innerHTML = "<iconify-icon icon='ic:twotone-drive-file-rename-outline' style='color: #26a563;' width='27' height='27'></iconify-icon>"+ "γ" +data6.userName;
	        	divn.className = "listno";
	        	
	        	var divd = document.createElement("div");
	        	divd.innerHTML = "<iconify-icon class='icon_size' icon='ic:sharp-transgender' style='color: #26a653;' width='27' height='27'></iconify-icon>" + "γ" + data6.userGender;
	        	divd.className = "listno";
	        	
	        	var divg = document.createElement("div");
	        	divg.innerHTML = "<iconify-icon icon='tabler:tournament' style='color: #26a563;' width='27' height='27' rotate='270deg'></iconify-icon>" +"γ" + data6.userGroup;
	        	divg.className = "listno";
	        	
	        	var divl = document.createElement("div");
	        	divl.innerHTML = "<iconify-icon class='icon_size' icon='icon-park-twotone:level' style='color: #26a563;' width='27' height='27'></iconify-icon>" + "γ" + data6.userLevel;
	        	divl.className = "listno";
	        	
	        	
	        	document.querySelector(".m6").append(divn);
	        	document.querySelector(".m6").append(divd);
	        	document.querySelector(".m6").append(divg);
	        	document.querySelector(".m6").append(divl);
	        	
 	      }).catch(error => {
 	         console.log("error");
 	      });

        }
        	
        </script>
        
    <footer>
        <jsp:include page="../etc/footer.jsp"></jsp:include>
    </footer>

		<script type="text/javascript">
            let main_logo = document.querySelector(".main_logo");
            
            main_logo.addEventListener("click",function() {
                location.href="${pageContext.request.contextPath}";
            });
        </script>
        
        <script type="text/javascript">
        $('.qna').click(function(e){
        	e.preventDefault();
        	alert("μ€λΉμ€μλλ€.");
        });
        </script>
	</div>
</body>
</html>