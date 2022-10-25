<%-- <%@page import="javax.websocket.Session"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%
   LocalDate now = LocalDate.now();
   int year = now.getYear();
   int today = now.getDayOfMonth();
   int month = now.getMonthValue();
   String we = now.getDayOfWeek().toString();
   
   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    
    int fday = cal.getMinimum(Calendar.DAY_OF_MONTH);
    int eday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       #out{
          margin: 0 auto;
          width: 1024px;
       }
       #out * {
            margin: 10px;
            border: 1px solid black;
            box-sizing: border-box;
        }

        #date {
            display: flex;
        }

        #datelist {
            display: flex;
        }

        #datelist button {
            width: 35px;
            background:none;
        }

        #div1{
            width: 850px;
        }

        #day {
            list-style: none;
            margin: 0;
            padding: 0;
            white-space: nowrap;
            overflow-x: scroll;

        }
        #day::-webkit-scrollbar {
            display: none;
        } 
        #day li {
            display: inline-block;
            width: 115px;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        #settingbutton{
           flex: 1;
           display: flex;
           border: 1px solid black;
           position : relative;
       }
       
       .matchgame{
          display: flex;
          color: black;
          text-decoration: none;
       }
       .game_time{
          flex: 1;
       }
       .mid_div{
          flex: 8;
       }
       .close{
          flex: 1;
       }
       .info_div{
          display: flex;
       }
       .day_box {
          background-color: rgb(7, 104, 231);
       }
       
       .rental_area {
          display:flex;
       }
       .time {
          display : inline-block;
          width:140px;
          height:50px;
          display: flex;
          justify-content: center;
          align-items: center;
       }
       
       .rental_span_able {
          background-color: #F8EDE3;
       }
       .rental_span_disable {
          background-color: gray;
       }
       
       .game_name {
          display: inline-block;
       }
       
    
    </style>
</head>
<body>
<div id="out">
<section id="date">
        <div id="datelist">
            <button id="dpre"> ◀ </button>
                    <div id="div1">
                        <ul id="day">
                            <% for(int i=fday; i<=eday; i++) { %>
                                <li class="today <%=i%>" id="<%=i%>">
                                    <% out.print(i); %>
                                </li>
                                <%} %>
                        </ul>
                    </div>
             <button id="dnext"> ▶ </button>
        </div>
        <button id="btn"> 확인 </button>
</section>


