<%@page import="com.sample.vo.GlistVO"%>
<%@page import="com.sample.vo.UserVO"%>
<%@page import="com.sample.vo.FieldReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<FieldReservationVO> sgamelist = null;
	List<UserVO>userlist = null;
	List<GlistVO> gamelist = null;
	
	if(session.getAttribute("sgamelist") != null){
		sgamelist = (List<FieldReservationVO>)session.getAttribute("sgamelist");
	}
	if(session.getAttribute("userlist") != null){
		userlist = (List<UserVO>)session.getAttribute("userlist");
	}
	if(session.getAttribute("gamelist") !=null) {
		gamelist = (List<GlistVO>)session.getAttribute("gamelist");
	}
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#out * {
		border: 1px solid black;
	}
	
	#searchbox {
		display: flex;
		height: 80px;
		align-items: center;
		justify-content: space-between;
		padding: 0 30px;
	}
	
	#upside{
		display: flex;
		justify-content: space-between;
	}
</style>
</head>
<body>
	<div id="out">
		<div id="searchbox">
			<select name="" id="select">
				<option value="null">카테고리</option>
				<option value="subname">신청자</option>
				<option value="gamecode">경기번호</option>
				<option value="gday">경기일자</option>
				<option value="fieldname">경기장소</option>
				<option value="fieldtype">매치형태</option>
				<option value="gender">성별</option>
				<option value="mag">매니저</option>
			</select>


			<div id="saerch">
				<input type="text" name="" id="inputbox" placeholder="검색어를 입력하세요">
				<button id="sbtn">검색</button>
			</div>
		</div>

		<div id="result">
			<div id="upside">
				<div>총 <%=sgamelist.size() %>건</div>
				<div id="btnbox">
					<button id="add">추가</button>
					<button id="del">삭제</button>
				</div>
			</div>
			<div id="list">
				<table>
					<thead>
						<tr>
							<td><input type="checkbox" name="" id=""></td>
							<td>경기번호</td>
							<td>예약번호</td>
							<td>신청자</td>
							<td>신청자코드</td>
							<td>경기날짜</td>
							<td>경기장</td>
							<td>매치형태</td>
							<td>경기성별</td>
							<td>참여인원</td>
							<td>매니저</td>
						</tr>
					</thead>
					<tbody  id="tablelist">
						<%
							for(int i=0; i< sgamelist.size(); i++){
								%>
								<tr class="gamelist" id="list<%=i %>">
									<td><input type="checkbox" name="checkbox" class="checkbox"></td>
									<td class="gameCode">
										<%out.print(sgamelist.get(i).getGameCode()); %>
									</td>
									<td class="rvCode">
										<%out.print(sgamelist.get(i).getRvCode()); %>
									</td>
									<td class="userName">
										<%
											for(int j=0; j< userlist.size(); j++) {
												if(sgamelist.get(i).getUserCode() == userlist.get(j).getUserCode()){
													out.print(userlist.get(j).getUserName());
												}
											}
										%>
									</td>
									<td class="userCode">
										<%out.print(sgamelist.get(i).getUserCode()); %>
									</td>
									<td class="GameDay">
										<%out.print(sgamelist.get(i).getGameDay()); %>
									</td>
									<td class="fieldName">
										<%out.print(sgamelist.get(i).getFieldName()); %>
									</td>
									<td class="fieldType">
										<%out.print(sgamelist.get(i).getFieldType()); %>
									</td>
									<td class="GameGender">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(sgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGameGender());
												}
											}
										%>
									</td>
									<td class="GamePnum">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(sgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGamePnum());
												}
											}
										%>
									</td>
									<td class="GameMag">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(sgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGameMag());
												}
											}
										%>
									</td>
								</tr>
							<%}
						%>
					</tbody>
				</table>
			</div>
			<div id="nev">
			
			<%
			if((sgamelist.size()/15)>=1){
				for(int i=1; i<=sgamelist.size()/15+1; i++){
			%>
				<a href="#" id="<%=i%>"> <%out.print(i); %> </a>
			<%
				}
			}else{
			%>
				<a> 1 </a>
			<%
			}
			%>	
			</div>
		</div>

	</div>
	
	<!-- 초기 로딩시 -->
	<script type="text/javascript">
	for(let k=0; k< <%=sgamelist.size()%>; k++){
    	document.getElementById("tablelist").children[k].style.display = "none";
    }
	if(<%=sgamelist.size()%> <15) {
		for(let k=0; k<<%=sgamelist.size()%>; k++){
	    	document.getElementById("tablelist").children[k].style.display = "";
	    }
	}else{
		for(let k=0; k<15; k++){
	    	document.getElementById("tablelist").children[k].style.display = "";
	    }
	}
	
		
	</script>
	
	<!-- 리스트 바꾸기 -->
	<script type="text/javascript">
		for(let i=0; i<(<%=sgamelist.size()/15%>+1); i++){
			let j = i*15;
			
			document.getElementById("nev").children[i].addEventListener("click",function(){
	            for(let k=0; k< <%=sgamelist.size()%>; k++){
	            	document.getElementById("tablelist").children[k].style.display = "none";
	            }
	            
	            if(i==<%=sgamelist.size()/15%>){
	            	for(let k=j; k<<%=sgamelist.size()%>; k++){
		            	document.getElementById("tablelist").children[k].style.display = "";
		            	console.log("gma");
		            }
	            }else{
	            	for(let k=j; k<j+15; k++){
		            	document.getElementById("tablelist").children[k].style.display = "";
		            	console.log("durl");
		            }
	            }
	            
	        });
		}
	</script>

	<!-- 검색 -->
		<script type="text/javascript">
		document.getElementById("sbtn").addEventListener("click",function(){
		console.log(document.getElementById("select").value);
		
		
		/* 카테고리 */
		if(document.getElementById("select").value == "null"){
			
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				document.getElementById("tablelist").children[i].style.display = "";
				cnt++;
			}
			
			let num = Math.round((cnt / 15))+1;
			console.log(num);
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		/* 신청자 검색 */
		if(document.getElementById("select").value == "subname"){
			
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("userName")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value)!= -1){
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			console.log(num);
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 경기번호 검색 */
		if(document.getElementById("select").value == "gamecode"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("gameCode")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 경기일자 검색 */
		if(document.getElementById("select").value == "gday"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("GameDay")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		/* 경기장소 검색 */
		if(document.getElementById("select").value == "fieldname"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("fieldName")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 매치형태 검색 */
		if(document.getElementById("select").value == "fieldtype"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("fieldType")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		/* 매니저 검색 */
		if(document.getElementById("select").value == "mag"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("GameMag")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value)!= -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 경기성별 검색 */
		if(document.getElementById("select").value == "gender"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("GameGender")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
	});
	</script>
	
	
	<!-- 엔터키 검색 -->
	<script type="text/javascript">
	 var input = document.getElementById("inputbox");
	 input.addEventListener("keyup", function (event) {
         if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("sbtn").click();
         }
       });
	</script>
	

	<!-- 삭제 -->
	<script type="text/javascript">
		 document.getElementById("del").addEventListener("click",function(){
			 var cklist = "rvCode=0";
			 var gclist = "gameCode=1";
			 var uclist = "userCode=1";
			 for(var i=0; i< <%=sgamelist.size()%>; i++){
				 if(document.getElementsByClassName("checkbox")[i].checked == true){
					 
					 console.log(document.getElementsByClassName("rvCode")[i].innerText);
					 cklist = cklist + "&rvCode=" + document.getElementsByClassName("rvCode")[i].innerText;
					 uclist = uclist + "&userCode=" + document.getElementsByClassName("userCode")[i].innerText;
					 gclist = gclist + "&gameCode=" + document.getElementsByClassName("gameCode")[i].innerText;
				 }
			 }
			 console.log(cklist);
			 console.log(gclist);
			 console.log(uclist);
			 
			 var del = confirm("정말삭제하시겠습니까?");
			 if(del){
				 location.href = "${pageContext.request.contextPath}/sub/sdel?"+cklist+"&"+uclist+"&"+gclist;
			 }else{
				 location.reload();
			 }
			 
	     });
	</script>


</body>
</html>