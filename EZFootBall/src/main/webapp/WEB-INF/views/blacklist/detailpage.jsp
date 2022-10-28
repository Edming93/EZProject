<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.container {
	display: grid;
	grid-template-columns: 200px 1fr 200px;
	grid-template-rows: 50px 50px 20px 300px 50px 10px 1fr 10px 50px;
	gap: 5px 5px;
	grid-auto-flow: row;
	grid-template-areas: ". . ." ". header ." ". . ." ". main ."
		". footer ." ". . ." ". comment ." ". . ." ". insert .";
}

.header {
	grid-area: header;
	display: grid;
	grid-template-columns: 75px 1fr;
	grid-template-rows: 1fr;
	gap: 3px;
	border-bottom: 1px solid black;
}

.main {
	grid-area: main;
	border: 1px solid black;
}

.footer {
	grid-area: footer;
	display: flex;
	flex-direction: row-reverse;
}

.comment {
	grid-area: comment;
	display: flex;
	flex-direction: column;
}

.insert {
	grid-area: insert;
	display: flex;
	flex-direction: row;
}

.insert>textarea {
	flex: 1;
}

.insert>button {
	width: 50px;
}
</style>
</head>
<body>



	<div class="container">
		<div class="header">
			<h4>제목 :</h4>
			<h4>${BlacklistVO.blacklistTitle}</h4>
		</div>
		<div class="editdelete" id="editdelete">
		<c:if test="${BlacklistVO.userId eq requestScope.userdata.userId}">
		<button id="editbtn">수정</button>
		<button id="deletebtn">삭제</button>
		</c:if>
		</div>
		<div class="main">
			<p>${BlacklistVO.blacklistContent}</p>
		</div>
		<div class="footer">
			<button id="backbtn">뒤로가기</button>
		</div>
		<div class="comment" id="comment"></div>
		<div class="insert" id="insert">
			<textarea name="inittext" id="inittext"></textarea>
			<button id="ibtn">댓글달기</button>
		</div>
	</div>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>	
	<script type="text/javascript">
	
	const commentmain = document.getElementById("comment");

	window.addEventListener('DOMContentLoaded', (e) => {
		fetch("${pageContext.request.contextPath}/blacklist/comment/${BlacklistVO.blacklistCode}")
		  .then(response => response.json())
		  .then(data => {
			  
			  console.log(data);
				
				let commentlist = [];
			  
			  for(const obj of data) {  
				  //상위댓글이 아무것도 없을때
				  if(obj.orderCode === 0){
					  commentlist.push(obj);
					  }else{
						  //else문 상위댓글과 자신이 쓰는 댓글 아이디 비교
						  for(const comp of data){
							  //만약 비교한 댓글 아이디가 상위댓글 번호와 같고
							  if(comp.commentCode == obj.orderCode){
								  //비교댓글의 리스트가 비었을 경우
								  if(comp.innerlist == null){
									  //리스트를 담을 배열을 생성
									  comp.innerlist = [];
								  }
								  	//그후 리스트 배열을 obj에 푸쉬
								  	comp.innerlist.push(obj);
								  	break;
							  }
						  }
					  }
				  } 
				
			  console.log(commentlist);
				  
			  //for obj commentlist 순환
			  for(const obj of commentlist){
				  makecommentlist(0,obj);
			  }
			  
		  }).catch(err => {
			  console.log(err);
		  });
	});
				  
			//위에서 실행할 makecommentlist 함수생성	  
			function makecommentlist(num, item){
				const maindiv = document.createElement("div");
				maindiv.style.border = "1px solid black";
				maindiv.style.padding = "5px";
				
				let lpad = (40*num) + 5;
				maindiv.style.paddingLeft = lpad + "px"; 
				
				const h4 = document.createElement("h4");
				h4.innerText = item.userName;
				const p = document.createElement("p");
				
				let content = (num > 0)?"↳":"";
				p.innerText = content + item.content;
						
				maindiv.append(h4);
				maindiv.append(p);
						
				commentmain.append(maindiv);
				
				// 아이템의 innerlist가 비어있지 않다면
				if(item.innerlist != null){
					for(const inneritem of item.innerlist){
						makecommentlist(num+1,inneritem);
					}
				}
			}	  
		
			
			
	
	document.getElementById("backbtn").addEventListener("click",function(){
		location.href = "${pageContext.request.contextPath}/blacklist/blacklistmain";
	});
	
	
document.getElementById("inittext").addEventListener("click", function(){
	

	//로그인 여부
	//로그인 컨트롤러에서 logincheck를 ajax로 불러옴

	$.ajax({
			url : "${pageContext.request.contextPath}/loginPage/logincheck",
			type : "GET",
			contentType:"application/json; charset=utf-8",
			dataType : "json",
			data : JSON.stringify(),
			success : function(data){

				if(data==false){
					Swal.fire({
					   title: '글쓰기를 위해 로그인 해주세요!',
					   text: '로그인 페이지로 이동하시겠습니까?',
					   icon: 'warning',
					   
					   
					   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
					   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
					   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
					   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
					   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
					   
 					   
					   reverseButtons: false, // 버튼 순서 거꾸로
					   
					}).then(result => {
					   // 만약 Promise리턴을 받으면,
					   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					   
						  location.href="${pageContext.request.contextPath}/loginPage/login";
					   	  	
					   }
					});
				}
		}
		});
	
});



document.getElementById("editbtn").addEventListener("click",function(){
	location.href = "${pageContext.request.contextPath}/blacklist/blacklistmain/editbbs/${BlacklistVO.blacklistCode}";
});



document.getElementById("deletebtn").addEventListener("click",function(){
	let isDelete = confirm("정말로 삭제하시겠습니까?");
	if(isDelete){
		location.href = "${pageContext.request.contextPath}/blacklist/blacklistmain/deletebbs/${BlacklistVO.blacklistCode}";
	}
});


</script>


</body>
</html>