<!--날짜데이터 삽입  -->
<script>
            let week = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY'];
            let num = week.indexOf("<%=we%>");
            let ct = <%=today%>% 7;

            for (var i = 0; i < document.getElementById("day").childElementCount; i++) {
                if ((i + 1) % 7 == ct) {
                    var newp = document.createElement("p");
                    newp.innerText = week[num];
                    document.getElementById("day").children[i].append(newp);
                } else if ((i + 1) % 7 == (ct + 1)) {
                    var newp = document.createElement("p");
                    if(num+1>=7){
                       newp.innerText = week[num + 1-7];
                    }else{
                       newp.innerText = week[num + 1];
                    }
                    document.getElementById("day").children[i].append(newp);
                }
                else if ((i + 1) % 7 == (ct + 2)) {
                    var newp = document.createElement("p");
                    if(num+2>=7){
                       newp.innerText = week[num + 2-7];
                    }else{
                       newp.innerText = week[num + 2];
                    }
                    document.getElementById("day").children[i].append(newp);
                }
                else if ((i + 1) % 7 == (ct + 3)) {
                    var newp = document.createElement("p");
                    if(num+3>=7){
                       newp.innerText = week[num + 3-7];
                    }else{
                       newp.innerText = week[num + 3];
                    }
                    document.getElementById("day").children[i].append(newp);
                }
                else if ((i + 1) % 7 == (ct + 4)) {
                    var newp = document.createElement("p");
                    if(num+4>=7){
                       newp.innerText = week[num + 4-7];
                    }else{
                       newp.innerText = week[num + 4];
                    }
                    document.getElementById("day").children[i].append(newp);
                }
                else if ((i + 1) % 7 == (ct + 5)) {
                    var newp = document.createElement("p");
                    if(num+5>=7){
                       newp.innerText = week[num + 5-7];
                    }else{
                       newp.innerText = week[num + 5];
                    }
                    document.getElementById("day").children[i].append(newp);
                }
                else if ((i + 1) % 7 == (ct + 6)) {
                    var newp = document.createElement("p");
                    if(num+6>=7){
                       newp.innerText = week[num + 6-7];
                    }else{
                       newp.innerText = week[num + 6];
                    }
                    document.getElementById("day").children[i].append(newp);
                } else if ((i + 1) % 7 == (ct - 6)) {
                    if (num < 6) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 6 + 7];
                        document.getElementById("day").children[i].append(newp);
                    } else {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 6];
                        document.getElementById("day").children[i].append(newp);
                    }
                }
                else if ((i + 1) % 7 == (ct - 5)) {
                    if (num < 5) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 5 + 7];
                        document.getElementById("day").children[i].append(newp);
                    } else {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 5];
                        document.getElementById("day").children[i].append(newp);
                    }
                }
                else if ((i + 1) % 7 == (ct - 4)) {
                    if (num < 4) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 4 + 7];
                        document.getElementById("day").children[i].append(newp);
                    } else {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 4];
                        document.getElementById("day").children[i].append(newp);
                    }
                }
                else if ((i + 1) % 7 == (ct - 3)) {
                    if (num < 3) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 3 + 7];
                        document.getElementById("day").children[i].append(newp);
                    } else {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 3];
                        document.getElementById("day").children[i].append(newp);
                    }
                }
                else if ((i + 1) % 7 == (ct - 2)) {
                    if (num < 2) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 2 + 7];
                        document.getElementById("day").children[i].append(newp);
                    } else {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 2];
                        document.getElementById("day").children[i].append(newp);
                    }

                }
                else if ((i + 1) % 7 == (ct - 1)) {
                    if (num < 1) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 1 + 7];
                        document.getElementById("day").children[i].append(newp);
                    } else {
                        var newp = document.createElement("p");
                        newp.innerText = week[num - 1];
                        document.getElementById("day").children[i].append(newp);
                    }
                }
            }
            
            document.getElementById("btn").addEventListener("click", function () {
                let pscrollleft = document.querySelector("#div1 ul").scrollLeft;

                let str = `
                scrollLeft : ${pscrollleft}
                `
                // alert(str);
                console.log(str);
                //여기 삭제해야댐~~~~
            });
            var set = <%=today%>

            document.querySelector("#div1 ul").scrollLeft = (set - 1) * 120.5;
            document.getElementById("dpre").addEventListener("click", function () {
                let pscrollleft1 = document.querySelector("#div1 ul").scrollLeft - 850;
                if (document.querySelector("#div1 ul").scrollLeft <= 0) {
                    document.querySelector("#div1 ul").scrollLeft = 0;
                } else {
                    document.querySelector("#div1 ul").scrollLeft = pscrollleft1;
                }

            });
            document.getElementById("dnext").addEventListener("click", function () {
                let pscrollleft1 = document.querySelector("#div1 ul").scrollLeft + 850;
                if (document.querySelector("#div1 ul").scrollLeft > 3045) {
                    document.querySelector("#div1 ul").scrollLeft = 3045;
                } else {
                    document.querySelector("#div1 ul").scrollLeft = pscrollleft1;
                }
            });
