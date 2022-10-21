
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
	
	request.setCharacterEncoding("utf-8");
	Object localObject = session.getAttribute("local");
	Object beneObject = session.getAttribute("bene");
	Object cloObject = session.getAttribute("clo");
	Object genderObject = session.getAttribute("gender");
	Object dayObject = session.getAttribute("day");
	
	String loca = String.valueOf(localObject);
	String local = loca;
	String bene = String.valueOf(beneObject);
	String clo = String.valueOf(cloObject);
	String gender = String.valueOf(genderObject);
	String day = String.valueOf(dayObject);
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head profile="http://www.w3.org/2005/10/profile"></head>
<head>
	<!-- <link rel="shortcut icon" href="#">
    <link rel="stylesheet" href="res/jquery-ui.css"/>
    <script src="res/jquery-1.12.4.js"></script>
    <script src="res/jquery-ui.js"></script> -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
         * {
            box-sizing: border-box;
        }

        #inner {
            width: 800px;
        }

        #inner * {
            margin: 10px;
            border: 1px solid black;
        }

        #header {
            display: flex;
        }

        #mainmenu {
            display: flex;
        }

        #date {
            display: flex;
            width: 760px;
        }

        #datelist {
            display: flex;
        }

        #datelist button {
            width: 30px;
        }

        #div1{
            width: 600px;
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
            width: 80px;
            margin: 0;
            padding: 0;
        }

        #setting {
            display: flex;
        }
        #txtDate{
            width: 60px;
        }
    </style>
