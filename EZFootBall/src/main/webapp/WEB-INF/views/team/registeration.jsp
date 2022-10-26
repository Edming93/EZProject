<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팀매치 - 팀등록</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-ui.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    <style>
    *{
        box-sizing : border-box;
        margin : 2px auto;
        
     
    }
    .posting{
        display: flex;
        background-color: beige;
        flex-direction: column;
        width: 500px;
        border: 1px solid white;
    }
    
    .team_info{
        display: flex;
        flex-direction: column;
    }
    .team_info .team_register{
        display: flex;
        justify-content: center;
        font-weight: 700;
        font-size: 40px;
        width: 500px;
        padding-left: 5px;
    }
    .team_info .team_name{
        width: 500px;
        float: left;
       
       
    }
    .team_info .team_name p{
        margin-left: 5px;
        font-weight: 700;
        font-size: 20px;
    }
    .team_info .team_name input{
        width: 490px;
        height: 40px;
        margin-left: 5px;
    }
    .team_info table{
        background-color: white;
        width : 98%;
        
    }
    .team_info table tr td input{
        
        width: 100%;
        float: left;
        padding-left: 5px;
    }

    .submit_button{
        width: 480px;
        height: 40px;
        background-color: black;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #writer_submit{
        width: 480px;
        height: 40px;
        background-color: black;
        border: none;
        color: white;
        font-weight: 700;
        font-size: 15px;
    }
    #writer_submit:hover{
        cursor: pointer;
    }
    .add_info{
    	color : red;
    	text-decoration : underline;
    }
   
    </style>
    
</head>
<body>
    <div class="posting">
       
        <div class="team_info">
            <div class="team_register">
                <p>팀 등록하기</p>
            </div>
            <form action="${pageContext.request.contextPath}/team/teamUpdate" method="post">
            <div class="team_name">
                <p>팀 이름</p>
                <input type="text" name="teamName" id="teamName" placeholder="매력있는 팀 이름 정하기">
            </div>
            <p class="add_info">※5명팀은 5명만 적어주세요</p>
            <table>
                <tr>
                    <th>이름</th>
                    <th>회원코드</th>
                </tr>
                <tr>
                    <td><input type="text" name="tmember1" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode1" class="userCode" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember2" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode2" class="userCode" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember3" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode3" class="userCode" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember4" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode4" class="userCode" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember5" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode5" class="userCode" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember6" class="tmem" placeholder="이름을 입력하세요"></td>
                    <td><button type="button" class="btn">확인</button></td>
                    <td><input type="text" name="userCode6" class="userCode" placeholder="회원코드"></td>
                </tr>
            </table>
            
            <div class="submit_button">
            	<button id="writer_submit">팀 등록하기</button>
        	</div>
        	 </form>
        </div>
    </div>
  	<script type="text/javascript">
  	let btns = document.getElementsByClassName("btn");
  	for(let i=0; i<btns.length; i++){
  		
  	
   		btns[i].addEventListener("click", function(){
   		let tmember = document.getElementsByClassName("tmem")[i].value;
		let userCode = document.getElementsByClassName("userCode")[i];
		
		
		const simple_data = {tmember};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/team/usercode",
			type : "POST",
			contentType:"application/json; charset=utf-8",
			dataType : "json",
 			data : JSON.stringify(simple_data),
			success : function(data){
				
				
				for(let comment of data){
					userCode.value = comment.userCode;
				}

			},
			error : function(e){
				alert(e);
			}
		});
		
	});
  	}

    </script>
  	
   	
</body>
</html>