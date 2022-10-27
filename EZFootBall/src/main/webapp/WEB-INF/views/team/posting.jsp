<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팀매치 게시글 등록</title>

     <link rel="stylesheet" href="${pageContext.request.contextPath }/js/jquery-ui.css"/>
    <script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/TeamMatchPosting.css">
 	<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
</head>
<body>
    <div class="container">
    	
        <div class="sub_con">
        <form action="${pageContext.request.contextPath }/team/postingFinish" method="post">
        	<div class="title">
	            <span class="ticon"><iconify-icon icon="fluent-emoji-flat:four-leaf-clover"></iconify-icon></span>
	            <h1>매치 작성</h1>
	            <span class="ticon"><iconify-icon icon="fluent-emoji-flat:four-leaf-clover"></iconify-icon></span>
        	</div>
        	<div class="subt">
	         	<div class="gender">
		                <p>성별</p><span class="gicon"><iconify-icon icon="mdi:gender-transgender" style="color: #26a653;"></iconify-icon></span>
		            </div>
		            <div class="option">
		                <select name="gameGender" id="gameGender">
		                    <option value="">매치 성별을 선택해주세요</option>
		                    <option value="남">남자</option>
		                    <option value="여">여자</option>
		                    <option value="혼성">혼성</option>
		                </select>
		            </div>
        		</div>
        	
        <div class="subt">
            <div class="date">
                <p>경기 날짜</p><span class="dicon"><iconify-icon icon="ic:round-date-range" style="color: #26a653;"></iconify-icon></span>
            </div>
            <div class="dinput">
            	<input type="text" name="gameDay" id="txtDate" class="gameDay" placeholder="더블클릭 하세요" autocomplete="off">
            </div>
      	</div>
      	<div class="subt">
       		<div class="matchp">
            	<p>매치 지역 <span class="match_place_span">(목록에서 지역을 선택해주세요)</span></p><span class="micon"><iconify-icon icon="fa6-solid:location-crosshairs" style="color: #26a653;"></iconify-icon></span>
       		</div>
            <div class="option">
                <select name="gamePlace" id="gameplace">
                    <option value="">지역을 선택해주세요</option>
                    <option value="서울">서울</option>
                    <option value="인천">인천</option>
                    <option value="경기도">경기도</option>
                    <option value="충청도">충청도</option>
                    <option value="강원도">강원도</option>
                    <option value="경상도">경상도</option>
                    <option value="전라도">전라도</option>
                    <option value="제주도">제주도</option>
                </select>
            </div>
         </div>
        <div class="subt">
          
                <div class="matchf">
                    <p>경기장</p><span class="ficon"><iconify-icon icon="tabler:soccer-field" style="color: #26a653;"></iconify-icon></span>
                </div>
                <div class="matchf_in">
                <input type="text" name="fieldName" id="fieldName" >
                    <div class="modal22">
				      <div class="modal22_body22"><strong style="font-size : 30px">지도 검색하기</strong>
				      <span id="mapclose"><img src="${pageContext.request.contextPath }/image.close1.jpg"/></span>

				      	<div class="map_search">
							<div class="search_area">
								<input type="text" name="search" id="search" placeholder="주소를 정확히 입력하세요 서비스가 좋지않아 죄송합니다" />
								
							</div>
							<div class="search_button">
								<a href="#" id="searcha">검색</a>
							</div>
						</div>
						<div id="map" class="gamefield_picture mapview"></div>
						<div id="maparea"></div>
						<div id="mapcontent"></div>
				      </div>
				    </div>
				    <div class="fbutton">
				    <a href="#" class="btn-open-popup22">지도 검색</a>
					</div>
                   <script type="text/javascript">
                    document.getElementById("searcha").addEventListener("click", function(){
                        			const address = document.getElementById("search").value;
                        			const fieldName = document.getElementById("fieldName");
                        			const fieldAddress = document.getElementById("fieldAddress");
                        			const fieldCode = document.getElementById("fieldCode");
                        			const gamePay = document.getElementById("gamePay");
                        			const gameMacth = document.getElementById("gameMacth");
                        			const comdiv = document.getElementById("mapcontent");
                        		
                        			const simple_data = {address};
                        			
                        			$.ajax({
                        				url : "${pageContext.request.contextPath}/team/getMap",
                        				type : "POST",
                        				contentType:"application/json; charset=utf-8",
                        				dataType : "json",
                        				data : JSON.stringify(simple_data),
                        				success : function(data){
                        					
                        					comdiv.innerHTML = "";
                        					for(const comment of data){

                        		
                        						const div = document.createElement("div");
     
                        						div.style.border = "1px solid black";
                        						div.style.width = "800px";
                        						div.style.margin = "0 auto";
                        						div.addEventListener("click",function(){
                        							
                        							fieldName.value = comment.fieldName; 
                        							fieldAddress.value = comment.fieldAddress;
                        							fieldCode.value = comment.fieldCode;
                        							gamePay.value = comment.fieldRentalfee.toLocaleString();
                        							gameMacth.value = comment.fieldType;
                        							
                        							
                        							modal2.classList.remove('show');
                        						});
                        						const h4 = document.createElement("h4");
                        						h4.innerText = "구장이름 : "+comment.fieldName;
                        						const p = document.createElement("p");
                        						p.innerText = "구장주소 : "+comment.fieldAddress;
                        						const a = document.createElement("a");
                        						a.innerText = "선택";
                        						
                        						
                        						div.append(h4);
                        						div.append(p);
                        						div.append(a);
                        						comdiv.append(div);
                        						 
                        						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        					      mapOption = {
                        					         
                        					          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        					          level: 3 // 지도의 확대 레벨
                        					      };  

                        					     // 지도를 생성합니다    
                        					     var map = new kakao.maps.Map(mapContainer, mapOption);
                        					     
                        					     // 주소-좌표 변환 객체를 생성합니다
                        					     var geocoder = new kakao.maps.services.Geocoder();
                        					     
                        					     // 주소로 좌표를 검색합니다
                        					     geocoder.addressSearch(comment.fieldAddress, function(result, status) {
                        					     
                        					         // 정상적으로 검색이 완료됐으면 
                        					          if (status === kakao.maps.services.Status.OK) {
                        					     
                        					             var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        					     
                        					             // 결과값으로 받은 위치를 마커로 표시합니다
                        					             var marker = new kakao.maps.Marker({
                        					                 map: map,
                        					                 position: coords
                        					             });
                        					     
                        					             // 인포윈도우로 장소에 대한 설명을 표시합니다
                        					             var infowindow = new kakao.maps.InfoWindow({
                        					                 content: '<div style="width:150px;text-align:center;padding:6px 0;">'+comment.fieldName+'</div>'
                        					             });
                        					             infowindow.open(map, marker);
                        					     
                        					             // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        					             map.setCenter(coords);
                        					         } 
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
            
        </div>
        
         <div class="subt">
            <div class="matcht">
                <p>경기 시작 시간 <span class="match_time_span">(목록에서 없는 시간은 예약마감입니다.)</span></p><span class="timeicon"><iconify-icon icon="bx:time-five" style="color: #26a563;"></iconify-icon></span>
            </div>
            <div class="option">
                <select name="gameTime" id="gameTime">
                    <option value="">매치시작 시간을 선택해주세요</option>
                    <option id="reservation1" value="08:00:00">AM8</option>
                    <option id="reservation2" value="10:00:00">AM10</option>
                    <option id="reservation3" value="12:00:00">PM12</option>
                    <option id="reservation4" value="14:00:00">PM2</option>
                    <option id="reservation5" value="16:00:00">PM4</option>
                    <option id="reservation6" value="18:00:00">PM6</option>
                    <option id="reservation7" value="20:00:00">PM8</option>
                    <option id="reservation8" value="22:00:00">PM10</option>
                </select>
            </div>
            <script type="text/javascript">
            	
            	
            document.getElementById("gameTime").addEventListener("click",function(){
            			
            			let res1 = document.getElementById("reservation1").value;
            			let res2 = document.getElementById("reservation2").value;
            			let res3 = document.getElementById("reservation3").value;
            			let res4 = document.getElementById("reservation4").value;
            			let res5 = document.getElementById("reservation5").value;
            			let res6 = document.getElementById("reservation6").value;
            			let res7 = document.getElementById("reservation7").value;
            			let res8 = document.getElementById("reservation8").value;
            			
//                     	let gameTime = document.getElementById("gameTime");
                    	let fieldName = document.getElementById("fieldName").value;
                    	let gameDay = document.getElementById("txtDate").value;
                    	
                    	console.log(fieldName);
            			console.log(gameDay);
            			const simple_data = {gameDay, fieldName};
            			
            			
            			console.log("11111111111111");
            			$.ajax({
            				url : "${pageContext.request.contextPath}/team/timeListR",
            				type : "POST",
            				contentType:"application/json; charset=utf-8",
            				dataType : "json",
            	 			data : JSON.stringify(simple_data),
            				success : function(data){
            					console.log(data);
            					console.log("2222222222222")
            					
            				
            					for(let comment of data){
            						if(fieldName == comment.fieldName && 
            							res1 == comment.gameTime &&
            							gameDay == comment.gameDay &&
            							(comment.gameType == 'S' || comment.gameType =='T')){
            							
            							document.getElementById("reservation1").style.display = "none";
            							}
            						else if(fieldName == comment.fieldName && 
                							res2 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation2").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res3 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation3").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res4 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation4").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res5 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation5").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res6== comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation6").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res7 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation7").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res8 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation8").style.display = "none";
                							}	
            							
            				
            						}
            					},
            				
            				error : function(e){
            					alert(e);
            				}
            			});
            		});
            </script>
        </div>
        <div class="subt">
            <div class="matchadd">
                <p>경기장 주소</p><span class="addicon"><iconify-icon icon="ant-design:home-filled" style="color: #26a563;"></iconify-icon></span>
            </div>
            <div class="addinput">
                <input type="text" name="fieldAddress" id="fieldAddress" placeholder="경기장 선택시 자동입력됩니다.">
            </div>
        </div>
         <div class="subt1">
         	<div class="innersubt1">
	            <div class="matchtype">
	                <p>매치 방식</p><span class="matchicon"><iconify-icon icon="emojione-monotone:vs-button" style="color: #26a563;" width="16" height="16"></iconify-icon></span>
	            </div>
	            <div class="typeinput">
	                <input type="text" name="gameMacth" id="gameMacth" placeholder="경기장 선택시 자동입력됩니다.">
	            </div>
	       </div>
	       <div class="innersubt1">
	            <div class="matchc">
	                <p>경기장 코드</p><span class="cicon"><iconify-icon icon="simple-icons:codemagic" style="color: #26a563;" width="16" height="16"></iconify-icon></span>
	            </div>
	            <div class="cinput">
	                <input type="text" name="fieldCode" id="fieldCode" placeholder="경기장 선택시 자동입력됩니다.">
	            </div>
	       </div>
	       <div class="innersubt1">
	            <div class="matchpay">
	                <p>참가비</p><span class="payicon"><iconify-icon icon="game-icons:money-stack" style="color: #26a563;" width="16" height="16"></iconify-icon></span>
	            </div>
	            <div class="payinput">
	                <input type="text" name="gamePay" id="gamePay" placeholder="경기장 선택시 자동입력됩니다."/>
	            </div>
            </div> 
           
        </div>
        <div class="subt">
           
                <div class="team">
                    <p>팀 이름<span class="sub_title3_span">(팀 이름을 알아도 검색기능을 사용해주세요)</span></p><span class="teamicon"><iconify-icon icon="fluent:people-team-20-filled" style="color: #26a563;" width="16" height="16"></iconify-icon></span>
                </div>
                <div class="innerteam">
	                <div class="teaminput">
	                	<input type="text" name="mTeamName" id="mTeamName" placeholder="팀 검색을 이용해주세요">
	                	<input type="hidden" name="teamCode" id="teamCode"/>
	                </div>
                    <div class="sbutton">
                        <div class="modal">
                            <div class="modal_body"><h2>팀 검색하기</h2>
                        
                                <div class="modal_inner_box">
                                	
                                    <div class="modal_team_search">
                                        <input type="text" name="modalText" id="modalText">
                                    </div>
                                    <div class="modal_search_button">
                                        <a href="#" id="modalsearchbutton"> >검색</a>
                                    </div>
                                
                                    
                                </div>
                                <div id="modaldata"></div>
                                <script type="text/javascript">
                                document.getElementById("modalsearchbutton").addEventListener("click", function(){
                        			let teamName = document.getElementById("modalText").value;
                        			const mteamName = document.getElementById("mTeamName");
                        			let gameMacth1 = document.getElementById("gameMacth").value;
                        			let teamCode = document.getElementById("teamCode");
                        			const comdiv = document.getElementById("modaldata");
  
                        			const simple_data = {teamName};
                        		
                        			$.ajax({
                        				url : "${pageContext.request.contextPath}/team/getTeam",
                        				type : "POST",
                        				contentType:"application/json; charset=utf-8",
                        				dataType : "json",
                        				data : JSON.stringify(simple_data),
                        				success : function(data){
                        					
                        					comdiv.innerHTML="";
                        					for(let comment of data){
                        
                        						const div = document.createElement("div");
                        						div.setAttribute("id","teamSelect");
                        						div.style.border = "1px solid black";
                        						div.style.width = "180px";
                        						div.style.backgroundColor = "#F8EDE3";

                        						if(gameMacth1 == "6vs6"){
													
														div.addEventListener("click",function(){
															if(comment.tmember6 != ''){
			                         							mteamName.value = comment.teamName; 
			                         							teamCode.value = comment.teamCode;
															}else {
																alert("5명이서 참가할 수 없습니다.");
																}
							
                        							const modal = document.querySelector('.modal');
                  							      
											        modal.classList.toggle('show');

                							        if (modal.classList.contains('show')) {
                							          body.style.overflow = 'hidden';
                        							}
														});
                        						}else if(gameMacth1 == "5vs5"){
													
													div.addEventListener("click",function(){
														if(comment.tmember6 == ''){
		                         							mteamName.value = comment.teamName; 
		                         							teamCode.value = comment.teamCode;
														}else {
															alert("6명이서 참가할 수 없습니다.");
															}
				
                    							const modal = document.querySelector('.modal');
              							      
										        modal.classList.toggle('show');

            							        if (modal.classList.contains('show')) {
            							          body.style.overflow = 'hidden';
                    							}
													});
                    						}						

                        						const h4 = document.createElement("h4");
                        						h4.innerText = "팀코드 :"+comment.teamCode;
                        						const p = document.createElement("p");
                        						p.innerText = "팀이름 :"+comment.teamName;
                        						const a = document.createElement("a");
                        						a.innerText = "선택";
                        						
                        						
                        						div.append(h4);
                        						div.append(p);
                        						div.append(a);
                        						comdiv.append(div);
                        					}

                        				},
                        				error : function(e){
                        					alert(e);
                        				}
                        			});
                        			
                        		});
                                </script>
                            </div>
                        </div>
                        <a href="#" class="btn-open-popup">팀 검색</a>
                    </div>
                    <div class="rbutton">
                        <a class="tbtn" href="${pageContext.request.contextPath}/team/register">팀 등록하기</a>
                    </div>
                </div>
         
        </div>
      
        <div class="submit">
            <button type="submit" id="subtn">팀 매치 작성 완료!</button>
        </div>
         
        </form>
        </div>
    </div>
   
   

    <script type="text/javascript">
    /* 달력관련 script */
    $.datepicker.setDefaults({
    	  dateFormat: 'yy-mm-dd',
    	  prevText: '이전 달',
    	  nextText: '다음 달',
    	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	  showMonthAfterYear: true,
    	  yearSuffix: '년'
    	});
    
        $(function() {
            console.log("dsjfdlsfhdslf");
            
            $('#txtDate').datepicker({ minDate: 0});
        });
   
	/* 팀 검색 modal창 script */
        const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
      </script>
      
      <script type="text/javascript">
      /* 지도 검색 modal창 script */
          
      const modal2 = document.querySelector('.modal22');
      const btnOpenPopup2 = document.querySelector('.btn-open-popup22');

      btnOpenPopup2.addEventListener('click', () => {
        modal2.classList.toggle('show');

        if (modal2.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });
		
      document.getElementById("mapclose").addEventListener("click",function(){
    	  modal2.classList.remove('show');
      });
      
      
//       modal2.addEventListener('click', (event) => {
//         if (event.target === modal2) {
//           modal2.classList.toggle('show');

//           if (!modal2.classList.contains('show')) {
//             body.style.overflow = 'auto';
//           }
//         }
//       });
      
     
     
      </script>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65331bb5f71196e87528297b0af9ceb4&libraries=services"></script>
      <script type="text/javascript">
		/* 지도표시 script */

      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         
          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };  

     // 지도를 생성합니다    
     var map = new kakao.maps.Map(mapContainer, mapOption);
     
     // 주소-좌표 변환 객체를 생성합니다
     var geocoder = new kakao.maps.services.Geocoder();
     
     // 주소로 좌표를 검색합니다
     geocoder.addressSearch('서울 금천구 가산디지털1로 151 이노플렉스 1차 3층 306호', function(result, status) {
     
         // 정상적으로 검색이 완료됐으면 
          if (status === kakao.maps.services.Status.OK) {
     
             var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
     
             // 결과값으로 받은 위치를 마커로 표시합니다
             var marker = new kakao.maps.Marker({
                 map: map,
                 position: coords
             });
     
             // 인포윈도우로 장소에 대한 설명을 표시합니다
             var infowindow = new kakao.maps.InfoWindow({
                 content: '<div style="width:150px;text-align:center;padding:6px 0;">구디아카데미</div>'
             });
             infowindow.open(map, marker);
     
             // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
             map.setCenter(coords);
         } 
     });   
     </script>
	
</body>
</html>
 

   