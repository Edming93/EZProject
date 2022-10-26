<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <script src="https://kit.fontawesome.com/4b992414b9.js" crossorigin="anonymous"></script>
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Zilla+Slab&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/frame/shop/header.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/frame/main/footer.css">
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
   <style>
      * {
         margin: 0 auto;
         padding: 0 auto;
         box-sizing: border-box;
         font-family: 'Noto Sans KR', sans-serif;
      }

      body {
         background-color: white;
         height: 100vh;
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

      .container {
         width: 100%;
         margin: 0 auto;
         display: grid;
         grid-template-columns: 23% 54% 23%;
         grid-template-rows: 65px 400px 1fr;
         gap: 5px 5px;
         grid-auto-flow: row;
         grid-template-areas: ". header ."
            ". rv_info ."
            ". pay_info  ."
      }

      .rv_info_container {
         grid-area: rv_info;
         margin-top: 20px;
         width: 100%;
         display: grid;
         grid-template-columns: 1fr 1fr;
         grid-template-rows: 1fr 1fr;
         grid-template-areas: ". ."
            "re_info field_info";
         background: #343434;
         background-size: 111% 100%;
         color: #dbdbdb;
         background-image: url("./image/football-488714_960_720_1.png");
      }

      .payment_container {
         grid-area: pay_select;

      }

      .rv_day {
         grid-area: re_info;
         width: 100%;
         display: flex;
         flex-direction: column;
         justify-content: flex-end;
         align-items: start;
         padding: 30px;
      }

      .rv_day h3 {
         margin: 0px;
         font-size: 25px;
      }

      .rv_day h4,
      .rv_time h4 {
         color: #A9A9A9;
         font-size: 18px;
         font-weight: 100;
      }

      .rv_time {
         grid-area: field_info;
         width: 100%;
         height: 100%;
         display: flex;
         flex-direction: column;
         justify-content: flex-end;
         align-items: end;
         padding: 30px;
      }

      .rv_time h3,
      h4 {
         margin: 0px;
      }

      .rv_time h3 {
         font-size: 22px;
         margin-bottom: 15px;
      }

      .rv_info_content h2 {
         margin-bottom: 15px;
      }

      .rv_info_content h3 {
         margin-bottom: 10px;

      }

      .alarm_icon {
         font-size: 21px;
      }


      .reservation_container {
         grid-area: pay_info;
         width:100%;
         display: flex;
         margin-top: 10px;
         
      }

      .rv_info_area {
         width:50%;
         padding:20px;


      }
      .rv_info_content {
         margin-top:25px;
         box-sizing: border-box;
         width: 100%;
         height: 50px;
         left: 220px;
         top: 429px;
         border:3px solid transparent;
         border-radius: 10px;
         background-image: linear-gradient(#fff, #fff), linear-gradient(to right, #26A653 0%, #5EDB8A 50%, #0071C3 100%);
         background-origin: border-box;
         background-clip: content-box,border-box;

         display: flex;
         justify-content: space-around;
         align-items: center;
      }

      .pay_info_area {
         width:50%;
         padding:20px;
      }
      .rv_info_title {
         display: flex;
         margin-bottom: 20px;
         font-size: 20px;
         font-weight: bold;
         
         
      }


      




      .payment_container {
         margin-top: 20px;
      }

      #payment_btn {
         display: flex;
         width: 90%;
         align-items: center;
         justify-content: center;
         height: 40px;
         background-color: gray;
         border: gray;
         cursor: pointer;
      }

      .notice_container {
         margin-top:20px;
         width: 100%;
         
      }

      .notice_area {
         margin-bottom: 20px;
         
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

      <div class="rv_info_container">
         <div class="rv_day">
            <h3>
               <iconify-icon class="alarm_icon" icon="grommet-icons:alarm"></iconify-icon> 예약 정보
            </h3>
            <h4>10/26 수</h4>
            <h4>PM06:00 ~ PM08:00</h4>
         </div>
         <div class="rv_time">
            <h3 class="field_name">이정욱 경기장</h3>
            <h4>강원도 강릉시 종합운동장길 69</h4>
         </div>
      </div>

      <div class="reservation_container">
         <div class="rv_info_area">
            <h3 class="rv_info_title">예약 정보</h3>
            <div class="rv_info_content">
               <div>
                  <span class="rv_type">매치 종류</span>
                  <span class="rv_type_result">6v6 매치</span>
               </div>
               <div>
                  <span class="rv_level">레벨</span>
                  <span class="rv_level_result">Lv.브론즈3</span>
               </div>
            </div>

            <div class="notice_container">
               <div class="notice_area">
                  <span class="rv_info_title">유의사항</span>
                  <span>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi molestias harum id? Perferendis sint sit, soluta laudantium saepe quae nesciunt molestiae, harum quisquam et ipsam animi laborum facilis! Distinctio, sint!</span>
               </div>
               <div class="notice_area">
                  <span class="rv_info_title">코로나19</span>
                  <span>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum dolor accusantium enim, quas quis asperiores quibusdam, tempora provident libero minima praesentium, dignissimos hic ratione sint nisi illo! Dolorem, iusto illo.</span>
               </div>
      
            </div>
         </div>

         <div class="pay_info_area">
            <h3 class="rv_info_title">결제</h3>
            <div class="pay_info_content">
               <div>
                  <span class="pay_title">이용금액</span>
                  <span class="pay">10,000원</span>
               </div>
               <hr>
               <div>
                  <span class="pay_title total_pay">총 금액</span>
                  <span class="pay">10,000원</span>
               </div>
               
               <div class="payment_container">
                  <button id="payment_btn" onclick="requestPay()">결제하기</button>
               </div>
               
            </div>
         </div>

      </div>
      


   
   </div>






   <script>
      var IMP = window.IMP; // 생략가능
      IMP.init('imp44418126'); // <-- 본인 가맹점 식별코드 삽입
      function requestPay() {
         IMP.init('iamport'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
         IMP.request_pay({
            pg: "inicis",
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '비싼거',
            amount: '5000',
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456'
         }, function (rsp) { // callback
            if (rsp.success) {

            } else {

            }
         });
      }
   </script>
</body>

</html>