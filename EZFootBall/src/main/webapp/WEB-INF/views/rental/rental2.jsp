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
		    cursor: pointer;
        }
        .idaydiv{
        }
        .idate{
        	padding-top: 12px;
        	font-size: 20px;
        	font-weight: bold;
        }

        #settingbutton{
		    flex: 1;
		    display: flex;
		    position: relative;
		    height: 40px;
		    margin-top: 20px;
		    font-size: 12px;
		    margin-bottom: 40px;
		    margin-left: 20px;
		    align-items: center;
    	}
    	
    	.local{
    		width: 100px;
    		border-radius: 30px;
    		margin-right: 10px;
    	}
    	
    	.type_input {
    		border-radius: 30px;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    background-color: white;
		    width: 110px;
    		height: 40px;
    	}
    	.size{
    		width: 100px;
    		border-radius: 30px;
    	}
    	option {
    		text-align: center;
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
   			height:100%;
   			margin-right: 10px;
   			cursor: pointer;
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
          background-color: rgb(212 247 225);
		  cursor: pointer;
		  text-decoration: none;
		  color: black;
		  border-radius: 11px;
		  border: 0px !important;
       }
       .rental_span_disable {
          text-decoration: none;
		  color: #A9A9A9;
		  border-radius: 11px;
		  border: 0px !important;
       }
       
		#result {
			display: flex;
	    	flex-direction: column;
		}
		.result_content {
			display: flex;
		    color: black;
		    text-decoration: none;
		    padding: 25px 20px;
		    border-bottom: 1px solid #efefef;
		    justify-content: space-around;
		    flex-direction: column;
		}
		.title_area {
	
		    display: flex;
		    justify-content: space-between;
		    flex-direction: column;
		}
		
	
		.size_span {
			font-size:13px;
			margin-bottom: 20px;
	    	display: flex;
		}
		
		.field_title {
			margin-bottom: 10px;
	    	display: flex;
	    	cursor: pointer;
		}
		
		input:focus, select:focus, option:focus, textarea:focus, button:focus{
		outline: none;
		}
    </style>
</head>
<body>
<div id="out">
<section id="date">
        <div id="datelist">
            <button id="dpre"> <img src="${pageContext.request.contextPath}/image/left_btn.svg"> </button>
                    <div id="div1">
                        <ul id="day">
                            <% for(int i=fday; i<=eday; i++) { %>
                                <li class="today <%=i%>" id="<%=i%>">
                                    <% out.print(i); %>
                                </li>
                                <%} %>
                        </ul>
                    </div>
             <button id="dnext"> <img src="${pageContext.request.contextPath}/image/right_btn.svg"> </button>
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

   <div id="result">
    
   </div>
   

