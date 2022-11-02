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
        padding-top:40px;
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
    
    #check_btn {
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
</style>
</head>
<body>
<div class="container">
    <div class="field_list_title">
        <h1>구장 목록</h1>
        <div class="button_area">
            <button class="field_insert">추가</button>
            <button class="field_delete">삭제</button>
        </div>
    </div>
    
    <div class="field_list_area">
        <c:forEach var="field" items="${fieldList}">
        <div class="content">
            <div class="check_btn_area">
                <input type="checkbox" name="check_btn" id="check_btn">
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
        </c:forEach>
    </div>

</div>
</body>
</html>