</head>
<body>
    <section id="inner">
        <header>
            <section id="header">
                <div>로고</div>
                <div>검색창</div>
                <div>로그인</div>
            </section>

            <section id="mainmenu">
                <div id="social">소셜매치</div>
                <div id="team">팀매치</div>
                <div id="rank">랭킹</div>
                <div id="reserve">구장예약</div>
                <div id="community">커뮤니티</div>
            </section>
            <script type="text/javascript">
            	document.getElementById("social").addEventListener("click", function () {
                    location.href = "${pageContext.request.contextPath}/menu/social";
                });
            	document.getElementById("team").addEventListener("click", function () {
                    location.href = "${pageContext.request.contextPath}/team";
                });
            	document.getElementById("rank").addEventListener("click", function () {
                    location.href = "${pageContext.request.contextPath}/rank";
                });
            	document.getElementById("reserve").addEventListener("click", function () {
                    location.href = "${pageContext.request.contextPath}/reserve";
                });
            	document.getElementById("community").addEventListener("click", function () {
                    location.href = "${pageContext.request.contextPath}/community";
                });
            </script>
        </header>

        <main>

            <section id="banner">
                배너
                <div>
                    페이징 및 멈춤 버튼
                    <button> < </button>
                    <button> || </button>
                    <button> > </button>
                </div>
            </section>

            <section id="date">
                <div id="datelist">
                    <button id="dpre"> < </button>
                    <div id="div1">
                        <ul id="day">
                           <%
                           	for(int i=fday; i<=eday; i++) { %>
                           		<li class="<%=i%>"><% out.print(i); %></li>
                           <%}
                           %>
                        </ul>
                    </div>
                    <button id="dnext"> > </button>
                </div>
                <script>
                let week = ['MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY'];
                let num = week.indexOf("<%=we%>");
                let ct = <%=today%>%7;
                console.log(num);
                console.log(ct);

                for(var i=0; i<document.getElementById("day").childElementCount; i++) {
                	console.log(i);
                    if((i+1)%7 == ct) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num];
                        document.getElementById("day").children[i].append(newp);
                    }else if((i+1)%7 == (ct+1)) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num+1];
                        document.getElementById("day").children[i].append(newp);
                    }
                    else if((i+1)%7 == (ct+2)) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num+2];
                        document.getElementById("day").children[i].append(newp);
                    }
                    else if((i+1)%7 == (ct+3)) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num+3];
                        document.getElementById("day").children[i].append(newp);
                    }
                    else if((i+1)%7 == (ct+4)) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num+4];
                        document.getElementById("day").children[i].append(newp);
                    }
                    else if((i+1)%7 == (ct+5)) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num+5];
                        document.getElementById("day").children[i].append(newp);
                    }
                    else if((i+1)%7 == (ct+6)) {
                        var newp = document.createElement("p");
                        newp.innerText = week[num+6];
                        document.getElementById("day").children[i].append(newp);
                    }else if((i+1)%7 == (ct-6)) {
                    	if(num<6){
                    		var newp = document.createElement("p");
                            newp.innerText = week[num-6+7];
                            document.getElementById("day").children[i].append(newp);
                    	}else{
                    		var newp = document.createElement("p");
                            newp.innerText = week[num-6];
                            document.getElementById("day").children[i].append(newp);
                    	}
                    }
                    else if((i+1)%7 == (ct-5)) {
                    	if(num<5){
                    		var newp = document.createElement("p");
                            newp.innerText = week[num-5+7];
                            document.getElementById("day").children[i].append(newp);
                    	}else{
                    		 var newp = document.createElement("p");
                             newp.innerText = week[num-5];
                             document.getElementById("day").children[i].append(newp);
                    	}
                    }
                    else if((i+1)%7 == (ct-4)) {
                    	if(num<4){
                    		var newp = document.createElement("p");
                            newp.innerText = week[num-4+7];
                            document.getElementById("day").children[i].append(newp);
                    	}else{
                    		var newp = document.createElement("p");
                            newp.innerText = week[num-4];
                            document.getElementById("day").children[i].append(newp);
                    	}
                    }
                    else if((i+1)%7 == (ct-3)) {
                    	if(num<3){
                    		var newp = document.createElement("p");
                            newp.innerText = week[num-3+7];
                            document.getElementById("day").children[i].append(newp);
                    	}else{
                    		 var newp = document.createElement("p");
                             newp.innerText = week[num-3];
                             document.getElementById("day").children[i].append(newp);
                    	}
                    }
                    else if((i+1)%7 == (ct-2)) {
                    	if(num<2){
                    		var newp = document.createElement("p");
                            newp.innerText = week[num-2+7];
                            document.getElementById("day").children[i].append(newp);
                    	}else{
                    		var newp = document.createElement("p");
                            newp.innerText = week[num-2];
                            document.getElementById("day").children[i].append(newp);
                    	}
                        
                    }
                    else if((i+1)%7 == (ct-1)) {
                    	if(num<1){
                    		var newp = document.createElement("p");
                            newp.innerText = week[num-1+7];
                            document.getElementById("day").children[i].append(newp);
                    	}else{
                    		var newp = document.createElement("p");
                    		newp.innerText = week[num-1];
                            document.getElementById("day").children[i].append(newp);
                    	}
                    }
                }
                    var set = <%=today%>
                    
                    document.querySelector("#div1 ul").scrollLeft = (set-1)*85.5;
                    document.getElementById("dpre").addEventListener("click",function () {
                        let pscrollleft1 = document.querySelector("#div1 ul").scrollLeft - 600;
                        if(document.querySelector("#div1 ul").scrollLeft<=0) {
                            document.querySelector("#div1 ul").scrollLeft =0;
                        }else{
                            document.querySelector("#div1 ul").scrollLeft = pscrollleft1;
                        }
                        
                    });
                    document.getElementById("dnext").addEventListener("click",function () {
                        let pscrollleft1 = document.querySelector("#div1 ul").scrollLeft + 600;
                        if(document.querySelector("#div1 ul").scrollLeft>2052) {
                            document.querySelector("#div1 ul").scrollLeft =2052;
                        }else{
                            document.querySelector("#div1 ul").scrollLeft = pscrollleft1;
                        }
                        
                    });
                </script>
                <input type="text" name="" id="txtDate" value="달력">
                <!-- <script type="text/javascript">
                    
                    $(document).click(function() {
                        $('#txtDate').datepicker();
                        var date = $('#txtDate').value;
                        console.log(date);
                    });
                </script> -->

            </section>
            
            <section id="setting">
                옵션설정
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
                <div>전체기간</div>
            </section>
            <script>
            	var xre = document.getElementById("xgender").checked;
            	var yre = document.getElementById("ygender").checked;
            	document.getElementById("<%=local%>").selected=true;
            	
            	for(var i=0; i<document.getElementById("day").childElementCount; i++) {
                    document.getElementById("day").children[i].addEventListener("click",function(){
                    	
                    	var yeardata = <%=year%>;
                    	var monthdata = <%=month%>;
                    	var daydata = this.className;
                    	
                    	var datedata = yeardata+"-"+monthdata+"-"+daydata;
                    	var lo =  document.getElementById("local").value;
                  
                    	location.href = "${pageContext.request.contextPath}/msocial/slist?local="+lo+"&benefit="+<%=bene%>+"&close="+<%=clo%>+"&ygender="+yre+"&xgender="+xre+"&day="+datedata;
                    });
                }
            	
                document.getElementById("local").addEventListener("change",function(){
                	var re = this.value;
                    if(re == null) {
                    }
                    else{
                    	lo=this.value;
                    	location.href = "${pageContext.request.contextPath}/msocial/slist?local="+re+"&benefit="+<%=bene%>+"&close="+re+"&ygender="+yre+"&xgender="+xre+"&day="+'<%=day%>';
                    }
                });
                
                document.getElementById("close").checked=<%=clo%>;
                document.getElementById("close").addEventListener("click",function(){
                	var re = this.checked;
                	var lo =  document.getElementById("local").value;
                	location.href = "${pageContext.request.contextPath}/msocial/slist?local="+lo+"&benefit="+<%=bene%>+"&close="+re+"&ygender="+yre+"&xgender="+xre+"&day="+'<%=day%>';
                });
                
                if('<%=gender%>' == '혼성') {
                	document.getElementById("ygender").checked=true;
                	yre=true;
                	document.getElementById("xgender").checked=true;
                	xre=true;
                }else if('<%=gender%>'=='남'){
                	document.getElementById("ygender").checked=true;
                	yre=true;
                	document.getElementById("xgender").checked=false;
                	xre=false;
                }else if('<%=gender%>'=='여'){
                	document.getElementById("ygender").checked=false;
                	yre=false;
                	document.getElementById("xgender").checked=true;
                	xre=true;
                }else{
                	document.getElementById("ygender").checked=false;
                	yre=false;
                	document.getElementById("xgender").checked=false;
                	xre=false;
                }
                
                
                document.getElementById("ygender").addEventListener("click",function(){
                	yre = this.checked;
                	var lo =  document.getElementById("local").value;
                	location.href = "${pageContext.request.contextPath}/msocial/slist?local="+lo+"&benefit="+<%=bene%>+"&close="+<%=clo%>+"&ygender="+yre+"&xgender="+xre+"&day="+'<%=day%>';
                });
                document.getElementById("xgender").addEventListener("click",function(){
                	xre = this.checked;
                	var lo =  document.getElementById("local").value;
                	location.href = "${pageContext.request.contextPath}/msocial/slist?local="+lo+"&benefit="+<%=bene%>+"&close="+<%=clo%>+"&ygender="+yre+"&xgender="+xre+"&day="+'<%=day%>';
                });
            </script>

            <section id="list">
                경기목록
                	<c:forEach var="vo" items="${list}">
                	<div class="listclass">
						<div>${vo.pk}</div>
						<div>${vo.gameName}</div>
						<div>${vo.gameTime}</div>
						<div>${vo.benefit}</div>
						<div>${vo.gameGender}</div>
						<div>${vo.close}</div>
					</div>
					</c:forEach>
                
            </section>

        </main>
        <footer>
            <section>
                푸터
            </section>
        </footer>

    </section>
</body>
</html>