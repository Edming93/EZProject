<%@page import="com.sample.vo.UinVO"%>
<%@page import="com.sample.vo.UserVO"%>
<%@page import="com.sample.vo.GlistVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String lv = null;
	String level = null;
	int id = 0;
	if( (UinVO)session.getAttribute("urabil") != null) {
		UinVO vo = (UinVO)session.getAttribute("urabil");
		level =vo.getUserLevel();
		if(level != null){
			lv = level.substring(0,level.length()-1);
			id = vo.getUserCode();
		}
	}else {
		lv = null;
	}
	
%>
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
	
	<div>
		신청자 목록		
	</div>
	
	<div id="list">
	</div>
	
	<button id="subbtn">
		신청 버튼
	</button>
	
	<!--신청자 목록 출력  -->
	<script type="text/javascript">
	/* document.getElementById("subbtn").disabled = true; */
	var list = [];
	const closed = null;
	window.onload = function(e) {
		 let data = {game_num:${matchinfo.gameCode}};
		 
	      fetch("${pageContext.request.contextPath}/msocial/joinlist",{
	         method : "POST", // PUT, PATCH, DELETE
	         headers : {
	            "Content-Type" : "application/json"},
	         body : JSON.stringify(data)
	      }).then(response => response.json()) 
	      
	      .then(data => {
	         for ( let name in data) {   	        	
	        	   let data2 = {user_code:data[name].userCode}
	        	   fetch("${pageContext.request.contextPath}/msocial/joininfo",{
	      	         method : "POST", // PUT, PATCH, DELETE
	      	         headers : {
	      	            "Content-Type" : "application/json"},
	      	         body : JSON.stringify(data2)
	      	      }).then(response => response.json()) 
	      	      .then(data2 => {  
	      	    	  
	      	         for ( let name2 in data2) {
	      	        	const divlist = document.createElement("div");
	      	        	
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
	      	        	
	      	        	divlist.append(divn);
	      	        	divlist.append(divd);
	      	        	divlist.append(divg);
	      	        	divlist.append(divv);
	      	        	divlist.append(divl);
	      	        	
	      	        	document.getElementById("list").append(divlist);
	      	        	
	      	        	list.push(data2[name2].userCode); 
	      	         }
	      	         
	      	      }).catch(error => {
	      	         console.log("error");
	      	      });
			
	         }
	         
	      }).catch(error => {
	         console.log("error");
	      });
	};
	</script>
	<!--버튼 클릭  -->
	<script type="text/javascript">
	if('${matchinfo.close}' == 'false') {
		document.getElementById("subbtn").disabled = true;
	}
	
	var aa = ${matchinfo.gameMaxp} - ${matchinfo.gamePnum};
	var lev = '${matchinfo.level}';
	var level = lev.substring(0,lev.length-1);
	
	document.getElementById("subbtn").addEventListener("click",function(){
		var cnt = 0;
		for(var i=0; i<list.length; i++){
			if(list[i] == '<%=id%>'){
				cnt++;
			}
		}
		
		if (cnt > 0) {
			alert("이미 신청한 경기 입니다");
		}else {
			if('<%=lv%>' == null){
				if(aa == 1) {
					location.href = "${pageContext.request.contextPath}/msocial/maxgame?num="+${matchinfo.gameCode}
				}else{
					location.href = "${pageContext.request.contextPath}/msocial/subgame?num="+${matchinfo.gameCode}
				}
			}else if('<%=lv%>' == level){
				if(aa == 1) {
					location.href = "${pageContext.request.contextPath}/msocial/maxgame?num="+${matchinfo.gameCode}
				}else{
					location.href = "${pageContext.request.contextPath}/msocial/subgame?num="+${matchinfo.gameCode}
				}
			}else {
				alert("레벨에 맞지 않아 신청 할 수 없습니다");
			}
		}
	});
	
	
		
		
	</script>
</body>
</html>