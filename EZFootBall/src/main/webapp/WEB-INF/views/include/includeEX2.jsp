
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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
                <button id="btn"> 확인 </button>
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
                for(var i=0; i<document.getElementById("day").childElementCount; i++) {
                    document.getElementById("day").children[i].addEventListener("click",function(){
                       
                       var yeardata = <%=year%>;
                       var monthdata = <%=month%>;
                       var daydata = this.className;
                       console.log(daydata);
                       
                       var datedata = yeardata+"-"+monthdata+"-"+daydata;
                       var lo =  document.getElementById("local").value;
                       //location.href = "${pageContext.request.contextPath}/msocial/cal?day="+datedata;
                       location.href = "${pageContext.request.contextPath}/msocial/slist?local="+lo+"&benefit="+<%=bene%>+"&close="+<%=clo%>+"&ygender="+yre+"&xgender="+xre+"&day="+datedata;
                    });
                }


                

                    document.getElementById("btn").addEventListener("click", function () {
                        let pscrollleft = document.querySelector("#div1 ul").scrollLeft;
                        let pscrolltop = document.querySelector("#div1 ul").scrollTop;
            
                        let str = `
                            scrollLeft : ${pscrollleft}
                            scrollTop : ${pscrolltop}
                            `
                        // alert(str);
                        console.log(str);
                        //여기 삭제해야댐~~~~
                    });
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
               console.log(yre);
               console.log(xre);
               document.getElementById("<%=local%>").selected=true;
                document.getElementById("local").addEventListener("change",function(){
                   var re = this.value;
                    if(re == null) {
                        console.log(re);
                    }
                    else{
                       lo=this.value;
                       let link_url = "${pageContext.request.contextPath}/msocial/slist?local="+re+"&benefit="+((<%=bene%>)?'':<%=bene%>)+"&close="+((<%=clo%>)?'':<%=clo%>)+"&ygender="+yre+"&xgender="+xre+"&day="+'<%=day%>';
                       //console.log(link_url);
                       location.href = link_url; 
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
                   console.log(yre);
                   console.log(xre);
                   var lo =  document.getElementById("local").value;
                   location.href = "${pageContext.request.contextPath}/msocial/slist?local="+lo+"&benefit="+<%=bene%>+"&close="+<%=clo%>+"&ygender="+yre+"&xgender="+xre+"&day="+'<%=day%>';
                });
                document.getElementById("xgender").addEventListener("click",function(){
                   xre = this.checked;
                   console.log(yre);
                   console.log(xre);
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
</body>
</html>