<script type="text/javascript">
<!--  처음 로딩시  -->

	window.onload = function() {
		document.getElementById("<%=today%>").style.backgroundColor="#26A653";
        document.getElementById("<%=today%>").style.color="#fff";
        document.getElementById("<%=today%>").style.border="1px solid #26A653";
        document.getElementById("<%=today%>").style.transform = "scale(1.5)";
		
        
		let day = <%=year%> + "-" +<%=month%> +"-" +<%=today%>;
		
		let fieldCode = ${field.fieldCode};

		today = day;
         let data = {day:day,code:fieldCode};
         
         fetch("${pageContext.request.contextPath}/rental/rvListSelect",{
            method : "POST",
            headers : {
               "Content-Type" : "application/json"},
            body : JSON.stringify(data)
         }).then(response => response.json()) 
         .then(list => {
            const result = document.getElementById("result");
               result.innerHTML = " ";
            
            for (let data of list) {
	            const content_area = document.createElement("div"); // 가장 바깥
	            const title_div = document.createElement("div"); // 구장명 표기
	            const h3 = document.createElement("h3");
	            h3.className = "field_title";
	            console.log("필드코드 : "+data.fieldCode);
	            h3.addEventListener("click",function() {
	            	location.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode="+data.fieldCode;
	            });
	            const match_type = document.createElement("span");
	            h3.innerHTML = data.fieldName;
	            match_type.innerHTML = "크기 "+data.gameMacth;
	            
	            title_div.append(h3);
	            title_div.append(match_type);
	            content_area.append(title_div);
	            result.append(content_area);
	
	            const rental_area = document.createElement("div");
	            rental_area.className = "rental_area";
			
				// 전체배열
				var timeset = ["08","10","12","14","16","18","20","22"];
				// db에서 불러온 배열
				var game_time = (data.gameTime).split(',');

				for(let i=0; i<timeset.length; i++){
					// true 혹은 false 반환
					let rental_div = document.createElement("a");
					let time = parseInt(timeset[i]);

					if(game_time.includes(timeset[i])){
						rental_div.className = "time rental_span_disable";
						rental_div.innerHTML = time+":00 - "+(time+2)+":00"; 
					}else{
						rental_div.className = "time rental_span_able";
						rental_div.href = "${pageContext.request.contextPath}/rental/paymentInter?pageurl=redirect:/rental/rentalPayment&fieldCode="+data.fieldCode+"&gameDay="+day+"&gameTime="+time;
						rental_div.innerHTML = time+":00 - "+(time+2)+":00"; 
					}
					rental_area.append(rental_div);
				}
            	content_area.append(rental_area);
            }
         }).catch(error => {
            console.log("무슨에러냐면! : " + error);
         });
   };
   
   <!-- 날짜 -->
   let today = null;
   let day_div = document.getElementById("day");
   let today_li = document.querySelectorAll(".today");

      today_li.forEach(function(e) {
         e.addEventListener("click", function () {

         // 초기화 시키는 로직
         today_li.forEach(function(e) {
            e.style.backgroundColor="#fff";
    		e.style.color='#C7C7C7';
    		e.style.border="1px solid #A9A9A9";
    		e.style.transition = "all 0.2s linear";
            e.style.transform = "scale(1.0)";
         });
      
         e.style.backgroundColor="#26A653";
     	 e.style.color="#fff";
     	 e.style.border="1px solid #26A653";
    	 e.style.transition = "all 0.2 linear";
         e.style.transform = "scale(1.5)";

       let year_data = <%=year%>;
       let month_data = <%=month%>;
       let day_data = this.className.substring(6);
       
       if(day_data<10) {
          day_data = "0"+day_data;
       }
       
       let day = <%=year%> + "-" +<%=month%> +"-" + day_data;
       today = day;
		let fieldCode = ${field.fieldCode};
       let data = {day:day,code:fieldCode};
       
       fetch("${pageContext.request.contextPath}/rental/rvListSelect",{
          method : "POST", // PUT, PATCH, DELETE
          headers : {
             "Content-Type" : "application/json"},
          body : JSON.stringify(data)
       }).then(response => response.json())
       .then(list => {
           const result = document.getElementById("result");
           result.innerHTML = " ";
        
           for (let data of list) {
	            const content_area = document.createElement("div"); // 가장 바깥
	            const title_div = document.createElement("div"); // 구장명 표기
	            const h3 = document.createElement("h3");
	            h3.className = "field_title";
	            console.log("필드코드 : "+data.fieldCode);
	            h3.addEventListener("click",function() {
	            	location.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode="+data.fieldCode;
	            });
	            const match_type = document.createElement("span");
	            h3.innerHTML = data.fieldName;
	            match_type.innerHTML = "크기 "+data.gameMacth;
	            
	            title_div.append(h3);
	            title_div.append(match_type);
	            content_area.append(title_div);
	            result.append(content_area);
	
	            const rental_area = document.createElement("div");
	            rental_area.className = "rental_area";
			
				// 전체배열
				var timeset = ["08","10","12","14","16","18","20","22"];
				// db에서 불러온 배열
				var game_time = (data.gameTime).split(',');

				for(let i=0; i<timeset.length; i++){
					// true 혹은 false 반환
					let rental_div = document.createElement("a");
					let time = parseInt(timeset[i]);
					if(game_time.includes(timeset[i])){
						rental_div.className = "time rental_span_disable";
						rental_div.innerHTML = parseInt(timeset[i])+":00 - "+(parseInt(timeset[i])+2)+":00"; 
					}else{
						rental_div.className = "time rental_span_able";
						rental_div.href = "${pageContext.request.contextPath}/rental/paymentInter?pageurl=redirect:/rental/rentalPayment&fieldCode="+data.fieldCode+"&gameDay="+day+"&gameTime="+time;
						rental_div.innerHTML = parseInt(timeset[i])+":00 - "+(parseInt(timeset[i])+2)+":00"; 
					}
					rental_area.append(rental_div);
				}
        	content_area.append(rental_area);
        }
     }).catch(error => {
        console.log("무슨에러냐면! : " + error);
     });
      
       
      
   });
      
   });
   </script>
  
  
  
  

  </div>
</body>
</html>