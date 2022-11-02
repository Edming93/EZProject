<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>팀 매치 예약 현황</title>
<style type="text/css">
	.TCRcontainer{
		margin-top: 1%;
	}
	.TCRHcon{
		display: flex;
	    width: 100%;
	    height: 30px;
	    justify-content: space-between;
	    margin-bottom: 1%;
	}
	.TCRselectMenu{
		width: 30%;
	    padding-left: 1%;
	    display: flex;
	}
	.Tselect{
		width: 30%;
	}
	.TCRsearchArea{
		display: flex;
	    width: 55%;
	}
	#Tsearch{
		width: 100%;
    	height: 30px;
	}
	.TCRbutton{
		height: 30px;
	    justify-content: center;
	    display: flex;
	    align-items: center;
	    background-color: black;
	    width: 13%;
	    margin-left: 1%;
	}
	#TCRbtn{
		font-size: 15px;
    	color: white;
	}
</style>
</head>
<body>
	<div class="TCRcontainer">
		<div class="TCRHcon">
			<div class="TCRselectMenu">
				<select name="Tselect" id="Tselect">
					<option value="">검색</option>
					<option value="지역">지역</option>
					<option value="구장이름">구장이름</option>
					<option value="예약날짜">예약날짜</option>
					<option value="매치날짜">매치날짜</option>
					<option value="예약번호">예약번호</option>
					<option value="매치형태">매치형태</option>
					<option value="성별">성별</option>
					<option value="신청자코드">신청자코드</option>
					<option value="게임코드">게임코드</option>
					<option value="신청자이름">신청자이름</option>
				</select>
			</div>
			<div class=TCRsearchArea>
				<div class="TCRsearch">
					<input type="text" name="Tsearch" id="Tsearch" />
				</div>
				<div class="TCRbutton">
					<span id="TCRbtn">검색</span>
				</div>
			</div>
		</div>
		
		<div class="TcontentCon">
			<table border="1">
				<thead>
					<tr>
						<th><input type="checkbox" name="" id="" /></th>
						<th>예약번호</th>
						<th>예약시간</th>
						<th>예약날짜</th>
						<th>매치날짜</th>
						<th>구장이름</th>
						<th>매치형태</th>
						<th>신청자코드</th>
						<th>신청자이름</th>
						<th>게임코드</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${team}">
						<tr>
							<td><input type="checkbox" name="" id="" /></td>
							<td>${i.rvCode}</td>
							<td>${i.gameTime}</td>
							<td>${i.rvDay }</td>
							<td>${i.gameDay }</td>
							<td>${i.fieldName }</td>
							<td>${i.fieldType }</td>
							<td>${i.userCode }</td>
							<td>${i.userVO.userName }</td>
							<td>${i.gameCode}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>