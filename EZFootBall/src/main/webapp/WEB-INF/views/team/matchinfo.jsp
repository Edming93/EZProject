<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.sample.vo.UinVO"%>
<%@page import="com.sample.vo.UserVO"%>
<%@page import="com.sample.vo.GlistVO"%>
<%@page import ="java.time.LocalTime"%>
<%
	int td = -1;
	String ugen = "무";
	if( (UinVO)session.getAttribute("urabil") != null) {
		UinVO vo = (UinVO)session.getAttribute("urabil");
		td = vo.getTeamCode();
		ugen = vo.getUserGender();
		if(vo.getTeamCode() != 0){
			td = vo.getTeamCode();
		}else {
			td = 0;
		}
	}
	LocalTime now = LocalTime.now();
	int hour = now.getHour();
%>
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
         display: grid;
    	 grid-template-columns: 23% 54% 23%;
         grid-template-rows: 65px 448px 85px 88px 400px 1fr auto auto auto 1fr ;
         gap: 5px 5px;
         grid-auto-flow: row;
         grid-template-areas: ". header btn" 
                              ". banner ." 
                              ". title  ."
                              ". menu ."
                              ". match ."
                              ". content ."
                              ". list ."
                              ". rule ."
                              ". refund ."
                              ". notice .";
      }

      .header_container {
         grid-area: header;
         width: 100%;
         height: 56px;
         display: flex;
         justify-content: center;
      }

      .header_area {
         width: 100%;
         height: 100%;
         padding-top: 15px;
      }

      .header_content {
         display: flex;
         height: 100%;
         justify-content: space-between;
      }

      .header_left {
         width: 95px;
         display: flex;
         justify-content: center;
         align-items: center;
      }

      .main_logo {
         background: url("${pageContext.request.contextPath}/image/ez_logo1.svg") no-repeat center;
         background-size: 95px 35px;
         cursor: pointer;
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

      }

      .big_menu_area {
         width: 100%;
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

      .menu1,
      .menu2,
      .menu3,
      .menu4,
      .menu5 {
         width: 100px;
         justify-content: center;
         display: inline-block;
      }

      .menu1_a {
         font-weight: bold;
         padding-bottom: 5px;
         border-bottom: 3px solid #26A653;
      }


      .banner_container {
         grid-area: banner;
         width: 100%;
         height: 100%;
         display: flex;
         justify-content: center;
         background-color: #fafafa;
      }

      .banner_content_area {
         width: 100%;
         display: flex;
         justify-content: center;
         align-items: center;
         overflow: hidden;
      }

      .banner_content {
         height: 448px;
         width: 100%;
         /* 추후에 사이즈 media로 변경 */
         white-space: nowrap;
         position: relative;
      }

      .banner_image {
         width: 100%;
         height: 100%;
      }

      .field_address {
         font-size: 13px;
      }

      .address_copy,
      .open_map {
         color: rgb(26, 124, 255);
         text-decoration: none;
         cursor: pointer;
         margin-right:5px;
      }

      .field_container {
         grid-area: title;
         display: flex;
         flex-direction: column;
         align-items: center;
      }

      .field_content_area {
         width: 100%;
         display: flex;
         flex-direction: column;
         padding: 20px;

      }

      .field_content {
         display: flex;
      }

      .field_address {
         margin-top: 10px;
      }

      .menu_container {
         grid-area: menu;
         display: flex;
         justify-content: center;
         margin-top: 10px;

      }
      .menu_content {
         display: flex;
         width: 100%;
		 border-bottom: 1px solid #ebebeb;
		 border-top: 1px solid #ebebeb;
		 padding:20px;
      }

      .menu_name {
         width: 125px;
         height: 100%;
         display: flex;
         justify-content: center;
         align-items: center;
      }
      
      .menu_title {
         color:white;
      	 text-decoration: none;
		 height: 30px;
		 line-height: 30px;
      }
      .menu_title2 {
      	 color:#C7C7C7;
      	 text-decoration: none;
      }
      
      .menu_title_area {
			background-color: #26A653;
		    width: 110px;
		    height: 35px;
		    text-align: center;
		    border-radius: 20px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    padding: 20px 0px;
		    
      }
      .menu_title_area2 {
		    width: 110px;
		    height: 35px;
		    text-align: center;
		    border-radius: 20px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    padding: 20px 0px;
		    border: 1px solid #C7C7C7;
		    cursor: pointer;
      }
      .menu_title_area2:hover {
      		background-color: #C7C7C7;
            color:white;
      }
      
      .menu_title_area2:hover .menu_title2 {
            color:white;
      }
      
      .content_container {
         grid-area:content;
         display: flex;
         flex-direction: column;
    	 padding: 0px 20px;
    	 padding-bottom: 35px;
    	 padding-top: 50px;
    	 border-top: 1px solid #ebebeb;
    	 
      }
      
      
      .content_content {
         display: flex;
         flex-direction: row;
         width:100%;
         margin-top:15px;
         justify-content: space-between;
      }
      
      .field_info_area {
         display: flex;
         width:70%;
         flex-direction: column;
      }

      .content_count {
         width: 100%;
         margin: 15px 0px;
         display: flex;
         justify-content: space-between;
      }

      .field_info {
         width:70%;
      }
      .plant_info {
         width:25%;
      }

      .field_image {
         width:165px;
         height:100px;
         margin-bottom: 20px;
      }
      
      .content_field_name {
         width:100%;
         margin-bottom: 10px;
         font-weight: bold;
      }
      
      .content_field_info {
         color:gray;
         font-size:13px;
      }

      .field_etc_area {
         display: flex;
         width: 25%;
         flex-direction: column;
         
      }
      
      .etc {
	    font-size: 16px;
	    margin-bottom: 20px;
	    display: flex;
	    line-height: 27px;
      }
      
      .etc_stroke {
         color:rgb(187, 187, 187);
      }

      .icon_size {
         font-size: 27px;

      }
      
      .match_container {
         grid-area: match;
         padding: 0px 20px;
         padding-bottom: 35px;
         padding-top: 50px;
         display: flex;
         width: 100%;
         justify-content: space-between;
        
      }
      .match_left{
      	width: 70%;
      }
      .match_right{
      	width: 25%;
      }
      .subbtn{
         width: 100px;
         height: 35px;
         background-color: #d3f1e1;
         color: #26a563;
         border: 1px solid #26a563;
         border-radius: 45px;
         font-weight: bold;
         cursor: pointer;
      }
      .list_container{
         grid-area: list;
         padding: 0px 20px;
         padding-bottom: 35px;
         padding-top: 50px;
         border-top: 1px solid #ebebeb;
      }
      
      .list_content{
      	 display: grid;
         grid-template-columns: repeat(2, 1fr);
         justify-content:space-between;
      }
      /* .list_num{
      	margin-bottom: 30px;
      	border: 2px solid #26a653;
      	border-radius: 15px;
      	width: 70%;
      	padding: 20px;
      } */
      
      /* .list_num >div {
      	padding-bottom: 15px;
      } */
      .listno{
         font-size: 16px;
         display: flex;
         line-height: 27px;
         padding-bottom : 5px;
      } 
      .listno:last-child{
      	padding-bottom : 5px;
      	border-bottom: 1px solid #d3f1e1;
      }
      .list_team{
      	font-size: 16px;
        display: flex;
        line-height: 50px;
      }
      .teamdiv{
      	width:90%;
      	padding: 15px;
      	border: 2px solid #26a653;
      	border-radius: 15px;;
      }
      .memberdiv{
      	padding: 10px;
      }
      
      .rule_container{
         grid-area: rule;
         width: 100%;
         margin-top: 10px;
		 border-top: 1px solid #ebebeb;
		 padding: 0px 20px;
      }
      
      .rule_title {
         margin-bottom: 35px;
         margin-top: 50px;
      }
      .rule_div{
      	padding-bottom: 30px;
      }
      .rule_name{
      	padding-bottom: 15px;
      }
      
      .rule_div > ul > li{
      	padding-bottom: 10px;
      }
      
      .refund_container {
      	 grid-area: refund;
         width: 100%;
         margin-top: 10px;
		 border-top: 1px solid #ebebeb;
		 padding: 0px 20px;
		 padding-bottom: 35px;
      }
      
      .refund_title {
         margin-bottom: 35px;
         margin-top: 50px;

      }
      .refund_table{
            border: 1px solid black;
            border-collapse: collapse;
            margin-top: 15px;
        }
       td {
            padding: 5px;
        }

      .notice_container {
         grid-area: notice;
         width: 100%;
         margin-top: 10px;
		 border-top: 1px solid #ebebeb;
		 padding: 0px 20px;
      }
      
      .notice_title {
         margin-bottom: 35px;
         margin-top: 50px;

      }

      .notice {
         margin: 20px 0px;
         font-size:14px;
      }
      
      .notice_content h4 {
         display: flex;
      }

      .icon_notice {
         font-size: 23px;

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
         line-height: 0px;
      }

      .etc_icon {
         margin-left: 10px;
         line-height: 0px;
      }

      .rv_btn_area {
         grid-area: btn;
         margin: 30px;
         position: sticky;
         top: 88%;
      }

      .rv_btn {
		    width: 220px;
		    height: 70px;
		    background-color: #e8f2ff;
		    color: rgb(26, 124, 255);
		    border: 1px solid rgb(187 216 255);
		    border-radius: 45px;
		    font-weight: bold;
		    font-size: 22px;
		    cursor: pointer;
      }
      
      .map_picture {
      	width:100%;
      	height:100%;
      	visibility: hidden;
      }
       #map { 
       	width:100%; 
       	height:100%; 
       	position: relative; 
       } 
      
      .picture_area {
      	width:100%;
      	height:100%;
      	position: absolute;
    	top: 0px;
      }
      
      .map_toggle {
      	visibility: visible;
      }
      
      .change_text {
      	color:#C7C7C7;;
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
      <div class="banner_container">
         <div class="banner_content_area">
            <div class="banner_content">
			   <div class="map_picture">
			   		<div id="map"></div>
			   </div>
			   <div class="picture_area" id="picture_area">
	           </div>
            </div>
         </div>
      </div>
      <div class="field_container">
         <div class="field_content_area">
            <h3 class="field_name">${matchinfo.fieldName}</h3>
            <div class="field_address">${matchinfo.fieldAddress}
               <a class="address_copy" href="#" onclick="clip(); return false;">주소 복사</a></span>
               <span class="open_map" id="mapbtn">지도 보기</span>
            </div>
         </div>
      </div>

      <!-- 주소복사 -->
      <script type="text/javascript">

         function clip(){
         
            var url = '';
            var textarea = document.createElement("textarea");
            document.body.appendChild(textarea);
            url = '${matchinfo.fieldAddress}';
            textarea.value = url;
            textarea.select();
            document.execCommand("copy");
            document.body.removeChild(textarea);
            alert("경기장 주소가 복사되었습니다.")
         }
         
         </script>
      <div class="menu_container">
         <div class="menu_content">
            <div class="menu_name">
            	<div class="menu_title_area">
            		<a href="#" class="field_plant menu_title">시설</a>
            	</div>
            </div>
            <div class="menu_name">
                <div class="menu_title_area2">
            		<a href="#" class="field_reservation menu_title2">구장 예약</a>
            	</div>
            </div>
         </div>
      </div>
      
      <div class="content_container">
         <div class="content_count">
            <h3 class="field_info">구장 정보</h3>
            <h3 class="plant_info">시설 정보</h3>
         </div>
         <div class="content_content">
            <div class="field_info_area">
            
               <div class="field_img_area" id="field_img_area">  </div>
               
               <div class="content_field_name">A구장</div>
               <div class="content_field_info" id="content_field_info"></div>
                
            </div>
            <div class="field_etc_area">
               <div class="etc"><iconify-icon class="icon_size" icon="icon-park:spikedshoes"></iconify-icon>　풋살화 대여</div>
               <div class="etc"><iconify-icon class="icon_size" icon="icon-park:basketball-clothes"></iconify-icon>　운동복 대여</div>
               <div class="etc"><iconify-icon class="icon_size" icon="ant-design:car-outlined"></iconify-icon>　주차</div>
               <div class="etc etc_stroke"><iconify-icon class="icon_size" icon="akar-icons:water"></iconify-icon>　<s>정수기</s></div>
               <div class="etc"><iconify-icon class="icon_size" icon="cil:toilet"></iconify-icon>　화장실</div>
               <div class="etc"><iconify-icon class="icon_size" icon="material-symbols:smoking-rooms-rounded"></iconify-icon>　흡연실</div>
               <div class="etc etc_stroke"><iconify-icon class="icon_size" icon="majesticons:bath-shower-line"></iconify-icon>　<s>샤워실</s></div>
            </div>
            
         </div>

      </div>

      <!-- 매치포인트 -->
      <div class="match_container">
      	
      	<div class="match_left">
      		<div class="content_count">
            <h3 class="match_info">게임정보</h3>
         </div>
     	 
     	 <div class="match_content" id="match_content">
     	 	<div class="etc">
     	 		<iconify-icon icon="uil:calender" style="color: #26a563;" width="27" height="27"></iconify-icon>　${matchinfo.gameDay} / ${matchinfo.gameTime}
     	 	</div>
     	 	<div class="etc">
     	 		<iconify-icon icon="mdi:map-marker-radius" style="color: #26a563;" width="27" height="27"></iconify-icon>　${matchinfo.fieldName} ${matchinfo.fieldAddress}
     	 	</div>
     	 	<div class="etc">
     	 		<iconify-icon icon="fa-solid:won-sign" style="color: #26a563;" width="27" height="27"></iconify-icon>　20000 / 인당
     	 		<!-- <script type="text/javascript">
     	 			if(${matchinfo.gameMacth} == '5vs5'){
     	 				document.getElementById("pay").innerText = "20000";
     	 			}else if (${matchinfo.gameMacth} == '6vs6') {
     	 				document.getElementById("pay").innerText = "20000";
     	 			}
     	 		</script> -->
     	 	</div>
     	 </div>
      	
      	
     	 
     	 
     	 </div>
     	 
     	<div class="match_right">
      		<div class="content_count">
            <h3 class="match_info">매치포인트</h3>
         </div>
     	 
     	 <div class="match_content" id="match_content">
     	 	<div class="etc">
     	 		<iconify-icon class="icon_size" icon="icon-park-twotone:level" style="color: #26a563;" width="27" height="27"></iconify-icon>　${matchinfo.level}
     	 	</div>
     	 	<div class="etc">
     	 		<iconify-icon class="icon_size" icon="ic:sharp-transgender" style="color: #26a653;" width="27" height="27"></iconify-icon>　${matchinfo.gameGender}
     	 	</div>
     	 	<div class="etc">
     	 		<iconify-icon class="icon_size" icon="mdi:soccer-field" style="color: #26a653;" width="27" height="27"></iconify-icon>　${matchinfo.gameMacth}
     	 	</div>
     	 	<div class="etc">
     	 		<iconify-icon class="icon_size" icon="emojione:person-running" width="27" height="27" flip="horizontal"></iconify-icon><p id="pnum"></p>
     	 		<script type="text/javascript">
     	 			if('${matchinfo.gameMacth}'=='5vs5'){
     	 				document.getElementById("pnum").innerText = "　팀당 5 명";
     	 			}else{
     	 				document.getElementById("pnum").innerText = "　팀당 6 명";
     	 			}
     	 		</script>
     	 	</div>
     	 	<div class="etc">
     	 		<iconify-icon class="icon_size" icon="icon-park-twotone:spikedshoes" style="color: #26a653;" width="27" height="27"></iconify-icon>　풋살화/운동화
     	 	</div>
     	 </div>
     	</div>
     	 
     	 
     </div>

      <!-- 신청자 목록 -->
      <div class="list_container">
      	<div class="content_count">
            <h3 class="list_info">신청현황</h3>
         </div>
         
         <div class="list_content" id="list_content">
        	
        </div>
      </div>
      
      <!--구장 사진 / 정보  / 신청자 목록 가져오기  -->
            <script type="text/javascript">
            	var list = [];
            	let cntmem = 0;
            	let genum = 0;
	            window.onload = function(e) {
	        	      let data = {fieldCode : ${matchinfo.fieldCode}};
	        	      
	        	      fetch("${pageContext.request.contextPath}/team/fieldinfo",{
	        	         method : "POST", // PUT, PATCH, DELETE
	        	         headers : {
	        	            "Content-Type" : "application/json"},
	        	         body : JSON.stringify(data)
	        	      }).then(response => response.json()) 
	        	      
	        	      .then(data => {
	        	    	  if(data.fieldImg1 != null){
	            	    		 var nimg1 = document.createElement("img");
	            	    	     nimg1.src = data.fieldImg1
	            	    	     nimg1.className = "field_image img1";
	            	    	     document.getElementById("field_img_area").append(nimg1);
	            	    	     var bimg1 = document.createElement("img");
	            	    	     bimg1.src = data.fieldImg1
	            	    	     bimg1.className = "banner_image img1";
	            	    	     document.getElementById("picture_area").append(bimg1);
	            	    	}
	            	    	if(data.fieldImg2 != null){
	            	    		 var nimg2 = document.createElement("img");
	            	    	     nimg2.src = data.fieldImg2
	            	    	     nimg2.className = "field_image img2";
	            	    	     document.getElementById("field_img_area").append(nimg2);
	            	    	     var bimg2 = document.createElement("img");
	            	    	     bimg2.src = data.fieldImg2
	            	    	     bimg2.className = "banner_image img2";
	            	    	     document.getElementById("picture_area").append(bimg2);
	            	    	}
	            	    	if(data.fieldImg3 != null){
	            	    		 var nimg3 = document.createElement("img");
	            	    	     nimg3.src = data.fieldImg3
	            	    	     nimg3.className = "field_image img3";
	            	    	     document.getElementById("field_img_area").append(nimg3);
	            	    	     var bimg3 = document.createElement("img");
	            	    	     bimg3.src = data.fieldImg3
	            	    	     bimg3.className = "banner_image img3";
	            	    	     document.getElementById("picture_area").append(bimg3);
	            	    	}
	            	    	if(data.fieldImg4 != null){
	            	    		 var nimg4 = document.createElement("img");
	            	    	     nimg4.src = data.fieldImg4
	            	    	     nimg4.className = "field_image img4";
	            	    	     document.getElementById("field_img_area").append(nimg4);
	            	    	     var bimg4 = document.createElement("img");
	            	    	     bimg4.src = data.fieldImg4
	            	    	     bimg4.className = "banner_image img4";
	            	    	     document.getElementById("picture_area").append(bimg4);
	            	    	}
	            	    	if(data.fieldImg5 != null){
	            	    		 var nimg5 = document.createElement("img");
	            	    	     nimg5.src = data.fieldImg5
	            	    	     nimg5.className = "field_image img5";
	            	    	     document.getElementById("field_img_area").append(nimg5);
	            	    	     var bimg1 = document.createElement("img");
	            	    	     bimg5.src = data.fieldImg5
	            	    	     bimg5.className = "banner_image img5";
	            	    	     document.getElementById("picture_area").append(bimg5);
	            	    	}
	            	    	
	            	    	document.getElementById("content_field_info").innerText = data.fieldSize + " / " + data.fieldInOut + " / " + data.fieldGrass;
	        	         
	        	      }).catch(error => {
	        	         console.log("error");
	        	      });
	        	      
	        	      
	        	      /* 신청자 목록 */
	        	      
	        	      
	        	      let data3 = {gameCode:${matchinfo.gameCode}};
	        			 
	        	      fetch("${pageContext.request.contextPath}/team/joinlist",{
	        	         method : "POST", // PUT, PATCH, DELETE
	        	         headers : {
	        	            "Content-Type" : "application/json"},
	        	         body : JSON.stringify(data3)
	        	      }).then(response => response.json()) 
	        	      
	        	      .then(data3 => {
	        	         for ( let name in data3) {
	        	        	 list.push(data3[name]);
	        	        	 const divlist = document.createElement("div");
	        	        	 divlist.className = "teamdiv";
	        	        	 
	        	        	 
	        	        	 let data4 = {team_code:data3[name]}
	        	        	 
	        	        	   fetch("${pageContext.request.contextPath}/team/joininfo",{
	        	      	         method : "POST", // PUT, PATCH, DELETE
	        	      	         headers : {
	        	      	            "Content-Type" : "application/json"},
	        	      	         body : JSON.stringify(data4)
	        	      	      }).then(response => response.json()) 
	        	      	      .then(data4 => {  
	        	      	    	  
	        	      	    	var divg = document.createElement("div");
	        	      	         for ( let name2 in data4) {
	        	      	        	const divinlist = document.createElement("div");
	        	      	        	divinlist.className = "memberdiv";
	        	      	        	
	        	      	        	var divn = document.createElement("div");
	    	  	      	        	divn.innerHTML = "<iconify-icon icon='ic:twotone-drive-file-rename-outline' style='color: #26a563;' width='27' height='27'></iconify-icon>"+ "　" +data4[name2].userName;
	    	  	      	        	divn.className = "listno";
	    	  	      	        	
	    	  	      	        	var divd = document.createElement("div");
	    	  	      	        	divd.innerHTML = "<iconify-icon class='icon_size' icon='ic:sharp-transgender' style='color: #26a653;' width='27' height='27'></iconify-icon>" + "　" + data4[name2].userGender;
	    	  	      	        	divd.className = "listno";
	    	  	      	        	
	    	  	      	        	/* var divg = document.createElement("div"); */
	    	  	      	        	divg.innerHTML = "<iconify-icon icon='material-symbols:groups' style='color: #26a653;' width='40' height='40'></iconify-icon>" +"　" + data4[name2].userGroup;
	    	  	      	        	divg.className = "list_team";
	    	  	      	        	
	    	  	      	        	var divv = document.createElement("div");
	    	  	      	        	divv.innerHTML ="<iconify-icon icon='fluent-emoji-flat:trophy' width='27' height='27'></iconify-icon>"+ "　　" + data4[name2].userVr;
	    	  	      	        	divv.className = "listno";
	    	  	      	        	
	    	  	      	        	var divl = document.createElement("div");
	    	  	      	        	divl.innerHTML = "<iconify-icon class='icon_size' icon='icon-park-twotone:level' style='color: #26a563;' width='27' height='27'></iconify-icon>" + "　" + data4[name2].userLevel;
	    	  	      	        	divl.className = "listno";
	        	      	        	
	        	      	        
	        	      	        	divinlist.append(divn);
	        	      	        	divinlist.append(divd);
	        	      	        	/* divinlist.append(divg); */
	        	      	        	divinlist.append(divv);
	        	      	        	divinlist.append(divl);
	        	      	        	
	        	      	        	divlist.append(divinlist);
	        	      	        	
	        	      	        	
	        	      	         }
	        	      	       divlist.prepend(divg);
	        	      	         
	        	      	      }).catch(error => {
	        	      	         console.log("error");
	        	      	      });
	        	        	 
	        	        	 document.getElementById("list_content").append(divlist);
	        	        	 
	        	         }
	        	         
	        	      }).catch(error => {
	        	         console.log("error");
	        	      });
	        	      
	        	      /* 팀원수 */
	        	      if(<%=td%> != -1) {
	        	    	  let teamcode = {teamCode :<%=td%>};
	        	    	  fetch("${pageContext.request.contextPath}/team/cntmebr",{
	    	  	      	         method : "POST", // PUT, PATCH, DELETE
	    	  	      	         headers : {
	    	  	      	            "Content-Type" : "application/json"},
	    	  	      	         body : JSON.stringify(teamcode)
	    	  	      	      }).then(response => response.json()) 
	    	  	      	      .then(teamcode => {  
	    	  	      	    	cntmem = teamcode;
	    	  	      	    	console.log(cntmem);
	    	  	      	         
	    	  	      	      }).catch(error => {
	    	  	      	         console.log("error");
	    	  	      	      });
	        	    	  
	        	      }
	        	      
	        	      /* 팀원 성별 */
	        	      let teamcode2 = {teamCode :<%=td%>};
        	    	  fetch("${pageContext.request.contextPath}/team/selectgen",{
    	  	      	         method : "POST", // PUT, PATCH, DELETE
    	  	      	         headers : {
    	  	      	            "Content-Type" : "application/json"},
    	  	      	         body : JSON.stringify(teamcode2)
    	  	      	      }).then(response => response.json()) 
    	  	      	      .then(teamcode2 => {  
    	  	      	    	genum = teamcode2;
    	  	      	    	console.log(genum);
    	  	      	      }).catch(error => {
    	  	      	         console.log("error");
    	  	      	      });
	        	      
	            	
	            }
           	</script>
      
      <!-- 매치 진행 및 취소 규정-->
      <div class="rule_container">
      	<div class="rule_title">
            <h3>매치 진행 및 취소 규정</h3>
         </div>
         
         <div class="rule_div">
         	<h4 class="rule_name">매치 규칙</h4>
         		<ul>
         			<li>모든 파울은 사이드라인에서 킥인</li>
         			<li>골키퍼에게 백패스 가능, 손으로는 잡으면 안돼요</li>
         			<li>사람을 향한 태클 금지</li>
         		</ul>
         </div>
         
         <div class="rule_div">
         	<h4 class="rule_name">진행 방식</h4>
         		<ul>
         			<li>풋살화와 개인 음료만 준비하세요</li>
         			<li>매니저가 경기 진행을 도와드려요</li>
         			<li>골키퍼와 휴식을 공평하세 돌아가면서 해요</li>
         			<li>레벨 데이터를 기준으로 팀을 나눠요</li>
         			<li>친구끼리 와도 팀 실력이 맞이 않으면 다른 팀이 될 수 있어요</li>
         		</ul>
         </div>
         <div class="rule_div">
         	<h4 class="rule_name">알아두면 좋아요</h4>
         		<ul>
         			<li>서로 존중하고 격려하며 함께 즐겨요</li>
         			<li>플랩 평균 레벨은 실버2에요</li>
         			<li>플랩에서는 하루 평균 180경기가 진행되고 있어요</li>
         			<li>매일 3,000여명이 팀 없이도 풋살을 즐기고 있어요</li>
         		</ul>
         </div>
         <div class="rule_div">
         	<h4 class="rule_name">일반취소 규정</h4>
         		<ul>
         			<li>매치 시작 1시간 30분 전까지 최소 인원(10명) 미달 시 매치가 취소 됩니다. 취소 시 카카오톡을 통해 안내드리며 캐시는 전액 환급됩니다.</li>
         		</ul>
         </div>
         <div class="rule_div">
         	<h4 class="rule_name">특수 취소 규정(우천)</h4>
         		<ul>
         			<li>당일 예보 변동이 심해, 실시간으로 예보를 확인하고 매치 시작 4시간 전까지 강수 안내 알림톡을 발송합니다.</li>
         			<li>강수 안내 알림톡을 받고, 매치 시작 1시간 30분 전까지 취소하면 전액 환불합니다.</li>
         			<li>매치 시작 1시간 30분 내에 취소하거나 무단 불참하면 이용이 제한될 수 있습니다.</li>
         			<li>취소자가 다수 발생하거나, 구장 상태 악화로 진행이 어렵다면 매치 시작 1시간 30분 이내라도 즉시 취소 안내를 드립니다.</li>
         			<li>강한 비(눈)로 매치를 취소 또는 중단할 경우, 남은 시간 만큼 캐시로 환산해 돌려 드립니다.</li>
         		</ul>
         </div>
         
      </div>
      
      <!-- 공지사항 -->
      <div class="notice_container">
         <div class="notice_title">
            <h3>공지사항</h3>
         </div>
         
         <div class="notice_content">
            <h4>
               <iconify-icon class="icon_notice" icon="ion:information-circle-outline"></iconify-icon>
               　안내 사항
            </h4>
            <ul>
               <li class="notice">흡연 : 지정구역 외에 흡연시 과태료 부과 </li>
               <li class="notice">주차관련 : 사전 주차 등록시 20대 3시간 무료 (매니저에게 주차번호 전달 필요)</li>
               <li class="notice">물/음료 : 자판기에서 구매가능. 정수기 여부X</li>
               <li class="notice">풋살화 대여 : 비오는날 제외, 대여 가능</li>
               <li class="notice">공 대여 : 대여 가능</li>
               <li class="notice">조끼 대여 : 대여 가능</li>
            </ul>
            
         </div>
      </div>
      
      <!-- 환불정책 -->
      <div class="refund_container">
         <div class="refund_title">
            <h3>환불 정책</h3>
         </div>
         
         <h4>신청 취소 시 환불 기준</h4>
          <table class="refund_table" border="1">
        <tbody>
            <tr>
                <td>매치 2일 전</td>
                <td>무료 취소</td>
                
            </tr>
            <tr>
                <td>매치 1일 전</td>
                <td>80% 환급</td>
            </tr>
            <tr>
                <td>매치 시작 90분 전까지</td>
                <td>20% 환급</td>
            </tr>
            <tr>
                <td>매치 시작 90분 이내</td>
                <td>취소 불가</td>
            </tr>
        </tbody>
    </table>
         
      	
      </div>
      
      <div class="rv_btn_area">
         <div class="rv_btn_content">
            <button class="rv_btn">
               신청하기
            </button>
         </div>
      </div>

	  <!--로고버튼  -->
      <script type="text/javascript">
         let main_logo = document.querySelector(".main_logo");

         main_logo.addEventListener("click", function () {
            location.href = "${pageContext.request.contextPath}";
         });
      </script>
      
       <!--플로트 신청하기 버튼  -->
      <script type="text/javascript">
      let rv_btn = document.querySelector(".rv_btn");
      if('${matchinfo.close}' == 'false') {
    	  rv_btn.disabled = true;
    	  rv_btn.innerText = "마감된경기";
    	  rv_btn.style.backgroundColor="rgb(190 191 193)";
    	  rv_btn.style.color = "rgb(241 247 255)";
    	  rv_btn.style.borderColor = "rgb(190 191 193)";
  		}
	      var aa = ${matchinfo.gameMaxp} - ${matchinfo.gamePnum};
	      var lev = '${matchinfo.level}';
	      var level = lev.substring(0,lev.length-1);
	      
	      let gamema = '${matchinfo.gameMacth}';
	      var gamecnt = gamema.substr(0, 1);
	      
	      rv_btn.addEventListener("click",function() {
	    	var cnt = 0;
			for(var i=0; i<list.length; i++){
				if(list[i] == '<%=td%>'){
					cnt++;
				}
			}
			
			let gtime = ${matchinfo.gameTime};
	  		let ntime = 0;
	  		if('<%=hour%>' < 10 ){
	  			ntime = "0" + <%=hour%>;
	  		}else {
	  			ntime = <%=hour%>;
	  		}
	  		
	  		if( ntime >= gtime){
	  			alert("지난 경기는 신청 할 수 없습니다");
	  		}else{
	  			if('<%=td%>' == 0) {
					alert("소속된 팀이 없으면 신청 할 수 없습니다.");
				}else {
					if('<%=ugen%>' == '무'){
						location.href = "${pageContext.request.contextPath}/team/tsubgame?num="+${matchinfo.gameCode}
					}
					else if('<%=ugen%>' == '${matchinfo.gameGender}' && genum == 1){
						if(cntmem != gamecnt){
							alert("이 게임은" + '${matchinfo.gameMacth}' + "매치로 인원 수가 맞지 않아 신청 할 수 없습니다");
						}else{
							if(cnt > 0) {
								alert("이미 신청한 경기 입니다.");
							}else{
								location.href = "${pageContext.request.contextPath}/team/tsubgame?num="+${matchinfo.gameCode}
							}
						}
					}else if('${matchinfo.gameGender}' == '혼성' && genum == 2){
						if(cntmem != gamecnt){
							alert("이 게임은" + '${matchinfo.gameMacth}' + "매치로 인원 수가 맞지 않아 신청 할 수 없습니다");
						}else{
							if(cnt > 0) {
								alert("이미 신청한 경기 입니다.");
							}else{
								location.href = "${pageContext.request.contextPath}/team/tsubgame?num="+${matchinfo.gameCode}
							}
						}
					}else{
						alert("이 게임은" + '${matchinfo.gameGender}' + "매치 게임으로 신청 할 수 없습니다");
					}
					
				}
	  		}
			
      });
      </script>

      
      
      
    <!--지도 보기  -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65331bb5f71196e87528297b0af9ceb4&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {

                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 2 // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${matchinfo.fieldAddress}', function (result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${matchinfo.fieldName}</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });   
    </script>
    
    <!--지도 버튼  -->
    <script type="text/javascript">
    	let mapbtn = document.getElementById("mapbtn");
    	
    	mapbtn.addEventListener("click", function () {
        	let banner_area = document.querySelector(".banner_content");
        	
            const map_picture = document.querySelector(".map_picture");
            map_picture.classList.toggle("map_toggle");
			
            mapbtn.classList.toggle("change_text");
            if(mapbtn.classList.contains("change_text")){
            	mapbtn.innerText="지도 닫기";
            }else {
            	mapbtn.innerText="지도 보기";
            }
        });
    </script>
   </div>
</body>

</html>