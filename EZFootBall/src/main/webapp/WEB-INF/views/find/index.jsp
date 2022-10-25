<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인페이지</h1>
	<form action="${pageContext.request.contextPath }/login" method="post">
		<label for="id">ID : <input type="text" name="id" id="id" /></label><br />
		<label for="pw">PW : <input type="text" name="pw" id="pw" /></label><br />
		<button>로그인</button>
	</form>
	<a href="${pageContext.request.contextPath}/findInfo">ID/PW찾기</a>
	<%-- <a href="${pageContext.request.contextPath}/Searchid">아이디 찾기</a><br />
	<a href="${pageContext.request.contextPath}/Searchpw">비밀번호 찾기</a><br /> --%>
</body>
</html>