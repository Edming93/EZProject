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
                                <li class="<%=i%>" id="<%=i%>">
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

<!--처음로딩시  -->
<script type="text/javascript">
	window.onload = function(e) {
		var yeardata = <%=year%>;
        var monthdata = <%=month%>;
        var daydata = <%=today%>;
        
        document.getElementById("<%=today%>").style.backgroundColor="rgb(7, 104, 231)";
        
        var day = <%=year%> + "-" +<%=month%> +"-" +<%=today%>;
        dayday = day;
	      
	      let data = {place:"null" ,close:"null",xgender:"null",ygender:"null",day:day};
	      
	      fetch("${pageContext.request.contextPath}/team/tlistall",{
	         method : "POST", // PUT, PATCH, DELETE
	         headers : {
	            "Content-Type" : "application/json"},
	         body : JSON.stringify(data)
	      }).then(response => response.json()) 
	      
	      .then(data => {
	         const result = document.getElementById("result");
	         document.getElementById("result").innerHTML = " ";
	         
	         for ( let name in data) {
	            const div_out = document.createElement("a");
	              div_out.className = "matchgame";
	              div_out.id = data[name].gameCode;
	              div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
	              
	              
	              let middiv = document.createElement("div");/*가운데  */
	              middiv.className = "mid_div";
	              let infodiv = document.createElement("div"); /*아래  */
	              infodiv.className = "info_div";
	              let tdiv = document.createElement("div");
	              tdiv.className = "game_time";
	              let ndiv = document.createElement("div");
	              let gdiv = document.createElement("div");
	              gdiv.className = "gender_div";
	              let mdiv = document.createElement("div");
	              mdiv.className = "match_div";
	              let ldiv = document.createElement("div");
	              ldiv.className = "level_div";
	              let bdiv  = document.createElement("div");
	              bdiv.className = "close";
	              
	              tdiv.innerText = "경기시간:"+ ":" + data[name].gameTime;
	              ndiv.innerText = "경기이름:"+ ":" + data[name].fieldName;
	              gdiv.innerText = "경기성별"+ ":" + data[name].gameGender;
	              mdiv.innerText = "경기매치"+ ":" + data[name].gameMacth;
	              ldiv.innerText = "경기레벨"+ ":" + data[name].level;
	              
	              
	              var pnum = data[name].gamePnum;/*신청인원  */
	              var minp = data[name].gameMinp;/*최소인원  */
	              var maxp = data[name].gameMaxp;/*최대인원  */
	              
	              if(data[name].gameMacth == '5vs5'){
	            	  if(pnum == 2){
	            		  bdiv.innerText = " 마감 ";
		            	  bdiv.style.backgroundColor = "#aaa";
	            	  }else{
	            		  bdiv.innerText = " 신청 ";
		            	  bdiv.style.backgroundColor = "blue";
	            	  }
	            	  
	              }else{
	            	  if(pnum == 3){
		            	  bdiv.innerText = " 마감 ";
		            	  bdiv.style.backgroundColor = "#aaa";
		              }else if(pnum ==2){
		            	  bdiv.innerText = " 마감 임박 ";
		            	  bdiv.style.backgroundColor = "red";
		              }else{
		            	  bdiv.innerText = " 신청 ";
		            	  bdiv.style.backgroundColor = "blue";
		              }
	            	  
	              }
	              
	              
	              
	              
	              
	             
	              div_out.append(tdiv);
	              middiv.append(ndiv);
	              infodiv.append(gdiv);
	              infodiv.append(mdiv);
	              infodiv.append(ldiv);
	              middiv.append(infodiv);
	              div_out.append(middiv);
	              div_out.append(bdiv);
	              result.append(div_out);
	         }
	         
	      }).catch(error => {
	         console.log("error");
	      });
	};
</script>

