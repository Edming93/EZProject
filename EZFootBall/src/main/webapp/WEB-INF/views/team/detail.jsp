<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/TeamDetail.css" />
</head>
<body>
    <div class="container">
        <div class="sub_container">
            <div class="header">
                <div class="logo">
                    <img src="../image/Group 32.jpg">
                </div>
                <div class="search">
                    <div class="search_box">
                        <input type="text" name="searchcontent" id="searchcontent" placeholder="검색어를 입력하세요">
                    </div>
                    <div class="search_button">
                        <a href="#">검색버튼</a>
                    </div>
                </div>
                <div class="login">
                    <a href="#">로그인</a>
                </div>
            </div>
            <div class="img_group">
                <div class="gamefield_picture">
                    <img  src="${fieldlistbyid.fieldImg1}">
                   
                </div>
                <div class="gamefield_picture">
                    <img src="${fieldlistbyid.fieldImg2}">
                    
                </div>
                <div class="gamefield_picture">
                    <img src="${fieldlistbyid.fieldImg3}">
                    
                </div>
                <div class="gamefield_picture">
                    <img src="${fieldlistbyid.fieldImg4}">
                    
                </div>
                <div class="gamefield_picture">
                    <img src="${fieldlistbyid.fieldImg5}">
                    
                </div>
                <div class="map_picture">
                    <div id="map" class="gamefield_picture mapview"></div>
                </div>
            </div>
            <div class="mainpage">
                <div class="left_mainpage">
                    <div class="match_info">
                        <div class="match_title">
                            <p>매치 포인트</p>
                        </div>
                        <div class="match_detail">
                            <ul>
                                <li>모든 레벨</li>
                                <li>남자</li>
                                <li>${fieldlistbyid.fieldType} 3파전</li>
                                <li>10~18명</li>
                                <li>풋살화/운동화</li>
                            </ul>
                        </div>
                    </div>
                    <div class="manager_info">
                        <p>김민지 매니저가 진행해요</p>
                    </div>
                    <div class="team_info">
                        <div class="comment">
                            <p>팀매치 상세 정보</p>
                        </div>
                        <div class="team_detail">
                            <div class="hometeam_info">

                                <table border="1" width="100%" cellspacing="5">
                                    <caption>Home팀</caption>
                                    <thead>
                                        <tr align="center" bgcolor="white">
                                            <td>번호</td>
                                            <th>이름</th>
                                            <th>레벨</th>
                                            <th>주장</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr align="center" bgcolor="white">
                                            <td>1</td>
                                            <td>이정욱</td>
                                            <td>아마추어1</td>
                                            <td>O</td>

                                        </tr>
                                        <tr align="center" bgcolor="white">
                                            <td>2</td>
                                            <td>강병관</td>
                                            <td>프로1</td>
                                            <td></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="awayteam_info">
                                <table border="1" width="100%" cellspacing="5">
                                    <caption>Away팀</caption>
                                    <thead>
                                        <tr align="center" bgcolor="white">
                                            <td>번호</td>
                                            <th>이름</th>
                                            <th>레벨</th>
                                            <th>주장</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr align="center" bgcolor="white">
                                            <td>1</td>
                                            <td>김민지</td>
                                            <td>프로1</td>
                                            <td>O</td>

                                        </tr>
                                        <tr align="center" bgcolor="white">
                                            <td>2</td>
                                            <td>임수빈</td>
                                            <td>아마추어1</td>
                                            <td></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="match_content">
                        구장 특이사항
                        ■주차: 구장 바로 옆 카페 내부의 데스크에서 태블릿을 통해 주차 등록 (3시간 무료) / 차량번호 미인식 → 주차권 배부 가능

                        ■흡연: 흡연부스 외 절대 금연
                        (흡연구역 외에서 흡연 적발 시 이후 서비스 이용에 제재가 있을 수 있습니다)

                        ■대여: 풋살화 유료 대여 가능
                        (우천시 대여 불가/ 2시간 6,000원/ 직원에게 문의)

                        ■기타: 해당 구장은 소음 민원 다발 지역이므로 심야 시간 참가자님들께서는 각별히 주의해주시기를 부탁드리겠습니다. (1차, 2차 경고시 퇴장 조치 될 수 있습니다.)

                        ■건물 내부(실내)로 입장 하실 때, 마스크 착용 부탁 드립니다.
                        매치 진행 및 취소 규정
                        매치 규칙
                        모든 파울은 사이드라인에서 킥인
                        골키퍼에게 백패스 가능. 손으로는 잡으면 안돼요
                        사람을 향한 태클 금지
                        진행 방식
                        풋살화와 개인 음료만 준비하세요
                        매니저가 경기 진행을 도와드려요
                        골키퍼와 휴식을 공평하게 돌아가면서 해요
                        레벨 데이터를 기준으로 팀을 나눠요
                        친구끼리 와도 팀 실력이 맞지 않으면 다른 팀이 될 수 있어요
                        알아두면 좋아요
                        서로 존중하고 격려하며 함께 즐겨요
                        플랩 평균 레벨은 아마추어2예요
                        플랩에서는 하루 평균 180경기가 진행되고 있어요
                        매일 3,000여명이 팀 없이도 풋살을 즐기고 있어요
                        일반 취소 규정
                        매치 시작 1시간 30분 전까지 최소 인원(10명) 미달 시 매치가 취소 됩니다. 취소 시 카카오톡을 통해 안내드리며 캐시는 전액 환급됩니다.
                        특수 취소 규정(우천)
                        당일 예보 변동이 심해, 실시간으로 예보를 확인하고 매치 시작 4시간 전까지 강수 안내 알림톡을 발송합니다.
                        강수 안내 알림톡을 받고, 매치 시작 1시간 30분 전까지 취소하면 전액 환불합니다.
                        매치 시작 1시간 30분 내에 취소하거나 무단 불참하면 이용이 제한될 수 있습니다.
                        취소자가 다수 발생하거나, 구장 상태 악화로 진행이 어렵다면 매치 시작 1시간 30분 이내라도 즉시 취소 안내를 드립니다.
                        강한 비(눈)로 매치를 취소 또는 중단할 경우, 남은 시간 만큼 캐시로 환산해 돌려 드립니다.
                    </div>
                </div>
                <div class="right_mainpage">
                    <div class="pc_sticky">
                        <div class="match_time">
                            <p>10월 17일 월요일 12:00</p>
                        </div>
                        <div class="match_location">
                            <div class="field_name">
                                <a href="#">${fieldlistbyid.fieldName }</a>
                            </div>
                            <div class="field_address">
                                <p>${fieldlistbyid.fieldAddress }</p>
                                <button id="copybtn" onclick="copyToClipboard()">주소 복사</button>
                                <a href="#" id="mapbtn">지도 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        //복사기능 함수 copyToClipboard
        function copyToClipboard(val) {
            var t = document.createElement("textarea");
            document.body.appendChild(t);
            t.value = val;
            t.select();
            document.execCommand('copy');
            document.body.removeChild(t);
        }
        $('#copybtn').click(function () {
            var textCopy = '서울 은평구 통일로 1550 50'
            copyToClipboard(textCopy);
            alert("글을 복사하였습니다.");
        });
    </script>
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65331bb5f71196e87528297b0af9ceb4&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {

                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 2 // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${fieldlistbyid.fieldAddress}', function (result, status) {

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
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${fieldlistbyid.fieldName}</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });   
    </script>
    <script type="text/javascript">
        document.getElementById("mapbtn").addEventListener("click", function () {
            const map = document.getElementById("map");
            map.style.display = "block";

        });
    </script>
</body>

</html>