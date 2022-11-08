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
		position:relative;
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
		height: 40px;
	    text-align: center;
	    border-bottom: 2px dotted #D2D79F;
	}
	
	#manager_List th {
		background-color: #F8EDE3;
		height: 50px;
    	border-bottom: 2px solid #D2D79F;
	}

	
	#check, #ck{
		width: 20px;
   		height: 30px;
	}
	
	#add_box{
		display:none;
		position: absolute;
		top: 100px;
    	left: 50%;
  	  	transform: translate(-50%, 0%);
		width: 300px;
		height: 300px;
		background: #eee;
		padding: 20px;
	}
	
	#add_box h5 {
		font-size: 16px;
		padding: 10px 0;
	}
	
	#add_box input{
		width: 100%;
		padding:5px 0;
		font-size: 16px;
	}
	
	.title_h5 {
		text-align: center;
		margin-bottom: 20px;
	}
	
	.btn_box2 {
		display:flex;
		width: 100%;
		justify-content: center;
	}
	
	.btn_box2 button{
		padding: 5px;
		margin: 5px;
		background: #fff;
		cursor: pointer;
	}
	
</style>
<body>
	<h1>매니저리스트</h1>
	<div id="main_container">
		<div class="btn_box">
			<button id="add" class="btn">추가</button>
			<button id="delete" class="btn">삭제</button>
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
				<td><input type="checkbox" name="ck" id="ck" class="ck"  userCode="${list.userCode}" /></td>
				<td>${list.userCode}</td>
				<td>${list.userId}</td>
				<td>${list.userName}</td>
				<td>${list.userBirth}</td>
				<td>${list.userGender}</td>
				<td>${list.userAddress}</td>
			</tr>				
			</c:forEach>
		</table>
		<div id="add_box">
			<h5 class="title_h5">매니저 추가</h5>
			<h5>유저 코드</h5>
			<input type="text" name="userCode" id="userCode" />
			<h5>유저 ID</h5>
			<input type="text" name="userId" id="userId" />
			<div class="btn_box2">
				<button id="box_add">추가</button>
				<button id="box_close">취소</button>
			</div>
		</div>
	</div>
	
	
	
	<script type="text/javascript">
		$("#check").click(function(){	 
			 if($("#check").prop("checked")) {
			  $(".ck").prop("checked", true);
			 } else {
			  $(".ck").prop("checked", false);
			 }
		});
		
		$(".ck").click(function(){
			$("#check").prop("checked", false);
		});
		
		$('#add').click(function(){
			$('#add_box').show();
		});
		
		$('#box_add').click(function(){
			const userId = $('#userId').val();
			const userCode = $('#userCode').val();
			
			var confirm_val = confirm("매니저를 추가하시겠습니까?");
			 
			if(confirm_val) {
				location.href = "${pageContext.request.contextPath}/admin/manageradd?userId="+userId+"&userCode="+userCode;
			}
		});
		
		$('#box_close').click(function(){
			$('#add_box').hide();
		});		
	</script>
	
	<script type="text/javascript">
		// 매니저 삭제
		$('#delete').click(function(){
			var confirm_val = confirm("매니저 삭제를 진행하시겠습니까?");
			 
			if(confirm_val) {
				var checkArr = new Array();
				  
				$("input[class='ck']:checked").each(function(){
				    checkArr.push($(this).attr("userCode"));
				});
				   
				   var chbox = new Array();
				   $.ajax({
				    url : "${pageContext.request.contextPath}/admin/magDelete",
				    type : "POST",
				  
				    data : { chbox : checkArr },
				    success : function(result){
				    	if(result == 1) { 
				    		location.href = "${pageContext.request.contextPath}/admin/magselect?magselect=magList";
			    		}else {
			    			alert("삭제 실패");
			    		}
		    		},
		    		error : function(){
		    			alert("삭제를 진행할 인원을 체크해주세요");
		    		}
		    	});
			}
		});
	</script>
</body>
</html>