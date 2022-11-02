<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .container {
        padding: 25px;
    }
    
    .field_list_title {
        display: flex;
        justify-content: space-between;
    }
    .content {
        display: flex;
        align-items: center;
        padding: 20px;
        padding-left: 60px;
        
    }
    .field_info_content {
        display: flex;
        flex-direction: column;
    }
    .check_btn_area {
        width: 50px;
        display: flex;
        justify-content: center;
    }
    
    .check_box {
    	width: 20px;
    	height: 20px;
    }
    .field_image_area {
        width: 200px;
        display: flex;
        justify-content: center;
    }
    .field_image {
	    width: 175px;
	    height: 120px;
    }
    
    .field_info {
    	padding-left: 20px;
    }
    
    .field_info_content {
    	font-size:15px;
    }

    .option_bar {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 0px 75px;
	    height: 50px;
	    margin-top: 20px;
    }
    .search_area {
    	display: flex;
    	justify-content: center;
    	align-items: center;
    }
    #search_local {
        width: 85px;
        height: 35px;
        text-align: center;
        margin-left: 20px;
    }
    #input_content {
    	height: 35px;
	    border-radius: 4px;
	    border: 1px solid black;
		width: 350px;
    }
    #search_btn {
    	width: 60px;
    	height: 36px;
    }
    .select_area {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .select_input_area {
    	display: flex;
    	align-items: center;
    }
</style>
</head>
<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/fieldAdmin/fieldChange" method="post">
    <div class="field_list_title">
        <h1>구장 목록</h1>
        <div class="button_area">
            <button class="field_modify" name="fieldChange" value="modify">수정</button>
            <button class="field_delete" name="fieldChange" value="delete">삭제</button>
        </div>
    </div>
    
    <div class="field_list_area">
    	<div class="option_bar">
            <div class="select_area">
                <div class="select_input_area">
                    <input type="checkbox" name="select_all" class="check_box " id="select_all" value="check">&nbsp;<b>전체선택</b>
                </div>
                <select name="local" id="search_local">
                    <option id="null" value="null">지역</option>
                    <option id="서울" value="서울">서울</option>
                    <option id="경기도" value="경기도">경기도</option>
                    <option id="강원도" value="강원도">강원도</option>
                    <option id="경상도" value="경상도">경상도</option>
                    <option id="전라도" value="전라도">전라도</option>
                    <option id="충청도" value="충청도">충청도</option>
                    <option id="제주도" value="제주도">제주도</option>
                </select>
            </div>
            
            <div class="search_area">
                <input type="text" name="input_content" id="input_content"><button id="search_btn">검색</button>
            </div>
        </div>
        <c:forEach var="field" items="${fieldList}">
        <div class="content ${field.fieldCode}">
            <div class="check_btn_area">
                <input type="checkbox" name="check_btn" class="check_box check_btn" value="${field.fieldCode}">
            </div>
            <div class="field_image_area">
                <img src="${field.fieldImg1}" class="field_image">
            </div>
            <div class="field_info">
                <div class="field_info_content">
                    <span class="field_name">구장명 : <b>${field.fieldName}</b></span>
                    <span class="field_address">구장주소 : <b>${field.fieldAddress}</b></span>
                    <span class="field_type">구장 형태 : <b>${field.fieldType}</b></span>
                    <span class="phone">구장 연락처 : <b>${field.fieldCall}</b></span>
                    <span class="etc_info">특이사항 : <b>${field.fieldGrass},${field.fieldInOut}</b></span>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            var local = document.getElementById("search_local");

            local.addEventListener("change",function() {
                if(local.value == "null" || local.value == null) {
                    document.querySelectorAll(".content").forEach(function(e) {
                    	console.log("111111111");
     					console.log(e);
                    	e.style.display="flex";
                    });
                }else if(!'${field.fieldName}'.includes(local.value)){
     				let field = document.querySelectorAll(".content");
     					field.forEach(function(e) {
     						e.style.display="none";
     						console.log(e);
     					});
                }

            });
        </script>
        </c:forEach>
        
        <script>
            let select_all_btn = document.getElementById("select_all");
            let select_check_btn = document.querySelectorAll(".check_btn");

            select_all_btn.addEventListener("click",function() {
                select_check_btn.forEach(function(e){
                    if(select_all_btn.checked == true){
                        e.checked = true;
                        
                    }else if(select_all_btn.checked != true){
                        e.checked = false;
                    }
                });
            });

        </script>
    </div>
    </form>
</div>
</body>
</html>