<!--날짜  -->
<script type="text/javascript">
var dayday = null;
for (var i = 0; i < document.getElementById("day").childElementCount; i++) {
	
	
    document.getElementById("day").children[i].addEventListener("click", function (e) {
    	for(var j = 0; j < document.getElementById("day").childElementCount; j++){
    		document.getElementById("day").children[j].style.backgroundColor="#fff";
    	};
    	this.style.backgroundColor="rgb(7, 104, 231)";

        var yeardata = <%=year%>;
        var monthdata = <%=month%>;
        var daydata = this.className;
        if(daydata<10) {
        	daydata = "0"+daydata;
        }
        
        var day = <%=year%> + "-" +<%=month%> +"-" + daydata;
        dayday = day;
        var local = document.getElementById("local").value;
        var clo = document.getElementById("close").checked;
        var xgen = document.getElementById("xgender").checked;
        var ygen = document.getElementById("ygender").checked;
        if(local == "null"){
           local = null;
        }
        var level = document.getElementById("level").value;
        if(level == null){
            level = null;
         }
        var mvar = document.getElementById("mvar").value;
        if(mvar == null){
      	  mvar = null;
         }
        
        
        let data = {place:local, close:clo, xgender:xgen, ygender:ygen, day:day, level:level,mver:mvar};
        
        fetch("${pageContext.request.contextPath}/team/tlist",{
           method : "POST", // PUT, PATCH, DELETE
           headers : {
              "Content-Type" : "application/json"},
           body : JSON.stringify(data)
        }).then(response => response.json()) 
        
        .then(data => {
           const result = document.getElementById("result");
           document.getElementById("result").innerHTML = " ";
           for ( let name in data) {
        	   const div_out = document.createElement("a");
	              div_out.className = "matchgame";
	              div_out.id = data[name].gameCode;
	              div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
	              
	              let middiv = document.createElement("div");/*가운데  */
	              middiv.className = "mid_div";
	              let infodiv = document.createElement("div"); /*아래  */
	              infodiv.className = "info_div";
	              let tdiv = document.createElement("div");
	              tdiv.className = "game_time";
	              let ndiv = document.createElement("div");
	              let gdiv = document.createElement("div");
	              gdiv.className = "gender_div";
	              let mdiv = document.createElement("div");
	              mdiv.className = "match_div";
	              let ldiv = document.createElement("div");
	              ldiv.className = "level_div";
	              let bdiv  = document.createElement("div");
	              bdiv.className = "close";
	              
	              tdiv.innerText = "경기시간:"+ ":" + data[name].gameTime;
	              ndiv.innerText = "경기이름:"+ ":" + data[name].fieldName;
	              gdiv.innerText = "경기성별"+ ":" + data[name].gameGender;
	              mdiv.innerText = "경기매치"+ ":" + data[name].gameMacth;
	              ldiv.innerText = "경기레벨"+ ":" + data[name].level;
	              
	              var pnum = data[name].gamePnum;/*신청인원  */
	              var minp = data[name].gameMinp;/*최소인원  */
	              var maxp = data[name].gameMaxp;/*최대인원  */
	              
	              
	              if(data[name].gameMacth == '5vs5'){
	            	  if(pnum == 2){
	            		  bdiv.innerText = " 마감 ";
		            	  bdiv.style.backgroundColor = "#aaa";
	            	  }else{
	            		  bdiv.innerText = " 신청 ";
		            	  bdiv.style.backgroundColor = "blue";
	            	  }
	            	  
	              }else{
	            	  if(pnum == 3){
		            	  bdiv.innerText = " 마감 ";
		            	  bdiv.style.backgroundColor = "#aaa";
		              }else if(pnum ==2){
		            	  bdiv.innerText = " 마감 임박 ";
		            	  bdiv.style.backgroundColor = "red";
		              }else{
		            	  bdiv.innerText = " 신청 ";
		            	  bdiv.style.backgroundColor = "blue";
		              }
	            	  
	              }
	             
	              div_out.append(tdiv);
	              middiv.append(ndiv);
	              infodiv.append(gdiv);
	              infodiv.append(mdiv);
	              infodiv.append(ldiv);
	              middiv.append(infodiv);
	              div_out.append(middiv);
	              div_out.append(bdiv);
	              result.append(div_out);
           }
       		
        }).catch(error => {
           console.log("error");
        });
		
        
       
    });
}
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
	      마감 가리기 <input type="checkbox" name="" id="close">
	   </div>

	   <div>
	      남 <input type="checkbox" name="" id="ygender"> 
	      여 <input type="checkbox" name="" id="xgender">
	   </div>
	   
	   
	   <select name="" id="level">
		   <option id="null" value="null">레벨</option>
		   <option id="서울" value="브론즈">브론즈</option>
		   <option id="경기도" value="실버">실버</option>
		   <option id="강원도" value="골드">골드</option>
	   </select>
	   
	   <select name="" id="mvar">
		   <option id="null" value="null">매치형태</option>
		   <option id="서울" value="5vs5">5vs5</option>
		   <option id="경기도" value="6vs6">6vs6</option>
	   </select>
		
	   
	   <div>
	   		<div id="listreset">대충초기화모양</div>
	   </div>
   
   </div>

   <div id="result">
    
   </div>
   <!-- 지역 설정  -->
   <script type="text/javascript">
   // 맨 처음 선택된 local 값을 받아옴
   var re = document.getElementById("local").value;
   
   document.getElementById("local").addEventListener("change",function(e){
	   // 마감 여부 선택 돼있는지 체크가 돼있으면 트루 , 아니면 펄스
      var clo = document.getElementById("close").checked;
	   // 남자
      var ygen = document.getElementById("ygender").checked;
	   // 여자
      var xgen = document.getElementById("xgender").checked;
	   // 맨 처음 선택된 애가 null이면  
       if(re == null){
    	   var ac = document.getElementById("local").value;
         
       }else{
          var ac = document.getElementById("local").value;
       }
	   
       var level = document.getElementById("level").value;
       if(level == null){
           level = null;
        }
       var mvar = document.getElementById("mvar").value;
       if(mvar == null){
     	  mvar = null;
        }
      
      
      let data = {place:ac ,close:clo,xgender:xgen,ygender:ygen,day:dayday, level:level,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             tdiv.innerText = "경기시간:"+ ":" + data[name].gameTime;
             ndiv.innerText = "경기이름:"+ ":" + data[name].fieldName;
             gdiv.innerText = "경기성별"+ ":" + data[name].gameGender;
             mdiv.innerText = "경기매치"+ ":" + data[name].gameMacth;
             ldiv.innerText = "경기레벨"+ ":" + data[name].level;
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
           	  }else{
           		  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
           	  }
           	  
             }else{
           	  if(pnum == 3){
	            	  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
	              }else if(pnum ==2){
	            	  bdiv.innerText = " 마감 임박 ";
	            	  bdiv.style.backgroundColor = "red";
	              }else{
	            	  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
	              }
           	  
             }
            
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(gdiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
   });
   </script>
   <!--마감  -->
   <script type="text/javascript">
   
   var close = document.getElementById("close").checked;
   
   document.getElementById("close").addEventListener("change",function(e){
	  
	  var ygen = document.getElementById("ygender").checked;
      var xgen = document.getElementById("xgender").checked;
      var local = document.getElementById("local").value;
      if(local == null){
         local = null;
      }
      var level = document.getElementById("level").value;
      if(level == null){
          level = null;
       }
      var mvar = document.getElementById("mvar").value;
      if(mvar == null){
    	  mvar = null;
       }
      
      var ac = this.checked;
      
      document.getElementById("close").checked = ac;
      
      let data = {place:local ,close:ac,xgender:xgen,ygender:ygen,day:dayday, level:level,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             tdiv.innerText = "경기시간:"+ ":" + data[name].gameTime;
             ndiv.innerText = "경기이름:"+ ":" + data[name].fieldName;
             gdiv.innerText = "경기성별"+ ":" + data[name].gameGender;
             mdiv.innerText = "경기매치"+ ":" + data[name].gameMacth;
             ldiv.innerText = "경기레벨"+ ":" + data[name].level;

             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
           	  }else{
           		  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
           	  }
           	  
             }else{
           	  if(pnum == 3){
	            	  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
	              }else if(pnum ==2){
	            	  bdiv.innerText = " 마감 임박 ";
	            	  bdiv.style.backgroundColor = "red";
	              }else{
	            	  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
	              }
           	  
             }
            
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(gdiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
      
   });
   </script>
   <!--성별  남-->
   <script type="text/javascript">
   
   var ygen = document.getElementById("ygender").checked;
   
   document.getElementById("ygender").addEventListener("change",function(e){
      var local = document.getElementById("local").value;
      var clo = document.getElementById("close").checked;
      var xgen = document.getElementById("xgender").checked;
      if(local == null){
         local = null;
      }
      var level = document.getElementById("level").value;
      if(level == null){
          level = null;
       }
      var mvar = document.getElementById("mvar").value;
      if(mvar == null){
    	  mvar = null;
       }
      
      var ac = this.checked;
      
      document.getElementById("ygender").checked = ac;
      
      let data = {place:local, close:clo, xgender:xgen, ygender:ac, day:dayday, level:level,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         
         
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             tdiv.innerText = "경기시간:"+ ":" + data[name].gameTime;
             ndiv.innerText = "경기이름:"+ ":" + data[name].fieldName;
             gdiv.innerText = "경기성별"+ ":" + data[name].gameGender;
             mdiv.innerText = "경기매치"+ ":" + data[name].gameMacth;
             ldiv.innerText = "경기레벨"+ ":" + data[name].level;

             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
           	  }else{
           		  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
           	  }
           	  
             }else{
           	  if(pnum == 3){
	            	  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
	              }else if(pnum ==2){
	            	  bdiv.innerText = " 마감 임박 ";
	            	  bdiv.style.backgroundColor = "red";
	              }else{
	            	  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
	              }
           	  
             }
            
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(gdiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
      
      
   });
   </script>
   <!--성별  여-->
   <script type="text/javascript">
   
   var xgen = document.getElementById("xgender").checked;
   
   document.getElementById("xgender").addEventListener("change",function(e){
      var local = document.getElementById("local").value;
      var clo = document.getElementById("close").checked;
      var ygen = document.getElementById("ygender").checked;
      if(local == null){
         local = null;
      }
      var level = document.getElementById("level").value;
      if(level == null){
          level = null;
       }
      var mvar = document.getElementById("mvar").value;
      if(mvar == null){
    	  mvar = null;
       }
      
      var ac = this.checked;
      
      document.getElementById("xgender").checked = ac;
      
      let data = {place:local, close:clo, xgender:ac, ygender:ygen, day:dayday, level:level,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             tdiv.innerText = "경기시간:"+ ":" + data[name].gameTime;
             ndiv.innerText = "경기이름:"+ ":" + data[name].fieldName;
             gdiv.innerText = "경기성별"+ ":" + data[name].gameGender;
             mdiv.innerText = "경기매치"+ ":" + data[name].gameMacth;
             ldiv.innerText = "경기레벨"+ ":" + data[name].level;
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
           	  }else{
           		  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
           	  }
           	  
             }else{
           	  if(pnum == 3){
	            	  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
	              }else if(pnum ==2){
	            	  bdiv.innerText = " 마감 임박 ";
	            	  bdiv.style.backgroundColor = "red";
	              }else{
	            	  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
	              }
           	  
             }
            
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(gdiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
      
      
   });
   </script>
   <!--레벨  -->
   <script type="text/javascript">
   var re = document.getElementById("level").value;
   
   document.getElementById("level").addEventListener("change",function(e){
	  var clo = document.getElementById("close").checked;
      var ygen = document.getElementById("ygender").checked;
      var xgen = document.getElementById("xgender").checked;
      var local = document.getElementById("local").value;
      if(local == "null"){
          local = null;
       }
      var mvar = document.getElementById("mvar").value;
      if(mvar == null){
    	  mvar = null;
       }
      if(re == null){
    	   var ac = document.getElementById("level").value;
         
       }else{
          var ac = document.getElementById("level").value;
       } 
      
      
      let data = {place:local ,close:clo,xgender:xgen,ygender:ygen,day:dayday,level:ac,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             tdiv.innerText = "경기시간:"+ ":" + data[name].gameTime;
             ndiv.innerText = "경기이름:"+ ":" + data[name].fieldName;
             gdiv.innerText = "경기성별"+ ":" + data[name].gameGender;
             mdiv.innerText = "경기매치"+ ":" + data[name].gameMacth;
             ldiv.innerText = "경기레벨"+ ":" + data[name].level;
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
           	  }else{
           		  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
           	  }
           	  
             }else{
           	  if(pnum == 3){
	            	  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
	              }else if(pnum ==2){
	            	  bdiv.innerText = " 마감 임박 ";
	            	  bdiv.style.backgroundColor = "red";
	              }else{
	            	  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
	              }
           	  
             }
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(gdiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
   });
   </script>
   
  <!--매치형태  -->
  <script type="text/javascript">
  var re = document.getElementById("mvar").value;
  
  document.getElementById("mvar").addEventListener("change",function(e){
	 var clo = document.getElementById("close").checked;
     var ygen = document.getElementById("ygender").checked;
     var xgen = document.getElementById("xgender").checked;
     var local = document.getElementById("local").value;
     if(local == "null"){
         local = null;
      }
     var level = document.getElementById("level").value;
     if(level == null){
         level = null;
      }
     
      if(re == null){
   	   var ac = document.getElementById("mvar").value;
        
      }else{
         var ac = document.getElementById("mvar").value;
      } 
     
     
     let data = {place:local ,close:clo,xgender:xgen,ygender:ygen,day:dayday,level:level,mver:ac};
     
     fetch("${pageContext.request.contextPath}/team/tlist",{
        method : "POST", // PUT, PATCH, DELETE
        headers : {
           "Content-Type" : "application/json"},
        body : JSON.stringify(data)
     }).then(response => response.json()) 
     
     .then(data => {
        const result = document.getElementById("result");
        document.getElementById("result").innerHTML = " ";
        
        for ( let name in data) {
       	 const div_out = document.createElement("a");
            div_out.className = "matchgame";
            div_out.id = data[name].gameCode;
            div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
            
            let middiv = document.createElement("div");/*가운데  */
            middiv.className = "mid_div";
            let infodiv = document.createElement("div"); /*아래  */
            infodiv.className = "info_div";
            let tdiv = document.createElement("div");
            tdiv.className = "game_time";
            let ndiv = document.createElement("div");
            let gdiv = document.createElement("div");
            gdiv.className = "gender_div";
            let mdiv = document.createElement("div");
            mdiv.className = "match_div";
            let ldiv = document.createElement("div");
            ldiv.className = "level_div";
            let bdiv  = document.createElement("div");
            bdiv.className = "close";
            
            tdiv.innerText = "경기시간:"+ ":" + data[name].gameTime;
            ndiv.innerText = "경기이름:"+ ":" + data[name].fieldName;
            gdiv.innerText = "경기성별"+ ":" + data[name].gameGender;
            mdiv.innerText = "경기매치"+ ":" + data[name].gameMacth;
            ldiv.innerText = "경기레벨"+ ":" + data[name].level;
            
            var pnum = data[name].gamePnum;/*신청인원  */
            var minp = data[name].gameMinp;/*최소인원  */
            var maxp = data[name].gameMaxp;/*최대인원  */
            
            
            if(data[name].gameMacth == '5vs5'){
          	  if(pnum == 2){
          		  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
          	  }else{
          		  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
          	  }
          	  
            }else{
          	  if(pnum == 3){
	            	  bdiv.innerText = " 마감 ";
	            	  bdiv.style.backgroundColor = "#aaa";
	              }else if(pnum ==2){
	            	  bdiv.innerText = " 마감 임박 ";
	            	  bdiv.style.backgroundColor = "red";
	              }else{
	            	  bdiv.innerText = " 신청 ";
	            	  bdiv.style.backgroundColor = "blue";
	              }
          	  
            }
           
            div_out.append(tdiv);
            middiv.append(ndiv);
            infodiv.append(gdiv);
            infodiv.append(mdiv);
            infodiv.append(ldiv);
            middiv.append(infodiv);
            div_out.append(middiv);
            div_out.append(bdiv);
            result.append(div_out);
        }
        
     }).catch(error => {
        console.log("error");
     });
  });
  </script>

   <!--초기화  -->
   <script type="text/javascript">
   document.getElementById("listreset").addEventListener("click",function(e){
	      document.getElementById("local").value = null;
	      document.getElementById("close").checked = false;
	      document.getElementById("ygender").checked = false;
	      document.getElementById("xgender").checked = false;
	      document.getElementById("level").value = null;
	      document.getElementById("mvar").value = null;
	      
	      var day = <%=year%> + "-" +<%=month%> +"-" +<%=today%>;
	      
	      for(var j = 0; j < document.getElementById("day").childElementCount; j++){
	    		document.getElementById("day").children[j].style.backgroundColor="#fff";
	    	};
	    	document.getElementById("<%=today%>").style.backgroundColor="rgb(7, 104, 231)";
	   
	   
	      let data = {day:day};
	      
	      fetch("${pageContext.request.contextPath}/team/tlistall",{
	         method : "POST", // PUT, PATCH, DELETE
	         headers : {
	            "Content-Type" : "application/json"},
	         body : JSON.stringify(data)
	      }).then(response => response.json()) 
	      
	      .then(data => {
	         const result = document.getElementById("result");
	         document.getElementById("result").innerHTML = " ";
	         for ( let name in data) {
	        	 const div_out = document.createElement("a");
	             div_out.className = "matchgame";
	             div_out.id = data[name].gameCode;
	             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
	             
	             let middiv = document.createElement("div");/*가운데  */
	             middiv.className = "mid_div";
	             let infodiv = document.createElement("div"); /*아래  */
	             infodiv.className = "info_div";
	             let tdiv = document.createElement("div");
	             tdiv.className = "game_time";
	             let ndiv = document.createElement("div");
	             let gdiv = document.createElement("div");
	             gdiv.className = "gender_div";
	             let mdiv = document.createElement("div");
	             mdiv.className = "match_div";
	             let ldiv = document.createElement("div");
	             ldiv.className = "level_div";
	             let bdiv  = document.createElement("div");
	             bdiv.className = "close";
	             
	             tdiv.innerText = "경기시간:"+ ":" + data[name].gameTime;
	             ndiv.innerText = "경기이름:"+ ":" + data[name].fieldName;
	             gdiv.innerText = "경기성별"+ ":" + data[name].gameGender;
	             mdiv.innerText = "경기매치"+ ":" + data[name].gameMacth;
	             ldiv.innerText = "경기레벨"+ ":" + data[name].level;
	             
	             var pnum = data[name].gamePnum;/*신청인원  */
	              var minp = data[name].gameMinp;/*최소인원  */
	              var maxp = data[name].gameMaxp;/*최대인원  */
	              
	              
	              if(data[name].gameMacth == '5vs5'){
	            	  if(pnum == 2){
	            		  bdiv.innerText = " 마감 ";
		            	  bdiv.style.backgroundColor = "#aaa";
	            	  }else{
	            		  bdiv.innerText = " 신청 ";
		            	  bdiv.style.backgroundColor = "blue";
	            	  }
	            	  
	              }else{
	            	  if(pnum == 3){
		            	  bdiv.innerText = " 마감 ";
		            	  bdiv.style.backgroundColor = "#aaa";
		              }else if(pnum ==2){
		            	  bdiv.innerText = " 마감 임박 ";
		            	  bdiv.style.backgroundColor = "red";
		              }else{
		            	  bdiv.innerText = " 신청 ";
		            	  bdiv.style.backgroundColor = "blue";
		              }
	            	  
	              }
	            
	             div_out.append(tdiv);
	             middiv.append(ndiv);
	             infodiv.append(gdiv);
	             infodiv.append(mdiv);
	             infodiv.append(ldiv);
	             middiv.append(infodiv);
	             div_out.append(middiv);
	             div_out.append(bdiv);
	             result.append(div_out);
	         }
	         
	      }).catch(error => {
	         console.log("error");
	      });
	      
	      
	   });
   </script>
  
  
  
  

  </div>
</body>
</html>