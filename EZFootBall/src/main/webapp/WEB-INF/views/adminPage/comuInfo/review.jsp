<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>
	<div class="container">
		<div id="div1">
			<div id="comment"></div>
			<div id="input">			

			</div>
		</div>
	</div>

<script type="text/javascript">

window.addEventListener("DOMContentLoaded", function(){

	$.ajax({
		url : "${pageContext.request.contextPath}/comuAdmin/review",
		type : "POST",
		contentType:"application/json; charset=utf-8",
		dataType : "json",
		success : function(data){
			const comdiv = document.getElementById("comment");
			
			for(let comment of data){
				console.log(comment);	
			
				const div = document.createElement("div");
				div.style.borderTop = "1px solid black";
				div.style.fontFamily = "Gowun Dodum";				
				
                const div2 = document.createElement("div");
                const div3 = document.createElement("div");


				const cname = document.createElement("p");
				cname.innerText = comment.userName;
				const ccontent = document.createElement("P");
				ccontent.innerText = comment.content;
				const cdate = document.createElement("p");
				cdate.innerText = comment.createDate;
				
				const checkbox = document.getElementById("mycheckbox");
				const inputcheckbox = document.createElement("INPUT");
				inputcheckbox.setAttribute("type", "checkbox");
				
				div.append(cdate);
				div.append(cname);
				div2.append(ccontent);
				div3.append(inputcheckbox)
				div.append(div2);
				div.append(div3);
				comdiv.append(div);


			}
		},
		error : function(e){
			alert(e);
		}
	});		
});
</script>


</body>
</html>