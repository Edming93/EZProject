<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	String magselect = null;
	if(request.getParameter("magselect") != null) {
		magselect = (String)request.getParameter("magselect");
	}else {
		magselect = "매니저리스트";
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
            <a class="menu" href="${pageContext.request.contextPath}/admin/magselect?magselect=매니저리스트"><li>매니저리스트</li></a>
            <a class="menu" href="${pageContext.request.contextPath}/admin/magselect?magselect=매니저신청리스트"><li>매니저 신청 리스트</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(magselect.equals("매니저리스트")){
        		%>
	    		  <jsp:include page="./maglist.jsp"></jsp:include>
	    		<%
        	}else if(magselect.equals("매니저신청리스트")){
        		%>
	    		  <jsp:include page="./magsublist.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
</body>
</html>