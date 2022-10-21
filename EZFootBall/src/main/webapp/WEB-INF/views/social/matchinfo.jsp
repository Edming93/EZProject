<%@page import="com.sample.vo.GlistVO"%>
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
	<button id="subbtn">
		신청 버튼
	</button>
	<script type="text/javascript">
	var aa = ${matchinfo.gameMaxp} - ${matchinfo.gamePnum};
	console.log(${matchinfo.gameMaxp} - ${matchinfo.gamePnum});
	if(aa <=1) {
		console.log("마감");
		
	}else {
		
		console.log("추가");
	}
	
	document.getElementById("subbtn").addEventListener("click",function(){
		
		if(aa <1) {
			console.log("마감");
			location.href = "${pageContext.request.contextPath}/msocial/maxgame?num="+${matchinfo.sgameNum}
		}else {
			location.href = "${pageContext.request.contextPath}/msocial/subgame?num="+${matchinfo.sgameNum}
			console.log("추가");
		}
	});
	
	
		
		
	</script>
</body>
</html>