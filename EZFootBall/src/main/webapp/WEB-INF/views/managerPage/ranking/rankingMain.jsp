<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String rank_p = request.getParameter("rankPage");
	if(rank_p == null ){
		rank_p="rank1";
	}
      
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        #contain * {
            /* border: 1px solid black; */
        }
        #contain{
            display: flex;
            flex-direction: column;
            width: 98%;
            margin: 0 auto;
            height: 98vh;
        }
        #submenu{
            display: flex;
            align-items: center;
            width: 20%;
            min-width: 200px;
            height: 50px;
            list-style: none;
            margin: 0;
            padding:5px 0 0 0;
            text-align: center;
        }
        .score_menu{
            width: 50%;
            height: 100%;
            min-width: 100px;
            text-decoration: none;
            color: black;
            border: 1px solid black;
            display: flex;
          align-items: center;
          justify-content: center;
        }
        #maincontent{
            width: 100%;
            border: 1px solid black;
        }
        
        .menu1_a {
	        font-weight: bold;
	        padding-bottom:5px;
	        border-bottom: 3px solid #26A653;
    	}
       
    </style>
    <title>Document</title>
</head>
<body>
<div id="contain">
    <div>
        <ul id="submenu">
            <a class="score_menu" href="${pageContext.request.contextPath}/manager/manager?page=ranking&rankPage=rank1"><li>점수관리</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
           if(rank_p.equals("rank1")){
              %>
               <jsp:include page="./score.jsp"></jsp:include>
             <%
           }
        %>
    </div>
</div>
</body>
</html>