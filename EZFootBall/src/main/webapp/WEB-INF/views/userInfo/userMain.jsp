<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	String idselect = null;
	if(request.getParameter("idselect") != null) {
		idselect = (String)request.getParameter("idselect");
	}else {
		idselect = "계정";
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
        .menu{
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
    </style>
    <title>Document</title>
</head>
<body>
<div id="contain">
    <div>
        <ul id="submenu">
            <a class="menu" href="${pageContext.request.contextPath}/admin/idselect?idselect=계정"><li>계정</li></a>
            <a class="menu" href="${pageContext.request.contextPath}/admin/idselect?idselect=블랙리스트"><li>블랙리스트</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(idselect.equals("계정")){
        		%>
	    		  <jsp:include page="./idlist.jsp"></jsp:include>
	    		<%
        	}else if(idselect.equals("블랙리스트")){
        		%>
	    		  <jsp:include page="./blacklist.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
</body>
</html>