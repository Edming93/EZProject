<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 관리</title>
</head>
<body>

<div id="comment"></div>
			<div id="input">
				<!-- 작성자 :
			<textarea name="name" id="name" cols="10" rows="3"></textarea>
			<hr /> -->

				<textarea name="content" id="content" placeholder="수정할 내용을 입력해 주세요"></textarea>
				<button id="submit">전송</button>
			</div>


<script type="text/javascript">
window.addEventListener("DOMContentLoaded", function(){
			let username = "${userdata.userName}";
			console.log(username);
			$.ajax({
				url : "${pageContext.request.contextPath}/review/comment",
				type : "POST",
				contentType:"application/json; charset=utf-8",
				dataType : "json",
				success : function(data){
					const comdiv = document.getElementById("comment");
					
					for(let comment of data){
						console.log(comment);	
					
						const div = document.createElement("div");
						div.style.display = "flex";
						div.style.flexDirection = "column";
						div.style.borderTop = "1px solid black";
						div.style.fontFamily = "Gowun Dodum";
						
						
                        const div2 = document.createElement("div");

                        div2.style.display = "flex";
                        div2.style.justifyContent = "center";
                        div2.style.fontSize = "25px";
                        const div3 = document.createElement("div");
                        div3.style.flex = "1";

                        
						
						const cname = document.createElement("p");
						cname.innerText = comment.userName;
						const ccontent = document.createElement("P");
						ccontent.innerText = comment.content;
						const cdate = document.createElement("p");
						cdate.innerText = comment.createDate;
						/* const cid = document.createElement("h4");
						cid.innerText = comment.id; */
						if (username == comment.userName) {
							const btn1 = document.createElement("button");
							const btn2 = document.createElement("button");
							btn1.style.borderRadius = "5px";
							btn2.style.borderRadius = "5px";
							btn1.style.backgroundColor = "#26A653";
							btn2.style.backgroundColor = "#26A653";
							btn1.style.color = "white";
							btn2.style.color = "white";
							btn1.style.border = "1px solid white";
							btn2.style.border = "1px solid white";
							btn1.innerText = "수정"
							btn2.innerText = "삭제"	
								//수정 버튼 클릭시 수정폼 생성
								btn1.addEventListener("click", function(){
									document.getElementById("input").style.display = "none";
									div2.classList.add('test3');
									btn1.id = "btnedit2";
									
									this.setAttribute("disabled", "disabled");
									
									const updateform = document.createElement("div");
									const updateinput = document.createElement("textarea");
									updateinput.cols = "30";
									updateinput.rows = "10";
									updateinput.placeholder="수정할 내용을 입력하세요"
									const updatebtn = document.createElement("button");
									updatebtn.innerText = "수정완료";
									updatebtn.style.borderRadius = "5px";
									updatebtn.style.backgroundColor = "#26A653";
									updatebtn.style.color = "white";
									updatebtn.style.border = "1px solid white";
									document.getElementsByClassName("test3")[0].style.display = "none";
									/* updateinput.append(updatebtn); */
									updateform.append(updateinput);
									 updateform.append(updatebtn);
									
									div.append(updateform);
							
									//수정버튼 연속 클릭시 연속 생성 제한거는 함수 찾기
									
									//수정완료 버튼 클릭시 수정된 내용으로 수정
									 updatebtn.addEventListener("click", function(){		
										 document.getElementById("input").style.display = "block";
									 	const target = document.getElementById('btnedit2');
									 	target.disabled = false; 
									 	document.getElementsByClassName("test3")[0].style.display = "flex";
									 	const content = updateinput.value;
									 	const createDate = new Date();
									 	//아이디값 받아오는게 문제듯
									 	const reviewCode = comment.reviewCode;
									 	const simple_data = {reviewCode, content, createDate};
									 		$.ajax({
									 			url : "${pageContext.request.contextPath}/review/comment/edit",
									 			type : "PUT",
									 			contentType:"application/json; charset=utf-8",
									 			dataType : "json",
									 			data : JSON.stringify(simple_data),
									 			success : function(data){
									 				if(data.state == "ok"){
									 					ccontent.innerText = content;
									 					var now = moment(createDate).format("YYYY-MM-DD HH:mm");
									 					cdate.innerText = now;
									 					updateform.remove();
									 				}
												
												}
									 		});
									 	});
									 });
								
								//삭제 버튼 이벤트
								btn2.addEventListener("click", function(){
									const reviewCode = comment.reviewCode;
									const simple_data = {reviewCode};
									$.ajax({
										url : "${pageContext.request.contextPath}/review/comment/delete",
										type : "delete",
										contentType:"application/json; charset=utf-8",
										dataType : "json",
										data : JSON.stringify(simple_data),
										success : function(data){
											if(data.state == "ok"){	
												div.remove();
											}
										},
										 error : function(e){
											alert(e);
										 }
//		 							
									});
								});
								div3.append(btn1);
								div3.append(btn2);
						}
						
						

						div.append(cdate);
						div.append(cname);
						div2.append(ccontent);
						div.append(div2);
						div.append(div3);
						comdiv.append(div);
						div.style.marginTop = "2%";
						comdiv.style.marginTop = "3%";
						comdiv.style.marginBottom = "3%";
						

						
						
					}
				},
				error : function(e){
					alert(e);
				}
			});		
		});
	</script>
</body>
</html>