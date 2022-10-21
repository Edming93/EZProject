<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mainpage-post{
        
        width: 1024px;
        border: 1px solid black;
        display: flex;
        flex-direction: column;
    }
    .mainpage-post .calender{
        flex : 1;
        display: flex;
        border: 1px solid black;
        width: 1024px;
    }
    .mainpage-post .settingbutton{
        flex: 1;
        display: flex;
       border: 1px solid black;
        width: 1024px;
    }
    .mainpage-post .date ul{
       
       list-style-type: none;
    }
    .mainpage-post .date ul li{
        display: inline-block;
        width: 100px;
        height: 50px;
        text-align: center;
    }
    .mainpage-post .date ul li a{
        text-decoration: none;
    }
    .mainpage-post .date ul li:hover{
       background-color: blue;
    }
</style>
</head>
<body>
	<div class="mainpage-post">
		<div class="calender">
			<div class="leftbutton">
				<a href="#">◀</a>
			</div>
			<div class="date">
				<ul>
					<li><a href="">16<br>일
					</a></li>
					<li><a href="">17<br>월
					</a></li>
					<li><a href="">18<br>화
					</a></li>
					<li><a href="">19<br>수
					</a></li>
					<li><a href="">20<br>목
					</a></li>
					<li><a href="">21<br>금
					</a></li>
					<li><a href="">22<br>토
					</a></li>
				</ul>

			</div>
			<div class="rightbutton">
				<a href="#">▶</a>
			</div>
		</div>
		<div class="settingbutton">
			<div class="setting">
				<select name="location" id="location">
					<option value="">내 지역</option>
					<option value="서울">서울</option>
					<option value="대전">대전</option>
					<option value="부산">부산</option>
					<option value="대구">대구</option>
					<option value="인천">인천</option>
				</select>
			</div>
			<div class="gender">
				<select name="gender" id="gender">
					<option value="">성별</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
					<option value="혼성">혼성</option>
				</select>
			</div>
		</div>
	</div>

</body>
</html>