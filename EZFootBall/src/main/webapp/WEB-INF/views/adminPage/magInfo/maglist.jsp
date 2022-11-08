<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<style>
	*{
		box-sizing: border-box;
		margin: 0;
	}
	
	#main_container{
		display: flex;
		flex-direction: column;
	}
	
	.btn_box{
		width:10%;
		align-self: flex-end;
	}
	
	.btn{
    	color: #fff;
    	height: 30px;
	    background-color: #26a563;
	    border: none;
	    border-radius: 10px;
	    width: 45%;
	    cursor: pointer;
	}
	
	#manager_List{
		width: 100%;
		border-collapse: collapse;
		font-size: 14px;
		margin: 20px 0;
	}
	
	#manager_List th, td {
		border-bottom: 1px solid black;
		padding: 10px;
		text-align: center;
	}
	
	#manager_List th {
		border-bottom: 1px solid black;
	}
	
	#check, #ck{
		width: 20px;
   		height: 30px;
	}
	
</style>
<body>
	<h1>매니저리스트</h1>
	<div id="main_container">
		<div class="btn_box">
			<button id="pass" class="btn">버튼1</button>
			<button id="fail" class="btn">버튼2</button>
		</div>
		<table id="manager_List">
			<tr>
				<th><input type="checkbox" name="check" id="check" /></th>
				<th>유저코드</th>
				<th>유저ID</th>
				<th>유저이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>주소</th>
			</tr>
			<c:forEach var="list" items="${managerList}">
			<tr class="item_box">
				<td><input type="checkbox" name="ck" id="ck" class="ck" /></td>
				<td>${list.userCode}</td>
				<td>${list.userId}</td>
				<td>${list.userName}</td>
				<td>${list.userBirth}</td>
				<td>${list.userGender}</td>
				<td>${list.userAddress}</td>
			</tr>				
			</c:forEach>
		</table>
	</div>
</body>
</html>