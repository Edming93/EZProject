<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String select = null;
	if(session.getAttribute("select") != null) {
		select = (String)session.getAttribute("select");
	}else {
		select = "userAdmin";
	}
	
%> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매니저페이지</title>
<style>
</style>
<body>
<h1>매니저페이지</h1>
</body>
</html>