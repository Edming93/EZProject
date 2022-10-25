<%@page import="com.sample.vo.UinVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>매치 정보 페이지 입니다</h1>
	<div>
		경기장에 맞는 사진
	</div>
	<div>
		매치포인트
		
		<div>레벨 : ${matchinfo.level}</div>
		<div>성별 :${matchinfo.gameGender}</div>
		<div>인원 : ${matchinfo.gamePnum}</div>
		<div>매치 : ${matchinfo.gameMacth}</div>
		<div>매니저 : ${matchinfo.gameMag}</div>
	</div>
	<div>
		<div>시간 : ${matchinfo.gameTime}</div>
		<div>경기명 : ${matchinfo.gameName}</div>
		<div>주소 : 경기장데이터</div>
	</div>
	
	<div id="list">
	
	</div>
	<button id="subbtn">
		신청 버튼
	</button>
	
	<!--신청자 목록  -->
	<script type="text/javascript">
	window.onload = function(e) {
		 let data = {game_code:${matchinfo.gameCode}};
		 
	      fetch("${pageContext.request.contextPath}/team/joinlist",{
	         method : "POST", // PUT, PATCH, DELETE
	         headers : {
	            "Content-Type" : "application/json"},
	         body : JSON.stringify(data)
	      }).then(response => response.json()) 
	      
	      .then(data => {
	         for ( let name in data) {
	        	 console.log(data[name])
	        	 const divlist = document.createElement("div");
	        	 
	        	 let data2 = {team_code:data[name]}
	        	 
	        	   fetch("${pageContext.request.contextPath}/team/joininfo",{
	      	         method : "POST", // PUT, PATCH, DELETE
	      	         headers : {
	      	            "Content-Type" : "application/json"},
	      	         body : JSON.stringify(data2)
	      	      }).then(response => response.json()) 
	      	      .then(data2 => {  
	      	    	  
	      	         for ( let name2 in data2) {
	      	        	const divinlist = document.createElement("div");
	      	        	
	      	        	var divn = document.createElement("div");
	      	        	divn.innerText = name + "이름 : " + data2[name2].userName;
	      	        	
	      	        	var divd = document.createElement("div");
	      	        	divd.innerText = name + "성별 : " + data2[name2].userGender;
	      	        	
	      	        	var divg = document.createElement("div");
	      	        	divg.innerText = name + "팀 : " + data2[name2].userGroup;
	      	        	
	      	        	var divv = document.createElement("div");
	      	        	divv.innerText = name + "승률 : " + data2[name2].userVr;
	      	        	
	      	        	var divl = document.createElement("div");
	      	        	divl.innerText = name + "레벨 : " + data2[name2].userLevel;
	      	        	
	      	        	divinlist.append(divn);
	      	        	divinlist.append(divd);
	      	        	divinlist.append(divg);
	      	        	divinlist.append(divv);
	      	        	divinlist.append(divl);
	      	        	
	      	        	divlist.append(divinlist);
	      	        	
	      	         }
	      	         
	      	      }).catch(error => {
	      	         console.log("error");
	      	      });
	        	 
	        	 document.getElementById("list").append(divlist); 
	         }
	         
	      }).catch(error => {
	         console.log("error");
	      });
	};
	</script>
	<script type="text/javascript">
	if('${matchinfo.close}' == 'false') {
		document.getElementById("subbtn").disabled = true;
	}
	var aa = ${matchinfo.gameMaxp} - ${matchinfo.gamePnum};
	document.getElementById("subbtn").addEventListener("click",function(){
		if(aa == 1) {
			location.href = "${pageContext.request.contextPath}/team/maxgame?num="+${matchinfo.gameCode}
		}else{
			location.href = "${pageContext.request.contextPath}/team/subgame?num="+${matchinfo.gameCode}
		}
	});
	
		
	</script>
</body>
</html>