</script>
  
  <div id="settingbutton"> 
      <select name="" id="local">
         <option id="null" value="null">지역</option>
         <option id="서울" value="서울">서울</option>
         <option id="경기도" value="경기도">경기도</option>
         <option id="강원도" value="강원도">강원도</option>
         <option id="경상도" value="경상도">경상도</option>
         <option id="전라도" value="전라도">전라도</option>
         <option id="충청도" value="충청도">충청도</option>
         <option id="제주도" value="제주도">제주도</option>
      </select>

      <div>
         예약 가능 <input type="checkbox" name="" id="type_input">
      </div>
      
      <select name="" id="filed_size">
         <option id="null" value="null">크기</option>
         <option id="5vs5" value="5vs5">5vs5</option>
         <option id="6vs6" value="6vs6">6vs6</option>
      </select>
      
      
      <div>
            <div id="listreset">초기화</div>
      </div>
   
   </div>

   <div id="result">
    
   </div>
   

<script type="text/javascript">
<!-- 날짜 -->
let today = null;
let day_div = document.getElementById("day");
let today_li = document.querySelectorAll(".today");

   today_li.forEach(function(e) {
      e.addEventListener("click", function () {

      // 초기화 시키는 로직
      today_li.forEach(function(e) {
         e.style.backgroundColor="#fff";
      });
   
      e.style.backgroundColor="rgb(7, 104, 231)";

    let year_data = <%=year%>;
    let month_data = <%=month%>;
    let day_data = this.className.substring(6);
    
    if(day_data<10) {
       day_data = "0"+day_data;
    }
    
    let day = <%=year%> + "-" +<%=month%> +"-" + day_data;
    today = day;
    console.log("11111111 : "+today);
    
    let local_select = document.getElementById("local").value;
    let type_input = document.getElementById("type_input").checked;
    let filed_size = document.getElementById("filed_size").value;
    
    if(local_select == "null"){
       local_select = null;
    }

    if(filed_size == "null"){
       filed_size = null;
     }
    
    let data = {place:local_select,type:type_input,day:day,mver:filed_size};
    
    fetch("${pageContext.request.contextPath}/rental/rvList",{
       method : "POST", // PUT, PATCH, DELETE
       headers : {
          "Content-Type" : "application/json"},
       body : JSON.stringify(data)
    }).then(response => response.json())
    .then(list => {
        const result = document.getElementById("result");
        result.innerHTML = " ";
     
        var num = 0;
        
        
     for (let data of list) {
        num++;
         const content_area = document.createElement("div"); // 가장 바깥
         content_area.id = "filed" + num;
         const title_div = document.createElement("div"); // 구장명 표기
         const h3 = document.createElement("h3");
         h3.style.display = "inline-block"; // 추후에 클래스로 뺄것
         const match_type = document.createElement("span");
         h3.innerHTML = data.gameName;
         match_type.innerHTML = "크기 "+data.gameMacth;
         
         title_div.append(h3);
         title_div.append(match_type);
         content_area.append(title_div);
         result.append(content_area);

         const rental_area = document.createElement("div");
         rental_area.className = "rental_area";
      
     for(let i=8; i<=22; i=i+2){
        var timediv = document.createElement("div");
        timediv.id = "timediv" + i; 
        timediv.className = "time rental_span_able time"+i;
        timediv.innerHTML = i+":00 - "+(i+2)+":00";
        
        rental_area.append(timediv);
     }
        let data2 = {gameName:data.gameName,gameDay:day};
        var cnt = 1;
        
        fetch("${pageContext.request.contextPath}/rental/timeList",{
              method : "POST",
              headers : {
                 "Content-Type" : "application/json"},
              body : JSON.stringify(data2)
           }).then(response => response.json()) 
           .then(timeList => {

              var timeset = ["08","10","12","14","16","18","20","22"];
              
             for(let time of timeList){

                let time_div = document.getElementById("filed"+cnt);

                    if(data.gameType == 'S' || data.gameType == 'T'){
                       var index = timeset.indexOf((time.gameTime));
                         
                           time_div.firstElementChild.firstElementChild.innerText = time.gameName;
                           time_div.lastElementChild.children[index].className = "time rental_span_disable";
                           time_div.lastElementChild.children[index].innerHTML = parseInt(time.gameTime)+":00 - "+(parseInt(time.gameTime)+2)+":00";
                    }
              }
             cnt++;

         }).catch(error => {
                 console.log("2번째 패치 에러 : " + error);
        });
     
     content_area.append(rental_area);

     }
  }).catch(error => {
     console.log("무슨에러냐면! : " + error);
  });
   
    
   
});
   
});


