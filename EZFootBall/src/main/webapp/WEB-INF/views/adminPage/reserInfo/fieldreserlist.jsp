<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.Gcontainer{
		margin-top: 1%;
	}
	.Gheader_area{
		display: flex;
	    width: 100%;
	    height: 30px;
	    justify-content: space-between;
	    margin-bottom: 1%;
	}
	.Gselect_option{
		width: 30%;
	    display: flex;
	}
	#Gselect{
		width: 60%;
		border: 3px solid #42855B;
	}
	.GRsearch{
		width: 100%;
	}

	#Gsearch{
		width: 100%;
    	height: 30px;
    	border: 2px solid black;
    	padding-left : 5px;
	}
	.Gbutton{
		height: 30px;
	    justify-content: center;
	    display: flex;
	    align-items: center;
	   	width: 15%;
	    margin-left: 1%;
	}
	#Gbtn{
		font-size: 15px;
    	color: white;
    	height: 30px;
	    background-color: #42855B;
	    border: none;
	    border-radius: 10px;
	    width: 100%;
	}
	#Gbtn:hover{
		cursor : pointer;
		background-color : red;
		font-weight : 700;
		font-size : 20px;
	}

	table {
		border-collapse : collapse;
		
	}
	table tr th {
		width : 120px;
		height : 50px;
		border-bottom : 2px solid #D2D79F;
		background-color : #F8EDE3;
	}
	table tr td {
		height : 40px;
		text-align : center;
		border-bottom : 2px dotted #D2D79F;
	}
	#allCheck{
		width: 20px;
   		height: 30px;
	}
	.chBox{
		width: 20px;
    	height: 30px;
	}
	.Gdelete_btn{
	    background-color: #BDD2B6;
    	border: 0.5px solid black;
    	border-radius: 10px;
    	margin-bottom: 1%;
    	width: 10%;
	}
	.Gdelete_btn:hover {
		font-weight : 700;
		background-color : red;
		cursor : pointer;
	}
</style>
</head>
<body>
	<div class="Gcontainer">
		<form action="${pageContext.request.contextPath}/admin/reserselect1" method="post">
			<div class="Gheader_area">
				<div class="Gselect_option">
					<select name="Gselect" id="Gselect">
						<option value="">선택</option>
						<option value="fieldName">구장이름</option>
						<option value="rvDay">예약날짜</option>
						<option value="gameDay">매치날짜</option>
						<option value="rvCode">예약번호</option>
						<option value="fieldType">매치형태</option>
						<option value="userCode">신청자코드</option>
						<option value="gameCode">게임코드</option>
						<option value="userName">신청자이름</option>
					</select>
				</div>
				
				<div class="GRsearch">
					<input type="text" name="Gsearch" id="Gsearch" placeholder="카테고리에 맞게 단어를 검색하세요" />
				</div>
				<div class="Gbutton">
					<button id="Gbtn">검색</button>
				</div>	
			</div>
		<div class="buttons">
			<button class="Gdelete_btn">선택삭제</button>
		</div>
		<div class="rv_table_area">
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck"/></th>
						<th>예약 번호</th>
						<th>예약 날짜</th>
						<th>매치 날짜</th>
						<th>예약 시간</th>
						<th>구장 이름</th>
						<th>구장 주소</th>
						<th>구장 크기</th>
						<th>구장 대여비</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${team}">
						<tr>
							<td><input type="checkbox" name="chBox" class="chBox" data-gameCode="${i.gameCode}" /></td>
							<td>${i.rvCode}</td>
							<td>${i.rvDay}</td>
							<td>${i.gameDay}</td>
							<td>${i.gameTime}</td>
							<td>${i.fieldName}</td>
							<td>${i.fieldAddress}</td>
							<td>${i.fieldType}</td>
							<td>${i.fieldRentalfee}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</form>
	</div>
</body>
</html>