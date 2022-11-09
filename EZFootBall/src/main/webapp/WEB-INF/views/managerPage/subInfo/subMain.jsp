<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String sub_p = request.getParameter("subPage");
		if(sub_p == null){
			sub_p="sub1";
		}
	System.out.println("서브메인 subPage값 :"+sub_p);
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
        .submenu_area {
        
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
        .sub_menu{
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
        
        .menu2_a {
	        font-weight: bold;
	        padding-bottom:5px;
	        border-bottom: 3px solid #26A653;
    	}
       
    </style>
    <title>Document</title>
</head>
<body>
<div id="contain">
    <div class="submenu_area">
        <ul id="submenu">
            <a class="sub_menu" href="${pageContext.request.contextPath}/manager/manager?page=subMain&subPage=sub1"><li>소셜매치 신청 현황</li></a>
            <a class="sub_menu" href="${pageContext.request.contextPath}/manager/manager?page=subMain&subPage=sub2"><li>팀매치 신청 현황</li></a>
            <a class="sub_menu" href="${pageContext.request.contextPath}/manager/manager?page=subMain&subPage=sub3"><li>취소 현황</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(sub_p.equals("sub1")){
        		%>
	    		  <jsp:include page="./sociallist.jsp"></jsp:include>
	    		<%
        	}else if(sub_p.equals("sub2")){
        		%>
	    		  <jsp:include page="./teamlist.jsp"></jsp:include>
	    		<%
        	}
        	else if(sub_p.equals("sub3")){
        		%>
	    		  <jsp:include page="./cancellist.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
</body>
</html>