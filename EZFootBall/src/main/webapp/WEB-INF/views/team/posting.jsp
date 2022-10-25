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
</head>
<body>
    <div class="posting">
        <div class="posting_subcon">
        <form action="${pageContext.request.contextPath }/team/postingFinish" method="post">
        <div class="title">
            <p>매치 작성</p>
        </div>
        <div class="match_type">
            <div class="sub_title1">
                <p>매치 방식</p>
            </div>
            <div class="option">
                <select name="gameMacth" id="gameMacth">
                    <option value="">매치방식을 선택해주세요</option>
                    <option value="5vs5">5vs5</option>
                    <option value="6vs6">6vs6</option>
                </select>
            </div>
        </div>
         <div class="gender">
            <div class="sub_title1">
                <p>성별</p>
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
        <div class="match_date">
            <div class="sub_title2">
                <p>경기 날짜</p>
            </div>
            <div class="calender">
            <input type="text" name="gameDay" id="txtDate" placeholder="더블클릭 하세요">
            </div>
        </div>
        <div class="match_time">
            <div class="sub_title2_1">
                <p>경기 시작 시간 <span class="match_time_span">(목록에서 없는 시간은 예약마감입니다.)</span></p>
            </div>
            <div class="option">
                <select name="gameTime" id="gameTime">
                    <option value="">매치시작 시간을 선택해주세요</option>
                    <option value="08:00:00">AM8</option>
                    <option value="10:00:00">AM10</option>
                    <option value="12:00:00">PM12</option>
                    <option value="14:00:00">PM2</option>
                    <option value="16:00:00">PM4</option>
                    <option value="18:00:00">PM6</option>
                    <option value="20:00:00">PM8</option>
                    <option value="22:00:00">PM10</option>
                </select>
            </div>
        </div>
        <div class="field">
            <div class="field_div">
                <div class="sub_title3">
                    <p>경기장</p>
                </div>
                <div class="search_map">
                <input type="text" name="gameName" id="gameName" >
                    <div class="modal22">
				      <div class="modal22_body22">지도 검색하기
				      	<a href="#" id="closebutton">닫기</a>

				      	<div class="map_search">
							<div class="search_area">
								<input type="text" name="search" id="search" placeholder="주소를 정확히 입력하세요 서비스가 좋지않아 죄송합니다" />
							</div>
							<div class="search_button">
								<a href="#" id="searcha">검색</a>
							</div>
							<div class="confirm_button">
								<a href="#">확인</a>
							</div>
						</div>
						<div id="map" class="gamefield_picture mapview"></div>
						<div id="maparea"></div>
						<div id="mapcontent"></div>
				      </div>
				    </div>
				    <div class="map_button">
				    <a href="#" class="btn-open-popup22">지도 검색</a>
					</div>
                   <script type="text/javascript">
                    document.getElementById("searcha").addEventListener("click", function(){
                        			let fieldAddress = document.getElementById("search").value;
                        			const gameName = document.getElementById("gameName");
                        			console.log(search);
                        			console.log("1231231231");
                        			
                        			const simple_data = {fieldAddress};
                        			
                        			$.ajax({
                        				url : "${pageContext.request.contextPath}/teammatch/getMap",
                        				type : "POST",
                        				contentType:"application/json; charset=utf-8",
                        				dataType : "json",
                        				data : JSON.stringify(simple_data),
                        				success : function(data){
                        					console.log("11111");
                        					console.log(data);
                        					for(const comment of data){
                        						console.log(comment.fieldName);
                        						const comdiv = document.getElementById("mapcontent");
                        						console.log("2222");
                        						const div = document.createElement("div");
     
                        						div.style.border = "1px solid black";
                        						div.style.width = "500px";
                        						div.addEventListener("click",function(){
                        							gameName.value = comment.fieldName; 
                        							console.log(search);
                        							console.log(comment.fieldName);
                        							
                        							modal2.classList.remove('show');
                        						});
                        						const h4 = document.createElement("h4");
                        						h4.innerText = "구장이름 :"+comment.fieldName;
                        						const p = document.createElement("p");
                        						p.innerText = "구장주소 :"+comment.fieldAddress;
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
        </div>
        <div class="match_place">
            <div class="sub_title_place">
                <p>매치 지역 <span class="match_place_span">(목록에서 지역을 선택해주세요)</span></p>
            </div>
            <div class="option">
                <select name="gamePlace" id="gameplace">
                    <option value="">지역을 선택해주세요</option>
                    <option value="서울">서울</option>
                    <option value="경기도">경기도</option>
                    <option value="충청도">충청도</option>
                    <option value="강원도">강원도</option>
                    <option value="제주도">제주도</option>
                    <option value="전라도">전라도</option>
                </select>
            </div>
        </div>
        <div class="payment">
            <div class="sub_title4">
                <p>참가비</p>
            </div>
            <div class="payment_text">
                <input type="text" name="gamePay" id="gamePay" placeholder="참가비를 입력하세요">
            </div>
        </div>
        <div class="team_search">
            <div class="team_search_div">
                <div class="sub_title3">
                    <p>팀 이름</p>
                </div>
                <div class="search_team">
                <input type="text" name="mTeamName" id="mTeamName" >
                    <div class="team_search_button">
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
                        			
  
                        			const simple_data = {teamName};
                        			
                        			$.ajax({
                        				url : "${pageContext.request.contextPath}/team/getTeam",
                        				type : "POST",
                        				contentType:"application/json; charset=utf-8",
                        				dataType : "json",
                        				data : JSON.stringify(simple_data),
                        				success : function(data){
                        					
                        					
                        					for(let comment of data){
                        						const comdiv = document.getElementById("modaldata");
                        						
                        						const div = document.createElement("div");
                        						div.setAttribute("id","teamSelect");
                        						div.style.border = "1px solid black";
                        						div.style.width = "180px";
                        						div.addEventListener("click",function(){
                        							mteamName.value = comment.teamName; 
                        							console.log(mteamName);
                        							console.log(comment.teamName);
                        							const modal = document.querySelector('.modal');
                        							      
													        modal.classList.toggle('show');

                        							        if (modal.classList.contains('show')) {
                        							          body.style.overflow = 'hidden';
                        							        }	
                        						});
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
                    <div class="team_button">
                        <a class="tbtn" href="${pageContext.request.contextPath}/team/register">팀 등록하기</a>
                    </div>
                </div>
            </div>
        </div>
      
        <div class="submit_button">
            <button type="submit" id="writer_submit">작성 완료</button>
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

      modal2.addEventListener('click', (event) => {
        if (event.target === modal2) {
          modal2.classList.toggle('show');

          if (!modal2.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
      
      document.getElementById("closebutton").addEventListener("click",function(){
    	  modal2.classList.remove('show');
      });
     
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
 

   