<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <style>
        #out {
            margin: 0 auto;
            width: 1024px;
        }
        #out *{
            /* border: 1px solid black; */
        }
        .rankdiv{
            display: flex;
            height: 80px;
            margin-bottom: 20px;
            
            display: flex;
            align-items: center;
        }
        .rankdiv > div {
            height: 70px;
            margin-right: 20px;
           
        }
        .numdiv{
            width: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            
        }
        .numdiv > div{
            padding: 0px 6px;
            border-bottom: 4px solid #798777;
        }
        .innerdiv{
            display: flex;
            width: 900px;
            border-bottom: 1px solid #bdd2b6;
        }
        .innerdiv > div {
            margin-right: 20px;
        }
        .namediv{
            width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
        }
        .scorediv{
            width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
        }

    </style>
</head>
<body>
<div id="out">
<%int num=1; %>
	<c:forEach var="rank" items="${rank}" > 
		<div id="rank<%=num%>" class="rankdiv">
			<div class="numdiv"><div><%=num%></div></div>
			<div class="innerdiv">
				<div class="namediv">${rank.userName}</div>
				<div class="scorediv">${rank.userScore}</div>
			</div>
			<%num++; %>
		</div>
 	</c:forEach>
 	
	
</div>
</body>
</html>