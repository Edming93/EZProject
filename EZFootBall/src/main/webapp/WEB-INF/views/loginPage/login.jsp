<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");

    	String id_ck = "";
    	String val = "";
    	
    	Cookie[] cookies = request.getCookies();
    	
        	for(Cookie cookie : cookies) {
        		if(cookie.getName().equals("userId")){
        			val = cookie.getValue();
        		}
        	}
        	
        	for(Cookie cookie : cookies) {
        		if(cookie.getName().equals("id_ck")){
        			id_ck = cookie.getValue();
        		}
        	}

    	System.out.println("var값 : " + val);
    	System.out.println("id_ck : " +id_ck);
    	
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            box-sizing: border-box;
            margin:0;
        }
        body {
            background-size:cover;
            width: 100%;
            height: 100%;
            color: #999;
			background-color: #fff;
        }
        
        .inner_container {
	        width: 100%;
	        margin: 0 auto;
	        display: flex;
	        flex-direction: column;
	        justify-content: center;
    	}
		
	    .main_title {
	    	display: flex;
	    	flex-direction: column;
	    	font-family: 'Happiness-Sans-Title';
    		margin-bottom: 60px;
	    }
	    
	    .title1 {
	    	font-size:30px;
	    	color:#2A2A2A;
	    }
	    .title2 {
	    	font-size:35px;
	    	color:#26A653;
	    	font-weight: bold;
	    }
		
        .content {
		    display: flex;
		    flex-direction: column;
		    height: 765px;
		    margin: auto;
		    padding-bottom: 60px;
    		padding-top: 145px;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            
        }
        .input {
			display: flex;
			width: 350px;
   			height: 55px;
			margin: 5px 0px;
			border: 1px solid #000;
			background-color: #fff;
			padding: 8px 17px;
			border-radius: 5px;
			font-size: 12px;
			color: #000;
    
        }
        .radio_label {
			margin: 0;
			text-align: left;
			display: flex;
			justify-content: left;
			margin-top: 5px;
			color: #999999;
			font-size: 12px;
        }
        .radio {
			display: flex;
			margin-right: 5px;
			width: 10px;
            
        }
        #login {
            width: 350px;
			height: 55px;
			background-color: #26A653;
			border: 0;
			border-radius: 3px;
			color: white;
			margin: 10px 0px;
        }
        a {
            text-decoration: none;
			color: #999;
			font-size: 11px;
			margin-bottom: 13px;
    		margin-top: 6px;
        }
        .id_footer {
        	display:flex;
            width: 100%;
            justify-content: space-around;
        }

        .id_foot {
            display: flex;
        }
        #sign_up {
		    border: 1px solid #707070;
		    color: #2a2a2a;
		    width: 85px;
		    height: 25px;
		    border-radius: 10px;
		    background-color: #fff;
		    cursor: pointer;
        }
        .user_question {
        	display:flex;
        	width:100%;
        	justify-content: center;
        	align-content: center;
        }

    </style>
</head>
<body>



    <div class="inner_container">
        <div class="content">
            <div class="main_title">
        		<h3 class="title1">땀흘리고 싶을 땐</h3>
        		<div class="title2">이지풋볼</div>
    		</div>
            <form action="${pageContext.request.contextPath}/loginPage/login" method="post">
                <input class="input" type="text" placeholder="ID" name="userId" id="id_input" value="<%=val%>">
                <input class="input" type="password" placeholder="password" name="userPw">
                <label class="radio_label"> 
                <input class="radio" type="checkbox" name="id_remem" id="id_remem" value="checked" <%=id_ck %>> 아이디 기억하기</label>
                <button id="login">Login</button>
                <div class="user_question">
                	<a href="#">회원이 아니신가요?</a>
                </div>
                
                <div class="id_footer">
                	<div class="id_foot">
	                    <button type="button" id="sign_up"><a href="${pageContext.request.contextPath}/find/findInfo">ID/PW찾기</a></button>
	                </div>
	                <div class="id_foot">
	                    <button type="button" id="sign_up"><a href="${pageContext.request.contextPath}/loginPage/signUp">회원가입</a></button>
	                </div>
	           	</div>
            </form>
        </div>
    </div>

</body>
</html>