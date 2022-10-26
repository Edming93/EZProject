<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
         grid-template-rows: 65px 448px 85px 88px 1fr 1fr ;
         gap: 5px 5px;
         grid-auto-flow: row;
         grid-template-areas: ". header btn" 
                              ". banner ." 
                              ". title  ."
                              ". menu ."
                              ". content ."
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

      .ez_icon {
         width: 65px;
         height: 35px;
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
         color: rgb(0, 60, 255);
         text-decoration: none;
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
/*       .field_plant { */
/*       	 font-weight : bold; */
/*       	 border-bottom: 3px solid #798777; */
/*       } */
      
      .content_container {
         grid-area:content;
         display: flex;
         flex-direction: column;
    	 padding: 0px 20px;
    	 padding-bottom: 35px;
    	 padding-top: 50px;
    	 
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
         width:50%;
         flex-direction: column;
      }

      .content_count {
         width: 100%;
         margin: 15px 0px;
         display: flex;
         justify-content: space-between;
      }

      .field_info {
         width:50%;
      }
      .plant_info {
         width:45%;
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
         width: 45%;
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
         width: 240px;
         height: 70px;
         background-color: #e8f2ff;
         color: rgb(26, 124, 255);
         border: 1px solid rgb(100 166 255);
         border-radius: 45px;
         font-weight: bold;
         font-size: 22px;
         cursor: pointer;
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

               <img class="banner_image img1" src="${field.fieldImg1}" alt="">
               <img class="banner_image img2" src="${field.fieldImg2}" alt="">
               <img class="banner_image img3" src="${field.fieldImg3}" alt="">
               <img class="banner_image img4" src="${field.fieldImg4}" alt="">
               <img class="banner_image img5" src="${field.fieldImg5}" alt="">
            </div>
         </div>
      </div>
      <div class="field_container">
         <div class="field_content_area">
            <h3 class="field_name">${field.fieldName}</h3>
            <div class="field_address">${field.fieldAddress}
               <a class="address_copy" href="#" onclick="clip(); return false;">주소 복사</a></span>
               <span class="open_map">지도 보기</span>
            </div>
         </div>
      </div>

      <script type="text/javascript">

         function clip(){
         
            var url = '';
            var textarea = document.createElement("textarea");
            document.body.appendChild(textarea);
            url = '${field.fieldAddress}';
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
               <div class="field_img_area">
                  <c:if test="${field.fieldImg1 != null}">
                     <img class="field_image img1" src="${field.fieldImg1}" alt="">
                 </c:if>
                 <c:if test="${field.fieldImg2 != null}">
                     <img class="field_image img2" src="${field.fieldImg2}" alt="">
                 </c:if>
                 <c:if test="${field.fieldImg3 != null}">
                     <img class="field_image img3" src="${field.fieldImg3}" alt="">
                 </c:if>
                 <c:if test="${field.fieldImg4 != null}">
                     <img class="field_image img4" src="${field.fieldImg4}" alt="">
                 </c:if>
                 <c:if test="${field.fieldImg5 != null}">
                     <img class="field_image img5" src="${field.fieldImg5}" alt="">
                 </c:if>
               </div>
                  <div class="content_field_name">A구장</div>
                  <div class="content_field_info">${field.fieldSize} / ${field.fieldInOut} / ${field.fieldGrass}</div>
            </div>

            <div class="field_etc_area">
               <div class="etc"><iconify-icon class="icon_size" icon="icon-park:spikedshoes"></iconify-icon>　풋살화 대여</div>
               <div class="etc"><iconify-icon class="icon_size" icon="icon-park:basketball-clothes"></iconify-icon>　운동복 대여</div>
               <div class="etc"><iconify-icon class="icon_size" icon="ant-design:car-outlined"></iconify-icon>　주차</div>
               <!-- <iconify-icon icon="icon-park-outline:basketball-clothes"></iconify-icon> -->
               <div class="etc etc_stroke"><iconify-icon class="icon_size" icon="akar-icons:water"></iconify-icon>　<s>정수기</s></div>
               <div class="etc"><iconify-icon class="icon_size" icon="cil:toilet"></iconify-icon>　화장실</div>
               <div class="etc"><iconify-icon class="icon_size" icon="material-symbols:smoking-rooms-rounded"></iconify-icon>　흡연실</div>
               <div class="etc etc_stroke"><iconify-icon class="icon_size" icon="majesticons:bath-shower-line"></iconify-icon>　<s>샤워실</s></div>
            </div>
         </div>

      </div>


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
      
      <div class="rv_btn_area">
         <div class="rv_btn_content">
            <button class="rv_btn">
               예약하기
            </button>
         </div>
      </div>


      <script type="text/javascript">
         let main_logo = document.querySelector(".main_logo");

         main_logo.addEventListener("click", function () {
            location.href = "${pageContext.request.contextPath}";
         });
         
         
         let rv_btn = document.querySelector(".rv_btn");
         
         rv_btn.addEventListener("click",function() {
             location.href = "${pageContext.request.contextPath}/rental/rentalPayment?fieldCode="+${field.fieldCode};
         })
      </script>
   </div>
</body>

</html>