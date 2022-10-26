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
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Zilla+Slab&display=swap"
          rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/frame/shop/header.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/frame/main/footer.css">
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <style>
          * {
            margin: 0 auto;
            padding: 0 auto;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
          }

          body {
            background-color: white;
          }

          html,
          body,
          header,
          main,
          footer,
          section,
          h1,
          h2,
          h3,
          h4,
          h5,
          h6,
          p,
          a,
          ul,
          li,
          nav {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
          }

          body {
            height: 100vh;
          }

          nav div {
            width: 100%;
            height: 100%;
          }



          /*메인*/
          main {
            display: flex;
            width: 90%;
            align-items: center;
            justify-content: center;
          }

          #art1 {
            display: flex;
            width: 60%;
            height: 50px;
            background-color: #7F7F7F;
            justify-content: center;
            align-items: center;
            color: white;

          }

          #art2 {
            width: 60%;
            height: 350px;
            border-bottom: 1px solid black;
          }

          #art2>label {
            margin: auto;
          }

          #art3 {
            width: 60%;
            height: 250px;
            border-bottom: 1px solid black;

          }

          #art4 {
            width: 60%;
            height: 270px;
            border-bottom: 1px solid black;
          }

          #art5 {
            width: 60%;
            height: 220px;
            border-bottom: 1px solid black;
          }

          #art6 {
            width: 60%;
            height: 80px;
            border-bottom: 1px solid black;
          }

          #art7 {
            width: 60%;
            height: 180px;

          }

          #art4-img {
            display: flex;
            width: 20%;
            float: left;
            height: 140px;
            margin: 15px 20px;

          }

          #art4-text {
            width: 60%;
            margin: 15px 30px;
            display: inline;
          }

          #art4-text>p {
            font-size: 0.8rem;
            margin-top: 5px;
          }

          #address-div2 {
            display: none;
          }


          #info2,
          #info3,
          #info4,
          #info5,
          #info6 {
            display: block;
            width: 90%;
            height: 35px;
            margin: 10px;
            margin-left: 20px;
            color: black;
            border-bottom: 1px solid #7F7F7F;

          }

          #info7 {
            display: block;
            width: 90%;
            height: 110px;
            margin: 10px;
            margin-left: 20px;
            color: black;
          }



          #info7>h3 {
            line-height: 35px;
          }

          #art5-box {
            display: flex;
            height: 120px;
          }

          #art5-left {
            display: flex;
          }

          #art5-right {
            display: flex;

          }

          #left-ul {
            width: 46%;
            line-height: 2rem;
          }

          #right-ul {
            float: right;
            width: 50%;
            line-height: 2rem;
          }

          #total-h4 {
            display: inline-block;
            padding-left: 130px;
          }

          #total-h5 {
            float: right;
            padding-right: 200px;
          }

          #pay-box {
            width: 90%;
          }


          select.box {
            width: 15%;
            height: 23px;
            box-sizing: border-box;
            margin-top: 2px;
            margin-left: 2px;
            border-radius: 4px;
            border: 1px solid #d9d6d6;
            color: #383838;
            background-color: #ffffff;

          }


          option {
            font-size: 16px;
          }

          label {
            width: 50%;
            margin-left: 25px;
          }

          .addr-box {
            width: 50%;
            margin-left: 100px;
            margin-top: 10px;
          }

          .addr-addr {
            margin-left: 25px;
          }

          .info-p {
            font-size: 0.7rem;
            color: #383838;
            margin-left: 100px;
            margin-top: 5px;
          }

          #info-btn,
          #info-btn2 {
            margin-top: 8px;
            margin-left: 100px;
          }

          #last-btn {
            display: flex;
            width: 90%;
            align-items: center;
            justify-content: center;
            height: 40px;
            background-color: gray;
            border: gray;
          }


          #last-btn:hover {
            cursor: pointer;
          }
        </style>
      </head>

      <body>


        <button id="last-btn" onclick="requestPay()">결제하기</button>


        </script>

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