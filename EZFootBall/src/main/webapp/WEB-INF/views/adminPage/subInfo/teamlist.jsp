<%@page import="com.sample.vo.GlistVO"%>
<%@page import="com.sample.vo.UserVO"%>
<%@page import="com.sample.vo.FieldReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<FieldReservationVO> stgamelist = null;
	List<UserVO>userlist = null;
	List<GlistVO> gamelist = null;
	
	if(session.getAttribute("stgamelist") != null){
		stgamelist = (List<FieldReservationVO>)session.getAttribute("stgamelist");
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
				<option value="subname">신청자</option>
				<option value="gamecode">경기번호</option>
				<option value="gday">경기일자</option>
				<option value="fieldname">경기장소</option>
				<option value="gnum">인원</option>
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
				<div>총 <%=stgamelist.size() %>건</div>
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
							<td>팀코드</td>
							<td>경기날짜</td>
							<td>경기장</td>
							<td>매치형태</td>
							<td>경기성별</td>
							<td>참여팀</td>
							<td>매니저</td>
						</tr>
					</thead>
					<tbody  id="tablelist">
						<%
							for(int i=0; i< stgamelist.size(); i++){
								%>
								<tr class="gamelist" id="list<%=i %>">
									<td><input type="checkbox" name="checkbox" class="checkbox"></td>
									<td class="gameCode">
										<%out.print(stgamelist.get(i).getGameCode()); %>
									</td>
									<td class="rvCode">
										<%out.print(stgamelist.get(i).getRvCode()); %>
									</td>
									<td class="userName">
										<%
											for(int j=0; j< userlist.size(); j++) {
												if(stgamelist.get(i).getUserCode() == userlist.get(j).getUserCode()){
													out.print(userlist.get(j).getUserName());
												}
											}
										%>
									</td>
									<td class="userCode">
										<%out.print(stgamelist.get(i).getUserCode()); %>
									</td>
									<td class="teamCode">
										<%out.print(stgamelist.get(i).getTeamCode()); %>
									</td>
									<td class="GameDay">
										<%out.print(stgamelist.get(i).getGameDay()); %>
									</td>
									<td class="fieldName">
										<%out.print(stgamelist.get(i).getFieldName()); %>
									</td>
									<td class="fieldType">
										<%out.print(stgamelist.get(i).getFieldType()); %>
									</td>
									<td class="GameGender">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(stgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGameGender());
												}
											}
										%>
									</td>
									<td class="GamePnum">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(stgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGamePnum());
												}
											}
										%>
									</td>
									<td class="GameMag">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(stgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
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
			if((stgamelist.size()/15)>=1){
				
				if((stgamelist.size()%15) == 0) {
					for(int i=1; i<=stgamelist.size()/15; i++){
						%>
						<a href="#" id="<%=i%>"> <%out.print(i); %> </a>
					<%
					}
				}else{
				
				for(int i=1; i<=stgamelist.size()/15+1; i++){
			%>
				<a href="#" id="<%=i%>"> <%out.print(i); %> </a>
			<%
					}
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
	for(let k=0; k< <%=stgamelist.size()%>; k++){
    	document.getElementById("tablelist").children[k].style.display = "none";
    }
	for(let k=0; k<15; k++){
    	document.getElementById("tablelist").children[k].style.display = "";
    }
		
	</script>
	
	<!-- 리스트 바꾸기 -->
	<script type="text/javascript">
		for(let i=0; i<document.getElementById("nev").children.length; i++){
			let j = i*15;
			
			document.getElementById("nev").children[i].addEventListener("click",function(){
	            for(let k=0; k< <%=stgamelist.size()%>; k++){
	            	document.getElementById("tablelist").children[k].style.display = "none";
	            }
	            
	            if(i==<%=stgamelist.size()/15%>){
	            	for(let k=j; k<<%=stgamelist.size()%>; k++){
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
		console.log("dididididi");
		
		/* 신청자 검색 */
		if(document.getElementById("select").value == "subname"){
			let cnt = 0;
			for(let i=0; i<document.getElementById("nev").children.length; i++){
				if(document.getElementsByClassName("userName")[i].innerText == document.getElementById("inputbox").value) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
					console.log("지워"+document.getElementById("tablelist").children[i].id);
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			console.log(num);
			for(let i=num; i<<%=stgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 경기번호 검색 */
		if(document.getElementById("select").value == "gamecode"){
			let cnt = 0;
			for(let i=0; i<document.getElementById("nev").children.length; i++){
				if(document.getElementsByClassName("gameCode")[i].innerText == document.getElementById("inputbox").value) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
					console.log("지워"+document.getElementById("tablelist").children[i].id);
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=stgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 경기일자 검색 */
		if(document.getElementById("select").value == "gday"){
			let cnt = 0;
			for(let i=0; i<document.getElementById("nev").children.length; i++){
				if(document.getElementsByClassName("GameDay")[i].innerText == document.getElementById("inputbox").value) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=stgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		/* 경기장소 검색 */
		if(document.getElementById("select").value == "fieldname"){
			let cnt = 0;
			for(let i=0; i<document.getElementById("nev").children.length; i++){
				if(document.getElementsByClassName("fieldName")[i].innerText == document.getElementById("inputbox").value) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=stgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		/* 매니저 검색 */
		if(document.getElementById("select").value == "mag"){
			let cnt = 0;
			for(let i=0; i<document.getElementById("nev").children.length; i++){
				if(document.getElementsByClassName("GameMag")[i].innerText == document.getElementById("inputbox").value) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=stgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 경기성별 검색 */
		if(document.getElementById("select").value == "gender"){
			let cnt = 0;
			for(let i=0; i<document.getElementById("nev").children.length; i++){
				if(document.getElementsByClassName("GameGender")[i].innerText == document.getElementById("inputbox").value) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=stgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
	});
	</script>

	<!-- 추가 -->
	<script type="text/javascript">
		
	</script>

	<!-- 삭제 -->
	<script type="text/javascript">
	 document.getElementById("del").addEventListener("click",function(){
		 var cklist = "rvCode=0";
		 var tclist = "teamCode=1";
		 var gclist = "gameCode=1";
		 for(var i=0; i< <%=stgamelist.size()%>; i++){
			 if(document.getElementsByClassName("checkbox")[i].checked == true){
				 
				 console.log(document.getElementsByClassName("rvCode")[i].innerText);
				 cklist = cklist + "&rvCode=" + document.getElementsByClassName("rvCode")[i].innerText;
				 tclist = tclist + "&teamCode=" + document.getElementsByClassName("teamCode")[i].innerText;
				 gclist = gclist + "&gameCode=" + document.getElementsByClassName("gameCode")[i].innerText;
			 }
		 }
		 console.log(cklist);
		 console.log(tclist);
		 console.log(gclist);
		 
		 var del = confirm("정말삭제하시겠습니까?");
		 if(del){
			 location.href = "${pageContext.request.contextPath}/sub/tdel?"+cklist+"&"+tclist+"&"+gclist;
		 }else{
			 location.reload();
		 }
		 
     });
	</script>


</body>
</html>