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
            /* margin: 10px; */
        	/* border: 1px solid black; */
            box-sizing: border-box;
        }

        #date {
            display: flex;
            width: 1024px;
            height: 150px;
        }

        #datelist {
            display: flex;
    		width: 100%;
        }

        #datelist button {
            width: 20px;
            background:none;
            border: none;
        }

        #div1{
            width: 980px;
            display: flex;
    		align-items: center;
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
		    width: 75px;
		    height: 70px;
		    margin: 30px;
		    padding: 0;
		    text-align: center;
		    border-radius: 71px;
		    border: 1px solid #e1e1e1;
		    color: #c7c7c7;
        }
        .idaydiv{
        }
        .idate{
        	padding-top: 12px;
        	font-size: 20px;
        	font-weight: bold;
        }
        /* #day li > div {
        	font-weight: bold;
        } */

        #settingbutton{
		    flex: 1;
		    display: flex;
		    position: relative;
		    height: 40px;
		    margin-top: 20px;
		    font-size: 12px;
		    margin-bottom: 40px;
		    margin-left: 20px;
    	}
    	
    	.local{
    		width: 100px;
    		border-radius: 30px;
    		margin-right: 10px;
    	}
    	
    	.closediv{
    		width: 100px;
    		border-radius: 30px;
    		display: flex;
    		align-items: center;
    		justify-content: center;
    		border: 1px solid black;
    		margin-right: 10px;
    	}
    	.gender{
    		width: 42px;
    		border-radius: 55px;
    		display: flex;
    		align-items: center;
    		justify-content: center;
    		border: 1px solid black;
    		margin-right: 10px;
    	}
    	#level{
    		width: 100px;
    		border-radius: 30px;
    		margin-right: 10px;
    	}
    	option {
    		text-align: center;
    	}
    	#mvar{
    		width: 100px;
    		border-radius: 30px;
    		margin-right: 10px;
    	}
    	.listreset{
    		width: 100px;
    		border-radius: 30px;
    		border: 1px solid black;
    		display: flex;
    		justify-content: center;
    		align-items: center;
    
    		
    	}
    	.matchgame{
			display: flex;
		    color: black;
		    text-decoration: none;
		    padding: 10px 0;
		    border-bottom: 1px solid #efefef;
		    height: 80px;
		    align-items: center;
		    justify-content: space-around;
    	}
    	.game_time{
		    font-size: 16px;
		    display: flex;
		    justify-content: center;
		    font-weight: 700;
    	}
    	
    	.gamename {
    		font-size: 20px;
    	}
    	.mid_div{
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
		    width: 700px;
    	}
    	.close{
		    border-radius: 30px;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    background-color: white;
		    border: 1px solid #26A653;
		    width: 110px;
    		height: 40px;
		    font-size: small;
		    color: #26A653;
    		
    	}
    	.close > div {
    		font-weight: bold;
    	}
    	.info_div{
		    display: flex;
		    width: 200px;
    		justify-content: space-between;
		    color: #848484;
    	}

    	
    	#dpre, #dnext {
    	    display: flex;
    		justify-content: center;
    		align-items: center;
    	}
    	.select_border {
   			border: 1px solid #A9A9A9;
   			font-size: 12px;
   		}
    	.active {
		   background-color:#26A653;
	   	   color:white;
	       border:1px solid #26A653;
   		}
		.bigger {
			width: 105px;
	        height: 100px;
	        margin: 15px;
		}

    </style>
</head>
<body>
<div id="out">
<section id="date">
        <div id="datelist">
            <div id="dpre"> <img src="${pageContext.request.contextPath}/image/left_btn.svg"> </div>
                    <div id="div1">
                        <ul id="day">
                            <% for(int i=fday; i<=eday; i++) { %>
                                <li class="<%=i%>" id="<%=i%>">
                                   <div class="idaydiv"> <% out.print(i); %> </div>
                                </li>
                                <%} %>
                        </ul>
                    </div>
             <div id="dnext"> <img src="${pageContext.request.contextPath}/image/right_btn.svg"> </div>
        </div>
        
