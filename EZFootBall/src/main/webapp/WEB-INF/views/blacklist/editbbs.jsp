<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	display: grid;
	grid-template-columns: 200px 1fr 200px;
	grid-template-rows: 50px 50px 20px 300px 50px;
	gap: 5px 5px;
	grid-auto-flow: row;
	grid-template-areas: ". . ." ". header ." ". . ." ". main ."
		". footer .";
}

.header {
	grid-area: header;
	display: grid;
	grid-template-columns: 75px 1fr;
	grid-template-rows: 30px 30px;
	align-items: center;
	gap: 5px;
}

.header h4 {
	margin: 0;
}

.main {
	grid-area: main;
	display: flex;
}

textarea {
	flex: 1;
}

.footer {
	grid-area: footer;
	display: flex;
	flex-direction: row-reverse;
}
</style>
</head>
<body>
	<form:form modelAttribute="BlacklistVO" action="${pageContext.request.contextPath}/blacklist/blacklistmain/editbbs" method="post">
		<form:hidden path="blacklistCode"/>
		<div class="container">
			<div class="header">
				<h4>지역 :</h4>
				<form:select path="blacklistLocal">
					<form:options items="${blacklistLocal}"/>
				</form:select>
				<h4>제목 :</h4>
				<form:input path="blacklistTitle"/>
			</div>
			<div class="main">
				<form:textarea path="blacklistContent"/>
			</div>
			<div class="footer">
				<button>전송</button>
			</div>
		</div>
	</form:form >
</body>
</html>