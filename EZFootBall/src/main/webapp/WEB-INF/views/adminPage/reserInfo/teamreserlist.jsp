<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
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
	       width: 33%;
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
	   	width: 28%;
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
		<form action="${pageContext.request.contextPath}/admin/reserselect1" method="post">
			<div class="TCRHcon">
				<div class="TCRselectMenu">
					<select name="Tselect" id="Tselect">
						<option value="">검색</option>
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
				
					<div class="TCRsearch">
						<input type="text" name="Tsearch" id="Tsearch" />
					</div>
					<div class="TCRbutton">
						<button id="TCRbtn">검색</button>
					</div>
				
			</div>
		
		
		<div class="TcontentCon">
			<table border="1">
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck" />모두 선택</th>
						<th>예약 번호</th>
						<th>예약 시간</th>
						<th>예약 날짜</th>
						<th>매치 날짜</th>
						<th>구장 이름</th>
						<th>매치 형태</th>
						<th>신청자 코드</th>
						<th>신청자 이름</th>
						<th>게임 코드</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${team}">
						<tr>
							<td><input type="checkbox" name="chBox" class="chBox" data-gameCode="${i.gameCode}" /></td>
							<td>${i.rvCode}</td>
							<td>${i.gameTime}</td>
							<td>${i.rvDay }</td>
							<td>${i.gameDay }</td>
							<td>${i.fieldName }</td>
							<td>${i.fieldType }</td>
							<td>${i.userCode }</td>
							<td>${i.userName }</td>
							<td>${i.gameCode}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="buttons">
				<button class="Tdeletebtn">선택삭제</button>
		</div>
		</form>
	</div>
							
	<script type="text/javascript">
	/* 전체 선택 버튼 */
	$("#allCheck").click(function(){
		 
		 var chk = $("#allCheck").prop("checked");
		 if(chk) {
		  $(".chBox").prop("checked", true);
		 } else {
		  $(".chBox").prop("checked", false);
		 }
		
		});
	</script>
	
	<script type="text/javascript">
	/* 개별 선택 버튼 */
	 $(".chBox").click(function(){
		
		  $("#allCheck").prop("checked", false);
		 });
	
	</script>
	
	<script type="text/javascript">
	 $(".Tdeletebtn").click(function(){
		
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		 
		  if(confirm_val) {
		   var checkArr = new Array();
		  
		
		   
		   $("input[class='chBox']:checked").each(function(){
		    checkArr.push($(this).attr("data-gameCode"));
		    console.log(checkArr);
		   });
		   console.log("123131231"); 
		   
		   var chbox = new Array();
		   $.ajax({
		    url : "${pageContext.request.contextPath}/admin/TdeleteList",
		    type : "POST",
		  
		    data : { chbox : checkArr },
		    success : function(result){
	    	 if(result == 1) {          
// 	    		   location.href = "${pageContext.request.contextPath}/admin/magselect";
    		  } else {
    		   alert("삭제 실패");
    		  }
    		 },
    		 error : function(e){
					alert(e);
					
    		 }
    		});
		   }
     });
	</script>
</body>
</html>