</section>


<!--날짜데이터 삽입  -->
<script>
            let week = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY'];
            let num = week.indexOf("<%=we%>");
            let ct = <%=today%>% 7;

            for (var i = 0; i < 7; i++) {
            	if(week[i]=='MONDAY'){
            		week[0]='월';
            	}else if(week[i]=='TUESDAY'){
            		week[1]='화';
            	}else if(week[i]=='WEDNESDAY'){
            		week[2]='수';
            	}else if(week[i]=='THURSDAY'){
            		week[3]='목';
            	}else if(week[i]=='FRIDAY'){
            		week[4]='금';
            	}else if(week[i]=='SATURDAY'){
            		week[5]='토';
            	}else if(week[i]=='SUNDAY'){
            		week[6]='일';
            	};
			}
            
            for (var i = 0; i < document.getElementById("day").childElementCount; i++) {

            	
                if ((i + 1) % 7 == ct) {
                    var newp = document.createElement("div");
                    newp.className = "idate";
                    newp.innerText = week[num];
                    document.getElementById("day").children[i].prepend(newp);
                } else if ((i + 1) % 7 == (ct + 1)) {
                    var newp = document.createElement("div");
                    newp.className = "idate";
                    if(num+1>=7){
                    	newp.innerText = week[num + 1-7];
                    }else{
                    	newp.innerText = week[num + 1];
                    }
                    document.getElementById("day").children[i].prepend(newp);
                }
                else if ((i + 1) % 7 == (ct + 2)) {
                    var newp = document.createElement("div");
                    newp.className = "idate";
                    if(num+2>=7){
                    	newp.innerText = week[num + 2-7];
                    }else{
                    	newp.innerText = week[num + 2];
                    }
                    document.getElementById("day").children[i].prepend(newp);
                }
                else if ((i + 1) % 7 == (ct + 3)) {
                    var newp = document.createElement("div");
                    newp.className = "idate";
                    if(num+3>=7){
                    	newp.innerText = week[num + 3-7];
                    }else{
                    	newp.innerText = week[num + 3];
                    }
                    document.getElementById("day").children[i].prepend(newp);
                }
                else if ((i + 1) % 7 == (ct + 4)) {
                    var newp = document.createElement("div");
                    newp.className = "idate";
                    if(num+4>=7){
                    	newp.innerText = week[num + 4-7];
                    }else{
                    	newp.innerText = week[num + 4];
                    }
                    document.getElementById("day").children[i].prepend(newp);
                }
                else if ((i + 1) % 7 == (ct + 5)) {
                    var newp = document.createElement("div");
                    newp.className = "idate";
                    if(num+5>=7){
                    	newp.innerText = week[num + 5-7];
                    }else{
                    	newp.innerText = week[num + 5];
                    }
                    document.getElementById("day").children[i].prepend(newp);
                }
                else if ((i + 1) % 7 == (ct + 6)) {
                    var newp = document.createElement("div");
                    newp.className = "idate";
                    if(num+6>=7){
                    	newp.innerText = week[num + 6-7];
                    }else{
                    	newp.innerText = week[num + 6];
                    }
                    document.getElementById("day").children[i].prepend(newp);
                } else if ((i + 1) % 7 == (ct - 6)) {
                    if (num < 6) {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 6 + 7];
                        document.getElementById("day").children[i].prepend(newp);
                    } else {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 6];
                        document.getElementById("day").children[i].prepend(newp);
                    }
                }
                else if ((i + 1) % 7 == (ct - 5)) {
                    if (num < 5) {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 5 + 7];
                        document.getElementById("day").children[i].prepend(newp);
                    } else {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 5];
                        document.getElementById("day").children[i].prepend(newp);
                    }
                }
                else if ((i + 1) % 7 == (ct - 4)) {
                    if (num < 4) {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 4 + 7];
                        document.getElementById("day").children[i].prepend(newp);
                    } else {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 4];
                        document.getElementById("day").children[i].prepend(newp);
                    }
                }
                else if ((i + 1) % 7 == (ct - 3)) {
                    if (num < 3) {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 3 + 7];
                        document.getElementById("day").children[i].prepend(newp);
                    } else {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 3];
                        document.getElementById("day").children[i].prepend(newp);
                    }
                }
                else if ((i + 1) % 7 == (ct - 2)) {
                    if (num < 2) {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 2 + 7];
                        document.getElementById("day").children[i].prepend(newp);
                    } else {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 2];
                        document.getElementById("day").children[i].prepend(newp);
                    }

                }
                else if ((i + 1) % 7 == (ct - 1)) {
                    if (num < 1) {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 1 + 7];
                        document.getElementById("day").children[i].prepend(newp);
                    } else {
                        var newp = document.createElement("div");
                        newp.className = "idate";
                        newp.innerText = week[num - 1];
                        document.getElementById("day").children[i].prepend(newp);
                    }
                }
                
                
            }
            
            
            var set = <%=today%>

            document.querySelector("#div1 ul").scrollLeft = (set - 1) * 150;
            document.getElementById("dpre").addEventListener("click", function () {
                let pscrollleft1 = document.querySelector("#div1 ul").scrollLeft - 983;
                if (document.querySelector("#div1 ul").scrollLeft <= 0) {
                    document.querySelector("#div1 ul").scrollLeft = 0;
                } else {
                    document.querySelector("#div1 ul").scrollLeft = pscrollleft1;
                }

            });
            document.getElementById("dnext").addEventListener("click", function () {
                let pscrollleft1 = document.querySelector("#div1 ul").scrollLeft + 983;
                if (document.querySelector("#div1 ul").scrollLeft > 4050) {
                    document.querySelector("#div1 ul").scrollLeft = 4050;
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
        
        document.getElementById("<%=today%>").style.backgroundColor="#e8f2ff";
        document.getElementById("<%=today%>").style.color="rgb(36 36 36)";
        document.getElementById("<%=today%>").style.transform = "scale(1.5)";
<%--         document.getElementById("<%=today%>").style.width="105px"; --%>
<%--         document.getElementById("<%=today%>").style.height="100px"; --%>
<%--         document.getElementById("<%=today%>").style.margin="15px"; --%>

        
        var day = <%=year%> + "-" +<%=month%> +"-" +<%=today%>;
        dayday = day;
	      
	      let data = {place:"null" ,close:"null",xgender:"null",ygender:"null",day:day};
	      
	      fetch("${pageContext.request.contextPath}/msocial/listall",{
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
	              div_out.href="${pageContext.request.contextPath}/msocial/info?num="+data[name].gameCode;
	              
	              
	              let middiv = document.createElement("div");/*가운데  */
	              middiv.className = "mid_div";
	              let infodiv = document.createElement("div"); /*아래  */
	              infodiv.className = "info_div";
	              let tdiv = document.createElement("div");
	              tdiv.className = "game_time";
	              let ndiv = document.createElement("div");
	              ndiv.className = "gamename";
	              let gdiv = document.createElement("div");
	              gdiv.className = "gender_div";
	              let mdiv = document.createElement("div");
	              mdiv.className = "match_div";
	              let ldiv = document.createElement("div");
	              ldiv.className = "level_div";
	              let bdiv  = document.createElement("div");
	              bdiv.className = "close";
	              
	             /* 경기시간 */
	              tdiv.innerText = data[name].gameTime + ":00";
	              /* 경기이름 */
<%-- 	              ndiv.innerText = <%=today%> + " - " + data[name].gameTime +  " - " + data[name].fieldName; --%>
	              ndiv.innerText = data[name].fieldName;
	              /* 경기 성별 */
	              gdiv.innerText = data[name].gameMacth;
	              /* 경기매치 */
	              mdiv.innerText = data[name].level;
	              /* 경기레벨 */
	              ldiv.innerText = data[name].gameGender;
	              
	              
	              var pnum = data[name].gamePnum;/*신청인원  */
	              var minp = data[name].gameMinp;/*최소인원  */
	              var maxp = data[name].gameMaxp;/*최대인원  */
	              
	              var textdiv = document.createElement("div");
	              
	              if(pnum == maxp){
	            	  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
	            	  
	              }else if(minp - pnum <=3){
	            	  textdiv.innerText = " 마감 임박 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border ="1px solid #E95656";
	            	  bdiv.style.color = "#E95656";
	            	  
	              }else{
	            	  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
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
var daydata = <%=today%>;
for (var i = 0; i < document.getElementById("day").childElementCount; i++) {
	
	
    document.getElementById("day").children[i].addEventListener("click", function (e) {
    	for(var j = 0; j < document.getElementById("day").childElementCount; j++){
    		document.getElementById("day").children[j].style.backgroundColor="#fff";
    		document.getElementById("day").children[j].style.color='#C7C7C7';
    		document.getElementById("day").children[j].style.transition = "all 0.2s linear";
            document.getElementById("day").children[j].style.transform = "scale(1.0)";
    	};
    	this.style.backgroundColor="#e8f2ff";
    	this.style.color="rgb(36 36 36)";
    	this.style.transition = "all 0.2 linear";
        this.style.transform = "scale(1.5)";


        var yeardata = <%=year%>;
        var monthdata = <%=month%>;
        daydata = this.className;
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
        
        fetch("${pageContext.request.contextPath}/msocial/slist",{
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
	              div_out.href="${pageContext.request.contextPath}/msocial/info?num="+data[name].gameCode;
	              
	              let middiv = document.createElement("div");/*가운데  */
	              middiv.className = "mid_div";
	              let infodiv = document.createElement("div"); /*아래  */
	              infodiv.className = "info_div";
	              let tdiv = document.createElement("div");
	              tdiv.className = "game_time";
	              let ndiv = document.createElement("div");
	              ndiv.className = "gamename";
	              let gdiv = document.createElement("div");
	              gdiv.className = "gender_div";
	              let mdiv = document.createElement("div");
	              mdiv.className = "match_div";
	              let ldiv = document.createElement("div");
	              ldiv.className = "level_div";
	              let bdiv  = document.createElement("div");
	              bdiv.className = "close";
	              
	             /* 경기시간 */
	              tdiv.innerText = data[name].gameTime + ":00";
	              /* 경기이름 */
	              ndiv.innerText = data[name].fieldName;
	              /* 경기 성별 */
	              gdiv.innerText = data[name].gameGender;
	              /* 경기매치 */
	              mdiv.innerText = data[name].gameMacth;
	              /* 경기레벨 */
	              ldiv.innerText = data[name].level;
	              
	              var pnum = data[name].gamePnum;/*신청인원  */
	              var minp = data[name].gameMinp;/*최소인원  */
	              var maxp = data[name].gameMaxp;/*최대인원  */
	              
	              
				 var textdiv = document.createElement("div");
	              
				 if(pnum == maxp){
	            	  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
	            	  
	              }else if(minp - pnum <=3){
	            	  textdiv.innerText = " 마감 임박 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border ="1px solid #E95656";
	            	  bdiv.style.color = "#E95656";
	            	  
	              }else{
	            	  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
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
	   <select name="" id="local" class="select_border local">
	      <option id="null" value="null">지역</option>
	      <option id="서울" value="서울">서울</option>
	      <option id="인천" value="인천">인천</option>
	      <option id="경기" value="경기">경기도</option>
	      <option id="강원" value="강원">강원도</option>
	      <option id="경상" value="경상">경상도</option>
	      <option id="전라" value="전라">전라도</option>
	      <option id="충청" value="충청">충청도</option>
	      <option id="제주" value="제주">제주도</option>
	   </select>

	   
	   <select name="" id="mvar" class="select_border mvar">
		   <option id="null" value="null">매치형태</option>
		   <option id="5" value="5vs5">5vs5</option>
		   <option id="6" value="6vs6">6vs6</option>
	   </select>
		
	   <select name="" id="level" class="select_border level">
		   <option id="null" value="null">레벨</option>
		   <option id="브론즈" value="브론즈">브론즈</option>
		   <option id="실버" value="실버">실버</option>
		   <option id="골드" value="골드">골드</option>
	   </select>
		
	  <label for="close" id="closediv" class="select_border closediv">마감 가리기</label> <input type="checkbox" name="close" id="close" style="display: none";>
	
	   <label for="ygender" class="select_border gender" id="sla"> 남 </label> <input type="checkbox" name="ygender" id="ygender" style="display: none";> 
	   <label for="xgender" class="select_border gender" id="du"> 여 </label> <input type="checkbox" name="xgender" id="xgender" style="display: none";>
	   
	   <div id="listreset" class="select_border listreset">
	   		RESET
	   </div>
   
   </div>

   <div id="result">
    
   </div>
   <!-- 지역 설정  -->
   <script type="text/javascript">
   // 맨 처음 선택된 local 값을 받아옴
   var re = document.getElementById("local").value;
   
   document.getElementById("local").addEventListener("change",function(e){
	      if(document.getElementById("local").value == "null"){
	    	  document.getElementById("local").classList.remove("active");
	      }else{
	    	  document.getElementById("local").classList.add("active"); 
	      }
	   
	   
	   
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
      
      fetch("${pageContext.request.contextPath}/msocial/slist",{
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
             div_out.href="${pageContext.request.contextPath}/msocial/info?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
            /* 경기시간 */
             tdiv.innerText = data[name].gameTime + ":00";
             /* 경기이름 */
             ndiv.innerText = <%=today%> + " - " + data[name].gameTime +  " - " + data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             var textdiv = document.createElement("div");
             
             if(pnum == maxp){
           	  textdiv.innerText = " 마감 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border = "0px";
           	  bdiv.style.color = "#BBBBBB";
           	  
             }else if(minp - pnum <=3){
           	  textdiv.innerText = " 마감 임박 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border ="1px solid #E95656";
           	  bdiv.style.color = "#E95656";
           	  
             }else{
           	  textdiv.innerText = " 신청하기 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.backgroundColor = "white";
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
	   document.getElementById("closediv").classList.toggle("active");
	  
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
      
      fetch("${pageContext.request.contextPath}/msocial/slist",{
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
             div_out.href="${pageContext.request.contextPath}/msocial/info?num="+data[name].gameCode;
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
            /* 경기시간 */
             tdiv.innerText = data[name].gameTime + ":00";
             /* 경기이름 */
             ndiv.innerText = <%=today%> + " - " + data[name].gameTime +  " - " + data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
             
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             var textdiv = document.createElement("div");
             
             if(pnum == maxp){
           	  textdiv.innerText = " 마감 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border = "0px";
           	  bdiv.style.color = "#BBBBBB";
           	  
             }else if(minp - pnum <=3){
           	  textdiv.innerText = " 마감 임박 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border ="1px solid #E95656";
           	  bdiv.style.color = "#E95656";
           	  
             }else{
           	  textdiv.innerText = " 신청하기 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.backgroundColor = "white";
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
   
   
   document.getElementById("ygender").addEventListener("click",function(e){
	   document.getElementById("sla").classList.toggle("active");
 
	  
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
      
      fetch("${pageContext.request.contextPath}/msocial/slist",{
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
             div_out.href="${pageContext.request.contextPath}/msocial/info?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
            /* 경기시간 */
             tdiv.innerText = data[name].gameTime + ":00";
             /* 경기이름 */
             ndiv.innerText = <%=today%> + " - " + data[name].gameTime +  " - " + data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
             

             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             var textdiv = document.createElement("div");
             
             if(pnum == maxp){
           	  textdiv.innerText = " 마감 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border = "0px";
           	  bdiv.style.color = "#BBBBBB";
           	  
             }else if(minp - pnum <=3){
           	  textdiv.innerText = " 마감 임박 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border ="1px solid #E95656";
           	  bdiv.style.color = "#E95656";
           	  
             }else{
           	  textdiv.innerText = " 신청하기 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.backgroundColor = "white";
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
	   document.getElementById("du").classList.toggle("active");
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
      
      fetch("${pageContext.request.contextPath}/msocial/slist",{
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
             div_out.href="${pageContext.request.contextPath}/msocial/info?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
            /* 경기시간 */
             tdiv.innerText = data[name].gameTime + ":00";
             /* 경기이름 */
             ndiv.innerText = <%=today%> + " - " + data[name].gameTime +  " - " + data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
             
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             var textdiv = document.createElement("div");
             
             if(pnum == maxp){
           	  textdiv.innerText = " 마감 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border = "0px";
           	  bdiv.style.color = "#BBBBBB";
           	  
             }else if(minp - pnum <=3){
           	  textdiv.innerText = " 마감 임박 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border ="1px solid #E95656";
           	  bdiv.style.color = "#E95656";
           	  
             }else{
           	  textdiv.innerText = " 신청하기 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.backgroundColor = "white";
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
      
      
      if(document.getElementById("level").value == "null"){
    	  document.getElementById("level").classList.remove("active");
      }else{
    	  document.getElementById("level").classList.add("active"); 
      }
      
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
      
      fetch("${pageContext.request.contextPath}/msocial/slist",{
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
             div_out.href="${pageContext.request.contextPath}/msocial/info?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
            /* 경기시간 */
             tdiv.innerText = data[name].gameTime + ":00";
             /* 경기이름 */
             ndiv.innerText = <%=today%> + " - " + data[name].gameTime +  " - " + data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
             
             
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             var textdiv = document.createElement("div");
             
             if(pnum == maxp){
           	  textdiv.innerText = " 마감 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border = "0px";
           	  bdiv.style.color = "#BBBBBB";
           	  
             }else if(minp - pnum <=3){
           	  textdiv.innerText = " 마감 임박 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.border ="1px solid #E95656";
           	  bdiv.style.color = "#E95656";
           	  
             }else{
           	  textdiv.innerText = " 신청하기 ";
           	  bdiv.append(textdiv);
           	  bdiv.style.backgroundColor = "white";
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
	  
      if(document.getElementById("mvar").value == "null"){
    	  document.getElementById("mvar").classList.remove("active");
      }else{
    	  document.getElementById("mvar").classList.add("active"); 
      }
      
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
     
     fetch("${pageContext.request.contextPath}/msocial/slist",{
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
            div_out.href="${pageContext.request.contextPath}/msocial/info?num="+data[name].gameCode;
            
            let middiv = document.createElement("div");/*가운데  */
            middiv.className = "mid_div";
            let infodiv = document.createElement("div"); /*아래  */
            infodiv.className = "info_div";
            let tdiv = document.createElement("div");
            tdiv.className = "game_time";
            let ndiv = document.createElement("div");
            ndiv.className = "gamename";
            let gdiv = document.createElement("div");
            gdiv.className = "gender_div";
            let mdiv = document.createElement("div");
            mdiv.className = "match_div";
            let ldiv = document.createElement("div");
            ldiv.className = "level_div";
            let bdiv  = document.createElement("div");
            bdiv.className = "close";
            
           /* 경기시간 */
            tdiv.innerText = data[name].gameTime + ":00";
            /* 경기이름 */
            ndiv.innerText = <%=today%> + " - " + data[name].gameTime +  " - " + data[name].fieldName;
            /* 경기 성별 */
            gdiv.innerText = data[name].gameGender;
            /* 경기매치 */
            mdiv.innerText = data[name].gameMacth;
            /* 경기레벨 */
            ldiv.innerText = data[name].level;
            
            
            var pnum = data[name].gamePnum;/*신청인원  */
            var minp = data[name].gameMinp;/*최소인원  */
            var maxp = data[name].gameMaxp;/*최대인원  */
            
           
            var textdiv = document.createElement("div");
            
            if(pnum == maxp){
          	  textdiv.innerText = " 마감 ";
          	  bdiv.append(textdiv);
          	  bdiv.style.border = "0px";
          	  bdiv.style.color = "#BBBBBB";
          	  
            }else if(minp - pnum <=3){
          	  textdiv.innerText = " 마감 임박 ";
          	  bdiv.append(textdiv);
          	  bdiv.style.border ="1px solid #E95656";
          	  bdiv.style.color = "#E95656";
          	  
            }else{
          	  textdiv.innerText = " 신청하기 ";
          	  bdiv.append(textdiv);
          	  bdiv.style.backgroundColor = "white";
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
	   console.log(dayday);
	      document.getElementById("local").value = null;
	      document.getElementById("close").checked = false;
	      document.getElementById("ygender").checked = false;
	      document.getElementById("xgender").checked = false;
	      document.getElementById("level").value = null;
	      document.getElementById("mvar").value = null;
	      
	      document.getElementById("local").classList.remove("active");
	      document.getElementById("closediv").classList.remove("active");
	      document.getElementById("sla").classList.remove("active");
	      document.getElementById("du").classList.remove("active");
	      document.getElementById("level").classList.remove("active");
	      document.getElementById("mvar").classList.remove("active");
	   
	      let data = {day:dayday};
	      
	      fetch("${pageContext.request.contextPath}/msocial/listall",{
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
	             div_out.href="${pageContext.request.contextPath}/msocial/info?num="+data[name].gameCode;
	             
	             let middiv = document.createElement("div");/*가운데  */
	              middiv.className = "mid_div";
	              let infodiv = document.createElement("div"); /*아래  */
	              infodiv.className = "info_div";
	              let tdiv = document.createElement("div");
	              tdiv.className = "game_time";
	              let ndiv = document.createElement("div");
	              ndiv.className = "gamename";
	              let gdiv = document.createElement("div");
	              gdiv.className = "gender_div";
	              let mdiv = document.createElement("div");
	              mdiv.className = "match_div";
	              let ldiv = document.createElement("div");
	              ldiv.className = "level_div";
	              let bdiv  = document.createElement("div");
	              bdiv.className = "close";
	              
	             /* 경기시간 */
	              tdiv.innerText = data[name].gameTime + ":00";
	              /* 경기이름 */
	              ndiv.innerText = <%=today%> + " - " + data[name].gameTime +  " - " + data[name].fieldName;
	              /* 경기 성별 */
	              gdiv.innerText = data[name].gameGender;
	              /* 경기매치 */
	              mdiv.innerText = data[name].gameMacth;
	              /* 경기레벨 */
	              ldiv.innerText = data[name].level;
	              
	             
	              var pnum = data[name].gamePnum;/*신청인원  */
	              var minp = data[name].gameMinp;/*최소인원  */
	              var maxp = data[name].gameMaxp;/*최대인원  */
	              
	              
				 var textdiv = document.createElement("div");
	              
				 if(pnum == maxp){
	            	  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
	            	  
	              }else if(minp - pnum <=3){
	            	  textdiv.innerText = " 마감 임박 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border ="1px solid #E95656";
	            	  bdiv.style.color = "#E95656";
	            	  
	              }else{
	            	  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
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