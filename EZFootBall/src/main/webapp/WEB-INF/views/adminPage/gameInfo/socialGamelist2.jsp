<%@page import="java.util.ArrayList"%>
<%@page import="com.sample.vo.GlistVO"%>
<%@page import="com.sample.vo.UserVO"%>
<%@page import="com.sample.vo.FieldReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<UserVO>userlist = null;
	List<GlistVO> gamelist = new ArrayList<GlistVO>();
	
	if(session.getAttribute("userlist") != null){
		userlist = (List<UserVO>)session.getAttribute("userlist");
	}
	if(session.getAttribute("gamelist") !=null) {
		List<GlistVO> allgamelist = (List<GlistVO>)session.getAttribute("gamelist");
		for(int i=0; i<allgamelist.size(); i++){
			if(allgamelist.get(i).getGameType().equals("S")){
				gamelist.add(allgamelist.get(i));
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<div id="out">
		<div id="searchbox">
			<select name="" id="select">
				<option value="null">카테고리</option>
				<option value="gameCode">경기번호</option>
				<option value="gameDay">경기날짜</option>
				<option value="gameTime">경기시간</option>
				<option value="level">경기레벨</option>
				<option value="gameMacth">매치형태</option>
				<option value="mag">매니저</option>
			</select>


			<div id="saerch">
				<input type="text" name="" id="inputbox" placeholder="검색어를 입력하세요">
				<button id="sbtn">검색</button>
			</div>
		</div>

		<div id="result">
			<div id="upside">
				<div>총 건</div>
				<div id="btnbox">
					<button id="add">추가</button>
					<button id="del">삭제</button>
				</div>
			</div>
			<div id="list">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="" id="Cbox"></th>
							<th>경기번호</th>
							<th>경기날짜</th>
							<th>경기시간</th>
							<th>경기레벨</th>
							<th>경기형태</th>
							<th>마감여부</th>
							<th>최소인원</th>
							<th>최대인원</th>
							<th>신청인원</th>
							<th>매니저</th>
							<th>참가비</th>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
			</div>
			
			<div id="nev">
			<a id="pre"> 이전 </a>
			<%
			if(gamelist.size()%15 == 0 ) {
				for(int i=1; i<=gamelist.size()/15;i++){
					if(i>15) {
						%>
						<a class="listnum" id="num<%=i%>" style="display: none;"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a class="listnum" id="num<%=i%>"> <% out.print(i); %> </a>
						<%
					}
				}
			}else{
				for(int i=1; i<=gamelist.size()/15 + 1;i++){
					if(i>15) {
						%>
						<a class="listnum" id="num<%=i%>" style="display: none;"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a class="listnum" id="num<%=i%>"> <% out.print(i); %> </a>
						<%
					}
				}
				
			}
				
			%>
			<a id="next"> 다음 </a>
			</div>
		</div>
		
	<!-- 초기 리스트 가져오기 및 페이지리스트-->
	<script type="text/javascript">
	let listselect = 0;
	let end = 0;
	
	window.onload = function(e) {
		if(<%=gamelist.size()%15==0%>){
			end = <%=gamelist.size()/15%>;
		}else{
			end = <%=gamelist.size()/15%> + 1;
		}
		/* 초기 리스트 */
		let params = {gameType:'S'};
		$.ajax({
		      url:"${pageContext.request.contextPath}/game/list",
		      type:"POST",
		      contentType:"application/json; charset=utf-8",
		      dataType : "json",
		      data:JSON.stringify(params), 
		      success: function(data) {
		    	  for ( let name in data){
		    		  let ntr =  document.createElement("tr");
		    		  ntr.className = "trbox";
		    		  ntr.id = "tr"+name;
		    		  
		    		  
		    		  let ncb = document.createElement("tr");
		    		  let nin = document.createElement("input");
		    		  nin.type = "checkbox";
		    		  nin.className="checkbox";
		    		  ncb.append(nin);
		    		  ntr.append(ncb);
		    		  
		    		  
		    		  let ngc =  document.createElement("th");
		    		  ngc.className = "gameCode";
		    		  ngc.id = "gc"+name;
		    		  ngc.innerText = data[name].gameCode;
		    		  ntr.append(ngc);
		    		  
		    		  let ngd =  document.createElement("th");
		    		  ngd.className = "gameDay";
		    		  ngd.id = "gd"+name;
		    		  ngd.innerText = data[name].gameDay;
		    		  ntr.append(ngd);
		    		  
		    		  let ngt = document.createElement("th");
		    		  ngt.className = "gameTime";
		    		  ngt.id = "gt"+name;
		    		  ngt.innerText = data[name].gameTime;
		    		  ntr.append(ngt);
		    		  
		    		  let ngl = document.createElement("th");
		    		  ngl.className = "gameLevel";
		    		  ngl.id = "gl"+name;
		    		  ngl.innerText = data[name].level;
		    		  ntr.append(ngl);
		    		  
		    		  let nge = document.createElement("th");
		    		  nge.className = "gameType";
		    		  nge.id = "ge"+name;
		    		  nge.innerText = data[name].gameMacth;
		    		  ntr.append(nge);
		    		  
		    		  let ngo = document.createElement("th");
		    		  ngo.className = "gameClose";
		    		  ngo.id = "go"+name;
		    		  if(data[name].close == "true"){
		    			  ngo.innerText = "신청가능";
		    		  }else{
		    			  ngo.innerText = "마감";
		    		  }
		    		  ntr.append(ngo);
		    		  
		    		  let ngn = document.createElement("th");
		    		  ngn.className = "numMin";
		    		  ngn.id = "gn"+name;
		    		  ngn.innerText = data[name].gameMinp;
		    		  ntr.append(ngn);
		    		  
		    		  let ngx = document.createElement("th");
		    		  ngx.className = "numMax";
		    		  ngx.id = "gx"+name;
		    		  ngx.innerText = data[name].gameMaxp;
		    		  ntr.append(ngx);
		    		  
		    		  let ngp = document.createElement("th");
		    		  ngp.className = "numP";
		    		  ngp.id = "gp"+name;
		    		  ngp.innerText = data[name].gamePnum;
		    		  ntr.append(ngp);
		    		  
		    		  let ngm = document.createElement("th");
		    		  ngm.className = "gameMag";
		    		  ngm.id = "gm"+name;
		    		  ngm.innerText = data[name].gameMag;
		    		  ntr.append(ngm);
		    		  
		    		  let ngy = document.createElement("th");
		    		  ngy.className = "gamePay";
		    		  ngy.id = "gy"+name;
		    		  ngy.innerText = data[name].gamePay;
		    		  ntr.append(ngy);
		    		  		    		  
		    		  document.getElementById("tbody").append(ntr);
		    		  
		    		  
		    	  }
		    	  
		      },
		      error: function() {
		          alert("에러 발생");
		      }
		  })
	}
	</script>

	<!-- 이전/다음 -->
	<script type="text/javascript">	
	/* 이전 버튼 */
	document.getElementById("pre").addEventListener("click",function(){
		if(listselect - 15 >=0){
			listselect = listselect - 15;
		}else{
			listselect = 0;
		}
		
		for(let i=0; i< document.getElementsByClassName("listnum").length; i++) {
			document.getElementsByClassName("listnum")[i].style.display = "none";
		}
		for(let i= listselect; i<listselect+15; i++){
			document.getElementsByClassName("listnum")[i].style.display = "";
		}
		
	});
	
	
	/* 다음 버튼 */
	document.getElementById("next").addEventListener("click",function(){
		if(listselect + 15 >=(end-15)){
			listselect = end-15;
		}else{
			listselect = listselect + 15;
		}
		
		for(let i=0; i< document.getElementsByClassName("listnum").length; i++) {
			document.getElementsByClassName("listnum")[i].style.display = "none";
		}
		for(let i= listselect; i<listselect+15; i++){
			document.getElementsByClassName("listnum")[i].style.display = "";
		}
		
	});
	
	</script>
	
	<!-- 페이징 버튼 -->
	<script type="text/javascript">
	for(let i=0; i< document.getElementsByClassName("listnum").length; i++) {
		document.getElementsByClassName("listnum")[i].addEventListener("click",function(){
			if (this.innerText > (end-8)){
				listselect = end-15;
		        for(let j=0; j< document.getElementsByClassName("listnum").length; j++){
		        	document.getElementsByClassName("listnum")[j].style.display = "none";
		        }
		        for(let j= listselect; j<listselect+15; j++){
					document.getElementsByClassName("listnum")[j].style.display = "";
				}
		        
			}else if(this.innerText >=8){
				listselect = this.innerText - 8;
		        for(let j=0; j< document.getElementsByClassName("listnum").length; j++){
		        	document.getElementsByClassName("listnum")[j].style.display = "none";
		        }
		        for(let j= listselect; j<listselect+15; j++){
					document.getElementsByClassName("listnum")[j].style.display = "";
				}
		        
			}else if (this.innerText <8){
				listselect = 0;
		        for(let j=0; j< document.getElementsByClassName("listnum").length; j++){
		        	document.getElementsByClassName("listnum")[j].style.display = "none";
		        }
		        for(let j= listselect; j<listselect+15; j++){
					document.getElementsByClassName("listnum")[j].style.display = "";
				}
			}
			let num = this.innerText;
			let numdata = {num:this.innerText,gameType:'S'};
			$.ajax({
			      url:"${pageContext.request.contextPath}/game/searchlist",
			      type:"POST",
			      contentType:"application/json; charset=utf-8",
			      dataType : "json",
			      data:JSON.stringify(numdata), 
			      success: function(data) {
			    	  document.getElementById("tbody").innerHTML="";
			    	  for ( let name in data){
			    		  let ntr =  document.createElement("tr");
			    		  ntr.className = "trbox";
			    		  ntr.id = "tr"+name;
			    		  
			    		  
			    		  let ncb = document.createElement("tr");
			    		  let nin = document.createElement("input");
			    		  nin.type = "checkbox";
			    		  nin.className="checkbox";
			    		  ncb.append(nin);
			    		  ntr.append(ncb);
			    		  
			    		  
			    		  let ngc =  document.createElement("th");
			    		  ngc.className = "gameCode";
			    		  ngc.id = "gc"+name;
			    		  ngc.innerText = data[name].gameCode;
			    		  ntr.append(ngc);
			    		  
			    		  let ngd =  document.createElement("th");
			    		  ngd.className = "gameDay";
			    		  ngd.id = "gd"+name;
			    		  ngd.innerText = data[name].gameDay;
			    		  ntr.append(ngd);
			    		  
			    		  let ngt = document.createElement("th");
			    		  ngt.className = "gameTime";
			    		  ngt.id = "gt"+name;
			    		  ngt.innerText = data[name].gameTime;
			    		  ntr.append(ngt);
			    		  
			    		  let ngl = document.createElement("th");
			    		  ngl.className = "gameLevel";
			    		  ngl.id = "gl"+name;
			    		  ngl.innerText = data[name].level;
			    		  ntr.append(ngl);
			    		  
			    		  let nge = document.createElement("th");
			    		  nge.className = "gameType";
			    		  nge.id = "ge"+name;
			    		  nge.innerText = data[name].gameMacth;
			    		  ntr.append(nge);
			    		  
			    		  let ngo = document.createElement("th");
			    		  ngo.className = "gameClose";
			    		  ngo.id = "go"+name;
			    		  if(data[name].close == "true"){
			    			  ngo.innerText = "신청가능";
			    		  }else{
			    			  ngo.innerText = "마감";
			    		  }
			    		  ntr.append(ngo);
			    		  
			    		  let ngn = document.createElement("th");
			    		  ngn.className = "numMin";
			    		  ngn.id = "gn"+name;
			    		  ngn.innerText = data[name].gameMinp;
			    		  ntr.append(ngn);
			    		  
			    		  let ngx = document.createElement("th");
			    		  ngx.className = "numMax";
			    		  ngx.id = "gx"+name;
			    		  ngx.innerText = data[name].gameMaxp;
			    		  ntr.append(ngx);
			    		  
			    		  let ngp = document.createElement("th");
			    		  ngp.className = "numP";
			    		  ngp.id = "gp"+name;
			    		  ngp.innerText = data[name].gamePnum;
			    		  ntr.append(ngp);
			    		  
			    		  let ngm = document.createElement("th");
			    		  ngm.className = "gameMag";
			    		  ngm.id = "gm"+name;
			    		  ngm.innerText = data[name].gameMag;
			    		  ntr.append(ngm);
			    		  
			    		  let ngy = document.createElement("th");
			    		  ngy.className = "gamePay";
			    		  ngy.id = "gy"+name;
			    		  ngy.innerText = data[name].gamePay;
			    		  ntr.append(ngy);
			    		  		    		  
			    		  document.getElementById("tbody").append(ntr);
			    	 	}
			    	  
			      },
			      error: function() {
			          alert("에러 발생");
			      }
			  })
			
	    })
	}
	</script>
	
	
	<!-- 검색 -->
	<script type="text/javascript">
		document.getElementById("sbtn").addEventListener("click",function(){
		console.log(document.getElementById("select").value);
		
		/* 신청자 검색 */
		if(document.getElementById("select").value == "gameCode"){
		let data = {gameType:'S',gameCode:document.getElementById("inputbox").value};
		fetch("${pageContext.request.contextPath}/game/searchlist",{
			method : "POST", // PUT, PATCH, DELETE
			headers : {
				"Content-Type" : "application/json"},
				body : JSON.stringify(data)
				}).then(response => response.json()) 
	      
		.then(data => {
			document.getElementById("tbody").innerHTML="";
	    	  for ( let name in data){
	    		  let ntr =  document.createElement("tr");
	    		  ntr.className = "trbox";
	    		  ntr.id = "tr"+name;
	    		  
	    		  
	    		  let ncb = document.createElement("tr");
	    		  let nin = document.createElement("input");
	    		  nin.type = "checkbox";
	    		  nin.className="checkbox";
	    		  ncb.append(nin);
	    		  ntr.append(ncb);
	    		  
	    		  
	    		  let ngc =  document.createElement("th");
	    		  ngc.className = "gameCode";
	    		  ngc.id = "gc"+name;
	    		  ngc.innerText = data[name].gameCode;
	    		  ntr.append(ngc);
	    		  
	    		  let ngd =  document.createElement("th");
	    		  ngd.className = "gameDay";
	    		  ngd.id = "gd"+name;
	    		  ngd.innerText = data[name].gameDay;
	    		  ntr.append(ngd);
	    		  
	    		  let ngt = document.createElement("th");
	    		  ngt.className = "gameTime";
	    		  ngt.id = "gt"+name;
	    		  ngt.innerText = data[name].gameTime;
	    		  ntr.append(ngt);
	    		  
	    		  let ngl = document.createElement("th");
	    		  ngl.className = "gameLevel";
	    		  ngl.id = "gl"+name;
	    		  ngl.innerText = data[name].level;
	    		  ntr.append(ngl);
	    		  
	    		  let nge = document.createElement("th");
	    		  nge.className = "gameType";
	    		  nge.id = "ge"+name;
	    		  nge.innerText = data[name].gameMacth;
	    		  ntr.append(nge);
	    		  
	    		  let ngo = document.createElement("th");
	    		  ngo.className = "gameClose";
	    		  ngo.id = "go"+name;
	    		  if(data[name].close == "true"){
	    			  ngo.innerText = "신청가능";
	    		  }else{
	    			  ngo.innerText = "마감";
	    		  }
	    		  ntr.append(ngo);
	    		  
	    		  let ngn = document.createElement("th");
	    		  ngn.className = "numMin";
	    		  ngn.id = "gn"+name;
	    		  ngn.innerText = data[name].gameMinp;
	    		  ntr.append(ngn);
	    		  
	    		  let ngx = document.createElement("th");
	    		  ngx.className = "numMax";
	    		  ngx.id = "gx"+name;
	    		  ngx.innerText = data[name].gameMaxp;
	    		  ntr.append(ngx);
	    		  
	    		  let ngp = document.createElement("th");
	    		  ngp.className = "numP";
	    		  ngp.id = "gp"+name;
	    		  ngp.innerText = data[name].gamePnum;
	    		  ntr.append(ngp);
	    		  
	    		  let ngm = document.createElement("th");
	    		  ngm.className = "gameMag";
	    		  ngm.id = "gm"+name;
	    		  ngm.innerText = data[name].gameMag;
	    		  ntr.append(ngm);
	    		  
	    		  let ngy = document.createElement("th");
	    		  ngy.className = "gamePay";
	    		  ngy.id = "gy"+name;
	    		  ngy.innerText = data[name].gamePay;
	    		  ntr.append(ngy);
	    		  		    		  
	    		  document.getElementById("tbody").append(ntr);
	    	 	}
	         
			}).catch(error => {
				console.log("error");
				});
		}
		
		
		/* 날짜 검색 */
		if(document.getElementById("select").value == "gameDay"){
		let data = {gameType:'S',gameDay:document.getElementById("inputbox").value};
		fetch("${pageContext.request.contextPath}/game/searchlist",{
			method : "POST", // PUT, PATCH, DELETE
			headers : {
				"Content-Type" : "application/json"},
				body : JSON.stringify(data)
				}).then(response => response.json()) 
	      
		.then(data => {
			document.getElementById("tbody").innerHTML="";
	    	  for ( let name in data){
	    		  let ntr =  document.createElement("tr");
	    		  ntr.className = "trbox";
	    		  ntr.id = "tr"+name;
	    		  
	    		  
	    		  let ncb = document.createElement("tr");
	    		  let nin = document.createElement("input");
	    		  nin.type = "checkbox";
	    		  nin.className="checkbox";
	    		  ncb.append(nin);
	    		  ntr.append(ncb);
	    		  
	    		  
	    		  let ngc =  document.createElement("th");
	    		  ngc.className = "gameCode";
	    		  ngc.id = "gc"+name;
	    		  ngc.innerText = data[name].gameCode;
	    		  ntr.append(ngc);
	    		  
	    		  let ngd =  document.createElement("th");
	    		  ngd.className = "gameDay";
	    		  ngd.id = "gd"+name;
	    		  ngd.innerText = data[name].gameDay;
	    		  ntr.append(ngd);
	    		  
	    		  let ngt = document.createElement("th");
	    		  ngt.className = "gameTime";
	    		  ngt.id = "gt"+name;
	    		  ngt.innerText = data[name].gameTime;
	    		  ntr.append(ngt);
	    		  
	    		  let ngl = document.createElement("th");
	    		  ngl.className = "gameLevel";
	    		  ngl.id = "gl"+name;
	    		  ngl.innerText = data[name].level;
	    		  ntr.append(ngl);
	    		  
	    		  let nge = document.createElement("th");
	    		  nge.className = "gameType";
	    		  nge.id = "ge"+name;
	    		  nge.innerText = data[name].gameMacth;
	    		  ntr.append(nge);
	    		  
	    		  let ngo = document.createElement("th");
	    		  ngo.className = "gameClose";
	    		  ngo.id = "go"+name;
	    		  if(data[name].close == "true"){
	    			  ngo.innerText = "신청가능";
	    		  }else{
	    			  ngo.innerText = "마감";
	    		  }
	    		  ntr.append(ngo);
	    		  
	    		  let ngn = document.createElement("th");
	    		  ngn.className = "numMin";
	    		  ngn.id = "gn"+name;
	    		  ngn.innerText = data[name].gameMinp;
	    		  ntr.append(ngn);
	    		  
	    		  let ngx = document.createElement("th");
	    		  ngx.className = "numMax";
	    		  ngx.id = "gx"+name;
	    		  ngx.innerText = data[name].gameMaxp;
	    		  ntr.append(ngx);
	    		  
	    		  let ngp = document.createElement("th");
	    		  ngp.className = "numP";
	    		  ngp.id = "gp"+name;
	    		  ngp.innerText = data[name].gamePnum;
	    		  ntr.append(ngp);
	    		  
	    		  let ngm = document.createElement("th");
	    		  ngm.className = "gameMag";
	    		  ngm.id = "gm"+name;
	    		  ngm.innerText = data[name].gameMag;
	    		  ntr.append(ngm);
	    		  
	    		  let ngy = document.createElement("th");
	    		  ngy.className = "gamePay";
	    		  ngy.id = "gy"+name;
	    		  ngy.innerText = data[name].gamePay;
	    		  ntr.append(ngy);
	    		  		    		  
	    		  document.getElementById("tbody").append(ntr);
	    	 	}
	         
			}).catch(error => {
				console.log("error");
				});
		}
		
		/* 시간 검색 */
		if(document.getElementById("select").value == "gameTime"){
		let data = {gameType:'S',gameTime:document.getElementById("inputbox").value};
		fetch("${pageContext.request.contextPath}/game/searchlist",{
			method : "POST", // PUT, PATCH, DELETE
			headers : {
				"Content-Type" : "application/json"},
				body : JSON.stringify(data)
				}).then(response => response.json()) 
	      
		.then(data => {
			document.getElementById("tbody").innerHTML="";
	    	  for ( let name in data){
	    		  let ntr =  document.createElement("tr");
	    		  ntr.className = "trbox";
	    		  ntr.id = "tr"+name;
	    		  
	    		  
	    		  let ncb = document.createElement("tr");
	    		  let nin = document.createElement("input");
	    		  nin.type = "checkbox";
	    		  nin.className="checkbox";
	    		  ncb.append(nin);
	    		  ntr.append(ncb);
	    		  
	    		  
	    		  let ngc =  document.createElement("th");
	    		  ngc.className = "gameCode";
	    		  ngc.id = "gc"+name;
	    		  ngc.innerText = data[name].gameCode;
	    		  ntr.append(ngc);
	    		  
	    		  let ngd =  document.createElement("th");
	    		  ngd.className = "gameDay";
	    		  ngd.id = "gd"+name;
	    		  ngd.innerText = data[name].gameDay;
	    		  ntr.append(ngd);
	    		  
	    		  let ngt = document.createElement("th");
	    		  ngt.className = "gameTime";
	    		  ngt.id = "gt"+name;
	    		  ngt.innerText = data[name].gameTime;
	    		  ntr.append(ngt);
	    		  
	    		  let ngl = document.createElement("th");
	    		  ngl.className = "gameLevel";
	    		  ngl.id = "gl"+name;
	    		  ngl.innerText = data[name].level;
	    		  ntr.append(ngl);
	    		  
	    		  let nge = document.createElement("th");
	    		  nge.className = "gameType";
	    		  nge.id = "ge"+name;
	    		  nge.innerText = data[name].gameMacth;
	    		  ntr.append(nge);
	    		  
	    		  let ngo = document.createElement("th");
	    		  ngo.className = "gameClose";
	    		  ngo.id = "go"+name;
	    		  if(data[name].close == "true"){
	    			  ngo.innerText = "신청가능";
	    		  }else{
	    			  ngo.innerText = "마감";
	    		  }
	    		  ntr.append(ngo);
	    		  
	    		  let ngn = document.createElement("th");
	    		  ngn.className = "numMin";
	    		  ngn.id = "gn"+name;
	    		  ngn.innerText = data[name].gameMinp;
	    		  ntr.append(ngn);
	    		  
	    		  let ngx = document.createElement("th");
	    		  ngx.className = "numMax";
	    		  ngx.id = "gx"+name;
	    		  ngx.innerText = data[name].gameMaxp;
	    		  ntr.append(ngx);
	    		  
	    		  let ngp = document.createElement("th");
	    		  ngp.className = "numP";
	    		  ngp.id = "gp"+name;
	    		  ngp.innerText = data[name].gamePnum;
	    		  ntr.append(ngp);
	    		  
	    		  let ngm = document.createElement("th");
	    		  ngm.className = "gameMag";
	    		  ngm.id = "gm"+name;
	    		  ngm.innerText = data[name].gameMag;
	    		  ntr.append(ngm);
	    		  
	    		  let ngy = document.createElement("th");
	    		  ngy.className = "gamePay";
	    		  ngy.id = "gy"+name;
	    		  ngy.innerText = data[name].gamePay;
	    		  ntr.append(ngy);
	    		  		    		  
	    		  document.getElementById("tbody").append(ntr);
	    	 	}
	         
			}).catch(error => {
				console.log("error");
				});
		}
		
		
		/* 레벨 검색 */
		if(document.getElementById("select").value == "level"){
		let data = {gameType:'S',level:document.getElementById("inputbox").value};
		fetch("${pageContext.request.contextPath}/game/searchlist",{
			method : "POST", // PUT, PATCH, DELETE
			headers : {
				"Content-Type" : "application/json"},
				body : JSON.stringify(data)
				}).then(response => response.json()) 
	      
		.then(data => {
			document.getElementById("tbody").innerHTML="";
	    	  for ( let name in data){
	    		  let ntr =  document.createElement("tr");
	    		  ntr.className = "trbox";
	    		  ntr.id = "tr"+name;
	    		  
	    		  
	    		  let ncb = document.createElement("tr");
	    		  let nin = document.createElement("input");
	    		  nin.type = "checkbox";
	    		  nin.className="checkbox";
	    		  ncb.append(nin);
	    		  ntr.append(ncb);
	    		  
	    		  
	    		  let ngc =  document.createElement("th");
	    		  ngc.className = "gameCode";
	    		  ngc.id = "gc"+name;
	    		  ngc.innerText = data[name].gameCode;
	    		  ntr.append(ngc);
	    		  
	    		  let ngd =  document.createElement("th");
	    		  ngd.className = "gameDay";
	    		  ngd.id = "gd"+name;
	    		  ngd.innerText = data[name].gameDay;
	    		  ntr.append(ngd);
	    		  
	    		  let ngt = document.createElement("th");
	    		  ngt.className = "gameTime";
	    		  ngt.id = "gt"+name;
	    		  ngt.innerText = data[name].gameTime;
	    		  ntr.append(ngt);
	    		  
	    		  let ngl = document.createElement("th");
	    		  ngl.className = "gameLevel";
	    		  ngl.id = "gl"+name;
	    		  ngl.innerText = data[name].level;
	    		  ntr.append(ngl);
	    		  
	    		  let nge = document.createElement("th");
	    		  nge.className = "gameType";
	    		  nge.id = "ge"+name;
	    		  nge.innerText = data[name].gameMacth;
	    		  ntr.append(nge);
	    		  
	    		  let ngo = document.createElement("th");
	    		  ngo.className = "gameClose";
	    		  ngo.id = "go"+name;
	    		  if(data[name].close == "true"){
	    			  ngo.innerText = "신청가능";
	    		  }else{
	    			  ngo.innerText = "마감";
	    		  }
	    		  ntr.append(ngo);
	    		  
	    		  let ngn = document.createElement("th");
	    		  ngn.className = "numMin";
	    		  ngn.id = "gn"+name;
	    		  ngn.innerText = data[name].gameMinp;
	    		  ntr.append(ngn);
	    		  
	    		  let ngx = document.createElement("th");
	    		  ngx.className = "numMax";
	    		  ngx.id = "gx"+name;
	    		  ngx.innerText = data[name].gameMaxp;
	    		  ntr.append(ngx);
	    		  
	    		  let ngp = document.createElement("th");
	    		  ngp.className = "numP";
	    		  ngp.id = "gp"+name;
	    		  ngp.innerText = data[name].gamePnum;
	    		  ntr.append(ngp);
	    		  
	    		  let ngm = document.createElement("th");
	    		  ngm.className = "gameMag";
	    		  ngm.id = "gm"+name;
	    		  ngm.innerText = data[name].gameMag;
	    		  ntr.append(ngm);
	    		  
	    		  let ngy = document.createElement("th");
	    		  ngy.className = "gamePay";
	    		  ngy.id = "gy"+name;
	    		  ngy.innerText = data[name].gamePay;
	    		  ntr.append(ngy);
	    		  		    		  
	    		  document.getElementById("tbody").append(ntr);
	    	 	}
	         
			}).catch(error => {
				console.log("error");
				});
		}
		
		
		/* 레벨 검색 */
		if(document.getElementById("select").value == "gameMacth"){
		let data = {gameType:'S',gameMacth:document.getElementById("inputbox").value};
		fetch("${pageContext.request.contextPath}/game/searchlist",{
			method : "POST", // PUT, PATCH, DELETE
			headers : {
				"Content-Type" : "application/json"},
				body : JSON.stringify(data)
				}).then(response => response.json()) 
	      
		.then(data => {
			document.getElementById("tbody").innerHTML="";
	    	  for ( let name in data){
	    		  let ntr =  document.createElement("tr");
	    		  ntr.className = "trbox";
	    		  ntr.id = "tr"+name;
	    		  
	    		  
	    		  let ncb = document.createElement("tr");
	    		  let nin = document.createElement("input");
	    		  nin.type = "checkbox";
	    		  nin.className="checkbox";
	    		  ncb.append(nin);
	    		  ntr.append(ncb);
	    		  
	    		  
	    		  let ngc =  document.createElement("th");
	    		  ngc.className = "gameCode";
	    		  ngc.id = "gc"+name;
	    		  ngc.innerText = data[name].gameCode;
	    		  ntr.append(ngc);
	    		  
	    		  let ngd =  document.createElement("th");
	    		  ngd.className = "gameDay";
	    		  ngd.id = "gd"+name;
	    		  ngd.innerText = data[name].gameDay;
	    		  ntr.append(ngd);
	    		  
	    		  let ngt = document.createElement("th");
	    		  ngt.className = "gameTime";
	    		  ngt.id = "gt"+name;
	    		  ngt.innerText = data[name].gameTime;
	    		  ntr.append(ngt);
	    		  
	    		  let ngl = document.createElement("th");
	    		  ngl.className = "gameLevel";
	    		  ngl.id = "gl"+name;
	    		  ngl.innerText = data[name].level;
	    		  ntr.append(ngl);
	    		  
	    		  let nge = document.createElement("th");
	    		  nge.className = "gameType";
	    		  nge.id = "ge"+name;
	    		  nge.innerText = data[name].gameMacth;
	    		  ntr.append(nge);
	    		  
	    		  let ngo = document.createElement("th");
	    		  ngo.className = "gameClose";
	    		  ngo.id = "go"+name;
	    		  if(data[name].close == "true"){
	    			  ngo.innerText = "신청가능";
	    		  }else{
	    			  ngo.innerText = "마감";
	    		  }
	    		  ntr.append(ngo);
	    		  
	    		  let ngn = document.createElement("th");
	    		  ngn.className = "numMin";
	    		  ngn.id = "gn"+name;
	    		  ngn.innerText = data[name].gameMinp;
	    		  ntr.append(ngn);
	    		  
	    		  let ngx = document.createElement("th");
	    		  ngx.className = "numMax";
	    		  ngx.id = "gx"+name;
	    		  ngx.innerText = data[name].gameMaxp;
	    		  ntr.append(ngx);
	    		  
	    		  let ngp = document.createElement("th");
	    		  ngp.className = "numP";
	    		  ngp.id = "gp"+name;
	    		  ngp.innerText = data[name].gamePnum;
	    		  ntr.append(ngp);
	    		  
	    		  let ngm = document.createElement("th");
	    		  ngm.className = "gameMag";
	    		  ngm.id = "gm"+name;
	    		  ngm.innerText = data[name].gameMag;
	    		  ntr.append(ngm);
	    		  
	    		  let ngy = document.createElement("th");
	    		  ngy.className = "gamePay";
	    		  ngy.id = "gy"+name;
	    		  ngy.innerText = data[name].gamePay;
	    		  ntr.append(ngy);
	    		  		    		  
	    		  document.getElementById("tbody").append(ntr);
	    	 	}
	         
			}).catch(error => {
				console.log("error");
				});
		}
		
	});
	</script>
	
	</div>
</body>
</html>