<!--  처음 로딩시  -->
   let yeardata = <%=year%>;
   let monthdata = <%=month%>;
   let daydata = <%=today%>;
   let day = yeardata + "-" +monthdata +"-" +daydata;
   today = day;
   
   window.onload = function() {
        document.getElementById(daydata).style.backgroundColor="rgb(7, 104, 231)";
        
         let data = {place:"null" ,type:"null",day:day};
         
         fetch("${pageContext.request.contextPath}/rental/rvList",{
            method : "POST",
            headers : {
               "Content-Type" : "application/json"},
            body : JSON.stringify(data)
         }).then(response => response.json()) 
         .then(list => {
            const result = document.getElementById("result");
               result.innerHTML = " ";
            
            var num = 0;
            for (let data of list) {
               num++;
               const content_area = document.createElement("div"); // 가장 바깥
               content_area.id = "filed" + num;
               const title_div = document.createElement("div"); // 구장명 표기
               const h3 = document.createElement("h3");
               h3.style.display = "inline-block"; // 추후에 클래스로 뺄것
               const match_type = document.createElement("span");
               h3.innerHTML = data.gameName;
               match_type.innerHTML = "크기 "+data.gameMacth;
               
               title_div.append(h3);
               title_div.append(match_type);
               content_area.append(title_div);
               result.append(content_area);
   
               const rental_area = document.createElement("div");
               rental_area.className = "rental_area";
         
            for(let i=8; i<=22; i=i+2){
               var timediv = document.createElement("div");
               timediv.id = "timediv" + i; 
               timediv.className = "time rental_span_able time"+i;
               timediv.innerHTML = i+":00 - "+(i+2)+":00";
               
               rental_area.append(timediv);
            }
               let data2 = {gameName:data.gameName,gameDay:day};
               var cnt = 1;
               
               fetch("${pageContext.request.contextPath}/rental/timeList",{
                     method : "POST",
                     headers : {
                        "Content-Type" : "application/json"},
                     body : JSON.stringify(data2)
                  }).then(response => response.json()) 
                  .then(timeList => {
   
                     var timeset = ["08","10","12","14","16","18","20","22"];
                     
                    for(let time of timeList){

                       let time_div = document.getElementById("filed"+cnt);

                           if(data.gameType == 'S' || data.gameType == 'T'){
                              var index = timeset.indexOf((time.gameTime));
                                
                                  time_div.firstElementChild.firstElementChild.innerText = time.gameName;
                                  time_div.lastElementChild.children[index].className = "time rental_span_disable";
                                  time_div.lastElementChild.children[index].innerHTML = parseInt(time.gameTime)+":00 - "+(parseInt(time.gameTime)+2)+":00";
                           }
                     }
                    cnt++;

                }).catch(error => {
                        console.log("2번째 패치 에러 : " + error);
               });
            
            content_area.append(rental_area);

            }
         }).catch(error => {
            console.log("무슨에러냐면! : " + error);
         });
   };
   
   <!-- 지역 설정  -->
         var local_select = document.getElementById("local");
            
         local_select.addEventListener("change",function(){
      // 마감 여부 선택 돼있는지 체크가 돼있으면 트루 , 아니면 펄스
         let type_input = document.getElementById("type_input").checked;
         let filed_size = document.getElementById("filed_size").value;
          
         console.log("filed_size : "+filed_size);
          
         local_select = document.getElementById("local").value;
          
          if(local_select == "null"){
             local_select = null;
          }
          if(filed_size == "null"){
             filed_size = null;
           }
         
          console.log("day : "+day);
          console.log("today : "+today);
      
      let data = {place:local_select,type:type_input,day:today,mver:filed_size};
      
      fetch("${pageContext.request.contextPath}/rental/selectRental",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(list => {
          const result = document.getElementById("result");
          result.innerHTML = " ";
       
          var num = 0;
          
          
       for (let data of list) {
          num++;
           const content_area = document.createElement("div"); // 가장 바깥
           content_area.id = "filed" + num;
           const title_div = document.createElement("div"); // 구장명 표기
           const h3 = document.createElement("h3");
           h3.style.display = "inline-block"; // 추후에 클래스로 뺄것
           const match_type = document.createElement("span");
           h3.innerHTML = data.gameName;
           match_type.innerHTML = "크기 "+data.gameMacth;
           
           title_div.append(h3);
           title_div.append(match_type);
           content_area.append(title_div);
           result.append(content_area);

           const rental_area = document.createElement("div");
           rental_area.className = "rental_area";
      
       for(let i=8; i<=22; i=i+2){
          var timediv = document.createElement("div");
          timediv.id = "timediv" + i; 
          timediv.className = "time rental_span_able time"+i;
          timediv.innerHTML = i+":00 - "+(i+2)+":00";
          
          rental_area.append(timediv);
       }
          let data2 = {gameName:data.gameName,gameDay:day};
          var cnt = 1;
          
          fetch("${pageContext.request.contextPath}/rental/timeList",{
                method : "POST",
                headers : {
                   "Content-Type" : "application/json"},
                body : JSON.stringify(data2)
             }).then(response => response.json()) 
             .then(timeList => {

                var timeset = ["08","10","12","14","16","18","20","22"];
                
               for(let time of timeList){

                  let time_div = document.getElementById("filed"+cnt);

                      if(data.gameType == 'S' || data.gameType == 'T'){
                         var index = timeset.indexOf((time.gameTime));
                           
                             time_div.firstElementChild.firstElementChild.innerText = time.gameName;
                             time_div.lastElementChild.children[index].className = "time rental_span_disable";
                             time_div.lastElementChild.children[index].innerHTML = parseInt(time.gameTime)+":00 - "+(parseInt(time.gameTime)+2)+":00";
                      }
                }
               cnt++;

           }).catch(error => {
                   console.log("2번째 패치 에러 : " + error);
          });
       
       content_area.append(rental_area);

       }
    }).catch(error => {
       console.log("무슨에러냐면! : " + error);
    });
      
   });
         
   <!-- 마감  -->
   
   let type_input = document.getElementById("type_input");
   
   type_input.addEventListener("change",function(){
     
      let local_select = document.getElementById("local").value;
      if(local_select == "null"){
         local_select = null;
      }
      var filed_size = document.getElementById("filed_size").value;
      if(filed_size == "null"){
         filed_size = null;
       }

      type_input = this.checked;
      console.log(type_input);
      
      let data = {place:local_select,type:type_input,day:today,mver:filed_size};
      
      fetch("${pageContext.request.contextPath}/rental/selectRental",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(list => {
          const result = document.getElementById("result");
          result.innerHTML = " ";
       
          var num = 0;

       for (let data of list) {
          num++;
           const content_area = document.createElement("div"); // 가장 바깥
           content_area.id = "filed" + num;
           const title_div = document.createElement("div"); // 구장명 표기
           const h3 = document.createElement("h3");
           h3.style.display = "inline-block"; // 추후에 클래스로 뺄것
           const match_type = document.createElement("span");
           h3.innerHTML = data.gameName;
           match_type.innerHTML = "크기 "+data.gameMacth;
           
           title_div.append(h3);
           title_div.append(match_type);
           content_area.append(title_div);
           result.append(content_area);

           const rental_area = document.createElement("div");
           rental_area.className = "rental_area";
      
          for(let i=8; i<=22; i=i+2){
             var timediv = document.createElement("div");
             timediv.id = "timediv" + i; 
             timediv.className = "time rental_span_able time"+i;
             timediv.innerHTML = i+":00 - "+(i+2)+":00";
             
             rental_area.append(timediv);
          }
          let data2 = {gameName:data.gameName,gameDay:day};
          var cnt = 1;
          
          fetch("${pageContext.request.contextPath}/rental/timeList",{
                method : "POST",
                headers : {
                   "Content-Type" : "application/json"},
                body : JSON.stringify(data2)
             }).then(response => response.json()) 
             .then(timeList => {

                var timeset = ["08","10","12","14","16","18","20","22"];
                
               for(let time of timeList){

                  let time_div = document.getElementById("filed"+cnt);

                      if(data.gameType == 'S' || data.gameType == 'T'){
                         var index = timeset.indexOf((time.gameTime));
                           
                             time_div.firstElementChild.firstElementChild.innerText = time.gameName;
                             time_div.lastElementChild.children[index].className = "time rental_span_disable";
                             time_div.lastElementChild.children[index].innerHTML = parseInt(time.gameTime)+":00 - "+(parseInt(time.gameTime)+2)+":00";
                      }
                }
               cnt++;

           }).catch(error => {
                   console.log("2번째 패치 에러 : " + error);
          });
       
       content_area.append(rental_area);

       }
    }).catch(error => {
       console.log("무슨에러냐면! : " + error);
    });
      
   });
   </script>
   
  <!-- 매치형태 -->
  <script type="text/javascript">
  var filed_size = document.getElementById("filed_size").value;
  
  document.getElementById("filed_size").addEventListener("change",function(e){
    var type_input = document.getElementById("type_input").checked;
     var local_select = document.getElementById("local").value;
     if(local_select == "null"){
        local_select = null;
      }
//       if(filed_size == null){
//          var ac = document.getElementById("mvar").value;
        
//       }else{
//          var ac = document.getElementById("mvar").value;
//       } 
     
     let data = {place:local_select,type:type_input,day:today,mver:filed_size};
     
     fetch("${pageContext.request.contextPath}/msocial/slist",{
        method : "POST", // PUT, PATCH, DELETE
        headers : {
           "Content-Type" : "application/json"},
        body : JSON.stringify(data)
     }).then(response => response.json()) 
     
     .then(data => {
         const result = document.getElementById("result");
         result.innerHTML = " ";
      
         var num = 0;

      for (let data of list) {
         num++;
          const content_area = document.createElement("div"); // 가장 바깥
          content_area.id = "filed" + num;
          const title_div = document.createElement("div"); // 구장명 표기
          const h3 = document.createElement("h3");
          h3.style.display = "inline-block"; // 추후에 클래스로 뺄것
          const match_type = document.createElement("span");
          h3.innerHTML = data.gameName;
          match_type.innerHTML = "크기 "+data.gameMacth;
          
          title_div.append(h3);
          title_div.append(match_type);
          content_area.append(title_div);
          result.append(content_area);

          const rental_area = document.createElement("div");
          rental_area.className = "rental_area";
      
          for(let i=8; i<=22; i=i+2){
             var timediv = document.createElement("div");
             timediv.id = "timediv" + i; 
             timediv.className = "time rental_span_able time"+i;
             timediv.innerHTML = i+":00 - "+(i+2)+":00";
             
             rental_area.append(timediv);
          }
         let data2 = {gameName:data.gameName,gameDay:day};
         var cnt = 1;
         
         fetch("${pageContext.request.contextPath}/rental/timeList",{
               method : "POST",
               headers : {
                  "Content-Type" : "application/json"},
               body : JSON.stringify(data2)
            }).then(response => response.json()) 
            .then(timeList => {

               var timeset = ["08","10","12","14","16","18","20","22"];
               
              for(let time of timeList){

                 let time_div = document.getElementById("filed"+cnt);

                     if(data.gameType == 'S' || data.gameType == 'T'){
                        var index = timeset.indexOf((time.gameTime));
                          
                            time_div.firstElementChild.firstElementChild.innerText = time.gameName;
                            time_div.lastElementChild.children[index].className = "time rental_span_disable";
                            time_div.lastElementChild.children[index].innerHTML = parseInt(time.gameTime)+":00 - "+(parseInt(time.gameTime)+2)+":00";
                     }
               }
              cnt++;

          }).catch(error => {
                  console.log("2번째 패치 에러 : " + error);
         });
      
      content_area.append(rental_area);

      }
   }).catch(error => {
      console.log("무슨에러냐면! : " + error);
   });
  });
  </script>

   <!--  초기화  -->
   <script type="text/javascript">
   document.getElementById("listreset").addEventListener("click",function(e){
         document.getElementById("local").value = null;
         document.getElementById("type_input").checked = false;
         document.getElementById("mvar").value = null;
         
         var day = <%=year%> + "-" +<%=month%> +"-" +<%=today%>;
         
         for(var j = 0; j < document.getElementById("day").childElementCount; j++){
             document.getElementById("day").children[j].style.backgroundColor="#fff";
          };
          document.getElementById("<%=today%>").style.backgroundColor="rgb(7, 104, 231)";
      
      
         let data = {day:day};
         
         fetch("${pageContext.request.contextPath}/rental/selectRental",{
            method : "POST", // PUT, PATCH, DELETE
            headers : {
               "Content-Type" : "application/json"},
            body : JSON.stringify(data)
         }).then(response => response.json()) 
         
         .then(data => {
             const result = document.getElementById("result");
             result.innerHTML = " ";
          
             var num = 0;

          for (let data of list) {
             num++;
              const content_area = document.createElement("div"); // 가장 바깥
              content_area.id = "filed" + num;
              const title_div = document.createElement("div"); // 구장명 표기
              const h3 = document.createElement("h3");
              h3.style.display = "inline-block"; // 추후에 클래스로 뺄것
              const match_type = document.createElement("span");
              h3.innerHTML = data.gameName;
              match_type.innerHTML = "크기 "+data.gameMacth;
              
              title_div.append(h3);
              title_div.append(match_type);
              content_area.append(title_div);
              result.append(content_area);

              const rental_area = document.createElement("div");
              rental_area.className = "rental_area";
         
             for(let i=8; i<=22; i=i+2){
                var timediv = document.createElement("div");
                timediv.id = "timediv" + i;
                timediv.className = "time rental_span_able time"+i;
                timediv.innerHTML = i+":00 - "+(i+2)+":00";
                
                rental_area.append(timediv);
             }
             let data2 = {gameName:data.gameName,gameDay:day};
             var cnt = 1;
             
             fetch("${pageContext.request.contextPath}/rental/timeList",{
                   method : "POST",
                   headers : {
                      "Content-Type" : "application/json"},
                   body : JSON.stringify(data2)
                }).then(response => response.json()) 
                .then(timeList => {

                   var timeset = ["08","10","12","14","16","18","20","22"];
                   
                  for(let time of timeList){

                     let time_div = document.getElementById("filed"+cnt);

                         if(data.gameType == 'S' || data.gameType == 'T'){
                            var index = timeset.indexOf((time.gameTime));
                              
                                time_div.firstElementChild.firstElementChild.innerText = time.gameName;
                                time_div.lastElementChild.children[index].className = "time rental_span_disable";
                                time_div.lastElementChild.children[index].innerHTML = parseInt(time.gameTime)+":00 - "+(parseInt(time.gameTime)+2)+":00";
                         }
                   }
                  cnt++;

              }).catch(error => {
                      console.log("2번째 패치 에러 : " + error);
             });
          
          content_area.append(rental_area);

          }
       }).catch(error => {
          console.log("무슨에러냐면! : " + error);
       });
         
      });
   </script>
  
  
  
  

  </div>
</body>
</html>