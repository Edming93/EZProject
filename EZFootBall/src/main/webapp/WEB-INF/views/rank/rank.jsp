<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <style>
        #out {
       	 	padding-top: 20px;
            margin: 0 auto;
            width: 100%;
        }
        #out *{
            /* border: 1px solid black; */
        }
        .rankdiv{
            display: flex;
            align-items: center;
            height: 100px;
    		width: 89%;
    		margin: 0 auto;
    		margin-bottom: 20px;
            padding: 20px 20px;
            border: 3px solid #26A653;
            border-radius: 25px;
        }
        .rankdiv > div {
            height: 70px;
           
        }
        .numdiv{
            width: 10%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 35px;
            
        }
        .numdiv > div{
            padding: 0px 6px;
            /* border-bottom: 4px solid #798777; */
        }
        .innerdiv{
       		width:90%;
            display: flex;
            justify-content: space-around;
        }
        .innerdiv > div {
        }
        .namediv{
            width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }
        .scorediv{
            width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }
        .windiv{
        	width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }
        .losediv{
        	width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }
        .lediv{
        	width: 150px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 20px;
            padding-right: 20px;
        }

    </style>
</head>
<body>
<div id="out">
<%int num=1; %>
	<c:forEach var="rank" items="${rank}" > 
		<div id="rank<%=num%>" class="rankdiv">
			<div class="numdiv"><div><%=num%></div></div>
			<div class="innerdiv">
				<div class="namediv">${rank.userName}</div>
				<div class="scorediv">${rank.userScore} 점</div>
				<div class="windiv">${rank.userWin} 승</div>
				<div class="losediv">${rank.userLose} 패</div>
				<div class="lediv" id="${rank.userCode}"></div>
			</div>
			<%num++; %>
		</div>
 	</c:forEach>
 	
 	<!-- 레벨 가져오기 -->
 	<script type="text/javascript">
				window.onload = function(e) {
					for(let i=0; i< <%=num%>; i++) {
						let data = {user_code:document.getElementsByClassName("lediv")[i].id};
						let icon = document.getElementsByClassName("licon")[i];
						fetch("${pageContext.request.contextPath}/rank/selevel",{
					         method : "POST", // PUT, PATCH, DELETE
					         headers : {
					            "Content-Type" : "application/json"},
					         body : JSON.stringify(data)
					      }).then(response => response.json()) 
					      
					      .then(data => {
					    	  let level = data.userLevel
					    	  let lv = level.substring(0,level.length-1);
					    	  
					    	  //document.getElementsByClassName("lediv")[i].innerText = data.userLevel;
					    	  if(lv == '골드'){
					    		  document.getElementsByClassName("lediv")[i].innerHTML = "<iconify-icon icon='emojione-monotone:letter-g' style='color: #ffd233;' width='30' height='30'></iconify-icon>　" +　data.userLevel;
					    	  }else if (lv == '실버') {
					    		  document.getElementsByClassName("lediv")[i].innerHTML = "<iconify-icon icon='emojione-monotone:letter-s' style='color: #ccc;' width='30' height='30'></iconify-icon>　" +　data.userLevel;
					    	  }else if(lv == '브론즈'){
					    		  document.getElementsByClassName("lediv")[i].innerHTML = "<iconify-icon icon='emojione-monotone:letter-b' style='color: #a95608;' width='30' height='30'></iconify-icon>　" +　data.userLevel;
					    	  }else{
					    		  document.getElementsByClassName("lediv")[i].innerHTML = "<iconify-icon icon='emojione-monotone:letter-n' style='color: #26a653;' width='30' height='30'></iconify-icon>　";
					    	  }
					         
					      }).catch(error => {
					         console.log("error");
					      });
					}
				}
	</script>
	
	<!-- 1위 테두리 변경 -->
	<script type="text/javascript">
		document.getElementById("rank1").style.backgroundColor = "rgba(253, 242, 204, 0.66)";
		document.getElementById("rank1").style.borderColor = "#ffd233";
		document.getElementById("rank1").style.height = "170px";
		document.getElementById("rank1").style.width = "99%";
		document.getElementsByClassName("numdiv")[0].style.fontSize = "45px";
		document.getElementsByClassName("numdiv")[0].style.fontWeight = "600";
		document.getElementsByClassName("namediv")[0].style.fontSize = "30px";
		document.getElementsByClassName("scorediv")[0].style.fontSize = "30px";
		document.getElementsByClassName("windiv")[0].style.fontSize = "30px";
		document.getElementsByClassName("losediv")[0].style.fontSize = "30px";
		document.getElementsByClassName("lediv")[0].style.fontSize = "30px";
		document.getElementsByClassName("lediv")[0].style.padding = "0";
	</script>
	
	<!-- 2위 테두리 변경 -->
	<script type="text/javascript">
		document.getElementById("rank2").style.backgroundColor = "rgba(233, 233, 233, 0.58)";
		document.getElementById("rank2").style.borderColor = "#BBBBBB";
		document.getElementById("rank2").style.height = "150px";
		document.getElementById("rank2").style.width = "95%";
		document.getElementsByClassName("numdiv")[1].style.fontSize = "40px";
		document.getElementsByClassName("numdiv")[1].style.fontWeight = "400";
		document.getElementsByClassName("namediv")[1].style.fontSize = "25px";
		document.getElementsByClassName("scorediv")[1].style.fontSize = "25px";
		document.getElementsByClassName("windiv")[1].style.fontSize = "25px";
		document.getElementsByClassName("losediv")[1].style.fontSize = "25px";
		document.getElementsByClassName("lediv")[1].style.fontSize = "25px";
		
	</script>
	
	<!-- 3위 테두리 변경 -->
	<script type="text/javascript">
		document.getElementById("rank3").style.backgroundColor = "rgba(150, 99, 53, 0.39)";
		document.getElementById("rank3").style.borderColor = "#A95608";
		document.getElementById("rank3").style.height = "100px";
		document.getElementById("rank3").style.width = "91%";
	</script>

</div>
</body>
</html>