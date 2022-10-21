<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지풋볼</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="icon" href="../image/ez_con.png">
<link rel="stylesheet" href="../css/review.css">
<style>
.main_logo{
    background: url("${pageContext.request.contextPath}/image/ez_logo.svg") no-repeat center;
    background-size:65px 35px;
    cursor: pointer;
}
</style>
</head>
<body>
<div class="container">
    <div class="header_container">
        <div class="header_area">
            <div class="header_content">
                <div class="header_left main_logo">
<!-- 					<img class="ez_icon" src="/image/ez_logo.svg"> -->
                </div>
                <div class="header_right login_btn etc_btn">
                    <input type="text" class="search_input">
                    <div class="login_icon">
                        <a href="${pageContext.request.contextPath}/loginPage/login">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2ZM9 7C9 5.34315 10.3431 4 12 4C13.6569 4 15 5.34315 15 7C15 8.65685 13.6569 10 12 10C10.3431 10 9 8.65685 9 7Z" fill="#464A54"/>
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M12 13.5C7.5502 13.5 5.07689 15.0054 3.93312 16.0093C3.22723 16.6288 3 17.4996 3 18.2447C3 20.3187 4.68132 22 6.75534 22H17.2447C19.3187 22 21 20.3187 21 18.2447C21 17.4996 20.7728 16.6288 20.0669 16.0093C18.9231 15.0054 16.4498 13.5 12 13.5ZM5.25244 17.5124C6.03934 16.8217 8.04626 15.5 12 15.5C15.9537 15.5 17.9607 16.8217 18.7476 17.5124C18.8856 17.6335 19 17.8668 19 18.2447C19 19.2141 18.2141 20 17.2447 20H6.75534C5.78589 20 5 19.2141 5 18.2447C5 17.8668 5.11441 17.6335 5.25244 17.5124Z" fill="#464A54"/>
                            </svg>
                        </a>
                    </div>
                    <div class="etc_icon">
                        <a href="${pageContext.request.contextPath}/etc/etc">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M5.5 10.5C6.32843 10.5 7 11.1716 7 12C7 12.8284 6.32843 13.5 5.5 13.5C4.67157 13.5 4 12.8284 4 12C4 11.1716 4.67157 10.5 5.5 10.5Z" fill="#464A54"/>
                                <path d="M12 10.5C12.8284 10.5 13.5 11.1716 13.5 12C13.5 12.8284 12.8284 13.5 12 13.5C11.1716 13.5 10.5 12.8284 10.5 12C10.5 11.1716 11.1716 10.5 12 10.5Z" fill="#464A54"/>
                                <path d="M18.5 10.5C19.3284 10.5 20 11.1716 20 12C20 12.8284 19.3284 13.5 18.5 13.5C17.6716 13.5 17 12.8284 17 12C17 11.1716 17.6716 10.5 18.5 10.5Z" fill="#464A54"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="big_menu_container">
        <div class="big_menu_area">
            <div class="big_menu_content">
                <div class="menu menu1"><a class="menu1_a" href="${pageContext.request.contextPath}/">소셜 매치</a></div>
                <div class="menu menu2"><a class="menu2_a" href="${pageContext.request.contextPath}/">팀 매치</a></div>
                <div class="menu menu3"><a class="menu3_a" href="${pageContext.request.contextPath}/rental/rental">구장 예약</a></div>
                <div class="menu menu4"><a class="menu4_a" href="#">랭킹</a></div>
                <div class="menu menu5"><a class="menu5_a" href="${pageContext.request.contextPath}/review/reviewmain">커뮤니티</a></div>
            </div>
        </div>

    </div>

	<div class="reviewmain1">
		 <div class="banner_container">
            <div class="banner_content_area">
                <div class="banner_content">
                    <img class="banner_image" src="../image/banner-manner_pc.png" alt="">
                </div>
            </div>
        </div>
		<hr>
		<div class ="reviewcome">
		<h1>이지 풋볼에 게임 후기를 남겨주세요!</h1>
		</div>
		<hr />
		<div id="comment"></div>
		<hr/>
		<div id="input">
			<!-- 작성자 :
			<textarea name="name" id="name" cols="10" rows="3"></textarea>
			<hr /> -->
			댓글 :
			<textarea name="content" id="content" cols="100" rows="10"
				placeholder="댓글을 입력해 주세요"></textarea>
			<button id="submit">전송</button>
		</div>
		<hr />

		
		

		<script type="text/javascript">
		document.getElementById("submit").addEventListener("click", function(){
			
			/* let owner = document.getElementById("name").value; */
			let content = document.getElementById("content").value;
			/* const simple_data = {owner, content}; */
			const simple_data = {content};
			console.log(simple_data);
			//댓글 작성
			$.ajax({
				url : "${pageContext.request.contextPath}/review/comment/save",
				type : "POST",
				contentType:"application/json; charset=utf-8",
				dataType : "json",
				data : JSON.stringify(simple_data),
				/* anync : false, */
				success : function(data){
					console.log(data);
					if(data.state == "ok"){
						const comdiv = document.getElementById("comment");
						
						const div = document.createElement("div");
						div.classList.add('test');
						div.style.border = "1px solid black";
						
						const div2 = document.createElement("div");
						div2.classList.add('test2');
						const cname = document.createElement("h4");
						cname.innerText = "작성자 :"+data.vo.userName;
						const ccontent = document.createElement("p");
						ccontent.innerText = content;
						const cdate = document.createElement("h3");
						cdate.innerText = data.vo.createDate;
						/* const cid = document.createElement("h4");
						cid.innerText = data.vo.id; */
						const btn1 = document.createElement("button");
						btn1.innerText = "수정"
						btn1.id = "btnedit";
						const btn2 = document.createElement("button");
						btn2.innerText = "삭제"
						
						div.append(btn1);
						div.append(btn2);
					/* 	div.append(cid); */
			 			div.append(cdate); 
			 			div.append(cname);
						div2.append(ccontent);
						div.append(div2);
						comdiv.append(div);
						console.log("simple_data")
						
						//수정 버튼 클릭시 수정폼 생성
						btn1.addEventListener("click", function(){
							
							this.setAttribute("disabled", "disabled");
							const updateform = document.createElement("div");
							updateform.style.border = "1px solid black";
							const updateinput = document.createElement("textarea");
							updateinput.cols = "40";
							updateinput.rows = "10";
							const updatebtn = document.createElement("button");
							updatebtn.innerText = "수정완료";
							
							document.getElementsByClassName("test2")[0].style.display = "none";
							updateform.append(updateinput);
							updateform.append(updatebtn);
							div.append(updateform);
							
							//수정완료 버튼 클릭시 수정된 내용으로 수정
							 updatebtn.addEventListener("click", function(){						 
							 	console.log("simple_data")
							 	const target = document.getElementById('btnedit');
							 	target.disabled = false;
							 	document.getElementsByClassName("test2")[0].style.display = "block";
							 	const content = updateinput.value;
							 	const id = data.vo.id;
							 	//const date = new Date();
							 	const simple_data = {id, content};
							 	
							 	$.ajax({
							 			url : "${pageContext.request.contextPath}/review/comment/edit",
							 			type : "PUT",
							 			contentType:"application/json; charset=utf-8",
							 			dataType : "json",
							 			data : JSON.stringify(simple_data),
							 			success : function(data){
							 				if(data.state == "ok"){
							 					ccontent.innerText = content;
							 					updateform.remove();
							 				}
											console.log("simple_data")
										}
							 		});
							 	});
							 });
						
						
						//삭제 버튼 이벤트 리스너
						btn2.addEventListener("click", function(){
							const id = data.vo.id;
							const simple_data = {id};
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
							});
						});
						
					}
				},
					error : function(e){
						alert(e);
				}
				
			});
			
		});
		
		
		//db에서 댓글 가져오기
		window.addEventListener("DOMContentLoaded", function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/review/comment",
				type : "POST",
				contentType:"application/json; charset=utf-8",
				dataType : "json",
				success : function(data){
					const comdiv = document.getElementById("comment");
					
					for(let comment of data){
						const div = document.createElement("div");
						div.style.border = "1px solid black";
                        const div2 = document.createElement("div");
						const cname = document.createElement("h4");
						cname.innerText = "작성자 :"+comment.userName;
						const ccontent = document.createElement("p");
						ccontent.innerText = comment.content;
						const cdate = document.createElement("h3");
						cdate.innerText = comment.createDate;
						/* const cid = document.createElement("h4");
						cid.innerText = comment.id; */
						const btn1 = document.createElement("button");
						btn1.innerText = "수정"
						const btn2 = document.createElement("button");
						btn2.innerText = "삭제"
                        
						
						div.append(btn1);
						div.append(btn2);
						/* div.append(cid); */
						div.append(cdate);
						div.append(cname);
						div2.append(ccontent);
						div.append(div2);
						comdiv.append(div);

						//수정 버튼 클릭시 수정폼 생성
						btn1.addEventListener("click", function(){
							div2.classList.add('test3');
							btn1.id = "btnedit2";
							
							this.setAttribute("disabled", "disabled");
							
							const updateform = document.createElement("div");
							updateform.style.border = "1px solid black";
							const updateinput = document.createElement("textarea");
							updateinput.cols = "30";
							updateinput.rows = "10";
							const updatebtn = document.createElement("button");
							updatebtn.innerText = "수정완료";
							
							document.getElementsByClassName("test3")[0].style.display = "none";
							updateform.append(updateinput);
							updateform.append(updatebtn);
							div.append(updateform);
					
							//수정버튼 연속 클릭시 연속 생성 제한거는 함수 찾기
							
							//수정완료 버튼 클릭시 수정된 내용으로 수정
							 updatebtn.addEventListener("click", function(){						 
							 	console.log("simple_data");
							 	const target = document.getElementById('btnedit2');
							 	target.disabled = false;
							 	document.getElementsByClassName("test3")[0].style.display = "block";
							 	const content = updateinput.value;
							 	//아이디값 받아오는게 문제듯
							 	const id = comment.id;
							 	const simple_data = {id, content};
							 		$.ajax({
							 			url : "${pageContext.request.contextPath}/review/comment/edit",
							 			type : "PUT",
							 			contentType:"application/json; charset=utf-8",
							 			dataType : "json",
							 			data : JSON.stringify(simple_data),
							 			success : function(data){
							 				if(data.state == "ok"){
							 					ccontent.innerText = content;
							 					updateform.remove();
							 				}
											console.log("simple_data")
										}
							 		});
							 	});
							 });
						

						//삭제 버튼 이벤트
						btn2.addEventListener("click", function(){
							const id = comment.id;
							const simple_data = {id};
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
				
								/*error : function(request, status, error) {
							        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);*/
								}
							});
						});
					}
				},
				error : function(e){
					alert(e);
				}
			});		
		});
	</script>
	</div>

</body>
</html>