<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String select = null;
	System.out.println(session.getAttribute("select"));
	if(session.getAttribute("select") != null) {
		select = (String)session.getAttribute("select");
		System.out.println("if"+select);
	}else {
		select = "유저관리";
		System.out.println("else"+select);
	}
	
%> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     *{
        box-sizing: border-box;
        margin: 0;
      
     }
     .Mcontainer{
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px solid black;
        width: 100vw;
        height: 100vh;
        background-color: beige;
     }
     .subcontainer{
        display: flex;
        width: 85%;
        height: 85%;
        background-color: white;
     }
     .main{
        flex : 1;
        border: 1px solid black;
     }
     .main .menubar{
        display: flex;
        flex-direction: column;
        width: 100%;
        height: 100%;
     }
     .main .menubar .profile{
        flex : 1;
        border: 1px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
     }
     .proflie{
        display: flex;
     }
     .pleft {
        flex : 0.7;
        border: 1px solid black;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding : 5px 0;

     }
     .pleft_title{
        flex : 1;
     }
     .pleft_img{
        flex : 3;
        width: 90%;
        border: 1px solid black;
     }
     .pright{
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        line-height: 30px;
     }
     .main .menubar .navmenu {
        flex: 4;
     }
     .navmenu ul {
        width: 100%;
        list-style-type: none;
        line-height: 400%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        padding: 0;
     }
     .navmenu ul li {
        border: 1px solid pink;
        width: 100%;
        padding: 0 20px;
     }
     .navmenu ul li:hover {
       background-color: #26a563;
       transition: all 0.4s linear;
       font-size: 25px;
       cursor: pointer;
     }
     .navmenu ul a{
        width: 100%;
        height: 100%;
        text-decoration: none;
        font-size: 20px;
        color : black;
     }
     #content{
        flex:4;
        border: 1px solid black;
     }
</style>
<body>
    <div class="Mcontainer">
        <div class="subcontainer">
            <div class="main">
                <div class="menubar">
                    <div class="profile">
                        <div class="pleft">
                            <div class="pleft_title">
                                <p>로고</p>
                            </div>
                            <div class="pleft_img">
                                이미지
                            </div>
                        </div>
                        <div class="pright">
                        <p>'김은진'관리자님</p>
                        <p>환영합니다</p>
                        </div>
                    </div>
                    <div class="navmenu">
                        <ul>
                            <a href="${pageContext.request.contextPath}/admin/select?select=유저관리"><li>유저관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=매니저관리"><li>매니저관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=예약관리"><li>예약관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=신청관리"><li>신청관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=구장관리"><li>구장관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=커뮤니티관리"><li>커뮤니티관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=결제관리"><li>결제관리</li></a>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="content">
        <%
        	if (select.equals("유저관리")){
	    		%>
	    		  <jsp:include page="../userInfo/userMain.jsp"></jsp:include>
	    		<%
    		}else if (select.equals("매니저관리")){
    			%>
        		 <jsp:include page="../magInfo/magMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("예약관리")){
        		%>
        		<jsp:include page="../reserInfo/reserMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("신청관리")){
        		%>
        		<jsp:include page="../subInfo/subMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("구장관리")){
        		%>
        		<jsp:include page="../fieldInfo/fieldMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("커뮤니티관리")){
        		%>
        		<jsp:include page="../comuInfo/comuMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("결제관리")){
        		%>
        		<jsp:include page="../payInfo/payMain.jsp"></jsp:include>
        		<%
        	}
        %>
           
        </div>
        </div>
    </div>
</body>
</html>